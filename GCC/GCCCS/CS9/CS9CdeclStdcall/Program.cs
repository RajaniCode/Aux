using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.IO;

class Program
{
    private static void Main()
    {  
	SystemProperties propertiesSystem = new();
	propertiesSystem.Print();
	Console.WriteLine();
  
        Program prgm = new();
        prgm.Print();       
    }

    // <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    unsafe public void Print() 
    {
        if (Environment.OSVersion.Platform == PlatformID.Win32NT)
        {
            try
            {
        #nullable enable
                string? currentFilePathAndName = new StackTrace(true).GetFrame(0)?.GetFileName();
                string? currentDirectory = Path.GetDirectoryName(currentFilePathAndName);
        #nullable disable
                string sourceDirectory = currentDirectory + "/MSYS2/CPP_x86_64";
                string targetDirectory = Directory.GetCurrentDirectory();

                // Console.WriteLine($"Current Directory: {currentDirectory}");
                // Console.WriteLine($"Source Directory: {sourceDirectory}");
                // Console.WriteLine($"Target Directory: {targetDirectory}");

                const string fileNameCdecl = "cdecl.dll";
                Console.WriteLine($"C++ Library File Name: {fileNameCdecl}");
                File.Copy(Path.Combine(sourceDirectory, fileNameCdecl), Path.Combine(targetDirectory, fileNameCdecl), true);

                Console.WriteLine("static extern function");
    		[DllImport(fileNameCdecl, EntryPoint = "hello_cdecl", CharSet=CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
    		static extern void hello_cdecl();

                const string fileNameThiscall = "thiscall.dll";
                Console.WriteLine($"C++ Library File Name: {fileNameThiscall}");
                File.Copy(Path.Combine(sourceDirectory, fileNameThiscall), Path.Combine(targetDirectory, fileNameThiscall), true);

    		[DllImport(fileNameThiscall, EntryPoint = "hello_thiscall", CharSet=CharSet.Unicode, CallingConvention = CallingConvention.ThisCall)]
		static extern void hello_thiscall(char* c);

                const string fileNameStdcall = "stdcall.dll";
                Console.WriteLine($"C++ Library File Name: {fileNameStdcall}");
                File.Copy(Path.Combine(sourceDirectory, fileNameStdcall), Path.Combine(targetDirectory, fileNameStdcall), true);

    		[DllImport(fileNameStdcall, EntryPoint = "hello_stdcall", CharSet=CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
		static extern void hello_stdcall();

		// Unmanaged calling convention: must be one of stdcall, cdecl, or thiscall
        	// Thiscall requires that the first parameter is present and can be enregistered
        	string marshal = "Marshal: thiscall";
        	IntPtr iptrmarshal = Marshal.StringToHGlobalAnsi(marshal);  
        	char *cptrmarshal = (char*)iptrmarshal.ToPointer();
        	/*
		delegate* unmanaged <void> delUnmanagedC = (delegate* unmanaged <void>)(delegate* <void>)&hello_cdecl;
        	delegate* unmanaged <char*, void> delUnmanagedT = (delegate* unmanaged <char*, void>)(delegate* <char*, void>)&hello_thiscall;
		delegate* unmanaged <void> delUnmanagedS = (delegate* unmanaged <void>)(delegate* <void>)&hello_stdcall;

        	delUnmanagedC();
        	delUnmanagedT(cptrmarshal);
  		delUnmanagedS();
        	*/	

		delegate* unmanaged[Cdecl]<void> delUnmanagedCdecl = (delegate* unmanaged[Cdecl]<void>)(delegate* <void>)&hello_cdecl;
		delegate* unmanaged[Thiscall]<char*, void> delUnmanagedThiscall = (delegate* unmanaged[Thiscall]<char*, void>)(delegate* <char*, void>)&hello_thiscall;
		delegate* unmanaged[Stdcall]<void> delUnmanagedStdcall = (delegate* unmanaged[Stdcall]<void>)(delegate* <void>)&hello_stdcall;

		delUnmanagedCdecl();
		delUnmanagedThiscall(cptrmarshal);
		delUnmanagedStdcall();
	    }
	    catch (Exception e) when (e is IOException || e is UnauthorizedAccessException || e is Exception)
   	    {
		// Console.WriteLine($"{e.GetType()} StackTrace: {e.StackTrace}");
		Console.WriteLine($"{e.GetType()} Message: {e.Message}");
	    }
        }

        if (Environment.OSVersion.Platform == PlatformID.Unix)
        {
            try
            {
        #nullable enable
                string? currentFilePathAndName = new StackTrace(true).GetFrame(0)?.GetFileName();
                string? currentDirectory = Path.GetDirectoryName(currentFilePathAndName);
        #nullable disable
                string sourceDirectory = currentDirectory + "/Apple_clang/CPP_x86_64";
                string targetDirectory = Directory.GetCurrentDirectory();

                // Console.WriteLine($"Current Directory: {currentDirectory}");
                // Console.WriteLine($"Source Directory: {sourceDirectory}");
                // Console.WriteLine($"Target Directory: {targetDirectory}");

                const string fileNameCdecl = "cdecl.so";
                Console.WriteLine($"C++ Library File Name: {fileNameCdecl}");
                File.Copy(Path.Combine(sourceDirectory, fileNameCdecl), Path.Combine(targetDirectory, fileNameCdecl), true);

                Console.WriteLine("static extern function");
    		[DllImport(fileNameCdecl, EntryPoint = "hello_cdecl", CharSet=CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
    		static extern void hello_cdecl();

                const string fileNameIO = "io.so";
                Console.WriteLine($"C++ Library File Name: {fileNameIO}");
                File.Copy(Path.Combine(sourceDirectory, fileNameIO), Path.Combine(targetDirectory, fileNameIO), true);

    		[DllImport(fileNameIO, EntryPoint = "hello_io", CharSet=CharSet.Unicode, CallingConvention = CallingConvention.ThisCall)]
		static extern void hello_io(char* c);

		// Unmanaged calling convention: must be one of stdcall, cdecl, or thiscall
        	// Thiscall requires that the first parameter is present and can be enregistered
        	string marshal = "Marshal: thiscall";
        	IntPtr iptrmarshal = Marshal.StringToHGlobalAnsi(marshal);  
        	char *cptrmarshal = (char*)iptrmarshal.ToPointer();
        	/*
        	delegate* unmanaged <void> delUnmanagedC = (delegate* unmanaged <void>)(delegate* <void>)&hello_cdecl;
        	delegate* unmanaged <char*, void> delUnmanagedT = (delegate* unmanaged <char*, void>)(delegate* <char*, void>)&hello_io;
        	delUnmanagedC();
        	delUnmanagedT(cptrmarshal);
        	*/	

		delegate* unmanaged[Cdecl]<void> delUnmanagedCdecl = (delegate* unmanaged[Cdecl]<void>)(delegate* <void>)&hello_cdecl;
        	delegate* unmanaged[Thiscall]<char*, void> delUnmanagedThiscall = (delegate* unmanaged[Thiscall]<char*, void>)(delegate* <char*, void>)&hello_io;

		delUnmanagedCdecl();
		delUnmanagedThiscall(cptrmarshal);
	    }
	    catch (Exception e) when (e is IOException || e is UnauthorizedAccessException || e is Exception)
   	    {
		// Console.WriteLine($"{e.GetType()} StackTrace: {e.StackTrace}");
		Console.WriteLine($"{e.GetType()} Message: {e.Message}");
	    }
        }
    }
}

class SystemProperties
{
    public void Print()
    {
        Console.WriteLine($"System.Environment.OSVersion: {System.Environment.OSVersion}");
        Console.WriteLine($"System.Environment.OSVersion.Platform: {System.Environment.OSVersion.Platform}");
        Console.WriteLine($"System.Environment.OSVersion.Version: {System.Environment.OSVersion.Version}");
        Console.WriteLine($"System.Environment.OSVersion.VersionString: {System.Environment.OSVersion.VersionString}");
        Console.WriteLine($"System.Environment.OSVersion.Version.Major: {System.Environment.OSVersion.Version.Major}");
        Console.WriteLine($"System.Environment.OSVersion.Version.Minor: {System.Environment.OSVersion.Version.Minor}");

        Console.WriteLine($"System.Environment.OSVersion.Platform == System.PlatformID.Win32NT: {System.Environment.OSVersion.Platform == System.PlatformID.Win32NT}");
        Console.WriteLine($"System.Environment.OSVersion.Platform == System.PlatformID.Unix: {System.Environment.OSVersion.Platform == System.PlatformID.Unix}");
        // Mono JIT compiler version 6.12.0.206 'PlatformID' does not contain a definition for 'Other'
	// Console.WriteLine($"System.Environment.OSVersion.Platform == System.PlatformID.Other: {System.Environment.OSVersion.Platform == System.PlatformID.Other}");
        // System.PlatformID.Win32NT
        // Console.WriteLine($"System.Environment.OSVersion.ServicePack: {System.Environment.OSVersion.ServicePack}");

        // System.Environment.Version property returns the .NET runtime version for .NET 5+ and .NET Core 3.x
        // Not recommend for .NET Framework 4.5+
        Console.WriteLine($"System.Environment.Version: {System.Environment.Version}");
        //  <-- Keep this information secure! -->
        // Console.WriteLine($"System.Environment.UserName: {System.Environment.UserName}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine($"System.Environment.MachineName: {System.Environment.MachineName}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine($"System.Environment.UserDomainName: {System.Environment.UserDomainName}");

        Console.WriteLine($"System.Environment.Is64BitOperatingSystem: {System.Environment.Is64BitOperatingSystem}");
        Console.WriteLine($"System.Environment.Is64BitProcess: {System.Environment.Is64BitProcess}");

        //  <-- Keep this information secure! -->
        // Console.WriteLine("CurrentDirectory: {0}", System.Environment.CurrentDirectory);
        //  <-- Keep this information secure! -->
        // Console.WriteLine("SystemDirectory: {0}", System.Environment.SystemDirectory);

        // RuntimeInformation.FrameworkDescription property gets the name of the .NET installation on which an app is running
        // .NET 5+ and .NET Core 3.x // .NET Framework 4.7.1+ // Mono 5.10.1+
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription: {System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription}");

        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture: {System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture}");
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.OSArchitecture: {System.Runtime.InteropServices.RuntimeInformation.OSArchitecture}");
        Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.OSDescription): {System.Runtime.InteropServices.RuntimeInformation.OSDescription}");
        // Mono JIT compiler version 6.12.0.206 'RuntimeInformation' does not contain a definition for 'RuntimeIdentifier'
        // Console.WriteLine($"System.Runtime.InteropServices.RuntimeInformation.RuntimeIdentifier: {System.Runtime.InteropServices.RuntimeInformation.RuntimeIdentifier}");

        // <-- Keep this information secure! -->
#if comments
        Console.WriteLine("Environment Variables:");
        foreach (System.Collections.DictionaryEntry de in System.Environment.GetEnvironmentVariables())
        {
            Console.WriteLine("{0} = {1}", de.Key, de.Value);
        }
#endif
    }
}


// dotnet run
/*
System.Environment.OSVersion: Unix 15.1.0
System.Environment.OSVersion.Platform: Unix
System.Environment.OSVersion.Version: 15.1.0
System.Environment.OSVersion.VersionString: Unix 15.1.0
System.Environment.OSVersion.Version.Major: 15
System.Environment.OSVersion.Version.Minor: 1
System.Environment.OSVersion.Platform == System.PlatformID.Win32NT: False
System.Environment.OSVersion.Platform == System.PlatformID.Unix: True
System.Environment.Version: 5.0.17
System.Environment.Is64BitOperatingSystem: True
System.Environment.Is64BitProcess: True
System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription: .NET 5.0.17
System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture: X64
System.Runtime.InteropServices.RuntimeInformation.OSArchitecture: X64
System.Runtime.InteropServices.RuntimeInformation.OSDescription): Darwin 24.1.0 Darwin Kernel Version 24.1.0: Thu Oct 10 21:03:15 PDT 2024; root:xnu-11215.41.3~2/RELEASE_ARM64_T6000

C++ Library File Name: cdecl.so
static extern function
C++ Library File Name: io.so
Hello, cdecl!
Marshal: thiscall
*/