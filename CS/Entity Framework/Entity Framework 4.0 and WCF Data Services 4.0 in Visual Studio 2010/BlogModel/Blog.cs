﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogModel
{
    public class Blog
    {
        public int ID
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        public string Owner
        {
            get;
            set;
        }

        public List<Post> Posts
        {
            get { return _posts; }
            set { _posts = value; }
        }
        List<Post> _posts = new List<Post>();
    }
}