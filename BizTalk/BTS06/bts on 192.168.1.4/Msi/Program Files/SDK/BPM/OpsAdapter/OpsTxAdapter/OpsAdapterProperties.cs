//---------------------------------------------------------------------
// File: OpsAdapterProperties.cs
// 
// Summary: This class handles the handler properties and the endpoint-
// properties at runtime. If you add or remove any properties to or from
// the designtime make sure you also alter the corresponding code in
// this class. Otherwise, there is no need to alter this code.
//
//
//---------------------------------------------------------------------
// This file is part of the Microsoft BizTalk Server 2006 SDK
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// This source code is intended only as a supplement to Microsoft BizTalk
// Server 2006 release and/or on-line documentation. See these other
// materials for detailed information regarding Microsoft code samples.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
// PURPOSE.
//---------------------------------------------------------------------

using System;
using System.IO;
using System.Xml;
using System.Net;
using Microsoft.Samples.BizTalk.Adapter.Common;
using Microsoft.BizTalk.Message.Interop;

namespace Microsoft.Samples.BizTalk.SouthridgeVideo.Adapters.OpsAdapter.RunTime.OpsTransmitAdapter
{
	/// <summary>
    /// Summary description for OpsAdapterProperties.
    /// </summary>
	internal class OpsAdapterProperties : ConfigProperties
	{
		// Handler properties...

		// Endpoint properties...
		private string _DotNetAssemblyStrongName;
		private string _DotNetClassName;
        private string _InitializationData;

        private string _transportLocationUri;

        // If we needed to use SSO we will need this extra property. It is set in the
		// LocationConfiguration method below.
		// Additionally:
		//   TransmitLocation.xsd in the design-time project must also be edited to
		//   expose the necessary SSO properties.
		//   OpsTransmitAdapterBatch within the run-time project must be
		//   edited to retrieve and populate the SSOResult class.
		//private string ssoAffiliateApplication;
		//public string AffiliateApplication { get { return ssoAffiliateApplication; } }

        /// <summary>
        /// Constructor for OpsAdapterProperties
        /// </summary>
        /// <param name="transportLocationUri">endpoint uri</param>
        public OpsAdapterProperties(string transportLocationUri)
        {
            this._transportLocationUri = transportLocationUri;
        }

		/// <summary>
		/// Gets the assembly strong name
		/// </summary>
        public string DotNetAssemblyStrongName
		{
			get { return this._DotNetAssemblyStrongName; }
		}

		/// <summary>
		/// Gets the fully qualified class name
		/// </summary>
        public string DotNetClassName
		{
			get { return this._DotNetClassName; }
		}

        /// <summary>
        /// Gets the initialization data that is passed to IOpsAIC.Initialize method
        /// </summary>
        public string InitializationData
        {
            get { return this._InitializationData; }
        }

        /// <summary>
        /// Gets the uri
        /// </summary>
        public string TransportLocationUri
        {
            get { return this._transportLocationUri; }
        }

        // Adapter level configuration properties
        //public static void HandlerConfiguration(XmlDocument configDom)
        //{
        //    // Handler properties
        //}

		public virtual void LocationConfiguration(XmlDocument configDom)
		{
			// If we needed to use SSO we will need this extra property
			//this.ssoAffiliateApplication = IfExistsExtract(configDom, "/Config/ssoAffiliateApplication");

			this._DotNetAssemblyStrongName = Extract(configDom, "/Config/DotNetAssemblyStrongName", string.Empty);
			this._DotNetClassName = Extract(configDom, "/Config/DotNetClassName", string.Empty);
            this._InitializationData = IfExistsExtract(configDom, "/Config/InitializationData", string.Empty);

            UpdateUriForDynamicSend();
		}

		public void UpdateUriForDynamicSend()
		{
			// Strip off the adapters alias
            int i = _transportLocationUri.LastIndexOf("OPS://");
            if ( i >= 0 )
			{
                string newUri = _transportLocationUri.Substring(i);
                this._transportLocationUri = newUri;
			}
		}
	}
}
