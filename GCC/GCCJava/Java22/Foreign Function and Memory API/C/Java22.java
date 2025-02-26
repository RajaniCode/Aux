// Java 22
// OpenJDK 22
// % export PATH="$HOME/Downloads/Software/OpenJDK/JDK22.0.2/jdk-22.0.2.jdk/Contents/Home/bin/":$PATH

// % java --enable-native-access=ALL-UNNAMED Java22.java
// Or
// % javac Java22.java
// % java --enable-native-access=ALL-UNNAMED Java22
// % rm -rf *.class


import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.nio.file.Paths;

class Java22 {
    public static void main(String[] args) { 
        SystemProperties propertiesSystem = new SystemProperties();
        propertiesSystem.print();
	System.out.println();

	var functionForeign = new ForeignFunction();
	functionForeign.print();
    }
}

class ForeignFunction {
    public void print() {
        FunctionDescriptor descriptorFunction = FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.JAVA_INT, ValueLayout.JAVA_INT);

        // String libraryDirectory = System.getProperty("user.dir") + "/apple-clang.dylib";
        String libraryDirectory = System.getProperty("user.dir") + "/apple-clang.so";

        try (Arena arenaConfined = Arena.ofConfined()) {
            SymbolLookup lookupSymbol = SymbolLookup.libraryLookup(Paths.get(libraryDirectory), arenaConfined);

            MemorySegment segmentLookup = lookupSymbol.find("power").orElseThrow(() -> new RuntimeException("Function 'power' not found"));

            Linker nativeLinker = Linker.nativeLinker();
            MethodHandle addFunctionHandle = nativeLinker.downcallHandle(segmentLookup, descriptorFunction);

            int x = 4;
            int y = 5;

            try (Arena confinedArena = Arena.ofConfined()) {
                MemorySegment segmentAllocate = confinedArena.allocate(ValueLayout.JAVA_INT, 2);

                segmentAllocate.set(ValueLayout.JAVA_INT, 0, x);
                segmentAllocate.set(ValueLayout.JAVA_INT, 4, y);

		try {
                    var result = addFunctionHandle.invoke(segmentAllocate.get(ValueLayout.JAVA_INT, 0), segmentAllocate.get(ValueLayout.JAVA_INT, 4));
                    System.out.println("%d to the power of %d = %d".formatted(x, y, result));
	    	} catch (Throwable e) {
	    	    // e.printStackTrace();
	    	    System.out.println(e.getMessage());
	    	}
            }
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
#include <math.h>

int power(int x, int y) {
    return pow(x, y);
}

int main() {
   printf("%i\n", power(4, 5));
}

// [
// % arch -x86_64 zsh
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


// java --enable-native-access=ALL-UNNAMED Java22.java
/*
OS Name: Mac OS X
OS Version: 15.0.1
OS Architecture: aarch64
Java Version: 22.0.2

4 to the power of 5 = 1024
*/