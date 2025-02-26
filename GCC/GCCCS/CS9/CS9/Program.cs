// CS 9.0
/*
1. Records
2. Init only setters
3. Top-level statements
4. Pattern matching enhancements
5. Native sized integers
6. Function pointers
7. Suppress emitting localsinit flag
8. Target-typed new expressions
9. static anonymous functions
10. Target-typed conditional expressions
11. Covariant return types
12. Extension GetEnumerator support for foreach loops
13. Lambda discard parameters
14. Attributes on local functions
15. Module initializers
16. New features for partial methods
17. Warning wave 5
*/


/*************************************************************************************************************************/
// using directives
/*************************************************************************************************************************/
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// System Properties
/*************************************************************************************************************************/
SystemProperties propertiesSystem = new();
propertiesSystem.Print();
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 3. Top-level statements
/*************************************************************************************************************************/
// Top-level statements must precede namespace and type declarations.
// Warning CS7022: The entry point of the program is global code; ignoring 'Program.Main()' entry point. // Errors will not be ignored though.
Console.WriteLine("3. Top-level statements");
// Console.WriteLine($"args: {(args.Length > 0 ? args[0] : args)}"); // dotnet run CS.NET9.0 // args: CS.NET9.0
Console.WriteLine($"args: {(args.Length > 0 ? string.Join(", " , args) : args)}"); // dotnet run CS .NET 9.0 // args: CS, .NET, 9.0
// return;
// return 1; // only int
// The top-level statements may contain async expressions. In that case, the synthesized entry point returns a Task, or Task<int>.
Task taskAsync = Task.Run(() => Thread.Sleep(1000)); // Task taskAsync = Task.Run(() => Task.Delay(1000));
Console.WriteLine($"Task Status: {taskAsync.Status}");
Console.WriteLine($"Task IsCompleted: {taskAsync.IsCompleted}");
Console.WriteLine("Thread.Sleep(1000)");
Thread.Sleep(1000);
Console.WriteLine($"Task Status: {taskAsync.Status}");
Console.WriteLine($"Task IsCompleted: {taskAsync.IsCompleted}");
await taskAsync;
Task<int> asyncTask = Task.Run( () => Enumerable.Range(1, new Random().Next(100)).Count( x => x % 2 == 0));
Console.WriteLine($"Task Status: {asyncTask.Status}");
Console.WriteLine($"Task IsCompleted: {asyncTask.IsCompleted}");
Console.WriteLine($"Task Result: {asyncTask.Result}");
Console.WriteLine($"Task Status: {asyncTask.Status}");
Console.WriteLine($"Task IsCompleted: {asyncTask.IsCompleted}");
// return await asyncTask;
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("1. Records");
/*************************************************************************************************************************/
Console.WriteLine($"record IsValueType: {typeof(R).IsValueType}");
Console.WriteLine($"record new() IsValueType: {new R().GetType().IsValueType}");
Console.WriteLine($"record IsClass: {typeof(R).IsClass}");

RecordType typeRecord = new RecordType();

C c1 = new();
C c2 = new();
c1.x = 1;
c2.x = 2;
Console.WriteLine($"Class Before c1 = c2: c1.x = {c1.x}, 2.x = {c2.x}"); // 1, 2
// c1 = c2.ShallowCopy; // 3, 2
c1 = c2; // 3, 3
c1.x = 3;
Console.WriteLine($"Class After c1 = c2 and c1.x = 3: c1.x = {c1.x}, c2.x = {c2.x}"); // 3, 3

S s1 = new();
S s2 = new();
s1.x = 1;
s2.x = 2;
Console.WriteLine($"Structure Before s1 = s2: s1.x = {s1.x}, s2.x = {s2.x}"); // 1, 2
s1 = s2.ShallowCopy; // 3, 2
// s1 = s2; // 3, 2
s1.x = 3;
Console.WriteLine($"Structure After s1 = s2 and s1.x = 3: 1.x = {s1.x}, s2.x = {s2.x}"); // 3, 2

R r1 = new();
R r2 = new();
r1.x = 1;
r2.x = 2;
Console.WriteLine($"Record Before r1 = r2: r1.x = {r1.x}, r2.x = {r2.x}"); // 1, 2
// r1 = r2.ShallowCopy; // 3, 2
r1 = r2; // 3, 3
r1.x = 3;
Console.WriteLine($"Record After r1 = r2 and r1.x = 3: r1.x = {r1.x}, r2.x = {r2.x}"); // 3, 3

var veh = new Vehicle("Boeing", "Dreamliner");
var air = new Aircraft("Boeing", "Dreamliner", 787);

// Equality is value-based
Console.WriteLine("Equality is value-based");
Console.WriteLine(veh == air); // False
Console.WriteLine(veh is Aircraft a); // False
Console.WriteLine(air is Vehicle c); // True

