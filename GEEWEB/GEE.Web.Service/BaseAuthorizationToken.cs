﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Web.Service
{
   public  abstract class BaseAuthorizationToken
    {
        public  static  string AuthorizationToken
        {
            get; set;
        }
    }
}
