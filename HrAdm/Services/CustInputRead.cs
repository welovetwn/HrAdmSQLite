﻿using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace HrAdm.Services
{
    public class CustInputRead
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select * from CustInput
order by Id
",
            Items = new QitemDto[] {
                new() { Fid = "FldText" },
            },
        };

        public async Task<JObject> GetPageA(string ctrl, DtDto dt)
        {
            return await new CrudRead().GetPageA(dto, dt, ctrl);
        }

    } //class
}