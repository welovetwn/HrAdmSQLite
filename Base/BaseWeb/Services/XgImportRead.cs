﻿using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace BaseWeb.Services
{
    public class XgImportRead
    {
        private readonly string _importType;

        //constructor
        public XgImportRead(string importType)
        {
            _importType = importType;
        }

        private ReadDto GetDto()
        {
            return new ReadDto()
            {
                ReadSql = $@"
select *
from XpImportLog
where Type='{_importType}'
order by Id desc
",
                Items = new QitemDto[] {
                    new() { Fid = "FileName", Op = ItemOpEstr.Like },
                },
            };
        }

        public async Task<JObject> GetPageA(string ctrl, DtDto dt)
        {
            return await new CrudRead().GetPageA(GetDto(), dt, ctrl);
        }

    } //class
}