// Print record object ToString() 
Console.WriteLine(air.ToString());

// Deconstruct method for positional records
Console.WriteLine("Deconstruct method for positional records");
var (real, nick) = veh;
Console.WriteLine(real);
Console.WriteLine(nick);
var (_, _, acn) = air;
Console.WriteLine(acn);

// Record with-expressions
Console.WriteLine("Record with-expressions");
Vehicle airbusDreamliner = veh with { RealName = "Airbus" };
Console.WriteLine(airbusDreamliner.ToString());
Vehicle boeingSuperjumbo = veh with { Nickname = "Superjumbo" };
Console.WriteLine(boeingSuperjumbo.ToString());
Vehicle airbusSuperjumbo = veh with { RealName = "Airbus", Nickname = "Superjumbo" };
Console.WriteLine(airbusSuperjumbo.ToString());
Vehicle airbusIndustrie = air with { RealName = "Airbus", Nickname = "Superjumbo", AircraftClassificationNumber = 380 };
Console.WriteLine(airbusIndustrie.ToString());

Console.WriteLine(new Games("Paris 2024").ToString());
Console.WriteLine(new Olympics("Los Angeles 2028").ToString());
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("2. Init only setters");
/*************************************************************************************************************************/
// Property initializer syntax to set the values, while still preserving the immutability
var metrics = new Analytics
{
    Browser = "Chromium",
    Sessions = 3000,
    PagesPerSession = 3.5F,
};
// metrics = metrics with { Browser = "Chrome" }; // record type
// Changing a property after initialization is an error by assigning to an init-only property outside of initialization
// The construction phase effectively ends after all initialization, including property initializers and with-expressions (record type) have completed.
// Error CS8852: Init-only property or indexer 'Analytics.Browser' can only be assigned in an object initializer, or on 'this' or 'base' in an instance constructor or an 'init' accessor.
// metrics.Browser = "Edge";
Console.WriteLine(metrics.ToString());
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("4. Pattern matching enhancements");
/*************************************************************************************************************************/
Console.WriteLine('1'.IsNumeric()); // True
Console.WriteLine('a'.IsNumeric()); // False
// Alternatively, with optional parentheses to make it clear that and has higher precedence than or
Console.WriteLine('a'.IsAlphaNumeric()); // True
Console.WriteLine('1'.IsAlphaNumeric()); // True
Console.WriteLine('~'.IsAlphaNumeric()); // False

var isNot = string.Empty;

if (isNot is not null)
{
    Console.WriteLine("is not null");
}
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("5. Native sized integers");
/*************************************************************************************************************************/
nint native = nint.MinValue;
nuint unsignedNative = nuint.MaxValue;
Console.WriteLine($"nint.MinValue = {native}");
Console.WriteLine($"nuint.MaxValue = {unsignedNative}");
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("6. Function pointers");
/*************************************************************************************************************************/
FunctionPointers funPointers = new();
funPointers.Print();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("7. Suppress emitting localsinit flag");
/*************************************************************************************************************************/
Suppresslocalsinit suppress = new();
suppress.StackAllocatedMemoryBlock();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("8. Target-typed new expressions");
/*************************************************************************************************************************/
TargetTypedNewExpressions expressionsTargetTyped = new();
var metric = expressionsTargetTyped.MetricsFor("Chrome", new());
// Combine target-typed new with init only properties to initialize a new object
Dimension city = new() { Location = "Scientia" };
Console.WriteLine(city.Location);
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("9. static anonymous functions");
/*************************************************************************************************************************/
StaticAnonymousFunctions anonymousFunctionsStatic = new();
anonymousFunctionsStatic.Anonymous();
anonymousFunctionsStatic.Act(anonymousFunctionsStatic.Fun(5));
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("10. Target-typed conditional expressions");
/*************************************************************************************************************************/
var rand = new Random();
var condition = rand.Next(0, 99) > 50;

// 10. Target-typed conditional expressions
// Conditional expressions that previously required casts or wouldn’t compile now just work
// int? nullable = condition ? 1 : (int?)null;

int? nullable = condition ? 1 : null;
Console.WriteLine($"{condition} {nullable}");
// Type of conditional expression cannot be determined because there is no implicit conversion between 'int' and '<null>'
// var implicitNullable = condition ? 1 : null;
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("11. Covariant return types");
/*************************************************************************************************************************/
B b = new B();
b.VirtualMethodA();
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("12. Extension GetEnumerator support for foreach loops");
/*************************************************************************************************************************/
IEnumerator<int> enumerator = Enumerable.Range(0, 10).GetEnumerator();
// Pre-CS 9.0 
/*
while(enumerator.MoveNext()) 
{
    Console.Write(enumerator.Current + " ");            
}   
*/
// Pre-CS 9.0 foreach statement cannot operate on variables of type 'IEnumerator<int>' because 'IEnumerator<int>' does not contain a public instance 
// CS 9.0 foreach loop recognizes extension method GetEnumerator 
foreach (var item in enumerator)
{
    Console.Write(item + " ");
}
Console.WriteLine();

