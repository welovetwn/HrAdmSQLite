using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace BaseWeb.Services
{
    public class XgFlowEdit : XgEdit
    {
        public XgFlowEdit(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto()
            {
                Table = "XpFlow",
                PkeyFid = "Id",
                Col4 = null,
                Items = new EitemDto[] {
                    new() { Fid = "Id" },
                    new() { Fid = "Code", Required = true },
                    new() { Fid = "Name", Required = true },
                    new() { Fid = "Portrait", Value = "1" },
                    new() { Fid = "Status", Value = "1" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        Table = "XpFlowNode",
                        PkeyFid = "Id",
                        FkeyFid = "FlowId",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "FlowId" },
                            new() { Fid = "Name",    Required = true },
                            new() { Fid = "NodeType", Required = true },
                            new() { Fid = "PosX", Required = true },
                            new() { Fid = "PosY", Required = true },
                            new() { Fid = "SignerType" },
                            new() { Fid = "SignerValue" },
                            new() { Fid = "PassType", Value = "0" },
                            //new() { Fid = "PassNum" },
                        },
                    },
                    new EditDto
                    {
                        Table = "XpFlowLine",
                        PkeyFid = "Id",
                        FkeyFid = "FlowId",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "FlowId" },
                            new() { Fid = "CondStr" },
                            new() { Fid = "StartNode", Required = true },
                            new() { Fid = "EndNode",   Required = true },
                            new() { Fid = "Sort", Required = true },
                        },
                    },
                },
            };
        }

        public async Task<ResultDto> CreateA(JObject json, FnSetNewKeyJson fnSetNewKey)
        {
            return await EditService().CreateA(json, fnSetNewKey);
        }

        public async Task<ResultDto> UpdateA(string key, JObject json, FnSetNewKeyJson fnSetNewKey)
        {
            return await EditService().UpdateA(key, json, fnSetNewKey);
        }

    } //class
}
