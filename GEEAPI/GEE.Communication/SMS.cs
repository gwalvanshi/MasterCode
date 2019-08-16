using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GEE.Communication
{
    public class SMS : Message
    {
        public override string Send()
        {
            throw new NotImplementedException("CommunicationType:SMS service is disabled.");
        }
    }
}
