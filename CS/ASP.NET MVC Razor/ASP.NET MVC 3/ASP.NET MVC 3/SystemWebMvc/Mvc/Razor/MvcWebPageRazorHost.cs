﻿/* ****************************************************************************
 *
 * Copyright (c) Microsoft Corporation. All rights reserved.
 *
 * This software is subject to the Microsoft Public License (Ms-PL). 
 * A copy of the license can be found in the license.htm file included 
 * in this distribution.
 *
 * You must not remove this notice, or any other, from this software.
 *
 * ***************************************************************************/

namespace System.Web.Mvc.Razor {
    using System.Diagnostics;
    using System.Diagnostics.CodeAnalysis;
    using System.Web.Razor.Generator;
    using System.Web.Razor.Parser;
    using System.Web.WebPages.Razor;

    [SuppressMessage("Microsoft.Naming", "CA1702:CompoundWordsShouldBeCasedCorrectly", MessageId = "WebPage", Justification = "The class name is derived from the name of the base type")]
    public class MvcWebPageRazorHost : WebPageRazorHost {
        [SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors", Justification = "The NamespaceImports property should not be virtual. This is a temporary fix.")]
        public MvcWebPageRazorHost(string virtualPath, string physicalPath)
            : base(virtualPath, physicalPath) {

            RegisterSpecialFile(RazorViewEngine.ViewStartFileName, typeof(ViewStartPage));

            DefaultPageBaseClass = typeof(WebViewPage).FullName;

            // REVIEW get rid of the namespace import to not force additional references in default MVC projects
            GetRidOfNamespace("System.Web.WebPages.Html");
        }

        public override RazorCodeGenerator DecorateCodeGenerator(RazorCodeGenerator incomingCodeGenerator) {
            if (incomingCodeGenerator is CSharpRazorCodeGenerator) {
                return new MvcCSharpRazorCodeGenerator(incomingCodeGenerator.ClassName,
                                                       incomingCodeGenerator.RootNamespaceName,
                                                       incomingCodeGenerator.SourceFileName,
                                                       incomingCodeGenerator.Host);
            }
            else if (incomingCodeGenerator is VBRazorCodeGenerator) {
                return new MvcVBRazorCodeGenerator(incomingCodeGenerator.ClassName,
                                                   incomingCodeGenerator.RootNamespaceName,
                                                   incomingCodeGenerator.SourceFileName,
                                                   incomingCodeGenerator.Host);
            }
            return base.DecorateCodeGenerator(incomingCodeGenerator);
        }

        public override ParserBase DecorateCodeParser(ParserBase incomingCodeParser) {
            if (incomingCodeParser is CSharpCodeParser) {
                return new MvcCSharpRazorCodeParser();
            }
            else if (incomingCodeParser is VBCodeParser) {
                return new MvcVBRazorCodeParser();
            }
            else {
                return base.DecorateCodeParser(incomingCodeParser);
            }
        }

        private void GetRidOfNamespace(string ns) {
            Debug.Assert(NamespaceImports.Contains(ns), ns + " is not a default namespace anymore");
            if (NamespaceImports.Contains(ns)) {
                NamespaceImports.Remove(ns);
            }
        }
        
    }
}
