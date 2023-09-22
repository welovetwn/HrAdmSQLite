using Base.Models;
using Base.Services;

namespace HrAdm.Services
{
    public class XpFlowSignEdit : XgEdit
    {
        private string _flowCode;   //XpFlow.Code
        public XpFlowSignEdit(string ctrl, string flowCode) : base(ctrl) 
        {
            _flowCode = flowCode;
        }

        override public EditDto GetDto()
        {
            string sql = "";
            var locale = _Xp.GetLocale0();
            if (_flowCode == "Leave")
            {
                sql = $@"
select
    l.Id,
    l.StartTime, l.EndTime, l.Hours, l.Created, l.FileName,
    c.Name_{locale} as LeaveName,
    u.Name as UserName,
    u2.Name as AgentName
from Leave l
join User u on l.UserId=u.Id
join User u2 on l.AgentId=u2.Id
join XpCode c on c.Type='LeaveType' and l.LeaveType=c.Value
where l.Id='{{0}}'
";
            }

            return new EditDto() { ReadSql = sql };
        }

    } //class
}
