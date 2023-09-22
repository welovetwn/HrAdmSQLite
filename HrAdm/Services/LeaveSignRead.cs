﻿using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace HrAdm.Services
{
    public class LeaveSignRead
    {
        private ReadDto GetDto()
        {
            var locale = _Xp.GetLocale0();
            return new ReadDto()
            {
                ReadSql = $@"
select 
    s.Id, s.NodeName,
    l.StartTime, l.EndTime, l.Hours, l.Created,
    u.Name as UserName,
    c.Name_{locale} as LeaveName
from XpFlowSign s
join XpFlow f on f.Code='Leave' and s.FlowId=f.Id
join Leave l on s.SourceId=l.Id and s.FlowLevel=l.FlowLevel and s.SignStatus='0'
join User u on l.UserId=u.Id
join XpCode c on c.Type='LeaveType' and l.LeaveType=c.Value
where s.SignerId='{_Fun.UserId()}'
order by l.Created
",
            };
        }

        public async Task<JObject> GetPageA(string ctrl, DtDto dt)
        {
            return await new CrudRead().GetPageA(GetDto(), dt, ctrl);
        }

    } //class
}