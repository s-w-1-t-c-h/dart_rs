# dart_rs
Basic Dart reverse shell based on [this one](https://github.com/Potato-Industries/dartrs) by [Potato-Industries](https://github.com/Potato-Industries). Pretty self explanatory. 

You’ll need Windows. I used a Windows 7 64-bit VM. From there:

1. Install the Dart SDK from dart.dev via the instructions (using Chocolately is easiest)

2. OPTIONAL: Install Visual Studio Community to get ‘editbin.exe’ so you can modify your Dart shell binary to run silently. Install the “Desktop Development with C++” package when prompted.

3. Grab rs.dart from this repo

4. Modify the host and port to a value that suitable to you

5. Open a command prompt and compile the binary with dart2native:

![image](https://user-images.githubusercontent.com/6980812/110584178-87f7db80-81ba-11eb-98f1-88215ce636b6.png)

6. To stop the binary executing with a persistent black command window in the foreground, use editbin.exe from your Visual Studio install to hide it (optional):

![image](https://user-images.githubusercontent.com/6980812/110584241-9fcf5f80-81ba-11eb-89c9-a250798098fe.png)

7. Transfer the binary to the target system, set up a listener on the box you configured and give it a crack.

