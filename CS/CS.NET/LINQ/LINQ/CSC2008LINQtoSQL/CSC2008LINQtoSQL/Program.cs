﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.Linq;
using System.Data.Linq.Mapping;

// Add Reference to System.Data.Linq assembly
// Copy Northwind.mdf in c:\linqtest5 folder OR Attach @"Data Source=.\SQLEXPRESS;Initial Catalog=Northwind;Integrated Security=True"

namespace LinqConsoleApp
{
    [Table(Name = "Customers")]
    public class Customer
    {
        private string _CustomerID;
        [Column(IsPrimaryKey = true, Storage = "_CustomerID")]
        public string CustomerID
        {
            get
            {
                return this._CustomerID;
            }
            set
            {
                this._CustomerID = value;
            }

        }

        private string _City;
        [Column(Storage = "_City")]
        public string City
        {
            get
            {
                return this._City;
            }
            set
            {
                this._City = value;
            }
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            //// Use a connection string.
            //DataContext db = new DataContext
            //    (@"c:\linqtest5\northwnd.mdf");

            // OR
            DataContext db = new DataContext(@"Data Source=.\SQLEXPRESS;Initial Catalog=Northwind;Integrated Security=True");

            // Get a typed table to run queries.
            Table<Customer> Customers = db.GetTable<Customer>();

            // Attach the log to show generated SQL.
            db.Log = Console.Out;

            // Query for customers in London.
            IQueryable<Customer> custQuery =
                from cust in Customers
                where cust.City == "London"
                select cust;

            foreach (Customer cust in custQuery)
            {
                Console.WriteLine("ID={0}, City={1}", cust.CustomerID,
                    cust.City);
            }

            // Prevent console window from closing.
            Console.ReadLine();

        }
    }
}
