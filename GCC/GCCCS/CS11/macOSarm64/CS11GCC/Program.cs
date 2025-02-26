// CS 11
/*
Generic math support
*/


/*************************************************************************************************************************/
// Explicit using directives
/*************************************************************************************************************************/
using System.Diagnostics;
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// System Properties
/*************************************************************************************************************************/
SystemProperties propertiesSystem = new();
propertiesSystem.Print();
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("Generic math support: static extern in interface");
/*************************************************************************************************************************/
if (Environment.OSVersion.Platform == PlatformID.Win32NT)
{
    try
    {
        string? currentFilePathAndNameWin32NT = new StackTrace(true).GetFrame(0)?.GetFileName();
        string? currentDirectoryWin32NT = Path.GetDirectoryName(currentFilePathAndNameWin32NT);
        string sourceDirectoryWin32NT = currentDirectoryWin32NT + @"\GCCWin32NT\C";
        string targetDirectoryWin32NT = Directory.GetCurrentDirectory();

        // Console.WriteLine($"Current Directory: {currentDirectoryWin32NT}");
        // Console.WriteLine($"Source Directory: {sourceDirectoryWin32NT}");
        // Console.WriteLine($"Target Directory: {targetDirectoryWin32NT}");

        const string fileNameWin32NT = "msys64-mingw64-gcc.dll";
        Console.WriteLine($"C Library File Name: {fileNameWin32NT}");
        File.Copy(Path.Combine(sourceDirectoryWin32NT, fileNameWin32NT), Path.Combine(targetDirectoryWin32NT, fileNameWin32NT), true);

	Console.WriteLine($"C Code: Call Void Fuction: IStatic.c_code(): {IStatic.c_codeWin32NT()}");
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
        string? currentFilePathAndName = new StackTrace(true).GetFrame(0)?.GetFileName();
        string? currentDirectory = Path.GetDirectoryName(currentFilePathAndName);
        string sourceDirectory = currentDirectory + "/GCC/C";
        string targetDirectory = Directory.GetCurrentDirectory();

        // Console.WriteLine($"Current Directory: {currentDirectory}");
        // Console.WriteLine($"Source Directory: {sourceDirectory}");
        // Console.WriteLine($"Target Directory: {targetDirectory}");

        const string fileName = "apple-clang.so";
        Console.WriteLine($"C Library File Name: {fileName}");
        File.Copy(Path.Combine(sourceDirectory, fileName), Path.Combine(targetDirectory, fileName), true);

        Console.WriteLine($"C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To IStatic.c_code(int number): {IStatic.c_code(int.MaxValue / 10)}");
    }
    catch (Exception e) when (e is IOException || e is UnauthorizedAccessException || e is Exception)
    {
	// Console.WriteLine($"{e.GetType()} StackTrace: {e.StackTrace}");
	Console.WriteLine($"{e.GetType()} Message: {e.Message}");
    }
}

partial interface IStatic
{
    // DllImport attribute cannot be applied to a method that is generic or contained in a generic method or type
    const string fileNameWin32NT = "msys64-mingw64-gcc.dll";
    [System.Runtime.InteropServices.DllImport(fileNameWin32NT)]
    static extern int c_codeWin32NT();
}

partial interface IStatic
{
    // DllImport attribute cannot be applied to a method that is generic or contained in a generic method or type
    const string fileName = "apple-clang.so";
    [System.Runtime.InteropServices.DllImport(fileName)]
    static extern int c_code(int number);
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// System Properties
/*************************************************************************************************************************/
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
/*************************************************************************************************************************/


// msys64-mingw64-gcc.dll
/*
$ mkdir -p "GCCWin32NT/C"
$ vim GCCWin32NT/C/msys64-mingw64-gcc.c
$ cat GCCWin32NT/C/msys64-mingw64-gcc.c
#include <stdio.h>
int 
c_code(void) {
  printf("C!\n");
}
$ gcc -c msys64-mingw64-gcc.c
$ gcc -shared -o msys64-mingw64-gcc.dll msys64-mingw64-gcc.o
*/


// apple-clang.so
/* 
% sw_vers
[
% arch -x86_64 zsh
% arch -arm64 zsh 
]
% arch
% gcc --version
% nano apple-clang.c
#include <stdio.h>
int
c_code(int number) {
  return number * 10;
}

int
main() {
  printf("%i\n", c_code(5));
}
% cat apple-clang.c
% gcc -c -fPIC apple-clang.c
% gcc -shared -o apple-clang.so apple-clang.o

% gcc apple-clang.c -o apple-clang
% ./apple-clang
*/


// NB
// default
// CS 8 Nullable reference type
// <Nullable>enable</Nullable> in .csproj
// CS 10 Implicit using directives
// <ImplicitUsings>enable</ImplicitUsings> in .csproj
// % dotnet run --configuration Debug
// % cat obj/Debug/net9.0/CS13.GlobalUsings.g.cs
// Or
// % dotnet run --configuration Release
// % cat obj/Release/net9.0/CS13.GlobalUsings.g.cs
/*
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
*/


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
System.Environment.Version: 7.0.20
System.Environment.Is64BitOperatingSystem: True
System.Environment.Is64BitProcess: True
System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription: .NET 7.0.20
System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture: Arm64
System.Runtime.InteropServices.RuntimeInformation.OSArchitecture: Arm64
System.Runtime.InteropServices.RuntimeInformation.OSDescription): Darwin 24.1.0 Darwin Kernel Version 24.1.0: Thu Oct 10 21:03:15 PDT 2024; root:xnu-11215.41.3~2/RELEASE_ARM64_T6000

Generic math support: static extern in interface
C Library File Name: apple-clang.so
C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To IStatic.c_code(int number): 2147483640
*/