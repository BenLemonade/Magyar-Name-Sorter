using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace MagyarNameSorter
{
    class Program
    {

        static void Main(string[] args)
        {
            //Read in all of the lines of 'Names.txt'.
            string[] lines = System.IO.File.ReadAllLines
            (@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Names.txt");

            //Clear the Sorted.txt file of any text.
            File.WriteAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", String.Empty);

            //Create dictionary 'First Letter Dicitonary', in order to sort all names by first character.
            Dictionary<string, List<string>> FirstLetterDictionary = new Dictionary<string, List<string>>();

            //For each line from 'Names.txt':
            foreach (string line in lines)
            {

                //If new first character is missing from 'First Letter Dictionary':
                if (!FirstLetterDictionary.ContainsKey(line.Substring(0,1)))
                {
                    //Add the first character as a key/category to 'First Letter Dictionary'.
                    FirstLetterDictionary.Add(line.Substring(0,1), new List<string>());
                    FirstLetterDictionary[line.Substring(0, 1)].Add(line);
                }
                //Else add line to the appropriate key and ++ to its counter.
                FirstLetterDictionary[line.Substring(0,1)].Add(line);
            }

            //For each key/category in 'First Letter Dictionary':
            foreach (string key in FirstLetterDictionary.Keys)
            {
                //Write the key name + the key count with two additional lines to the console.
                Console.Write(key + " : " + FirstLetterDictionary[key].Count + " names" + System.Environment.NewLine + System.Environment.NewLine);

                //Write the key name + the key count with two additional lines to file 'Sorted.txt'.
                File.AppendAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", key + " : " + FirstLetterDictionary[key].Count + " names" + Environment.NewLine + Environment.NewLine);

                //For each item in the current key/category:
                foreach (string item in FirstLetterDictionary[key])
                {
                    //Write the current item, with a comma separator to the console.
                    Console.Write("{0}, ", item);

                    //Write the current item, with a comma separator to the file 'Sorted.txt'.
                    File.AppendAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", item + ", ");
                }

                //Add three new lines to the bottom of the last entry in the console.
                Console.WriteLine("");
                Console.WriteLine("");
                Console.WriteLine("");

                //Add three new lines to the bottom of the last entry in  the file 'Sorted.txt'.
                File.AppendAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", System.Environment.NewLine);
                File.AppendAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", System.Environment.NewLine);
                File.AppendAllText(@"C:\Visual Studio for C#\Projects\Magyar-Name-Sorter\Sorted.txt", System.Environment.NewLine);

            }
            Console.ReadKey();            
        }
    }
}