async IAsyncEnumerator<int> GetAsyncEnumerator()
{
    yield return 0;
    await Task.Delay(1);
    yield return 1;
}

// CS 9.0 foreach recognizes async extension method
IAsyncEnumerator<int> enumeratorAsync = GetAsyncEnumerator();
await foreach (var item in enumeratorAsync)
{
    Console.Write(item + " ");
}
Console.WriteLine();

// CS 9.0 Iterate on ValueTuple using a foreach
foreach (var item in (2, 3, 4))
{
    Console.Write(item + " ");
}
Console.WriteLine();

// CS 9.0 Iterate on Tuple using a foreach
foreach (var item in Tuple.Create(4, 5, 6))
{
    Console.Write(item + " ");
}
Console.WriteLine("\n");
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("13. Lambda discard parameters");
/*************************************************************************************************************************/
LambdaDiscardParameters DiscardParametersLambda = new();
Console.WriteLine(DiscardParametersLambda.Constant(null, null));
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("14. Attributes on local functions");
/*************************************************************************************************************************/
AttributesOnLocalFunctions localFunctionsAttributes = new();
localFunctionsAttributes.Function();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("16. New features for partial methods");
/*************************************************************************************************************************/
// CS 9.0 The two features added for code generators are extensions to partial method syntax, and module initializers
int outResult;
PartialMethods partialMethod = new();
partialMethod.PartialMethod(out outResult);
Console.WriteLine($"partial method out parameter:{outResult}");
Console.WriteLine();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
Console.WriteLine("17. Warning wave 5");
/*************************************************************************************************************************/
WarningWave5 Wave5Warning = new();
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 1. Records
/*************************************************************************************************************************/
/*
record Vehicle
{
    public string RealName { get; }
    public string Nickname  { get; }

    public Vehicle(string real, string nick) => (RealName, Nickname) = (real, nick);
}

// Inherit record
// Records may only inherit from object or another record
record Car : Vehicle
{
    public string Brand { get; }

    public Car(string real, string nick, string tagline) : base(real, nick) => Brand = tagline;
}

// Can be sealed
sealed record Aircraft : Vehicle
{
    public int AircraftClassificationNumber { get; }

    public Aircraft(string real, string nick, int acn) : base(real, nick) => AircraftClassificationNumber = acn;
}
*/

// Positional records
record Vehicle(string RealName, string Nickname);

record Car(string RealName, string Nickname, string Brand) : Vehicle(RealName, Nickname);

sealed record Aircraft(string RealName, string Nickname, int AircraftClassificationNumber) : Vehicle(RealName, Nickname);

// Anamoly?
record WithoutCurlyBraces;

// Can have destructor
record RecordType
{
    public RecordType()
    {
        Console.WriteLine("record constructor");
    }

    // record destructor
    /*
    // The programmer has no control over when the finalizer is called; the garbage collector decides when to call it.
    // The garbage collector checks for objects that are no longer being used by the application.
    // If it considers an object eligible for finalization, it calls the finalizer (if any) and reclaims the memory used to store the object.
    // It's possible to force garbage collection by calling Collect, but most of the time, this call should be avoided because it may create performance issues.
    */
    ~RecordType() => Console.WriteLine("The finalizer is executing.");
}

interface IRecordInterface { }

// Default internal
// Can be generic
// Can be abstract
// Can only inherit from object or another record
// Can implement interface
// Can have static constructor
// Cannot be static 
abstract record AssertRecord<T> : object, IRecordInterface
{ 
    static AssertRecord() { }
    public abstract void AbstractMethod(); 
}

// Add a body and include any additional methods as well to record
record Games(string Name)
{
    public void Play() => Console.WriteLine("Good sport!");
}

record Olympics(string Name) : Games(Name)
{
    public void WinMedals() => Console.WriteLine("Bring laurels!");

    public override string ToString()
    {
        StringBuilder s = new();
        // CS 9.0 record base
        base.PrintMembers(s); 
        return $"Olympics {{ {s.ToString()} }}";
    }
}

class C
{
    public int x = 0;
    public C ShallowCopy => (C)MemberwiseClone();
}

struct S
{
    public int x;
    public S ShallowCopy => (S)MemberwiseClone();
}

record R
{
    public int x;
    public R ShallowCopy => (R)MemberwiseClone();
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 2. Init only setters
/*************************************************************************************************************************/
// record Analytics
struct Analytics
{
    // init accessors instead of set accessors for properties and indexers
    // public string Browser { get; set; }
    public string Browser { get; init; }
    public int Sessions { get; init; }
    public float PagesPerSession { get; init; }

