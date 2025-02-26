// Java 22
// OpenJDK 22
// % export PATH="$HOME/Downloads/Software/OpenJDK/JDK22.0.2/jdk-22.0.2.jdk/Contents/Home/bin/":$PATH

// % java --enable-preview --source 22 --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector Java22.java
// Or
// % javac -Xlint:preview --enable-preview --source 22 --add-modules=jdk.incubator.vector Java22.java
// % java --enable-preview --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector Java22
// % rm -rf *.class

// Java 21
// OpenJDK 21
// % export PATH="$HOME/Downloads/Software/OpenJDK/JDK21.0.2/jdk-21.0.2.jdk/Contents/Home/bin/":$PATH

// % java --enable-preview --source 21 --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector Java22.java
// Or
// % javac -Xlint:preview --enable-preview --source 21 --add-modules=jdk.incubator.vector Java22.java
// % java --enable-preview --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector Java22
// % rm -rf *.class


/*
# 454: Foreign Function & Memory API
*/


import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.Arrays;

class Java22 {
    public static void main(String[] args) { 
        SystemProperties propertiesSystem = new SystemProperties();
        propertiesSystem.print();
	System.out.println();

        // # 454: Foreign Function & Memory API
	var apiForeignFunctionAndMemory = new ForeignFunctionAndMemoryAPI();
	apiForeignFunctionAndMemory.print();
    }
}

class ForeignFunctionAndMemoryAPI {
    private void radixsort() {
	// 1. Find foreign function on the C library path
	Linker linkerNative = Linker.nativeLinker();
	SymbolLookup lookuppSymbol = linkerNative.defaultLookup();
        MethodHandle radixsortHandle = linkerNative.downcallHandle(
            lookuppSymbol.find("radixsort").orElseThrow(), 
    	    FunctionDescriptor.ofVoid(ValueLayout.ADDRESS, ValueLayout.JAVA_INT, ValueLayout.ADDRESS, ValueLayout.JAVA_CHAR));

        // 2. Allocate on-heap memory to store four strings
        String[] javaStrings   = { "Delta", "Gamma", "Alpha", "Beta" };
        System.out.println("radixsort input: " + Arrays.toString(javaStrings));
	
	// Java 22
	// 3. Use try-with-resources to manage the lifetime of off-heap memory
	try (Arena offHeap = Arena.ofConfined()) { 	

	    // Java 22
	    // 4. Allocate a region of off-heap memory to store four pointers
    	    MemorySegment pointers = offHeap.allocate(ValueLayout.ADDRESS, javaStrings.length);

	    // 5. Copy the strings from on-heap to off-heap
    	    for (int i = 0; i < javaStrings.length; i++) {
	 	// Java 22 
        	MemorySegment cString = offHeap.allocateFrom(javaStrings[i]);
        	pointers.setAtIndex(ValueLayout.ADDRESS, i, cString);
    	    }

	    // 6. Sort the off-heap data by calling the foreign function
	    // invoke // unreported exception Throwable; must be caught or declared to be thrown
	    try {
    	    	radixsortHandle.invoke(pointers, javaStrings.length, MemorySegment.NULL, '\0');
	    } catch (Throwable e) {
	    	// e.printStackTrace();
	    	System.out.println(e.getMessage());
	    }

	    // 7. Copy the (reordered) strings from off-heap to on-heap
    	    for (int i = 0; i < javaStrings.length; i++) {
        	MemorySegment cString = pointers.getAtIndex(ValueLayout.ADDRESS, i);
		// Java 22
       	        javaStrings[i] = cString.reinterpret(Long.MAX_VALUE).getString(0);
    	    }
    	}

	// 8. All off-heap memory is deallocated here
        System.out.println("radixsort output: " + Arrays.toString(javaStrings));
    }

