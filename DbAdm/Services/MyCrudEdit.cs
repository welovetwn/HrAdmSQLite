using Base.Models;
using Base.Services;

namespace DbAdm.Services
{
    public class MyCrudEdit : XgEdit
    {
        public MyCrudEdit(string ctrl) : base(ctrl) { }

        override public EditDto GetDto() {
            //4 tables
            return new EditDto
            {
                Table = "Crud",
                PkeyFid = "Id",
                Col4 = new string[] { null, "Created", null, "Revised"},
                Items = new EitemDto[] {
                    new() { Fid = "Id" },
                    new() { Fid = "ProjectId", Required = true },
                    new() { Fid = "ProgCode", Required = true },
                    new() { Fid = "ProgName", Required = true },
                    new() { Fid = "LabelHori", Required = true },
                    new() { Fid = "ReadSql" },
                    new() { Fid = "TableAs" },
                    new() { Fid = "HasCreate" },
                    new() { Fid = "HasUpdate" },
                    new() { Fid = "HasDelete" },
                    new() { Fid = "HasView" },
                    new() { Fid = "HasExport" },
                    new() { Fid = "HasReset" },
                    new() { Fid = "AuthType", Required = true },
                    new() { Fid = "Status", Required = true },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        //all child readSql use 'in'
                        ReadSql = @"
select a.*,
	c.Code, c.Name, c.DataType
from CrudQitem a
join [Column] c on a.ColumnId=c.Id
where a.CrudId in ({0})
order by a.Sort
",
                        Table = "CrudQitem",                        
                        PkeyFid = "Id",
                        FkeyFid = "CrudId",
                        OrderBy = "Sort",
                        Col4 = null,
                        Items = new EitemDto[] {
                            new() { Fid = "Id" },
                            new() { Fid = "CrudId" },
                            new() { Fid = "ColumnId", Required = true },
                            new() { Fid = "TableAs" },
                            new() { Fid = "QitemType", Required = true },
                            new() { Fid = "ItemData" },
                            new() { Fid = "Op", Required = true },
                            new() { Fid = "IsRange" },
                            new() { Fid = "IsFind2" },
                            new() { Fid = "PosGroup" },
                            new() { Fid = "LayoutCols" },
                            //new() { Fid = "ExtInfo" },
                            new() { Fid = "Sort", Required = true },
                        },
                    },
                    new EditDto
                    {
                        ReadSql = @"
select a.*
from CrudRitem a
where a.CrudId in ({0})
order by a.Sort
",
                        Table = "CrudRitem",
                        PkeyFid = "Id",
                        FkeyFid = "CrudId",
                        OrderBy = "Sort",
                        Col4 = null,
                        Items = new EitemDto[] {
                            new() { Fid = "Id" },
                            new() { Fid = "CrudId" },
                            new() { Fid = "ColumnCode", Required = true },
                            new() { Fid = "Name", Required = true },
                            new() { Fid = "Width", /*Type = ItemTypeEnum.Num*/ },
                            new() { Fid = "RitemType", Required = true },
                            //new() { Fid = "ExtInfo" },
                            new() { Fid = "Sort", Required = true },
                        },
                    },
                    new EditDto
                    {
                        Table = "CrudEtable",
                        PkeyFid = "Id",
                        FkeyFid = "CrudId",
                        OrderBy = "Sort",
                        Col4 = null,
                        Items = new EitemDto[] {
                            new() { Fid = "Id" },
                            new() { Fid = "CrudId" },
                            new() { Fid = "TableId", Required = true },
                            new() { Fid = "PkeyFid", Required = true },
                            new() { Fid = "FkeyFid" },
                            new() { Fid = "AutoIdLen" },
                            new() { Fid = "Col4" },
                            new() { Fid = "HalfWidth" },
                            new() { Fid = "OrderBy" },
                            new() { Fid = "Sort", Required = true },
                        },
                        Childs = new []
                        {
                            new EditDto
                            {
                                ReadSql = @"
select a.*,
	c.Code, c.Name, c.DataType
from CrudEitem a
join [Column] c on a.ColumnId=c.Id
where a.EtableId in ({0})
order by a.Sort
",
                                Table = "CrudEitem",
                                PkeyFid = "Id",
                                FkeyFid = "EtableId",
                                OrderBy = "Sort",
                                Col4 = null,
                                Items = new EitemDto[] {
                                    new() { Fid = "Id" },
                                    new() { Fid = "EtableId" },
                                    new() { Fid = "ColumnId", Required = true },
                                    new() { Fid = "EitemType", Required = true },
                                    new() { Fid = "ItemData" },
                                    new() { Fid = "Required" },
                                    new() { Fid = "HasCreate" },
                                    new() { Fid = "HasUpdate" },
                                    new() { Fid = "PlaceHolder" },                                    
                                    new() { Fid = "DefaultValue" },
                                    new() { Fid = "PosGroup" },
                                    new() { Fid = "LayoutCols" },
                                    new() { Fid = "Width" },
                                    new() { Fid = "CheckType" },
                                    new() { Fid = "CheckData" },
                                    new() { Fid = "Sort" },    //by backend
                                },
                            },
                        },
                    },
                },
            };      
        }

    } //class
}
