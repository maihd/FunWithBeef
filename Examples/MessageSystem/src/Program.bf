namespace MessageSystem;

using System;

public class Program
{
    static void Main()
    {
        Console.WriteLine("This is a simple message system!");

        MessageSystem messageSystem = new MessageSystem();
        messageSystem.ListenOnType(100, scope (message) => {
            Console.WriteLine("Message with type 100 received...");
		});
        messageSystem.ListenOnName("msg", scope (message) => {
            Console.WriteLine("Message with name \"msg\" received...");
		});
        messageSystem.Post(scope Message(100));
        messageSystem.Post(scope Message("msg"));
        delete messageSystem;

        // End of program, request press any key to close
        Console.WriteLine("Press any key to exit...");
        Console.Read();
    }
}