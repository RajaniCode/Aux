﻿//  Copyright (c) Microsoft Corporation. All rights reserved.

using System;
using System.IdentityModel.Tokens;
using System.Security.Cryptography;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Security;
using System.Xml;

namespace Microsoft.Samples.WS2007FederationHttpBinding
{
    public class RequestSecurityTokenResponseWSTrust13 : RequestSecurityTokenBase
    {
        // Private members.
        private SecurityToken m_requestedSecurityToken;
        private SecurityToken m_requestedProofToken;
        private SecurityToken m_issuerEntropy;
        private SecurityKeyIdentifierClause m_requestedAttachedReference;
        private SecurityKeyIdentifierClause m_requestedUnattachedReference;
        private bool m_computeKey;

        // Constructors.
        public RequestSecurityTokenResponseWSTrust13()
            : this(String.Empty, String.Empty, 0, null, null, null, false)
        {
        }

        public RequestSecurityTokenResponseWSTrust13(string context, string tokenType, int keySize, EndpointAddress appliesTo, SecurityToken requestedSecurityToken, SecurityToken requestedProofToken, bool computeKey ) : base ( context, tokenType, keySize, appliesTo )
        {
            this.m_requestedSecurityToken = requestedSecurityToken;
            this.m_requestedProofToken = requestedProofToken;
            this.m_computeKey = computeKey;
        }

        // Public properties.
        public SecurityToken RequestedSecurityToken 
        { 
            get { return m_requestedSecurityToken; } 
            set { m_requestedSecurityToken = value; } 
        }

        public SecurityToken RequestedProofToken
        {
            get { return m_requestedProofToken; }
            set { m_requestedProofToken = value; }
        }

        public SecurityKeyIdentifierClause RequestedAttachedReference
        {
            get { return m_requestedAttachedReference; }
            set { m_requestedAttachedReference = value; }
        }

        public SecurityKeyIdentifierClause RequestedUnattachedReference
        {
            get { return m_requestedUnattachedReference; }
            set { m_requestedUnattachedReference = value; }
        }

        public SecurityToken IssuerEntropy
        {
            get { return m_issuerEntropy; }
            set { m_issuerEntropy = value; }
        }

        public bool ComputeKey
        {
            get { return m_computeKey; }
            set { m_computeKey = value; }
        }

        // Public methods.
        /// <summary>
        /// 
        /// </summary>
        /// <param name="requestorEntropy"></param>
        /// <param name="issuerEntropy"></param>
        /// <param name="keySize"></param>
        /// <returns></returns>
        public static byte[] ComputeCombinedKey(byte[] requestorEntropy, byte[] issuerEntropy, int keySize)
        {
            if (keySize < 64 || keySize > 4096)
                throw new ArgumentOutOfRangeException("keySize");

            KeyedHashAlgorithm kha = new HMACSHA1(requestorEntropy, true);

            byte[] key = new byte[keySize / 8]; // Final key
            byte[] a = issuerEntropy; // A(0)
            byte[] b = new byte[kha.HashSize / 8 + a.Length]; // Buffer for A(i) + seed

            for (int i = 0; i < key.Length;)
            {
                // Calculate A(i+1).                
                kha.Initialize();
                a = kha.ComputeHash(a);

                // Calculate A(i) + seed.
                a.CopyTo(b, 0);
                issuerEntropy.CopyTo(b, a.Length);
                kha.Initialize();
                byte[] result = kha.ComputeHash(b);

                for (int j = 0; j < result.Length; j++)
                {
                    if (i < key.Length)
                        key[i++] = result[j];
                    else
                        break;
                }
            }

            return key;
        }

        // Methods of BodyWriter.
        protected override void OnWriteBodyContents(XmlDictionaryWriter writer)
        {
            writer.WriteStartElement(Constants.Trust13.Elements.RequestSecurityTokenResponseCollection, Constants.Trust13.NamespaceUri);
            writer.WriteStartElement(Constants.Trust13.Elements.RequestSecurityTokenResponse, Constants.Trust13.NamespaceUri);

            if (this.TokenType != null && this.TokenType.Length > 0)
            {
                writer.WriteStartElement(Constants.Trust13.Elements.TokenType, Constants.Trust13.NamespaceUri);
                writer.WriteString(this.TokenType);
                writer.WriteEndElement(); // wst:TokenType
            }

            WSSecurityTokenSerializer ser = new WSSecurityTokenSerializer(SecurityVersion.WSSecurity11,
                                                                          TrustVersion.WSTrust13,
                                                                          SecureConversationVersion.WSSecureConversation13,
                                                                          false, null, null, null);

            if (this.RequestedSecurityToken != null)
            {
                writer.WriteStartElement(Constants.Trust13.Elements.RequestedSecurityToken, Constants.Trust13.NamespaceUri);                
                ser.WriteToken(writer, this.RequestedSecurityToken);                    
                writer.WriteEndElement(); // wst:RequestedSecurityToken
            }

            if ( this.RequestedAttachedReference != null )
            {
                writer.WriteStartElement(Constants.Trust13.Elements.RequestedAttachedReference, Constants.Trust13.NamespaceUri);
                ser.WriteKeyIdentifierClause ( writer, this.RequestedAttachedReference);
                writer.WriteEndElement(); // wst:RequestedAttachedReference
            }

            if ( this.RequestedUnattachedReference != null )
            {
                writer.WriteStartElement(Constants.Trust13.Elements.RequestedUnattachedReference, Constants.Trust13.NamespaceUri);
                ser.WriteKeyIdentifierClause ( writer, this.RequestedUnattachedReference);
                writer.WriteEndElement(); // wst:RequestedAttachedReference
            }

            if (this.AppliesTo != null)
            {
                writer.WriteStartElement(Constants.Policy.Elements.AppliesTo, Constants.Policy.NamespaceUri);
                this.AppliesTo.WriteTo(AddressingVersion.WSAddressing10, writer);
                writer.WriteEndElement(); // wsp:AppliesTo
            }

            if (this.RequestedProofToken != null)// Issuer entropy; write RPT only
            {
                writer.WriteStartElement(Constants.Trust13.Elements.RequestedProofToken, Constants.Trust13.NamespaceUri);
                ser.WriteToken(writer, this.RequestedProofToken);
                writer.WriteEndElement(); // wst:RequestedSecurityToken
            }

            if(this.IssuerEntropy != null && this.ComputeKey) // Combined entropy; write RPT and Entropy
            {
                writer.WriteStartElement(Constants.Trust13.Elements.RequestedProofToken, Constants.Trust13.NamespaceUri);
                writer.WriteStartElement(Constants.Trust13.Elements.ComputedKey, Constants.Trust13.NamespaceUri);
                writer.WriteValue(Constants.Trust13.ComputedKeyAlgorithms.PSHA1);
                writer.WriteEndElement(); // wst:ComputedKey
                writer.WriteEndElement(); // wst:RequestedSecurityToken

                if (this.IssuerEntropy!= null)
                {
                    writer.WriteStartElement(Constants.Trust13.Elements.Entropy, Constants.Trust13.NamespaceUri);                    
                    ser.WriteToken(writer, this.IssuerEntropy);
                    writer.WriteEndElement(); // wst:Entropy
                }
            }

            writer.WriteEndElement(); // wst:RequestSecurityTokenResponse
            writer.WriteEndElement(); // wst:RequestSecurityTokenResponseCollection
        }
    }
}

