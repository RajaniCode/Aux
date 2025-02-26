// Java 16
// OpenJDK 16
// % export PATH="$HOME/Downloads/Software/OpenJDK/JDK16.0.2/jdk-16.0.2.jdk/Contents/Home/bin/":$PATH

// Java 16
// Microsoft Build of OpenJDK
// % export PATH="$HOME/Downloads/Software/OpenJDK/MicrosoftBuildofOpenJDK/jdk-16.0.2+7/Contents/Home/bin/":$PATH

// % java --enable-preview --source 16 --add-modules=jdk.incubator.foreign -Dforeign.restricted=permit Java16.java
// Or
// % javac -Xlint:preview --enable-preview --source 16 --add-modules=jdk.incubator.foreign Java16.java
// % java --enable-preview --add-modules=jdk.incubator.foreign -Dforeign.restricted=permit Java16
// % rm -rf *.class

// OpenJDK 15
// % export PATH="$HOME/Downloads/Software/OpenJDK/JDK15.0.2/jdk-15.0.2.jdk/Contents/Home/bin/":$PATH


/*
# 389: Foreign Linker API (Incubator)
*/


import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.nio.file.Path;
import java.util.Optional;
import jdk.incubator.foreign.CLinker;
import jdk.incubator.foreign.FunctionDescriptor;
import jdk.incubator.foreign.LibraryLookup;

class Java16 {
    public static void main(String[] args) throws Throwable {
        var propertiesSystem = new SystemProperties();
        propertiesSystem.print();
	System.out.println();

	// # 389: Foreign Linker API (Incubator)
        var incubatorForeignLinkerAPI = new ForeignLinkerAPIIncubator();
	incubatorForeignLinkerAPI.print();
    }
}

class ForeignLinkerAPIIncubator {
    public void print() throws Throwable {
        System.out.println("# 389: Foreign Linker API (Incubator)");

        String userDir = System.getProperty("user.dir");

        // String fileName = "apple-clang.dylib";
        String fileName = "apple-clang.so";

        String dirFile = userDir + "/" + fileName;

        Path pathOf = Path.of(dirFile);

	try {
            LibraryLookup libraryLookup = LibraryLookup.ofPath(pathOf);

            Optional < LibraryLookup.Symbol > optionalLibraryLookupSymbol = libraryLookup.lookup("c_code");

            if (optionalLibraryLookupSymbol.isPresent()) {

                LibraryLookup.Symbol libraryLookupSymbol = optionalLibraryLookupSymbol.get();

                FunctionDescriptor descriptorFunction = FunctionDescriptor.ofVoid();

                // return type, parameter type(s)
                MethodType typeMethod = MethodType.methodType(Void.TYPE);

                MethodHandle handleMethod = CLinker.getInstance().downcallHandle(
                    libraryLookupSymbol.address(),
                    typeMethod,
                    descriptorFunction
                );

                // unreported exception Throwable; must be caught or declared to be thrown
                handleMethod.invokeExact();
            }

	} catch (UnsatisfiedLinkError e) {
	    // e.printStackTrace();
	    System.out.println(e.getMessage());
	}
    }
}

class SystemProperties {
    public void print() {
        System.out.println(String.format("OS Name: %s", System.getProperty("os.name")));
        System.out.println(String.format("OS Version: %s", System.getProperty("os.version")));
        System.out.println(String.format("OS Architecture: %s", System.getProperty("os.arch")));
        System.out.println(String.format("Java Version: %s", System.getProperty("java.version")));
        // System.getProperties().list(System.out);
    }
}


// apple-clang.c
/*
#include <stdio.h>

void
c_code(void) {
  printf("C!\n");
}

int
main() {
  c_code();
}

// % arch -x86_64 zsh
// [
// % arch -arm64 zsh 
// ]
// % arch
// .dylib
// % gcc -shared -o apple-clang.dylib -fPIC apple-clang.c
// .so
// % gcc -c -fPIC apple-clang.c
// % gcc -shared -o apple-clang.so apple-clang.o
// "main"
// % gcc apple-clang.c -o apple-clang
// % ./apple-clang
*/


// java --enable-preview --source 16 --add-modules=jdk.incubator.foreign -Dforeign.restricted=permit Java16.java
/*
WARNING: Using incubator modules: jdk.incubator.foreign
warning: using incubating module(s): jdk.incubator.foreign
1 warning
OS Name: Mac OS X
OS Version: 10.16
OS Architecture: x86_64
Java Version: 16.0.2

# 389: Foreign Linker API (Incubator)
C!
*/


// NB
// Java 16 Microsoft Build of OpenJDK
/*
apple-clang.so' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64e' or 'arm64'))
*/


// Credits
/*
https://openjdk.org/
https://oracle.com/java/
https://microsoft.com/openjdk/
https://gcc.gnu.org/
*/