﻿
//-----------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All Rights Reserved.
//-----------------------------------------------------------------

using System;
using System.ServiceModel;

namespace Microsoft.Samples.StandardEndpoints
{

    // Define a service contract
    [ServiceContract(Namespace = "Microsoft.Samples.StandardEndpoints")]
    public interface ICalculator
    {
        [OperationContract]
        double Add(double n1, double n2);
        [OperationContract]
        double Subtract(double n1, double n2);
        [OperationContract]
        double Multiply(double n1, double n2);
        [OperationContract]
        double Divide(double n1, double n2);
    }

    // Service class which implements the service contract
    public class CalculatorService : ICalculator
    {
        public double Add(double n1, double n2)
        {
            double result = n1 + n2;
            Console.WriteLine("Received Add({0},{1})", n1, n2);
            Console.WriteLine("Return: {0}", result);
            return result;
        }

        public double Subtract(double n1, double n2)
        {
            double result = n1 - n2;
            Console.WriteLine("Received Subtract({0},{1})", n1, n2);
            Console.WriteLine("Return: {0}", result);
            return result;
        }

        public double Multiply(double n1, double n2)
        {
            double result = n1 * n2;
            Console.WriteLine("Received Multiply({0},{1})", n1, n2);
            Console.WriteLine("Return: {0}", result);
            return result;
        }

        public double Divide(double n1, double n2)
        {
            double result = n1 / n2;
            Console.WriteLine("Received Divide({0},{1})", n1, n2);
            Console.WriteLine("Return: {0}", result);
            return result;
        }


        // Host the service within this EXE console application
        public static void Main()
        {
            // Create a ServiceHost for the CalculatorService type
            using (ServiceHost serviceHost = new ServiceHost(typeof(CalculatorService), new Uri("http://localhost:8000/Samples/Service.svc")))
            {
                // Open the ServiceHost to create listeners and start listening for messages
                serviceHost.Open();

                // The service can now be accessed
                Console.WriteLine("The service is ready.");
                Console.WriteLine("Press <ENTER> to terminate service.");
                Console.WriteLine();
                Console.ReadLine();
            }
        }

    }

}