    private void strlen(String text) {        
	System.out.println("strlen input: " + text);
	
        try (Arena arena = Arena.ofConfined()) {
            
	    // Java 22
            // Allocate off-heap memory and
            // copy the argument, a Java string, into off-heap memory
            MemorySegment segmentMemory = arena.allocateFrom(text);
        
            // Link and call the C function strlen
        
            // Obtain an instance of the native linker
            Linker linkerNative = Linker.nativeLinker();
        
            // Locate the address of the C function signature
            SymbolLookup lookupSymbol = linkerNative.defaultLookup();
            MemorySegment segmentMemoryLookup = lookupSymbol.find("strlen").get();
        
            // Create a description of the C function
            FunctionDescriptor descriptorFunction =
                FunctionDescriptor.of(ValueLayout.JAVA_LONG, ValueLayout.ADDRESS);
            
            // Create a downcall handle for the C function    
            MethodHandle strlenHandle = linkerNative.downcallHandle(segmentMemoryLookup, descriptorFunction);

	    try {
                // Call the C function directly from Java
	        // invokeExact // unreported exception Throwable; must be caught or declared to be thrown
	    System.out.println("strlen output: " + (long)strlenHandle.invokeExact(segmentMemory));
	    } catch (Throwable e) {
	    	// e.printStackTrace();
	    	System.out.println(e.getMessage());
	    }
        } 
    }

    class Qsort {
        static int qsortCompare(MemorySegment elem1, MemorySegment elem2) {
            return Integer.compare(elem1.get(ValueLayout.JAVA_INT, 0), elem2.get(ValueLayout.JAVA_INT, 0));
        }
    }

    // Obtain instance of native linker
    private final Linker nativeLinker = Linker.nativeLinker();
    
    private void qsort(int... unsortedArray) throws Throwable {
        System.out.println("qsort input: " + Arrays.toString(unsortedArray));
        
        int[] sorted = null;
        
        // Create downcall handle for qsort
        MethodHandle qsortHandle = nativeLinker.downcallHandle(
            nativeLinker.defaultLookup().find("qsort").get(),
            FunctionDescriptor.ofVoid(ValueLayout.ADDRESS,
                                      ValueLayout.JAVA_LONG,
                                      ValueLayout.JAVA_LONG,
                                      ValueLayout.ADDRESS));
        
        // Create method handle for qsortCompare
	// findStatic // unreported exception NoSuchMethodException; must be caught or declared to be thrown
	// findStatic // unreported exception IllegalAccessException; must be caught or declared to be thrown
        MethodHandle comparHandle = MethodHandles.lookup()
            .findStatic(Qsort.class,
                        "qsortCompare",
                        MethodType.methodType(int.class,
                                              MemorySegment.class,
                                              MemorySegment.class));
                                              
        // Create a Java description of a C function implemented by a Java method
        FunctionDescriptor qsortCompareDesc = FunctionDescriptor.of(
            ValueLayout.JAVA_INT,
            ValueLayout.ADDRESS.withTargetLayout(ValueLayout.JAVA_INT),
            ValueLayout.ADDRESS.withTargetLayout(ValueLayout.JAVA_INT));


        // Create function pointer for qsortCompare
        MemorySegment compareFunc = nativeLinker.upcallStub(comparHandle,
                                                      qsortCompareDesc,
                                                      Arena.ofAuto());        
        
	// Java 22
        try (Arena arena = Arena.ofConfined()) {                           
            // Allocate off-heap memory and store unsortedArray in it                
            MemorySegment array = arena.allocateFrom(ValueLayout.JAVA_INT,
                                                      unsortedArray);        
                    
            // Call qsort
	    // invoke // unreported exception Throwable; must be caught or declared to be thrown     
            qsortHandle.invoke(array,
                        (long)unsortedArray.length,
                        ValueLayout.JAVA_INT.byteSize(),
                        compareFunc);
            
            // Access off-heap memory
            sorted = array.toArray(ValueLayout.JAVA_INT);              
        }

        System.out.println("qsort output: " + Arrays.toString(sorted));
    }    

    public void print() {
        System.out.println("# 454: Foreign Function & Memory API");
	radixsort();
        strlen("Hola!");
	try {
	    // unreported exception Throwable; must be caught or declared to be thrown
            qsort(5, 7, 9, 3, 4, 6, 1, 8, 2, 0);
	} catch (Throwable e) {
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


// java --enable-preview --source 22 --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector Java22.java
/*
WARNING: Using incubator modules: jdk.incubator.vector
OS Name: Mac OS X
OS Version: 15.0.1
OS Architecture: aarch64
Java Version: 22.0.2

# 454: Foreign Function & Memory API
radixsort input: [Delta, Gamma, Alpha, Beta]
radixsort output: [Alpha, Beta, Delta, Gamma]
strlen input: Hola!
strlen output: 5
qsort input: [5, 7, 9, 3, 4, 6, 1, 8, 2, 0]
qsort output: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
*/


// Credits
/*
https://openjdk.org/
https://oracle.com/java/
*/