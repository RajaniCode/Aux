﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SortDescending
{
  class Program
  {
    static void Main(string[] args)
    {
      // inspired
      string quote =
        "Most people have the will to win, few have the will to prepare to win.";


      // make an array dropping empty items
      string[] words = quote.Split(new char[] { ' ', ',', '.' },
        StringSplitOptions.RemoveEmptyEntries);

      // sort descending
      var descending = from word in words orderby word descending select word;

      foreach (var s in descending)
        Console.WriteLine(s);

      Console.ReadLine();

    }
  }
}
