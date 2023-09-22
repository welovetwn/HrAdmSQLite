using System;
using System.Collections.Generic;

namespace HrAdm.Tables
{
    public partial class XpCode
    {
        public string Type { get; set; }
        public string Value { get; set; }
        public string Name_zhHant { get; set; }
        public string Name_zhHans { get; set; }
        public string Name_enUS { get; set; }
        public int Sort { get; set; }
        public string Ext { get; set; }
        public string Note { get; set; }
    }
}
