using Base.Models;
using Base.Services;

namespace HrAdm.Services
{
    public class LeaveSignEdit : XgEdit
    {
        public LeaveSignEdit(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            var locale = _Xp.GetLocale0();
            return new EditDto
            {
                ReadSql = $@"
select
    s.Id as SignId,
    l.Id as LeaveId,
    l.StartTime, l.EndTime, l.Hours, l.Created, l.FileName,
    c.Name_{locale} as LeaveName,
    u.Name as UserName,
    u2.Name as AgentName
from XpFlowSign s
join Leave l on s.SourceId=l.Id and s.FlowLevel=l.FlowLevel and s.SignStatus='0'
join User u on l.UserId=u.Id
join User u2 on l.AgentId=u2.Id
join XpCode c on c.Type='LeaveType' and l.LeaveType=c.Value
where s.Id='{{0}}'
",
            };
        }

    } //class
}
