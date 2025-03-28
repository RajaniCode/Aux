/*******************************************************************************
 * Copyright 2008-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"). You may not use
 * this file except in compliance with the License. A copy of the License is located at
 *
 * http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 * *****************************************************************************
 *    __  _    _  ___
 *   (  )( \/\/ )/ __)
 *   /__\ \    / \__ \
 *  (_)(_) \/\/  (___/
 *
 *  AWS SDK for .NET
 */

using System;
using System.Collections.Generic;
using System.Xml.Serialization;
using System.Text;

namespace Amazon.EC2.Model
{
    /// <summary>
    /// An active license in use and attached to an Amazon EC2 instance.
    /// </summary>
    [XmlRootAttribute(IsNullable = false)]
    public class InstanceLicense
    {    
        private string poolField;

        /// <summary>
        /// The license pool from which to take a license when starting
        /// Amazon EC2 instances in the associated RunInstances request.
        /// </summary>
        [XmlElementAttribute(ElementName = "Pool")]
        public string Pool
        {
            get { return this.poolField; }
            set { this.poolField = value; }
        }

        /// <summary>
        /// Sets the license pool from which to take a license when starting
        /// Amazon EC2 instances in the associated RunInstances request.
        /// </summary>
        /// <param name="pool">The license pool from which to take a license when starting
        /// Amazon EC2 instances in the associated RunInstances request.</param>
        /// <returns>this instance</returns>
        public InstanceLicense WithPool(string pool)
        {
            this.poolField = pool;
            return this;
        }

        /// <summary>
        /// Checks if Pool property is set
        /// </summary>
        /// <returns>true if Pool property is set</returns>
        public bool IsSetPool()
        {
            return this.poolField != null;
        }

    }
}
