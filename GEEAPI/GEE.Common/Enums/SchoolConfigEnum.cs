using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Common.Enums
{
    public class SchoolConfigEnum
    {

       public enum SchoolConfigNoGeneEnum
        {
            //IsSystemGenerated,
            //True
            [Description("IsSystemGenerated")]
            IsSystemGenerated = 1,
            [Description("True")]
            True = 2
        }
    }
}
