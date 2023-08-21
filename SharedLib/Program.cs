namespace SharedLib;

public static class Program
{
    public static void SayHello()
    {
        var arch = System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture;
        Console.WriteLine("Hello, world!");
        Console.WriteLine();
        Console.WriteLine($"I'm running on {arch}");
    }
}