    public override string ToString() => $"Browser = {Browser}, Sessions = {Sessions}, with {PagesPerSession} pages/session.";
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 4. Pattern matching enhancements
/*************************************************************************************************************************/
static class ExtensionPatternMatchingEnhancements
{
    public static bool IsNumeric(this char c) => c is >= '0' and <= '9';
    public static bool IsAlphaNumeric(this char c) => c is (>= 'a' and <= 'z') or (>= 'A' and <= 'Z') or (>= '0' and <= '9');
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 6. Function pointers
/*************************************************************************************************************************/
// <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
unsafe delegate char* UnsafeDelegate(char *c);

// Only for reference/analogy
/*
delegate int FunctionPointer(string s);
// delegate FunctionPointer FunPointer(FunctionPointer f);
// unsafe delegate delegate*<string, int> FunPointer(delegate* managed<string, int> f);
unsafe delegate delegate*<char*, int> FunPointer(delegate* managed<char*, int> f);
// unsafe delegate delegate* unmanaged<string, void> UnmanagedDelegate();
unsafe delegate delegate* unmanaged<char*, void> UnmanagedDelegate();
*/

class FunctionPointers
{
    // Unsafe delegate need not refer static method
    // public static char* UnsafeDelegateMethod(char *c) => c;
    unsafe public char* UnsafeDelegateMethod(char *c) => c;

    // Only static methods for function pointers delegate*
    public static void StaticMethod() => Console.WriteLine("Function pointer to static method");
    public static void StaticMethod(string s) => Console.WriteLine($"Function pointer to static method: {s}");
    public static void StaticMethod(int i) => Console.WriteLine($"Function pointer to static method: {i}");

    // Only static methods for managed and unmanaged function pointers delegate*
    public static void ManagedStaticMethod(string s) => Console.WriteLine($"Function pointer: {s}");
    // unsafe public static void UnManagedStaticMethod(int i) => Console.WriteLine($"Function pointer: {i}");
    unsafe public static void UnManagedStaticMethod(char *c) => Console.WriteLine($"Function pointer: {Marshal.PtrToStringAnsi((IntPtr)c)}");    
    
    // Only static methods for function pointer equivalents delegate*
    public static int Function(string s) { Console.WriteLine($"Function pointer: {s}"); return default(int); }
    unsafe public static delegate*<string, int> Fun(delegate* managed<string, int> f) => default(delegate*<string, int>);

