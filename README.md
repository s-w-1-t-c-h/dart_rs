# Dart reverse shell v1.1
Updated and (currently) working basic dart reverse shell for Windows (Powershell) based on [this one](https://github.com/Potato-Industries/dartrs) by [Potato-Industries](https://github.com/Potato-Industries). Pretty self explanatory. Only took two and a half years to find the time to come back to this... 

Code has been rewritten to support the latest version of Dart, error handling improved, process management problems fixed, etc. Avoids [quite a few endpoint AV products](https://virusscan.jotti.org/en-US/filescanjob/cugw4ajdkh), including BitDefender even though Jotti says otherwise (tested on a fully updated release of BitDefender Total Security as of 2023-11-10). Tested and working on Windows 10/11.

# How to compile

You’ll need Windows. I used a Windows 10 64-bit VM. From there:

1. Install the Dart SDK from dart.dev via the instructions (using Chocolately is easiest)

2. Grab rs.dart from this repo

3. Modify the host and port to a value that suits you

4. Open a command prompt and compile the binary with dart:

![image](https://github.com/s-w-1-t-c-h/dart_rs/assets/6980812/d081b941-013e-4179-8bc0-d625d1cd0942)

5. Transfer the binary to the target system, set up a listener on the box you configured and give it a crack.

6. OPTIONAL: Install Visual Studio Community to get ‘editbin.exe’ so you can modify your Dart shell binary to run silently. Check out the advice [here](https://stackoverflow.com/questions/57207503/dumpbin-exe-editbin-exe-package-needed-in-visual-studio-2019) for how to get editbin.exe. Use editbin.exe to stop the binary executing with a persistent black command window in the foreground:

![image](https://github.com/s-w-1-t-c-h/dart_rs/assets/6980812/c9eae6c3-0276-4a3c-86c2-47cf42812c41)

---

Better than it was, but could still use some improvements.

