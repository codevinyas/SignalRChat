using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace SRHitCounter
{
    [HubName("hitCounter")]
    public class HitCounterHub : Hub
    {
        public void RecordHit(string name, string message)
        {
            this.Clients.All.updateCounter(name, message);
        }

    }
}