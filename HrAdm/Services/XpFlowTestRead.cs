﻿using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace HrAdm.Services
{
    public class XpFlowTestRead
    {
        private ReadDto GetDto(string userId)
        {
            return new()
            {
                //目前簽核者為登入者才可簽核(CanSign)
                ReadSql = $@"
select 
    f.Name as FlowName, x.Name_zhHant as FlowStatusName, 
    case when d.FlowStatus='0' then s.NodeName else '' end as NodeName, 
    u.Name as SignerName,
	d.Created, d.Id,
    case when (d.FlowStatus='0' and s.SignerId='{userId}') then 1 else 0 end as CanSign
from XpFlowTest d 
join XpFlowSignTest s on s.SourceId=d.Id and s.FlowLevel=d.FlowLevel
join XpFlow f on s.FlowId=f.Id
join XpCode x on x.Type='FlowStatus' and d.FlowStatus=x.Value
join User u on s.SignerId=u.Id
order by d.Created desc
",
                TableAs = "d",
                Items = new QitemDto[] {
                    new() { Fid = "FlowId", Col = "f.Id" },
                    new() { Fid = "FlowStatus" },
                },
            };
        }

        public async Task<JObject> GetPageA(string ctrl, DtDto dt)
        {
            return await new CrudRead().GetPageA(GetDto(_Fun.UserId()), dt, ctrl);
        }

    } //class
}