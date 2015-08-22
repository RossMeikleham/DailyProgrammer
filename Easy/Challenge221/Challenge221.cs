
using System;

public class Challenge221 {

    public static void Main(string[] args) {
        bool rightDirection = true;
        int x = 0;
        
        for (int i= 0; i < args.Length; i++) {

            // Travelling downwards
            if (!rightDirection) {
                for (int j = 1; j < args[i].Length - 1; j++) {
                    Console.WriteLine("{0}", args[i][j].ToString().PadLeft(x + 1));    
                }

                // If travelling downwards is the last word, print the last letter of it
                if (i == args.Length - 1) {
                    Console.WriteLine("{0}", args[i][args[i].Length - 1].ToString().PadLeft(x + 1));
                }
                rightDirection = true;

            // Travelling Right
            } else {
                Console.WriteLine("{0}", args[i].PadLeft(x + args[i].Length));
                rightDirection = false;
                x += (args[i].Length - 1);
            }       
        }       
    }
}
