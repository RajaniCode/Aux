﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Xml.Linq;

namespace WPF_UsingLinqDataSource
{
    public class CXmlFileLoader
    {
        public XElement LoadXml(string xFilePath)
        {
            XElement xEle = XElement.Load(xFilePath);
            return xEle;
        }
    }
}