    unsafe public void Print()
    {
        UnsafeDelegate delUnsafe = UnsafeDelegateMethod;

        // Method groups will now be allowed as arguments to an address-of expression
        delegate*<void> delStaticMethod = &StaticMethod; // StaticMethod()
        // last parameterized type is return type
        delegate*<string, void> delStaticMethods = &StaticMethod; // StaticMethod(string s)
        delegate*<int, void> delStaticMethodi = &StaticMethod; // StaticMethod(int i)

        // Error: ambiguous conversion from method group StaticMethod to "void*"
        // void* v = &StaticMethod;

        delegate* managed<string, void> delManaged = &ManagedStaticMethod;
        // delegate* unmanaged<int, void> delUnmanaged = (delegate* unmanaged<int, void>)(delegate* <int, void>)&UnManagedStaticMethod;
        delegate* unmanaged<char*, void> delUnmanaged = (delegate* unmanaged<char*, void>)(delegate*<char*, void>)&UnManagedStaticMethod;

        // Function pointer equivalent without calling convention
        delegate*<string, int> delEquivalent = &Function;
        delegate*<delegate* managed<string, int>, delegate*<string, int>> delEquivalentManaged = &Fun;

        // Function pointer equivalent with calling convention
        delegate* managed<string, int> delManagedEqui = &Function;
        delegate*<delegate* managed<string, int>, delegate*<string, int>> delEquiManaged = &Fun;

        string marshal = "Marshal: unsafe delegate can refer non-static method";
        IntPtr iptrmarshal = Marshal.StringToHGlobalAnsi(marshal);
        char* cptrmarshal = (char*)iptrmarshal.ToPointer();
        char* cpmarshal = delUnsafe(cptrmarshal);
        Console.WriteLine(Marshal.PtrToStringAnsi((IntPtr)cpmarshal));

        delStaticMethod();
        delStaticMethods("Hello, World!");
        delStaticMethodi(1);

        delManaged("delegate managed");
        // delUnmanaged(1);
        string marsh = "Marshal: delegate unmanaged";
        IntPtr iptrmarsh = Marshal.StringToHGlobalAnsi(marsh);
        char* cptrmarsh = (char*)iptrmarsh.ToPointer();
        delUnmanaged(cptrmarsh);

        Console.WriteLine($"delegate equivalent return: {delEquivalent("delegate equivalent")}");
        /*
        delegate*<string, int> delEquivalentManagedRoundtrip = delEquivalentManaged(delEquivalent);
        delEquivalentManagedRoundtrip = &Function;
        Console.WriteLine($"delegate equivalent managed round trip return: {delEquivalentManagedRoundtrip("delegate equivalent managed round trip")}");
        */
        delEquivalent = delEquivalentManaged(delEquivalent);
        delEquivalent = &Function;
        Console.WriteLine($"delegate equivalent managed round trip return: {delEquivalent("delegate equivalent managed round trip")}");

        Console.WriteLine($"delegate managed equi return: {delManagedEqui("delegate managed equi")}");
        /*
        delegate*<string, int> delEquiManagedRoundtrip = delEquiManaged(delManagedEqui);
        delEquiManagedRoundtrip = &Function;
        Console.WriteLine($"delegate equi managed round trip return: {delEquiManagedRoundtrip("delegate equi managed round trip")}");
        */
        delManagedEqui = delEquiManaged(delManagedEqui);
        delManagedEqui = &Function;
        Console.WriteLine($"delegate equi managed round trip return: {delManagedEqui("delegate equi managed round trip")}");
        Console.WriteLine();
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 7. Suppress emitting localsinit flag
/*************************************************************************************************************************/
class Suppresslocalsinit
{ 
    // CS 9.0 Add the SkipLocalsInitAttribute to instruct the compiler not to emit the localsinit flag 
    // As this flag instructs the CLR to zero-initialize all local variables
    // <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    [SkipLocalsInitAttribute]
    public void StackAllocatedMemoryBlock()
    {
        Console.Write("SkipLocalsInitAttribute for stackalloc: ");
        int length = 3;
        Span<int> numbers = stackalloc int[length];
        for (var i = 0; i < length; i++)
        {
            numbers[i] = i;
            // Console.Write($"{numbers[i]}{(char)32}");
        }
        Console.WriteLine(string.Join(", ", numbers.ToArray()));
        Console.WriteLine();
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 8. Target-typed new expressions
/*************************************************************************************************************************/
class AnalyticsOptions { }

class Dimension
{
    // Init only setters or properties 
    public string Location { get; init; }
}

class TargetTypedNewExpressions
{
    // 8. Target-typed new expressions
    // CS 9.0 Omit the type in a new expression when the created object's type is already known
    private List<Analytics> metrics = new();

    // Return an instance created by the default constructor using a return new(); statement
    public Analytics Instance()
    {
        return new();
    }

    // 8. Target-typed new expressions
    // Target-typed new can also be used when you need to create a new object to pass as an argument to a method
    // public Analytics MetricsFor(string browser, AnalyticsOptions options) => new();
    public Analytics MetricsFor(string browser, AnalyticsOptions options) => Instance();
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 9. static anonymous functions
/*************************************************************************************************************************/
delegate void Del();

class StaticAnonymousFunctions
{
    // 9. static anonymous functions
    // CS 9.0 static modifier for lambda expressions or anonymous methods
    public Del Anonymous = static () => Console.WriteLine("=> static anonymous functions"); // Del anonymous = static delegate { Console.WriteLine("9. static anonymous functions"); };
    public Func<int, int> Fun = static x => x * x;
    public Action<int> Act = static (int i) => Console.WriteLine($"=> static action: {i}"); // Action<int> act = static delegate (int i) { Console.WriteLine($"static action: {i}"); };
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 11. Covariant return types
/*************************************************************************************************************************/
class A
{
    public virtual A VirtualMethodA() => new();
}

class B : A
{
    // 11. Covariant return types
    // CS 9.0 Overridden virtual function can return a type derived from the return type declared in the base class method
    public override B VirtualMethodA() => new();
    // public override Covariant VirtualMethodA() => new();
}

// class Covariant : A { }
class Covariant : B { }
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 12. Extension GetEnumerator support for foreach loops
/*************************************************************************************************************************/
static class ExtensionGetEnumeratorSupportForForeachLoops
{
    // CS 9.0 foreach loop will recognize and use an extension method GetEnumerator
    public static IEnumerator<T> GetEnumerator<T>(this IEnumerator<T> enumerator) => enumerator;
    public static IAsyncEnumerator<T> GetAsyncEnumerator<T>(this IAsyncEnumerator<T> enumerator) => enumerator;
    public static IEnumerator<object> GetEnumerator<T1, T2, T3>(this ValueTuple<T1, T2, T3> tuple)
    {
        yield return tuple.Item1;
        yield return tuple.Item2;
    }
    public static IEnumerator<object> GetEnumerator<T1, T2, T3>(this Tuple<T1, T2, T3> tuple)
    {
        yield return tuple.Item1;
        yield return tuple.Item2;
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 13. Lambda discard parameters
/*************************************************************************************************************************/
class LambdaDiscardParameters
{
    // 13. Lambda discard parameters
    // CS 9.0 discards for specifying two or more input parameters of a lambda expression that aren't used in the expression
    public Func<string, string, string> Constant = static (_, _) => "13. Lambda discard parameters (9. static anonymous functions)";
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 14. Attributes on local functions
/*************************************************************************************************************************/
class AttributesOnLocalFunctions
{
    public void Function()
    {
        Console.WriteLine("AllowNull: " + AllowNullLocalFunction(null));
        Console.WriteLine("DisallowNull: warning CS8625, warning CS8603");
#nullable enable // Or //#nullable enable warnings // warning CS8625: Cannot convert null literal to non-nullable reference type.
        Console.WriteLine(DisallowNullLocalFunction(null));
#nullable disable // Or //#nullable disable warnings

        /*
        You can use the following modifiers with a local function:
        async
        unsafe
        static (in CS 8.0 and later). A static local function can't capture local variables or instance state.
        extern (in CS 9.0 and later). An external local function must be static.
        */

        // 14. Attributes on local functions
        // CS 9.0 Nullable attribute annotations to local functions
        Console.WriteLine("14. Attributes on local functions");
        [return: MaybeNull] string AllowNullLocalFunction([AllowNull] string allowNull) => null;
#nullable enable // Or //#nullable enable warnings // warning CS8603: Possible null reference return // [return: NotNull] 
        string DisallowNullLocalFunction([DisallowNull] string disallowNull) => null;
#nullable disable // Or //#nullable disable warnings

        if (Environment.OSVersion.Platform == PlatformID.Win32NT)
        {
            try
            {
#nullable enable 
		string? currentFilePathAndNameWin32NT = new StackTrace(true).GetFrame(0)?.GetFileName();
        	string? currentDirectoryWin32NT = Path.GetDirectoryName(currentFilePathAndNameWin32NT);
#nullable disable
        	string sourceDirectoryWin32NT = currentDirectoryWin32NT + @"\GCCWin32NT\C";
        	string targetDirectoryWin32NT = Directory.GetCurrentDirectory();

                // Console.WriteLine($"Current Directory: {currentDirectoryWin32NT}");
                // Console.WriteLine($"Source Directory: {sourceDirectoryWin32NT}");
                // Console.WriteLine($"Target Directory: {targetDirectoryWin32NT}");

                const string fileNameWin32NT = "msys64-mingw64-gcc.dll";
                Console.WriteLine($"C Library File Name: {fileNameWin32NT}");
                File.Copy(Path.Combine(sourceDirectoryWin32NT, fileNameWin32NT), Path.Combine(targetDirectoryWin32NT, fileNameWin32NT), true);

                // CS 9.0 extern modifier for local functions
                Console.WriteLine("static extern in local function");
                [DllImport(fileNameWin32NT, CharSet = CharSet.Unicode)]
                static extern int c_code();

                Console.WriteLine($"C Code: Call Void Fuction: c_code(): {c_code()}");
		Console.WriteLine();
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
        	string sourceDirectory = currentDirectory + "/GCC/C_x86_64";
        	string targetDirectory = Directory.GetCurrentDirectory();

                // Console.WriteLine($"Current Directory: {currentDirectory}");
                // Console.WriteLine($"Source Directory: {sourceDirectory}");
                // Console.WriteLine($"Target Directory: {targetDirectory}");

                const string fileName = "apple-clang.so";
                Console.WriteLine($"C Library File Name: {fileName}");
                File.Copy(Path.Combine(sourceDirectory, fileName), Path.Combine(targetDirectory, fileName), true);

                // CS 9.0 extern modifier for local functions
                Console.WriteLine("static extern in local function");
                [DllImport(fileName, CharSet = CharSet.Unicode)]
                static extern int c_code(int number);

		Console.WriteLine($"C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To c_code(int number): {c_code(int.MaxValue / 10)}");
		Console.WriteLine();
            }
	    catch (Exception e) when (e is IOException || e is UnauthorizedAccessException || e is Exception)
   	    {
		// Console.WriteLine($"{e.GetType()} StackTrace: {e.StackTrace}");
		Console.WriteLine($"{e.GetType()} Message: {e.Message}");
	    }
        }
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 15. Module initializers
/*************************************************************************************************************************/
class ModuleInitializers
{
    /*
    Must have ModuleInitializerAttribute attribute 
    Must be static
    Must be non-virtual
    Must be parameterless
    Must return void
    Must not be a generic method
    Must not be contained in a generic class
    Must be accessible from the containing module // Will be called by the runtime when the assembly loads
    */

    // ModuleInitializer called without invoking
    [ModuleInitializerAttribute]
    public static void ModuleInitializer()
    {
        Console.WriteLine("15. Module initializers");
        Console.WriteLine("ModuleInitializerAttribute, static, non-virtual, parameterless, and void");
        Console.WriteLine("Will be called by the runtime when the assembly loads");
        Console.WriteLine();
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 16. New features for partial methods
/*************************************************************************************************************************/
partial class PartialMethods
{
    // Defining declaration for implementing declaration of partial method
    public partial PartialMethods PartialMethod(out int o);
}

partial class PartialMethods
{
    // Pre-CS9 partial methods are private but can't specify an access modifier, have a void return, and can't have out parameters
    // CS 9.0 removes these restrictions, but requires that partial method declarations have an implementation
    // Partial method without an access modifier follow the old rules
    // If the partial method includes the private access modifier, the new rules govern that partial method
    public partial PartialMethods PartialMethod(out int o)
    {
        o = 1;
        return new();
    }
}
/*************************************************************************************************************************/


/*************************************************************************************************************************/
// 17. Warning wave 5
/*************************************************************************************************************************/
// Comment out this for Warning wave 5
// #pragma warning disable CS7023, CS8073, CS8848, CS8897, CS8898, CS0219

class WarningWave5
{
    static class StaticClass
    {
        public static void Thing() { }
    }

    private void M(object o)
    {
        // CS7023 - A static type is used in an 'is' or 'as' expression.
        // Warning CS7023: The second operand of an 'is' or 'as' operator may not be static type 'WarningWave5.StaticClass'
        // To correct this warning, remove the test and remove any code executed only if the test succeeded.
        if (o is StaticClass)
        {
            Console.WriteLine("Can't happen");
        }
        else
        {
            Console.WriteLine("o is not an instance of a static class");
        }
    }

    class Program
    {
        public static void M(S s)
        {
            // CS8073 - The result of the expression is always 'false' (or 'true').
            // To fix this error, remove the null check and code that would execute if the object is null.
            if (s == null) { } // Warning CS8073: The result of the expression is always 'false' since a value of type 'WarningWave5.S' is never equal to 'null' of type 'WarningWave5.S?'
            if (s != null) { } // Warning CS8073: The result of the expression is always 'true' since a value of type 'WarningWave5.S' is never equal to 'null' of type 'WarningWave5.S?'
        }
    }

    struct S
    {
        public static bool operator ==(S s1, S s2) => s1.Equals(s2);
        public static bool operator !=(S s1, S s2) => !s1.Equals(s2);
#nullable enable // Or //#nullable enable warnings // Warning CS8632: The annotation for nullable reference types should only be used in code within a '#nullable' annotations context.
        public override bool Equals(object? other)
#nullable disable // Or //#nullable disable warnings
        {
            // Implementation elided
            return false;
        }
        public override int GetHashCode() => 0;

        // Other details elided...
    }

    class Src { }
    class Src2 { }

    private void CS8848()
    {
        dynamic dyna = new object();
        var source = dyna;
        bool b = true;
        // Warning CS8848: Operator 'from' cannot be used here due to precedence. Use parentheses to disambiguate.
        // To fix this warning, put parentheses around the query expression
        // var a = b && (from c in source select c); // Error commented out

        var indexes = dyna;
        int[] array = { 1, 2, 3, 4, 5, 6, 7 };
        // Warning CS8848: Operator 'from' cannot be used here due to precedence. Use parentheses to disambiguate.
        // To fix this warning, put parentheses around the query expression
        // var range = array[0..(from c in indexes select c)]; // Error commented out
    }

    /*
    // Members must be fully assigned, use of unassigned variable (CS8880, CS8881, CS8882, CS8883, CS8884, CS8885, CS8886, CS8887)
    // Several warnings improve the definite assignment analysis for struct types declared in imported assemblies.
    // All these new warnings are generated when a struct in an imported assembly includes an inaccessible field (usually a private field) of a reference type:
    */

    /*
    public struct Struct
    {
	//  Error CS8773: Feature 'struct field initializers' is not available in CS 9.0. Please use language version CS 10 or greater.
	private string data = String.Empty;

    	// Error CS8773: Feature 'parameterless struct constructors' is not available in CS 9.0. Please use language version CS 10 or greater.
	public Struct() { }
    }

    public struct DefiniteAssignmentNoWarnings
    {
        // CS8880
        public Struct Property { get; }
        // CS8881
        private Struct field;

        // CS8882
        public void Method(out Struct s)
        {
            s = default;
        }

        public DefiniteAssignmentNoWarnings(int dummy)
        {
            Property = default;
            field = default;

            // CS8883
            Struct v2 = Property;
            // CS8884
            Struct v3 = field;
            // CS8885:
            DefiniteAssignmentNoWarnings p2 = this;
        }

        public static void Method2(out Struct s1)
        {
            // CS8886
            s1 = default;
            var s2 = s1;
        }

        public static void UseLocalStruct()
        {
            Struct r1 = default;
            var r2 = r1;
        }
    }
    */

    public static class Utilities { }
      
    public interface IUtility
    {
        // Warning CS8897: 'WarningWave5.Utilities': static types cannot be used as parameters
        // To fix this warning, change the parameter type or remove the method.
        public void SetUtility(Utilities u);

        // Warning CS8898: 'WarningWave5.Utilities': static types cannot be used as return types
        // To fix this warning, change the return type or remove the method.
        public Utilities GetUtility();
    }
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
% arch
% arch -x86_64 zsh
[
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


// CS9.csproj
/*
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net5.0</TargetFramework>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
  </PropertyGroup>

</Project>
*/


// CS 9.0
// macOS
/*
% sudo rm -rf /usr/local/share/dotnet
% sudo rm -rf /etc/paths.d/dotnet
% sudo rm -rf /etc/paths.d/dotnet-cli-tools
dotnet-sdk-5.0.408-osx-x64.pkg
% /usr/local/share/dotnet/x64/dotnet --version
5.0.408
<TargetFramework>net5.0</TargetFramework>
% /usr/local/share/dotnet/x64/dotnet run
% /usr/local/share/dotnet/x64/dotnet run --framework net5.0
*/


// dotnet run // Excluding Warnings Intended
/*
15. Module initializers
ModuleInitializerAttribute, static, non-virtual, parameterless, and void
Will be called by the runtime when the assembly loads

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

3. Top-level statements
args: System.String[]
Task Status: WaitingToRun
Task IsCompleted: False
Thread.Sleep(1000)
Task Status: Running
Task IsCompleted: True
Task Status: WaitingToRun
Task IsCompleted: False
Task Result: 46
Task Status: RanToCompletion
Task IsCompleted: True

1. Records
record IsValueType: False
record new() IsValueType: False
record IsClass: True
record constructor
Class Before c1 = c2: c1.x = 1, 2.x = 2
Class After c1 = c2 and c1.x = 3: c1.x = 3, c2.x = 3
Structure Before s1 = s2: s1.x = 1, s2.x = 2
Structure After s1 = s2 and s1.x = 3: 1.x = 3, s2.x = 2
Record Before r1 = r2: r1.x = 1, r2.x = 2
Record After r1 = r2 and r1.x = 3: r1.x = 3, r2.x = 3
Equality is value-based
False
False
True
Aircraft { RealName = Boeing, Nickname = Dreamliner, AircraftClassificationNumber = 787 }
Deconstruct method for positional records
Boeing
Dreamliner
787
Record with-expressions
Vehicle { RealName = Airbus, Nickname = Dreamliner }
Vehicle { RealName = Boeing, Nickname = Superjumbo }
Vehicle { RealName = Airbus, Nickname = Superjumbo }
Aircraft { RealName = Airbus, Nickname = Superjumbo, AircraftClassificationNumber = 380 }
Games { Name = Paris 2024 }
Olympics { Name = Los Angeles 2028 }

2. Init only setters
Browser = Chromium, Sessions = 3000, with 3.5 pages/session.

4. Pattern matching enhancements
True
False
True
True
False
is not null

5. Native sized integers
nint.MinValue = -9223372036854775808
nuint.MaxValue = 18446744073709551615

6. Function pointers
Marshal: unsafe delegate can refer non-static method
Function pointer to static method
Function pointer to static method: Hello, World!
Function pointer to static method: 1
Function pointer: delegate managed
Function pointer: Marshal: delegate unmanaged
Function pointer: delegate equivalent
delegate equivalent return: 0
Function pointer: delegate equivalent managed round trip
delegate equivalent managed round trip return: 0
Function pointer: delegate managed equi
delegate managed equi return: 0
Function pointer: delegate equi managed round trip
delegate equi managed round trip return: 0

7. Suppress emitting localsinit flag
SkipLocalsInitAttribute for stackalloc: 0, 1, 2

8. Target-typed new expressions
Scientia

9. static anonymous functions
=> static anonymous functions
=> static action: 25

10. Target-typed conditional expressions
True 1

11. Covariant return types

12. Extension GetEnumerator support for foreach loops
0 1 2 3 4 5 6 7 8 9 
0 1 
2 3 
4 5 

13. Lambda discard parameters
13. Lambda discard parameters (9. static anonymous functions)

14. Attributes on local functions
AllowNull: 
DisallowNull: warning CS8625, warning CS8603

14. Attributes on local functions
C Library File Name: apple-clang.so
static extern in local function
C Code: Multiply By 10: By Passing Argument (int.MaxValue / 10) For Parameter (number) To c_code(int number): 2147483640

16. New features for partial methods
partial method out parameter:1

17. Warning wave 5
*/


// Credits
/*
https://dotnet.microsoft.com/
https://gcc.gnu.org/
*/