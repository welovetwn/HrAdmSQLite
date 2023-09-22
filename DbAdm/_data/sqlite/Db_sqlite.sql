-- Script Date: 2023/9/20 上午 10:40  - ErikEJ.SqlCeScripting version 3.5.2.88
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [XpCode] (
  [Type] nvarchar(20) NOT NULL
, [Value] nvarchar(10) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [Sort] int NOT NULL
, [Ext] nvarchar(30) NULL COLLATE NOCASE
, [Note] nvarchar(255) NULL COLLATE NOCASE
, CONSTRAINT [PK_XpCode] PRIMARY KEY ([Type],[Value])
);
CREATE TABLE [tmpTable] (
  [Code] nvarchar(100) NOT NULL
, [Note] nvarchar(255) NULL COLLATE NOCASE
, CONSTRAINT [PK__tmpTable__A25C5AA6183AE814] PRIMARY KEY ([Code])
);
CREATE TABLE [tmpColumn] (
  [Code] nvarchar(100) NOT NULL
, [TableCode] nvarchar(100) NULL COLLATE NOCASE
, [DataType] nvarchar(20) NOT NULL COLLATE NOCASE
, [Nullable] bit NOT NULL
, [DefaultValue] nvarchar(100) NULL COLLATE NOCASE
, [Sort] smallint NOT NULL
, [Note] nvarchar(100) NULL COLLATE NOCASE
);
CREATE TABLE [Table] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [ProjectId] nvarchar(10) NOT NULL COLLATE NOCASE
, [Code] nvarchar(100) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [Note] nvarchar(255) NULL COLLATE NOCASE
, [TranLog] bit DEFAULT (0) NOT NULL
, [Status] bit NOT NULL
);
CREATE TABLE [Project] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [Code] nvarchar(30) NOT NULL COLLATE NOCASE
, [DbName] nvarchar(20) NOT NULL COLLATE NOCASE
, [DbType] tinyint DEFAULT (0) NOT NULL
, [ProjectPath] nvarchar(255) NOT NULL COLLATE NOCASE
, [ConnectStr] nvarchar(255) NOT NULL COLLATE NOCASE
, [Status] bit NOT NULL
, [FromTmpTable] bit DEFAULT (0) NOT NULL
);
CREATE TABLE [CrudRitem] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [CrudId] nvarchar(10) NOT NULL COLLATE NOCASE
, [ColumnCode] nvarchar(100) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [Width] int NOT NULL
, [RitemType] nvarchar(10) NOT NULL COLLATE NOCASE
, [Sort] int NOT NULL
);
CREATE TABLE [CrudQitem] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [CrudId] nvarchar(10) NOT NULL COLLATE NOCASE
, [ColumnId] nvarchar(10) NOT NULL COLLATE NOCASE
, [TableAs] nvarchar(20) NOT NULL COLLATE NOCASE
, [QitemType] nvarchar(20) NOT NULL COLLATE NOCASE
, [ItemData] nvarchar(20) NULL COLLATE NOCASE
, [Op] nvarchar(10) NOT NULL COLLATE NOCASE
, [IsRange] bit NOT NULL
, [IsFind2] bit NOT NULL
, [PosGroup] nvarchar(10) NULL COLLATE NOCASE
, [LayoutCols] nvarchar(20) NULL COLLATE NOCASE
, [Sort] int NOT NULL
);
CREATE TABLE [CrudEtable] (
  [Id] nvarchar(10) NOT NULL
, [CrudId] nvarchar(10) NOT NULL COLLATE NOCASE
, [TableId] nvarchar(10) NOT NULL COLLATE NOCASE
, [PkeyFid] nvarchar(10) NOT NULL COLLATE NOCASE
, [FkeyFid] nvarchar(10) NULL COLLATE NOCASE
, [Col4] nvarchar(30) NOT NULL COLLATE NOCASE
, [OrderBy] nvarchar(10) NOT NULL COLLATE NOCASE
, [Sort] int NOT NULL
, [HalfWidth] bit NOT NULL
, [AutoIdLen] nvarchar(20) NULL COLLATE NOCASE
, CONSTRAINT [PK_CrudEtable] PRIMARY KEY ([Id])
);
CREATE TABLE [CrudEitem] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [EtableId] nvarchar(10) NOT NULL COLLATE NOCASE
, [ColumnId] nvarchar(10) NOT NULL COLLATE NOCASE
, [EitemType] nvarchar(10) NOT NULL COLLATE NOCASE
, [ItemData] nvarchar(50) NULL COLLATE NOCASE
, [Required] bit NOT NULL
, [HasCreate] bit NOT NULL
, [HasUpdate] bit NOT NULL
, [PlaceHolder] nvarchar(10) NULL COLLATE NOCASE
, [DefaultValue] nvarchar(10) NULL COLLATE NOCASE
, [PosGroup] nvarchar(10) NULL COLLATE NOCASE
, [LayoutCols] nvarchar(10) NULL COLLATE NOCASE
, [Width] int NOT NULL
, [CheckType] nvarchar(10) NOT NULL COLLATE NOCASE
, [CheckData] nvarchar(10) NULL COLLATE NOCASE
, [Sort] int NOT NULL
, CONSTRAINT [FK_CrudEitem_CrudEtable] FOREIGN KEY ([EtableId]) REFERENCES [CrudEtable] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE [Crud] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [ProjectId] nvarchar(10) NOT NULL COLLATE NOCASE
, [ProgCode] nvarchar(30) NOT NULL COLLATE NOCASE
, [ProgName] nvarchar(30) NOT NULL COLLATE NOCASE
, [LabelHori] bit NOT NULL
, [ReadSql] nvarchar(500) NOT NULL COLLATE NOCASE
, [TableAs] nvarchar(10) NULL COLLATE NOCASE
, [HasCreate] bit NOT NULL
, [HasUpdate] bit NOT NULL
, [HasDelete] bit NOT NULL
, [HasView] bit NOT NULL
, [HasExport] bit NOT NULL
, [HasReset] bit NOT NULL
, [AuthType] tinyint NOT NULL
, [Status] bit NOT NULL
, [Created] datetime NOT NULL
, [Revised] datetime NULL
);
CREATE TABLE [Column] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Id] nvarchar(10) NOT NULL COLLATE NOCASE
, [TableId] nvarchar(10) NOT NULL COLLATE NOCASE
, [Code] nvarchar(100) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [DataType] nvarchar(20) NOT NULL COLLATE NOCASE
, [Nullable] bit NOT NULL
, [DefaultValue] nvarchar(100) NULL COLLATE NOCASE
, [Sort] int NOT NULL
, [Note] nvarchar(255) NULL COLLATE NOCASE
, [Status] bit NOT NULL
);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'AuthType','0','無',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'AuthType','1','Controller',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'AuthType','2','Action',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','0','None',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','Email','Email',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','Max','Max',5,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','Min','Min',4,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','Range','Range',6,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'CheckType','Url','Url',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','C','CheckBox',7,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','D','Date',9,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','DEC','Decimal',5,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','DT','DateTime',10,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','F','File',11,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','H','Hide',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','HTML','Html',12,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','INT','Integer',4,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','MO','Modal',14,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','PWD','Password',15,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','R','Radio',8,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','RO','ReadOnly',16,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','S','Select',6,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','SO','Sort',13,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','T','Text',2,'Q',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'EitemType','TA','TextArea',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','C','CheckBox',6,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','D','Date',8,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','DT','DateTime',9,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','F','File',10,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','H','Hide',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','MO','Modal',12,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','N','Numeric',4,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','PWD','Password',13,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','R','Radio',7,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','RO','Read Only',14,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','S','Select',5,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','SO','Sort',11,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','T','Text',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'InputType','TA','TextArea',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','Equal','Equal',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','In','In',4,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','InRange','In Range',12,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','Is','Is',9,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','IsNull','Is Null',10,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','Like','Like',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','Like2','Like(模糊)',5,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','Like2Cols','Like Cols(模糊)',8,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','LikeCols','Like Cols',7,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','LikeList','Like List',6,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','NotLike','Not Like',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','NotNull','Not Null',11,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'QitemOp','UD','User Defined',13,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','0','Normal',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','CF','Crud Fun',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','SN','Status Name',4,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','SS','Set Status',6,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','UD','User Defined',7,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name],[Sort],[Ext],[Note]) VALUES (
'RitemType','YE','YesEmpty',3,NULL,NULL);
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'AuthRoles','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'CustomerContract','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'CustomerMapping','客戶對應設定');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'CustomerRepair','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'Department','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'Employee','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'EmployeeArea','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'EmployeeAuthWork','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'Errorlog','異常錯誤Log');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'MixCategories','各類別主檔');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'WorkClass','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'WorkOrderImage','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'WorkOrderNo','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'WorkProcedure','');
INSERT INTO [tmpTable] ([Code],[Note]) VALUES (
'WorkResponse','');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','AuthRoles','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'RoleName','AuthRoles','varchar(45)',1,'',2,'角色名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','CustomerContract','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContractNo','CustomerContract','varchar(20)',0,'',2,'合約編號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProjectNo','CustomerContract','varchar(20)',0,'',3,'專案代碼');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProjectName','CustomerContract','varchar(30)',1,'',4,'專案名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'TaxId','CustomerContract','char(8)',0,'',5,'客戶統一編號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Name','CustomerContract','varchar(50)',1,'',6,'客戶名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Address','CustomerContract','varchar(100)',1,'',7,'公司地址');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Telephone','CustomerContract','varchar(20)',1,'',8,'電話');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Email','CustomerContract','varchar(100)',1,'',9,'Email');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContractStart','CustomerContract','datetime',0,'',10,'合約有效期-起');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContractEnd','CustomerContract','datetime',0,'',11,'合約有效期-迄');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContactName','CustomerContract','varchar(50)',1,'',12,'客戶聯絡窗口');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'FhProductDesc','CustomerContract','varchar(100)',1,'',13,'富鴻網產品描述');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'FhContactName','CustomerContract','varchar(50)',1,'',14,'富鴻網聯絡窗口');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProductPDM','CustomerContract','varchar(50)',1,'',15,'富鴻網產品PDM');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProductPJM','CustomerContract','varchar(50)',1,'',16,'富鴻網產品PJM');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AutoRepair','CustomerContract','tinyint(1)',1,'0',17,'啟動自動派維修工單');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','CustomerMapping','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'UniNumber','CustomerMapping','varchar(20)',0,'',2,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CategoryName','CustomerMapping','varchar(50)',1,'',3,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'MixCategoryId','CustomerMapping','varchar(50)',1,'',4,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','CustomerRepair','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkOrderNo','CustomerRepair','varchar(20)',0,'',2,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CustomerContractId','CustomerRepair','varchar(50)',0,'',3,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'RepairDateTime','CustomerRepair','datetime',0,'',4,'報修日期、時間');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProblemMain','CustomerRepair','varchar(50)',0,'',5,'障礙主類');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProblemSub','CustomerRepair','varchar(50)',0,'',6,'障礙次類');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProblemDesc','CustomerRepair','varchar(100)',1,'',7,'描述障礙內容');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContactrName','CustomerRepair','varchar(100)',1,'',8,'描述障礙內容');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContactrTel','CustomerRepair','varchar(100)',1,'',9,'描述障礙內容');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ContactrEmail','CustomerRepair','varchar(100)',1,'',10,'描述障礙內容');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'VideoPath','CustomerRepair','varchar(200)',1,'',11,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','Department','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Dept','Department','varchar(50)',1,'',2,'部門');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Team','Department','varchar(50)',1,'',3,'組別');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'OriginSource','Department','varchar(50)',1,'',4,'原始來源');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'EmployeeId','Employee','varchar(20)',0,'',1,'帳號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Name','Employee','varchar(30)',1,'',2,'員工姓名');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ENGName','Employee','varchar(30)',1,'',3,'員工英文名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Phone','Employee','varchar(20)',1,'',4,'聯絡電話');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Email','Employee','varchar(50)',1,'',5,'電子信箱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'PWD','Employee','varchar(50)',1,'',6,'密碼');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Origin','Employee','varchar(50)',1,'',7,'來源');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'PhoneToken','Employee','varchar(100)',1,'',8,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'DepartmentId','Employee','varchar(50)',0,'',9,'部門');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'EmployeeStatus','Employee','int(11)',1,'',10,'帳號狀態');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','EmployeeArea','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CityCode','EmployeeArea','varchar(45)',1,'',2,'城市代碼');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CityName','EmployeeArea','varchar(45)',1,'',3,'城市名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AreaCode','EmployeeArea','varchar(45)',1,'',4,'郵遞區號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AreaName','EmployeeArea','varchar(45)',1,'',5,'區域名稱(鄉鎮市區)');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'SerialNum','EmployeeArea','int(11)',1,'0',6,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','EmployeeAuthWork','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'EmployeeId','EmployeeAuthWork','varchar(20)',0,'',2,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkCategoryId','EmployeeAuthWork','varchar(50)',1,'',3,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'RegionWorkClass','EmployeeAuthWork','varchar(10)',1,'',4,'Region/WorkClass');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'EmployeeAreaId','EmployeeAuthWork','varchar(50)',1,'',5,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkClassId','EmployeeAuthWork','varchar(50)',1,'',6,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuthRolesId','EmployeeAuthWork','varchar(50)',1,'',7,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CanCreate','EmployeeAuthWork','tinyint(1)',1,'',8,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CanRead','EmployeeAuthWork','tinyint(1)',1,'',9,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CanDelete','EmployeeAuthWork','tinyint(1)',1,'',10,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CanUpdate','EmployeeAuthWork','tinyint(1)',1,'',11,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','Errorlog','varchar(36)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'DateTime','Errorlog','datetime',0,'',2,'發生時間');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'EmployeeId','Errorlog','varchar(45)',0,'',3,'登入帳號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Environment','Errorlog','varchar(45)',0,'',4,'環境 (Web、App)');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ExceptionPath','Errorlog','varchar(100)',0,'',5,'例外發生位置');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ExceptionMessageJson','Errorlog','varchar(1000)',0,'',6,'例外訊息Json');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','MixCategories','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Category','MixCategories','varchar(30)',1,'',2,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ColumnDescribe','MixCategories','varchar(50)',1,'',3,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ColumnValue','MixCategories','varchar(50)',1,'',4,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ColumnType','MixCategories','varchar(50)',1,'',5,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ParentCategoryId','MixCategories','varchar(50)',1,'',6,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ColumnSort','MixCategories','int(11)',1,'',7,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','WorkClass','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ClassName','WorkClass','varchar(45)',1,'',2,'類別名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ClassPath','WorkClass','varchar(45)',1,'',3,'類別路徑');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ParentId','WorkClass','varchar(50)',1,'',4,'上層類別 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Sort','WorkClass','int(11)',1,'0',5,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','WorkOrderImage','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkOrderId','WorkOrderImage','varchar(50)',0,'',2,'工單號碼 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ImageSort','WorkOrderImage','int(11)',0,'',3,'影像排序');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ImageType','WorkOrderImage','varchar(50)',1,'',4,'影像分類');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ImagePath','WorkOrderImage','varchar(100)',0,'',5,'影像名稱');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','WorkOrderNo','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Product','WorkOrderNo','varchar(1)',0,'',2,'工單字軌');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkNo','WorkOrderNo','int(11)',0,'',3,'工單單日流水號');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'MaxNo','WorkOrderNo','int(11)',0,'',4,'單日流水號最大值');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'MinNo','WorkOrderNo','int(11)',0,'',5,'單日流水號最小值');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Date','WorkOrderNo','datetime',0,'',6,'工單號碼分配日期');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','WorkProcedure','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkOrderId','WorkProcedure','varchar(50)',0,'',2,'工單號碼 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuditorDate','WorkProcedure','datetime',1,'',3,'審核時間');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuditorDescription','WorkProcedure','varchar(100)',1,'',4,'審核結果說明');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuditorEmployeeId','WorkProcedure','varchar(20)',1,'',5,'審核人員 Id ');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CheckPoint','WorkProcedure','varchar(50)',1,'',6,'審核節點');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuditorStatus','WorkProcedure','tinyint(1)',1,'',7,'審核結果');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'Id','WorkResponse','varchar(50)',0,'',1,'');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'CustomerRepairId','WorkResponse','varchar(50)',0,'',2,'報修工單 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkDatetime','WorkResponse','datetime',1,'',3,'派工日期時間');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'ProcessDatetime','WorkResponse','datetime',1,'',4,'處理日期時間');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'MaintainProcessDesc','WorkResponse','varchar(100)',1,'',5,'維運處理描述');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkEmpId','WorkResponse','varchar(20)',1,'',6,'施工人員 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'AuditEmpId','WorkResponse','varchar(20)',1,'',7,'審核人員 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'PmEmpId','WorkResponse','varchar(20)',1,'',8,'主管單位 Id');
INSERT INTO [tmpColumn] ([Code],[TableCode],[DataType],[Nullable],[DefaultValue],[Sort],[Note]) VALUES (
'WorkStatusMappingId','WorkResponse','varchar(50)',1,'',9,'工單進程 Id');
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
1,'1616P03AXA','1616NY85WA','_EFMigrationsHistory','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
2,'1616P03CSA','1616NY85WA','AirConstructionRecord','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
3,'1616P03E3A','1616NY85WA','AirInspect','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
4,'1616P03FHA','1616NY85WA','AirInstall','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
5,'1616P03GUA','1616NY85WA','AirMaintain','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
6,'1616P03J5A','1616NY85WA','AirVisuallyInspect','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
7,'1616P03KGA','1616NY85WA','Area','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
8,'1616P03LWA','1616NY85WA','AuthRoles','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
9,'1616P03NAA','1616NY85WA','AuthUser','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
10,'1616P03PMA','1616NY85WA','BillDate','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
11,'1616P03QYA','1616NY85WA','CloseReason','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
12,'1616P03S9A','1616NY85WA','CloseReasonDetail','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
13,'1616P03TLA','1616NY85WA','Contract','合約主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
14,'1616P03V0A','1616NY85WA','Department','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
15,'1616P03WEA','1616NY85WA','District','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
16,'1616P03XRA','1616NY85WA','DocumentSetting','資料設定主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
17,'1616P03YZA','1616NY85WA','Employee','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
18,'1616P040DA','1616NY85WA','EmployeeArea','員工區域主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
19,'1616P041TA','1616NY85WA','EmployeeAreaDetail','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
20,'1616P0434A','1616NY85WA','EmployeeWorkClassDetail','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
21,'1616P044FA','1616NY85WA','EnergyAreaMapping','能源區域關聯表','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
22,'1616P045YA','1616NY85WA','EnergyDcuAbnormal','能源Dcu異常主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
23,'1616P0479A','1616NY85WA','EnergyDcuMaster','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
24,'1616P048PA','1616NY85WA','EnergyDcuSurvey','能源Dcu會勘','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
25,'1616P04A0A','1616NY85WA','EnergyFanAbnormal','能源Fan異常主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
26,'1616P04BBA','1616NY85WA','EnergyFanMaster','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
27,'1616P04CRA','1616NY85WA','EnergyFanSurvey','能源Fan會勘','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
28,'1616P04E2A','1616NY85WA','Errorlog','異常錯誤Log','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
29,'1616P04FAA','1616NY85WA','Location','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
30,'1616P04GQA','1616NY85WA','LoginLog','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
31,'1616P04J4A','1616NY85WA','OrderImg','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
32,'1616P04KFA','1616NY85WA','PowerInstallDcu','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
33,'1616P04LVA','1616NY85WA','PowerInstallFan','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
34,'1616P04N6A','1616NY85WA','PowerMaintainDcu','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
35,'1616P04PLA','1616NY85WA','PowerMaintainFan','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
36,'1616P04QXA','1616NY85WA','PriceSet','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
37,'1616P04S8A','1616NY85WA','PriceSetDetail','計價明細檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
38,'1616P04TNA','1616NY85WA','QuickScreeningRecord','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
39,'1616P04V2A','1616NY85WA','sensor','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
40,'1616P04WDA','1616NY85WA','Test','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
41,'1616P04XTA','1616NY85WA','WorkClass','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
42,'1616P04Z4A','1616NY85WA','WorkDispatch','工單派修原因主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
43,'1616P050FA','1616NY85WA','WorkOrder','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
44,'1616P051VA','1616NY85WA','WorkOrderDcu','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
45,'1616P0539A','1616NY85WA','WorkOrderFan','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
46,'1616P054LA','1616NY85WA','WorkOrderNo','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
47,'1616P0560A','1616NY85WA','WorkOrderPowerNo','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
48,'1616P057BA','1616NY85WA','WorkProcedure','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
49,'1616P058NA','1616NY85WA','WorkStatusMapping','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
50,'1616ZCDM6A','1616XFNCSA','AuthRoles','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
51,'1616ZCDNLA','1616XFNCSA','CustomerContract','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
52,'1616ZCDQ0A','1616XFNCSA','CustomerMapping','客戶對應設定','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
53,'1616ZCDRBA','1616XFNCSA','CustomerRepair','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
54,'1616ZCDSNA','1616XFNCSA','Department','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
55,'1616ZCDTZA','1616XFNCSA','Employee','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
56,'1616ZCDVAA','1616XFNCSA','EmployeeArea','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
57,'1616ZCDWQA','1616XFNCSA','EmployeeAuthWork','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
58,'1616ZCDY1A','1616XFNCSA','Errorlog','異常錯誤Log','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
59,'1616ZCDZFA','1616XFNCSA','MixCategories','各類別主檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
60,'1616ZCE0VA','1616XFNCSA','WorkClass','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
61,'1616ZCE29A','1616XFNCSA','WorkOrderImage','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
62,'1616ZCE3PA','1616XFNCSA','WorkOrderNo','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
63,'1616ZCE56A','1616XFNCSA','WorkProcedure','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
64,'1616ZCE6HA','1616XFNCSA','WorkResponse','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
65,'161D2APDCA','161D29Q5SA','Act','公益活動','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
66,'165R6BBPBA','165R6ANSGA','Categories','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
67,'165R6BBQRA','165R6ANSGA','CustomerCustomerDemo','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
68,'165R6BBS2A','165R6ANSGA','CustomerDemographics','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
69,'165R6BBTDA','165R6ANSGA','Customers','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
70,'165R6BBUQA','165R6ANSGA','Employees','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
71,'165R6BBW4A','165R6ANSGA','EmployeeTerritories','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
72,'165R6BBXFA','165R6ANSGA','Order Details','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
73,'165R6BBYVA','165R6ANSGA','Orders','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
74,'165R6BC06A','165R6ANSGA','Products','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
75,'165R6BC2XA','165R6ANSGA','Region','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
76,'165R6BC48A','165R6ANSGA','Shippers','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
77,'165R6BC5KA','165R6ANSGA','Suppliers','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
78,'165R6BC6ZA','165R6ANSGA','Territories','','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
79,'5X9RB36MYA','Db','Column','欄位檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
80,'5X9RB36PRA','Db','Crud','CRUD設定','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
81,'5X9RB36TCA','Db','CrudEitem','CRUD維護欄位','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
82,'5X9RB36VLA','Db','CrudEtable','CRUD維護資料表','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
83,'5X9RB36XEA','Db','CrudQitem','CRUD查詢欄位','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
84,'5X9RB36ZCA','Db','CrudRitem','CRUD查詢結果欄位','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
85,'5X9RB3720A','Db','Project','專案檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
86,'5X9RB373ZA','Db','Table','資料表檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
87,'5XD29XBSMA','Hr','Dept','部門','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
88,'5XD29XC3BA','Hr','User','使用者','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
89,'5XD29XC6LA','Hr','UserJob','工作經驗','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
90,'5XD29XC7WA','Hr','UserLang','語言能力','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
91,'5XD29XC9AA','Hr','UserLicense','用戶證照','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
92,'5XD29XCAWA','Hr','UserSchool','學歷資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
93,'5XD29XCDPA','Hr','UserSkill','專業技能','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
94,'5Z5BHXK86A','Hr','Leave','假單','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
95,'D58J2RM39A','Db','XpCode','雜項檔','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
96,'D58LXKZJUA','Hr','Cms','CMS','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
97,'D58LXL00BA','Hr','CustInput','自訂輸入欄位','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
98,'D58LXL0GHA','Hr','XpCode','雜項檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
99,'D58LXL0Y0A','Hr','XpEasyRpt','簡單報表','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
100,'D58LXL1D4A','Hr','XpFlow','流程','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
101,'D58LXL1VTA','Hr','XpFlowLine','流程線','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
102,'D58LXL2A8A','Hr','XpFlowNode','流程節點','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
103,'D58LXL2SLA','Hr','XpFlowSign','流程簽核資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
104,'D58LXL378A','Hr','XpImportLog','匯入資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
105,'D58LXL3N4A','Hr','XpProg','系統功能','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
106,'D58LXL44TA','Hr','XpRole','角色','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
107,'D58LXL4KKA','Hr','XpRoleProg','角色功能','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
108,'D58LXL50NA','Hr','XpTranLog','交易記錄','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
109,'D58LXL5FUA','Hr','XpUserRole','用戶角色','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
110,'D58WX60WVA','D58WWHCYQA','Attend','手機用戶參加尋寶資料','',0,0);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
111,'D58WX61CCA','D58WWHCYQA','Bao','尋寶資料','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
112,'D58WX61TFA','D58WWHCYQA','Cms','CMS內容','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
113,'D58WX627KA','D58WWHCYQA','Reply','用戶答題資料','',0,0);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
114,'D58WX62PGA','D58WWHCYQA','Stage','尋寶關卡','',1,0);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
115,'D58WX634WA','D58WWHCYQA','User','管理系統用戶','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
116,'D58WX63L5A','D58WWHCYQA','UserApp','手機用戶資料','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
117,'D58WX6485A','D58WWHCYQA','UserCust','客戶資料','',1,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
118,'D8ZRXETU8A','D58WWHCYQA','BaoAttend','App用戶參加者資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
119,'D8ZRXEUAEA','D58WWHCYQA','BaoReply','用戶答題資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
120,'D8ZRXEUS7A','D58WWHCYQA','BaoStage','尋寶關卡','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
121,'D9QTSQF55A','D58WWHCYQA','XpCode','雜項檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
122,'IBxwfrp6Sl','wvK6LgdGeK','Candidate','候選人','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
123,'qIebMI42WA','wvK6LgdGeK','Config','系統組檔','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
124,'tKUNoEv1qp','wvK6LgdGeK','Vote','投票資料','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
125,'rDrG0sqtuf','wvK6LgdGeK','Voter','投票者','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
1122,'kTvOnXy3sj','uNn743Oo7H','InBulk','進港散裝','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
1123,'JqeuC6ODS7','uNn743Oo7H','OutBulk','出港散裝','',0,1);
INSERT INTO [Table] ([Sn],[Id],[ProjectId],[Code],[Name],[Note],[TranLog],[Status]) VALUES (
1124,'UMXgXA56dn','uNn743Oo7H','User','','',0,1);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
1,'1616XFNCSA','Test_F2a','Test_F2',0,'(empty)','(empty)',0,1);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
2,'161D29Q5SA','EarthIssue','Earth',0,'D:\_project\EarthIssue','data source=(localdb)\mssqllocaldb;initial catalog=Earth;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
3,'165R6ANSGA','Northwind','Northwind',0,'(empty)','data source=(localdb)\mssqllocaldb;initial catalog=Northwind;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
4,'D58WWHCYQA','BaoAdm','Bao',0,'d:\_project\BaoAdm','data source=(localdb)\mssqllocaldb;initial catalog=Bao;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
5,'Db','DbAdm','Db',0,'D:\_project\DbAdm','data source=(localdb)\mssqllocaldb;initial catalog=Db;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
6,'Hr','HrAdm','Hr',0,'D:\_project\HrAdm','data source=(localdb)\mssqllocaldb;initial catalog=Hr;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
7,'wvK6LgdGeK','VoteAdm','Vote',0,'d:\_project\VoteAdm','data source=(localdb)\mssqllocaldb;initial catalog=Vote;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [Project] ([Sn],[Id],[Code],[DbName],[DbType],[ProjectPath],[ConnectStr],[Status],[FromTmpTable]) VALUES (
1007,'uNn743Oo7H','PortAdm','Port',0,'D:\_project\PortAdm','data source=(localdb)\mssqllocaldb;initial catalog=Port;integrated security=True;multipleactiveresultsets=True;max pool size=1000;',1,0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
1,'161D72L61A','161D2WBJ8A','Name','活動名稱',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
2,'161D72L7FA','161D2WBJ8A','AssistId','贊助來源',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3,'161D72L8SA','161D2WBJ8A','PlanCoin','預計使用幣數',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
4,'161D72LA6A','161D2WBJ8A','UseCoin','實際使用幣數',0,'0',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
5,'161D72LBLA','161D2WBJ8A','Status','資料狀態',0,'SN',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
6,'161D72LCXA','161D2WBJ8A','Created','建檔日期',0,'0',5);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
7,'161D72LE8A','161D2WBJ8A','_Fun','維護',0,'CF',6);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
8,'5XEXK6A9SA','5XDCQU13AA','Account','帳號',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
9,'5XEXK6ASFA','5XDCQU13AA','Name','使用者名稱',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
10,'5XEXK6B26A','5XDCQU13AA','DeptName','部門',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
11,'5XEXK6B5MA','5XDCQU13AA','Status','資料狀態',0,'SS',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
12,'5XEXK6B9RA','5XDCQU13AA','_Fun','維護',0,'CF',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
13,'5Z5ZUACLWA','5Z5JPZR5HA','UserId','請假人',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
14,'5Z5ZUACMUA','5Z5JPZR5HA','AgentId','代理人',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
15,'5Z5ZUACP0A','5Z5JPZR5HA','LeaveType','假別',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
16,'5Z5ZUACPQA','5Z5JPZR5HA','StartTime','開始時間',0,'DT',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
17,'5Z5ZUACQUA','5Z5JPZR5HA','EndTime','結束時間',0,'DT',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
18,'5Z5ZUACRPA','5Z5JPZR5HA','Hours','請假時數',0,'0',5);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
19,'5Z5ZUACTKA','5Z5JPZR5HA','FlowSignStatus','流程簽核狀態',0,'0',6);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
20,'5Z5ZUACUHA','5Z5JPZR5HA','Created','Created',0,'DT',7);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
21,'D8J9A1PT9A','D8J9A1MFLA','ProjectCode','專案',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
22,'D8J9A1Q72A','D8J9A1MFLA','Code','資料表代碼',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
23,'D8J9A1QPKA','D8J9A1MFLA','Name','資料表名稱',0,'0',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
24,'D8J9A1R5AA','D8J9A1MFLA','TranLog','是否記錄交易',0,'YE',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
25,'D8J9A1RMEA','D8J9A1MFLA','_Fun','維護',0,'CF',5);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
26,'D8J9A1S3AA','D8J9A1MFLA','Status','資料狀態',0,'SN',6);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
27,'D8JAARUJEA','D8J9A1MFLA','DbName','資料庫',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
28,'D8JNSZQGBA','D8JNSZN7YA','ProjectCode','專案Id',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
29,'D8JNSZQZ8A','D8JNSZN7YA','Code','資料表代碼',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
30,'D8JNSZRD6A','D8JNSZN7YA','Name','資料表名稱',0,'0',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
31,'D8JNSZRV4A','D8JNSZN7YA','TranLog','是否記錄交易',0,'YE',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
32,'D8JNSZSBAA','D8JNSZN7YA','Status','資料狀態',0,'SN',6);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
33,'D8JPP0VNCA','D8JNSZN7YA','DbName','資料庫名稱',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
34,'D8JPP0W6JA','D8JNSZN7YA','_Fun','維護',0,'CF',5);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
35,'9AKBgQooDd','Jh2OTTD2or','VoteNo','候選號碼',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
36,'CzR1b1WInr','Jh2OTTD2or','Name','姓名',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
37,'dt3lbPpTSm','Jh2OTTD2or','Count','得票數',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
1035,'mQ5r81zPFH','Jh2OTTD2or','_Fun','維護',0,'CF',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
2035,'rND93jPqNG','YUecyawDVS','Name','姓名',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
2036,'JqrQp4BPma','YUecyawDVS','Account','登入帳號',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
2037,'4HorEBprVl','YUecyawDVS','Status','資料狀態',0,'YE',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
2038,'YYs9WNHCID','YUecyawDVS','_Fun','維護',0,'CF',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3035,'a5UNAdv1OL','JjoEMzsiGr','Ym','民國年月',0,'0',0);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3036,'veeBSFt7An','JjoEMzsiGr','PortName','港口名稱',0,'0',1);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3037,'Zftoo49xqW','JjoEMzsiGr','InOut','國內外',0,'0',2);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3038,'T76QUtFFU4','JjoEMzsiGr','AreaName','區域名稱',0,'0',3);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3039,'3jVgWpxHxg','JjoEMzsiGr','CargoType','貨品',0,'0',4);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3040,'lbFK8IdjRe','JjoEMzsiGr','Weight','噸重',0,'0',5);
INSERT INTO [CrudRitem] ([Sn],[Id],[CrudId],[ColumnCode],[Name],[Width],[RitemType],[Sort]) VALUES (
3041,'OrreGYWAaW','JjoEMzsiGr','Note','備註',0,'0',6);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1,'161D72L4QA','161D2WBJ8A','161D2APL5A','','T','','Equal',0,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
2,'5XDCQUBPRA','5XDCQU13AA','5XD29XD72A','','T','','Like',0,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
3,'5XDCS43M4A','5XDCQU13AA','5XD29XD8JA','','T','','Like',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
4,'5XDCS43PJA','5XDCQU13AA','5XD29XDARA','','S','Depts','Equal',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
5,'5Z5ZUACK6A','5Z5JPZR5HA','5Z5BHXMGLA','','S','LeaveTypes','Equal',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
6,'5Z5ZUACL6A','5Z5JPZR5HA','5Z5BHXMS5A','','S','SignStatuses','Equal',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
7,'5Z87DRL40A','5Z5JPZR5HA','5Z5BHXMJ7A','','D','','InRange',1,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
8,'D8J9A1MWSA','D8J9A1MFLA','5X9RB3GRZA','','S','Projects','Equal',0,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
9,'D8J9A1NEQA','D8J9A1MFLA','5YFVJXCCVA','','T','','Like',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
10,'D8J9A1NUSA','D8J9A1MFLA','5X9RB3GT3A','','T','','Like',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
11,'D8JEACLSTA','D8J9A1MFLA','D58FUTT5TA','','S','YesNos','Equal',0,0,'','',3);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
12,'D8JNSZNM8A','D8JNSZN7YA','5X9RB3GRZA','','S','Projects','Equal',0,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
13,'D8JNSZP38A','D8JNSZN7YA','5YFVJXCCVA','','T','','Like',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
14,'D8JNSZPJJA','D8JNSZN7YA','5X9RB3GT3A','','T','','Like',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
15,'D8JNSZQ05A','D8JNSZN7YA','D58FUTT5TA','','S','YesNos','Equal',0,0,'','',3);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
16,'NPojx2wwsp','YUecyawDVS','fcmkyjHA3O','','T','','Like',0,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
17,'75gTsQMiqa','YUecyawDVS','AUsuAQ4SJd','','T','','Like',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
18,'iuzdH2kp9m','YUecyawDVS','SdslmZPic1','','S','YesNos','Equal',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1016,'oAUJ3O0x99','JjoEMzsiGr','V4ZR1m3J8T','','T','','Equal',1,0,'','',0);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1017,'sXTrCCJtAw','JjoEMzsiGr','FSjaSs4PmB','','S','PortNamesA','Equal',0,0,'','',1);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1018,'Vepnx3sa1Z','JjoEMzsiGr','aP3ONcJrCI','','S','InOutsA','Equal',0,0,'','',2);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1019,'xQA4l0RfuR','JjoEMzsiGr','R2BunFdJRk','','T','','Like2',0,0,'','',3);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1020,'l99xmm6E7H','JjoEMzsiGr','aVNx8fsNq0','','T','','Like2',0,0,'','',4);
INSERT INTO [CrudQitem] ([Sn],[Id],[CrudId],[ColumnId],[TableAs],[QitemType],[ItemData],[Op],[IsRange],[IsFind2],[PosGroup],[LayoutCols],[Sort]) VALUES (
1021,'QSvc5iQPxc','JjoEMzsiGr','vwylLi9Zbd','','INT','','Equal',1,0,'','',5);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'161D72LFNA','161D2WBJ8A','161D2APDCA','Id','','1','',0,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYLM3AWA','5XDCQU13AA','5XD29XC3BA','Id','','0','',0,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYNLFBNA','5XDCQU13AA','5XD29XC6LA','Id','UserId','0','',2,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYURMVMA','5XDCQU13AA','5XD29XCAWA','Id','UserId','0','',1,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYURN5GA','5XDCQU13AA','5XD29XC7WA','Id','UserId','0','Sort',3,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYURNAJA','5XDCQU13AA','5XD29XC9AA','Id','UserId','0','',4,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5XEYURNC2A','5XDCQU13AA','5XD29XCDPA','Id','UserId','0','',5,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'5Z642A9LLA','5Z5JPZR5HA','5Z5BHXK86A','Id','','1','',0,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'D8J9A1SKGA','D8J9A1MFLA','5X9RB373ZA','Id','','0','',0,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'D8J9A1T1AA','D8J9A1MFLA','5X9RB36MYA','Id','TableId','0','',1,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'D8JNSZSWHA','D8JNSZN7YA','5X9RB373ZA','Id','','0','',0,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'D8JNSZT7JA','D8JNSZN7YA','5X9RB36MYA','Id','TableId','0','',1,0,NULL);
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'fpqDsLLEZ5','JjoEMzsiGr','kTvOnXy3sj','Sn','','0','',0,0,'');
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'YnLMqLhYHz','Jh2OTTD2or','IBxwfrp6Sl','Id','','0','',0,0,'_Fun.AutoIdShort');
INSERT INTO [CrudEtable] ([Id],[CrudId],[TableId],[PkeyFid],[FkeyFid],[Col4],[OrderBy],[Sort],[HalfWidth],[AutoIdLen]) VALUES (
'zpEzZuN5SA','YUecyawDVS','rDrG0sqtuf','Id','','0','',0,0,'_Fun.AutoIdLong');
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
1,'161D72LH2A','161D72LFNA','161D2APJUA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
2,'161D72LJGA','161D72LFNA','161D2APL5A','T','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3,'161D72LKWA','161D72LFNA','161D2APMKA','S','Assists',0,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
4,'161D72LMAA','161D72LFNA','161D2APNZA','DEC','',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
5,'161D72LNQA','161D72LFNA','161D2APQAA','DEC','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
6,'161D72LQ4A','161D72LFNA','161D2APRQA','F','',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
7,'161D72LRJA','161D72LFNA','161D2APT1A','TA','',0,1,1,'','','','2,6',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
8,'161D72LSVA','161D72LFNA','161D2APUFA','C','啟用',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
9,'161D72LU9A','161D72LFNA','161D2APX3A','RO','',0,1,1,'','','','',0,'0','',8);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
10,'161D72LVPA','161D72LFNA','161D2APYHA','RO','',0,1,1,'','','','',0,'0','',9);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
11,'5XEYLM3KAA','5XEYLM3AWA','5XD29XD5LA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
12,'5XEYLM3N0A','5XEYLM3AWA','5XD29XD72A','T','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
13,'5XEYNLFSBA','5XEYLM3AWA','5XD29XD8JA','T','',0,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
14,'5XEYNLFW4A','5XEYLM3AWA','5XD29XDARA','T','',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
15,'5XEYNLFXLA','5XEYLM3AWA','5XD29XDBYA','C','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
16,'5XEYNLFYVA','5XEYNLFBNA','5XD29XDDDA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
17,'5XEYNLG0EA','5XEYNLFBNA','5XD29XDF1A','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
18,'5XEYNLG1MA','5XEYNLFBNA','5XD29XDGTA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
19,'5XEYNLG31A','5XEYNLFBNA','5XD29XDKZA','T','',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
20,'5XEYNLG4KA','5XEYNLFBNA','5XD29XDN0A','T','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
21,'5XEYNLG5VA','5XEYNLFBNA','5XD29XDPVA','T','',1,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
22,'5XEYNLG7CA','5XEYNLFBNA','5XD29XDUAA','T','',1,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
23,'5XEYNLG8MA','5XEYNLFBNA','5XD29XDVWA','INT','',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
24,'5XEYNLGA4A','5XEYNLFBNA','5XD29XDXPA','C','',0,1,1,'','','','',0,'0','',8);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
25,'5XEYNLGBGA','5XEYNLFBNA','5XD29XE1AA','MO','1000',0,1,1,'','','','',0,'0','',9);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
26,'5XEYURNH5A','5XEYURMVMA','5XD29XGNVA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
27,'5XEYURNJEA','5XEYURMVMA','5XD29XGR4A','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
28,'5XEYURNKSA','5XEYURMVMA','5XD29XGSRA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
29,'5XEYURNN1A','5XEYURMVMA','5XD29XGV8A','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
30,'5XEYURNQBA','5XEYURMVMA','5XD29XGWUA','T','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
31,'5XEYURNRRA','5XEYURMVMA','5XD29XGZGA','T','',1,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
32,'5XEYURNSWA','5XEYURMVMA','5XD29XH1CA','C','',0,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
33,'5XEYURNX4A','5XEYURN5GA','5XD29XE2UA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
34,'5XEYURNZNA','5XEYURN5GA','5XD29XE9LA','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
35,'5XEYURP18A','5XEYURN5GA','5XD29XGACA','SO','',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
36,'5XEYURP33A','5XEYURN5GA','5XD29XFPMA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
37,'5XEYURP56A','5XEYURN5GA','5XD29XFX1A','S','LangLevels',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
38,'5XEYURP6HA','5XEYURN5GA','5XD29XFZXA','S','LangLevels',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
39,'5XEYURP80A','5XEYURN5GA','5XD29XG6HA','S','LangLevels',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
40,'5XEYURP9NA','5XEYURN5GA','5XD29XG8HA','S','LangLevels',0,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
41,'5XEYURPBDA','5XEYURNAJA','5XD29XGC3A','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
42,'5XEYURPDTA','5XEYURNAJA','5XD29XGE9A','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
43,'5XEYURPFAA','5XEYURNAJA','5XD29XGG3A','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
44,'5XEYURPGVA','5XEYURNAJA','5XD29XGHSA','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
45,'5XEYURPN5A','5XEYURNAJA','5XD29XGKPA','F','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
46,'5XEYURPPJA','5XEYURNC2A','5XD29XH4HA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
47,'5XEYURPQVA','5XEYURNC2A','5XD29XH6EA','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
48,'5XEYURPT8A','5XEYURNC2A','5XD29XHC2A','H','',0,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
49,'5XEYURPWGA','5XEYURNC2A','5XD29XH8EA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
50,'5XEYURPYZA','5XEYURNC2A','5XD29XHA2A','TA','',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
51,'5XLQA0CC6A','5XEYURNC2A','5XLQ99LV9A','SO','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
52,'5Z642A9Q8A','5Z642A9LLA','5Z5BHXMCMA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
53,'5Z642A9QYA','5Z642A9LLA','5Z5BHXME5A','S','Users',1,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
54,'5Z642A9RUA','5Z642A9LLA','5Z5BHXMFJA','S','Users',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
55,'5Z642A9T0A','5Z642A9LLA','5Z5BHXMGLA','S','LeaveTypes',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
56,'5Z642A9TYA','5Z642A9LLA','5Z5BHXMJ7A','DT','',1,1,1,'','','','2,4',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
57,'5Z642A9ULA','5Z642A9LLA','5Z5BHXMKSA','DT','',1,1,1,'','','','2,4',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
58,'5Z642A9VKA','5Z642A9LLA','5Z5BHXMM5A','DEC','',1,1,1,'','','','2,1',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
59,'5Z642A9XHA','5Z642A9LLA','5Z5BHXMS5A','RO','FlowSignStatusName',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
60,'5Z642A9YGA','5Z642A9LLA','5Z5BHXMU0A','C','啟用',0,1,1,'','','','',0,'0','',8);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
61,'5Z642A9ZHA','5Z642A9LLA','5Z5BHXMVTA','RO','CreatorName',0,1,1,'','','','',0,'0','',9);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
62,'5Z642AA1FA','5Z642A9LLA','5Z5BHXMXVA','RO','',0,1,1,'','','','',0,'0','',10);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
63,'5Z642AA2HA','5Z642A9LLA','5Z5BHXMZRA','RO','ReviserName',0,1,1,'','','','',0,'0','',11);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
64,'5Z642AA37A','5Z642A9LLA','5Z5BHXN1KA','RO','',0,1,1,'','','','',0,'0','',12);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
65,'D8J9A1TH3A','D8J9A1SKGA','5X9RB3GPHA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
66,'D8J9A1TZHA','D8J9A1SKGA','5X9RB3GRZA','S','Projects',1,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
67,'D8J9A1ULAA','D8J9A1SKGA','5YFVJXCCVA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
68,'D8J9A1UXFA','D8J9A1SKGA','5X9RB3GT3A','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
69,'D8J9A1VD2A','D8J9A1SKGA','D58FUTT5TA','C','是',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
70,'D8J9A1VVNA','D8J9A1SKGA','5X9RB3GZ3A','C','啟用',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
71,'D8J9A1WAHA','D8J9A1T1AA','5X9RB37ZKA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
72,'D8J9A1WRSA','D8J9A1T1AA','5X9RB381FA','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
73,'D8J9A1X7LA','D8J9A1T1AA','5YFVJXBYXA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
74,'D8J9A1XP4A','D8J9A1T1AA','5X9RB3845A','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
75,'D8J9A1Y4LA','D8J9A1T1AA','5X9RB3890A','T','',1,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
76,'D8J9A1YL9A','D8J9A1T1AA','5X9RB38APA','C','',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
77,'D8J9A1Z1FA','D8J9A1T1AA','5X9RB38E9A','T','',0,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
78,'D8J9A1ZHGA','D8J9A1T1AA','5X9RB38G3A','INT','',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
79,'D8J9A1ZZCA','D8J9A1T1AA','5X9RB38HTA','T','',0,1,1,'','','','',0,'0','',8);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
80,'D8J9A20FPA','D8J9A1T1AA','5X9RB38KTA','C','',0,1,1,'','','','',0,'0','',9);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
81,'D8JNSZTP0A','D8JNSZSWHA','5X9RB3GPHA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
82,'D8JNSZU55A','D8JNSZSWHA','5X9RB3GRZA','T','',1,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
83,'D8JNSZUNGA','D8JNSZSWHA','5YFVJXCCVA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
84,'D8JNSZV2FA','D8JNSZSWHA','5X9RB3GT3A','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
85,'D8JNSZVJXA','D8JNSZSWHA','D58FUTT5TA','C','是',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
86,'D8JNSZW0MA','D8JNSZSWHA','5X9RB3GZ3A','C','正常',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
87,'D8JNSZWECA','D8JNSZT7JA','5X9RB37ZKA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
88,'D8JNSZWXHA','D8JNSZT7JA','5X9RB381FA','H','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
89,'D8JNSZXAKA','D8JNSZT7JA','5YFVJXBYXA','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
90,'D8JNSZXS2A','D8JNSZT7JA','5X9RB3845A','T','',1,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
91,'D8JNSZY7TA','D8JNSZT7JA','5X9RB3890A','T','',1,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
92,'D8JNSZYP2A','D8JNSZT7JA','5X9RB38APA','C','',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
93,'D8JNSZZ72A','D8JNSZT7JA','5X9RB38E9A','T','',0,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
94,'D8JNSZZNVA','D8JNSZT7JA','5X9RB38G3A','INT','',0,1,1,'','','','',0,'0','',7);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
95,'D8JNT002PA','D8JNSZT7JA','5X9RB38HTA','T','',0,1,1,'','','','',0,'0','',8);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
96,'D8JNT00JHA','D8JNSZT7JA','5X9RB38KTA','C','',0,1,1,'','','','',0,'0','',9);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
97,'UQa5iYzWEs','YnLMqLhYHz','xGZiOLBCDA','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
98,'PF9fep2Rrm','YnLMqLhYHz','XTcUBUjVth','T','',1,1,1,'','','','2,1',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
99,'vS2vOd7z93','YnLMqLhYHz','Gq7rq5L2RG','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
100,'JIhoOCOA0G','YnLMqLhYHz','rCOf19gjwB','RO','Count',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
1097,'MaSPbVxmXB','YnLMqLhYHz','4r6HGLZa4M','F','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
2097,'XUJ4HkON1I','zpEzZuN5SA','OX7hmRCbeH','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
2098,'DxPWZqxoGG','zpEzZuN5SA','fcmkyjHA3O','T','',1,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
2099,'Zi1ivdOcf7','zpEzZuN5SA','AUsuAQ4SJd','T','',1,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
2100,'N2pvV91okL','zpEzZuN5SA','SdslmZPic1','C','啟用',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3097,'YVyFGuFjxZ','fpqDsLLEZ5','KMfcyezYB1','H','',0,1,1,'','','','',0,'0','',0);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3098,'QT3Ns2OpeZ','fpqDsLLEZ5','V4ZR1m3J8T','RO','',0,1,1,'','','','',0,'0','',1);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3099,'pYbPxTc5Zx','fpqDsLLEZ5','FSjaSs4PmB','RO','',0,1,1,'','','','',0,'0','',2);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3100,'mWN8KkgzLS','fpqDsLLEZ5','aP3ONcJrCI','RO','',0,1,1,'','','','',0,'0','',3);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3101,'h1eIvqYR2J','fpqDsLLEZ5','R2BunFdJRk','RO','',0,1,1,'','','','',0,'0','',4);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3102,'mAsGyoChtZ','fpqDsLLEZ5','aVNx8fsNq0','RO','',0,1,1,'','','','',0,'0','',5);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3103,'VyOtqb6eUD','fpqDsLLEZ5','vwylLi9Zbd','RO','',0,1,1,'','','','',0,'0','',6);
INSERT INTO [CrudEitem] ([Sn],[Id],[EtableId],[ColumnId],[EitemType],[ItemData],[Required],[HasCreate],[HasUpdate],[PlaceHolder],[DefaultValue],[PosGroup],[LayoutCols],[Width],[CheckType],[CheckData],[Sort]) VALUES (
3104,'tqK7I6z6yR','fpqDsLLEZ5','HSaMmpm0JR','T','',0,1,1,'','','','',0,'0','',7);
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
1,'161D2WBJ8A','161D29Q5SA','Act','活動維護',1,'select * from dbo.Act
order by Id','',1,1,1,1,0,0,0,1,'2022-03-19 17:00:45.000',NULL);
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
2,'5XDCQU13AA','Hr','UserExt','用戶學經歷維護',1,'select u.*, d.name as DeptName from [User] u
join [Dept] d on u.DeptId=d.Id
order by u.Id','',0,1,0,1,0,1,1,1,'2020-12-12 19:18:07.000','2021-01-20 18:09:39.000');
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
3,'5Z5JPZR5HA','Hr','Leave','請假作業',1,'select l.* 
from Leave l
join [User] u on l.UserId=u.Id
join [User] u2 on l.AgentId=u2.Id
order by l.Id','',1,1,1,1,0,1,1,1,'2021-02-18 01:11:15.000','2021-02-20 11:53:27.000');
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
4,'D8J9A1MFLA','Db','Test','資料表維護2',1,'select 
    p.Code as ProjectCode, p.DbName,
    a.Code, a.Name, a.TranLog,
    '''' as _Fun, a.Status, 
    a.Id
from dbo.[Table] a
inner join dbo.Project p on p.Id=a.ProjectId
order by a.Id desc','a',1,1,1,1,0,0,0,1,'2022-01-20 11:10:47.000','2022-01-20 15:25:28.000');
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
5,'D8JNSZN7YA','Db','Table2','資料表維護2',1,'select 
    p.Code as ProjectCode, p.DbName,
    a.Code, a.Name, a.TranLog,
    '''' as _Fun, a.Status, 
    a.Id
from dbo.[Table] a
inner join dbo.Project p on p.Id=a.ProjectId
order by a.Id desc','',1,1,1,1,0,0,0,1,'2022-01-20 16:11:25.000','2022-05-06 00:18:24.000');
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
6,'Jh2OTTD2or','wvK6LgdGeK','Candidate','侯選人管理',1,'select *
from dbo.Candidate
order by Sn','',1,1,1,1,0,0,0,1,'2022-08-28 11:59:01.000',NULL);
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
1006,'YUecyawDVS','wvK6LgdGeK','Voter','投票者管理',1,'select * from dbo.Voter
order by Sn','',1,1,1,1,0,0,0,1,'2022-08-29 12:54:46.000',NULL);
INSERT INTO [Crud] ([Sn],[Id],[ProjectId],[ProgCode],[ProgName],[LabelHori],[ReadSql],[TableAs],[HasCreate],[HasUpdate],[HasDelete],[HasView],[HasExport],[HasReset],[AuthType],[Status],[Created],[Revised]) VALUES (
2006,'JjoEMzsiGr','uNn743Oo7H','InBulk','進港散裝CRUD',1,'select *
from dbo.InBulk','',0,1,0,1,0,1,0,1,'2022-10-24 21:32:45.000',NULL);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1,'15ZQD4ED1A','D58LXL44TA','test','test','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
2,'1616P05CQA','1616P03CSA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3,'1616P05E1A','1616P03CSA','WorkNo','','varchar(13)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
4,'1616P05FFA','1616P03CSA','ProjectName','','varchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
5,'1616P05GVA','1616P03CSA','WorkDate','','varchar(16)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
6,'1616P05J9A','1616P03CSA','WorkTime','','varchar(16)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
7,'1616P05KLA','1616P03CSA','Latitude','','decimal(10,6)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
8,'1616P05LXA','1616P03CSA','Longitude','','decimal(10,6)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
9,'1616P05NBA','1616P03CSA','Location','','varchar(100)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
10,'1616P05QTA','1616P03CSA','WorkDesc','','varchar(100)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
11,'1616P05SDA','1616P03CSA','DescItem','','varchar(1)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
12,'1616P060PA','1616P03CSA','Img1','','varchar(100)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
13,'1616P0623A','1616P03CSA','ImgDesc1','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
14,'1616P063EA','1616P03CSA','Img2','','varchar(100)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
15,'1616P064RA','1616P03CSA','ImgDesc2','','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
16,'1616P0662A','1616P03CSA','Img3','','varchar(100)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
17,'1616P067GA','1616P03CSA','ImgDesc3','','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
18,'1616P068TA','1616P03CSA','Img4','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
19,'1616P06A7A','1616P03CSA','ImgDesc4','','varchar(50)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
20,'1616P06BJA','1616P03CSA','Img5','','varchar(100)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
21,'1616P06CVA','1616P03CSA','ImgDesc5','','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
22,'1616P06E9A','1616P03CSA','Img6','','varchar(100)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
23,'1616P06FLA','1616P03CSA','ImgDesc6','','varchar(50)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
24,'1616P06GXA','1616P03CSA','WorkSignImg','','varchar(100)',0,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
25,'1616P06JBA','1616P03CSA','SiteSignImg','','varchar(100)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
26,'1616P06KNA','1616P03CSA','CreateTime','','timestamp',0,'CURRENT_TIMESTAMP',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
27,'1616P06M2A','1616P03CSA','CreateUser','','varchar(20)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
28,'1616P06NGA','1616P03CSA','LastUpdateTime','','timestamp',0,'CURRENT_TIMESTAMP',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
29,'1616P06PTA','1616P03CSA','LastUpdateUser','','varchar(20)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
30,'1616P06R4A','1616P03CSA','WorkEmp','','varchar(50)',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
31,'1616P06SJA','1616P03E3A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
32,'1616P06TYA','1616P03E3A','WorkOrderId','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
33,'1616P06VCA','1616P03E3A','InspectTime','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
34,'1616P06WPA','1616P03E3A','OutCase','','tinyint(1)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
35,'1616P06Y0A','1616P03E3A','PowerLine','','tinyint(1)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
36,'1616P06ZEA','1616P03E3A','Equipment','','tinyint(1)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
37,'1616P070RA','1616P03E3A','Shelter','','tinyint(1)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
38,'1616P0725A','1616P03E3A','Pollution','','tinyint(1)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
39,'1616P073GA','1616P03E3A','MetalWaterproof','','tinyint(1)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
40,'1616P074WA','1616P03E3A','MetalWhole','','tinyint(1)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
41,'1616P0767A','1616P03E3A','CementPVC','','tinyint(1)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
42,'1616P077MA','1616P03E3A','CementCase','','tinyint(1)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
43,'1616P078YA','1616P03E3A','CementIronCircle','','tinyint(1)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
44,'1616P07A6A','1616P03E3A','InspectNoted','','varchar(100)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
45,'1616P07BPA','1616P03E3A','CloseReasonDetailId','','varchar(45)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
46,'1616P07D0A','1616P03E3A','Img1','','varchar(100)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
47,'1616P07EBA','1616P03E3A','Img2','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
48,'1616P07FRA','1616P03E3A','Img3','','varchar(100)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
49,'1616P07H2A','1616P03E3A','Img4','','varchar(100)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
50,'1616P07JDA','1616P03E3A','StationNo','','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
51,'1616P07KTA','1616P03E3A','StartDate','','datetime',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
52,'1616P07M7A','1616P03E3A','EndDate','','datetime',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
53,'1616P07NJA','1616P03E3A','SuccessDate','','datetime',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
54,'1616P07PYA','1616P03FHA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
55,'1616P07R9A','1616P03FHA','WorkOrderId','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
56,'1616P07SLA','1616P03FHA','InstallTime','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
57,'1616P07U0A','1616P03FHA','InstallProject','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
58,'1616P07VBA','1616P03FHA','LocationId','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
59,'1616P07WRA','1616P03FHA','Address','','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
60,'1616P07Y5A','1616P03FHA','IMEI','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
61,'1616P07ZGA','1616P03FHA','SensorNo','','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
62,'1616P080WA','1616P03FHA','ManageUnit','','varchar(50)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
63,'1616P082AA','1616P03FHA','Lat','','decimal(10,6)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
64,'1616P083MA','1616P03FHA','Lon','','decimal(10,6)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
65,'1616P084YA','1616P03FHA','CloseReasonDetailId','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
66,'1616P0869A','1616P03FHA','Desc1','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
67,'1616P087SA','1616P03FHA','Desc2','','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
68,'1616P0890A','1616P03FHA','Desc3','','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
69,'1616P08AEA','1616P03FHA','Desc4','','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
70,'1616P08BRA','1616P03FHA','Desc5','','varchar(50)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
71,'1616P08D2A','1616P03FHA','Desc6','','varchar(50)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
72,'1616P08EGA','1616P03FHA','Desc7','','varchar(50)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
73,'1616P08FWA','1616P03FHA','Desc8','','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
74,'1616P08H7A','1616P03FHA','Desc9','','varchar(50)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
75,'1616P08JMA','1616P03FHA','Desc10','','varchar(50)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
76,'1616P08KYA','1616P03FHA','Desc11','','varchar(50)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
77,'1616P08M9A','1616P03FHA','Img1','','varchar(100)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
78,'1616P08NLA','1616P03FHA','Img2','','varchar(100)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
79,'1616P08PXA','1616P03FHA','Img3','','varchar(100)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
80,'1616P08RBA','1616P03FHA','Img4','','varchar(100)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
81,'1616P08SRA','1616P03FHA','Img5','','varchar(100)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
82,'1616P08U2A','1616P03FHA','Img6','','varchar(100)',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
83,'1616P08VGA','1616P03FHA','Img7','','varchar(100)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
84,'1616P08WTA','1616P03FHA','Img8','','varchar(100)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
85,'1616P08Y4A','1616P03FHA','Img9','','varchar(100)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
86,'1616P08ZJA','1616P03FHA','Img10','','varchar(100)',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
87,'1616P090VA','1616P03FHA','Img11','','varchar(100)',1,'',34,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
88,'1616P0929A','1616P03FHA','InstallRoad','安裝路段','varchar(50)',1,'',35,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
89,'1616P093LA','1616P03FHA','InstallCounty','安裝縣市','varchar(50)',1,'',36,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
90,'1616P094XA','1616P03FHA','SituationType','感測情境類型','varchar(50)',1,'',37,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
91,'1616P0968A','1616P03FHA','SituationName','感測情境名稱','varchar(50)',1,'',38,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
92,'1616P097KA','1616P03FHA','InstallArea','安裝鄉鎮區','varchar(50)',1,'',39,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
93,'1616P098ZA','1616P03FHA','InstallHigh','安裝高度','varchar(50)',1,'',40,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
94,'1616P09AAA','1616P03FHA','InstallLocation','裝設位置','varchar(50)',1,'',41,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
95,'1616P09BQA','1616P03FHA','MobileDevice','是否為移動式裝置','tinyint(1)',1,'',42,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
96,'1616P09D1A','1616P03FHA','RetrofitWindSpeed','有無加裝風速風向','tinyint(1)',1,'',43,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
97,'1616P09EFA','1616P03FHA','InstallLight','燈桿編號','varchar(50)',1,'',44,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
98,'1616P09FSA','1616P03FHA','Img12','','varchar(100)',1,'',45,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
99,'1616P09H3A','1616P03FHA','Img13','','varchar(100)',1,'',46,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
100,'1616P09JHA','1616P03FHA','Desc12','','varchar(50)',1,'',47,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
101,'1616P09KXA','1616P03FHA','Desc13','','varchar(50)',1,'',48,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
102,'1616P09MBA','1616P03FHA','ImgLat','','decimal(10,6)',1,'',49,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
103,'1616P09NRA','1616P03FHA','ImgLon','','decimal(10,6)',1,'',50,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
104,'1616P09Q2A','1616P03FHA','SuccessDate','','datetime',1,'',51,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
105,'1616P09RDA','1616P03GUA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
106,'1616P09STA','1616P03GUA','WorkOrderId','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
107,'1616P09U4A','1616P03GUA','SendTime','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
108,'1616P09VJA','1616P03GUA','Cause','','varchar(70)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
109,'1616P09WYA','1616P03GUA','Record','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
110,'1616P09Y9A','1616P03GUA','CloseTime','','datetime',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
111,'1616P09ZPA','1616P03GUA','CloseReasonDeatilId','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
112,'1616P0A10A','1616P03GUA','Img1','','varchar(100)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
113,'1616P0A2BA','1616P03GUA','Img2','','varchar(100)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
114,'1616P0A3RA','1616P03GUA','Img3','','varchar(100)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
115,'1616P0A52A','1616P03GUA','Img4','','varchar(100)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
116,'1616P0A6GA','1616P03GUA','IMEI','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
117,'1616P0A7WA','1616P03GUA','ChangeIMEI','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
118,'1616P0A9AA','1616P03GUA','Description','','varchar(100)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
119,'1616P0AAMA','1616P03GUA','Project1999','1999專案代號','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
120,'1616P0ABVA','1616P03GUA','Issue','','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
121,'1616P0AD9A','1616P03GUA','SuccessDate','','datetime',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
122,'1616P0AEPA','1616P03J5A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
123,'1616P0AG0A','1616P03J5A','WorkOrderId','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
124,'1616P0AHEA','1616P03J5A','VisuallyInspectTime','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
125,'1616P0AJRA','1616P03J5A','Exterior','','tinyint(1)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
126,'1616P0AL2A','1616P03J5A','ExteriorNoted','','varchar(100)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
127,'1616P0AMGA','1616P03J5A','Internal','','tinyint(1)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
128,'1616P0ANTA','1616P03J5A','InternalNoted','','varchar(100)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
129,'1616P0AQ7A','1616P03J5A','Around','','tinyint(1)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
130,'1616P0ARJA','1616P03J5A','AroundNoted','','varchar(100)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
131,'1616P0ASYA','1616P03J5A','Emission','','tinyint(1)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
132,'1616P0AUCA','1616P03J5A','EmissionNoted','','varchar(100)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
133,'1616P0AVPA','1616P03J5A','Sensor','','tinyint(1)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
134,'1616P0AX0A','1616P03J5A','SensorNoted','','varchar(100)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
135,'1616P0AYEA','1616P03J5A','MaintainLog','','tinyint(1)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
136,'1616P0AZRA','1616P03J5A','MaintainLogNoted','','varchar(100)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
137,'1616P0B12A','1616P03J5A','Img1','','varchar(100)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
138,'1616P0B2GA','1616P03J5A','Img2','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
139,'1616P0B3TA','1616P03J5A','Img3','','varchar(100)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
140,'1616P0B54A','1616P03J5A','Img4','','varchar(100)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
141,'1616P0B6FA','1616P03J5A','DetectorStationNo','','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
142,'1616P0B7SA','1616P03J5A','DetectorNo','','varchar(50)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
143,'1616P0B96A','1616P03J5A','IMGNo','','varchar(50)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
144,'1616P0BALA','1616P03J5A','StartDate','','datetime',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
145,'1616P0BBXA','1616P03J5A','EndDate','','datetime',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
146,'1616P0BD8A','1616P03J5A','WorkEmp','','varchar(50)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
147,'1616P0BENA','1616P03J5A','VerifyEmp','','varchar(50)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
148,'1616P0BG2A','1616P03J5A','UnitManager','','varchar(50)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
149,'1616P0BHGA','1616P03J5A','SuccessDate','','datetime',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
150,'1616P0BJTA','1616P03KGA','Id','','int(11)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
151,'1616P0BL4A','1616P03KGA','Name','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
152,'1616P0BMFA','1616P03KGA','Latitude','','decimal(10,6)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
153,'1616P0BNVA','1616P03KGA','Longitude','','decimal(10,6)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
154,'1616P0BQ6A','1616P03LWA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
155,'1616P0BRHA','1616P03LWA','RoleName','角色名稱','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
156,'1616P0BSUA','1616P03LWA','OutSource','','tinyint(1)',0,'0',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
157,'1616P0BU5A','1616P03LWA','Area_Id','','int(11)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
158,'1616P0BVGA','1616P03NAA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
159,'1616P0BWTA','1616P03NAA','AuthRoles_Id','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
160,'1616P0BY7A','1616P03NAA','Employee_EmpID','','varchar(20)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
161,'1616P0BZJA','1616P03PMA','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
162,'1616P0C0YA','1616P03PMA','WorkOrderId','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
163,'1616P0C29A','1616P03PMA','Address','','varchar(100)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
164,'1616P0C3LA','1616P03PMA','ElectricNo','','varchar(15)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
165,'1616P0C50A','1616P03PMA','ElectricMeterNo','','varchar(15)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
166,'1616P0C6BA','1616P03PMA','BillDate_Jan','','varchar(15)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
167,'1616P0C7RA','1616P03PMA','BillDate_Feb','','varchar(15)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
168,'1616P0C95A','1616P03PMA','BillDate_Mar','','varchar(15)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
169,'1616P0CAGA','1616P03PMA','BillDate_Apr','','varchar(15)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
170,'1616P0CBTA','1616P03PMA','BillDate_May','','varchar(15)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
171,'1616P0CD7A','1616P03PMA','BillDate_Jun','','varchar(15)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
172,'1616P0CEMA','1616P03PMA','BillDate_Jul','','varchar(15)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
173,'1616P0CG1A','1616P03PMA','BillDate_Aug','','varchar(15)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
174,'1616P0CHFA','1616P03PMA','BillDate_Sep','','varchar(15)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
175,'1616P0CJSA','1616P03PMA','BillDate_Oct','','varchar(15)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
176,'1616P0CL3A','1616P03PMA','BillDate_Nov','','varchar(15)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
177,'1616P0CMHA','1616P03PMA','BillDate_Dec','','varchar(15)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
178,'1616P0CNUA','1616P03PMA','AuditYear','','varchar(15)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
179,'1616P0CQ5A','1616P03QYA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
180,'1616P0CRKA','1616P03QYA','WorkCategory','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
181,'1616P0CSWA','1616P03QYA','Reason','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
182,'1616P0CUAA','1616P03S9A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
183,'1616P0CVQA','1616P03S9A','CloseDetail','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
184,'1616P0CWYA','1616P03S9A','CloseReason_Id','','varchar(50)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
185,'1616P0CYCA','1616P03S9A','WorkStatusMapping_Id','','int(11)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
186,'1616P0CZPA','1616P03S9A','PriceSet_Id','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
187,'1616P0D13A','1616P03S9A','Reboot','','tinyint(1)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
188,'1616P0D2EA','1616P03TLA','Id','GUID','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
189,'1616P0D3RA','1616P03TLA','ContractNo','合約編號','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
190,'1616P0D52A','1616P03TLA','ProjectNo','專案代碼','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
191,'1616P0D6GA','1616P03TLA','ProjectName','專案名稱','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
192,'1616P0D7TA','1616P03TLA','TaxID','統一編號','varchar(50)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
193,'1616P0D97A','1616P03TLA','CustomerName','客戶名稱','varchar(50)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
194,'1616P0DAMA','1616P03TLA','ContractStart','合約有效期-起','datetime',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
195,'1616P0DBYA','1616P03TLA','ContractEnd','合約有效期-迄','datetime',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
196,'1616P0DD9A','1616P03TLA','Address','公司地址','varchar(200)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
197,'1616P0DEPA','1616P03TLA','Phone','電話','varchar(20)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
198,'1616P0DG3A','1616P03TLA','Email','Email','varchar(50)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
199,'1616P0DHHA','1616P03TLA','ContactPerson','客戶聯絡人','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
200,'1616P0DJUA','1616P03TLA','Desc','描述','varchar(500)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
201,'1616P0DL8A','1616P03TLA','BusinessContactPerson','業務窗口','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
202,'1616P0DMKA','1616P03TLA','PDM','產品PDM','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
203,'1616P0DNWA','1616P03TLA','PJM','專案PJM','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
204,'1616P0DQ7A','1616P03TLA','Status','是否啟用','tinyint(1)',0,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
205,'1616P0DRMA','1616P03V0A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
206,'1616P0DT1A','1616P03V0A','Dept','部門','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
207,'1616P0DUCA','1616P03V0A','Team','組別','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
208,'1616P0DVLA','1616P03V0A','OriginSource','轉檔來的OldWeb,手動新增FHNet','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
209,'1616P0DX0A','1616P03WEA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
210,'1616P0DYEA','1616P03WEA','Code','代碼','varchar(2)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
211,'1616P0DZRA','1616P03WEA','Name','名稱','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
212,'1616P0E15A','1616P03XRA','Id','Id','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
213,'1616P0E2KA','1616P03XRA','Key','','varchar(100)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
214,'1616P0E3WA','1616P03XRA','Values','','varchar(1000)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
215,'1616P0E5AA','1616P03YZA','EmpID','','varchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
216,'1616P0E6MA','1616P03YZA','Name','員工姓名','varchar(20)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
217,'1616P0E81A','1616P03YZA','ENGName','員工英文名稱','varchar(30)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
218,'1616P0E9CA','1616P03YZA','Phone','聯絡電話','varchar(20)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
219,'1616P0EAPA','1616P03YZA','Email','電子信箱','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
220,'1616P0EC3A','1616P03YZA','Department_Id','','varchar(50)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
221,'1616P0EDEA','1616P03YZA','PWD','密碼','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
222,'1616P0EEUA','1616P03YZA','Origin','轉檔來的OldWeb,手動新增FHNet','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
223,'1616P0EG8A','1616P03YZA','PhoneToken','','varchar(100)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
224,'1616P0EHKA','1616P040DA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
225,'1616P0EJWA','1616P040DA','CityCode','城市代碼','varchar(100)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
226,'1616P0ELAA','1616P040DA','CityName','城市名稱','varchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
227,'1616P0EMQA','1616P040DA','AreaCode','郵遞區號','varchar(100)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
228,'1616P0EP1A','1616P040DA','AreaName','區域名稱(鄉鎮市區)','varchar(100)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
229,'1616P0EQCA','1616P041TA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
230,'1616P0ERPA','1616P041TA','EmployeeAreaId','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
231,'1616P0ET0A','1616P041TA','EmployeeId','','varchar(20)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
232,'1616P0EUEA','1616P0434A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
233,'1616P0EVUA','1616P0434A','WorkClassId','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
234,'1616P0EX8A','1616P0434A','EmployeeId','','varchar(20)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
235,'1616P0EYNA','1616P044FA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
236,'1616P0F02A','1616P044FA','AreaCode','區處碼','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
237,'1616P0F1DA','1616P044FA','BusinessAreaCode','營業區碼','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
238,'1616P0F2TA','1616P044FA','ZipCode','郵遞區號','varchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
239,'1616P0F44A','1616P044FA','Auditor','審核人員','varchar(10)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
240,'1616P0F5FA','1616P044FA','Director','主管人員','varchar(10)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
241,'1616P0F6VA','1616P045YA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
242,'1616P0F86A','1616P045YA','DcuNo','DcuNo','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
243,'1616P0F9HA','1616P045YA','CurrentStatus','目前狀態','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
244,'1616P0FAUA','1616P045YA','CreateDate','建立日期','datetime',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
245,'1616P0FC8A','1616P0479A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
246,'1616P0FDNA','1616P0479A','DistrictId','','varchar(45)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
247,'1616P0FEZA','1616P0479A','BusinessCode','營業區代碼','varchar(2)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
248,'1616P0FGAA','1616P0479A','DcuNo','DCU 編號','varchar(20)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
249,'1616P0FHQA','1616P0479A','ZipCode','郵遞區號','varchar(10)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
250,'1616P0FK1A','1616P0479A','DcuType','DCU型號','varchar(20)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
251,'1616P0FLFA','1616P0479A','IMEI','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
252,'1616P0FMSA','1616P0479A','InductionType','引電類型','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
253,'1616P0FP3A','1616P0479A','Address','用電地址','varchar(200)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
254,'1616P0FQHA','1616P0479A','Longitude','經度','decimal(10,6)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
255,'1616P0FRUA','1616P0479A','Latitude','緯度','decimal(10,6)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
256,'1616P0FT8A','1616P0479A','ModuleType','型號','varchar(15)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
257,'1616P0FUKA','1616P0479A','ChannelType','頻道組別','varchar(2)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
258,'1616P0FVWA','1616P0479A','WhiteList','白名單','tinyint(4)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
259,'1616P0FXAA','1616P0479A','LocationType','位置類型','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
260,'1616P0FYMA','1616P0479A','Floor','樓層','int(11)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
261,'1616P0FZYA','1616P0479A','ConnectionMethod','連線方式','varchar(50)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
262,'1616P0G19A','1616P0479A','SignUp','註冊','tinyint(4)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
263,'1616P0G2LA','1616P0479A','Connect','連線','tinyint(4)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
264,'1616P0G40A','1616P0479A','LastOnlineTime','最後上線時間','datetime',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
265,'1616P0G5BA','1616P0479A','IP','IP','varchar(15)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
266,'1616P0G6RA','1616P0479A','CellID','Cell ID','varchar(20)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
267,'1616P0G82A','1616P0479A','SignalStrength','訊號強度','int(11)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
268,'1616P0G9DA','1616P0479A','DialInformation','撥接資訊','varchar(20)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
269,'1616P0GAQA','1616P0479A','SignalDate','訊號強度時間','datetime',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
270,'1616P0GC4A','1616P0479A','OnlineTimeOn3Day','過去3天上線時數','int(2)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
271,'1616P0GDJA','1616P0479A','Remarks','備註','varchar(100)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
272,'1616P0GEVA','1616P0479A','Remark2','備註二','varchar(100)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
273,'1616P0GG9A','1616P0479A','Status','狀態','int(11)',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
274,'1616P0GHLA','1616P0479A','MeterNumber','電表數','int(11)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
275,'1616P0GK0A','1616P0479A','MeterRegistration','電表註冊','int(11)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
276,'1616P0GLBA','1616P0479A','MeterConnection','電表連線','int(11)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
277,'1616P0GMNA','1616P0479A','MeterReading','電表讀表','int(11)',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
278,'1616P0GP2A','1616P0479A','AMIContractNo','AMI契約編號','varchar(50)',1,'',34,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
279,'1616P0GQDA','1616P0479A','ModuleNo','','varchar(50)',1,'',35,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
280,'1616P0GRQA','1616P0479A','ModuleIMSI','模組IMSI','varchar(50)',1,'',36,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
281,'1616P0GT4A','1616P0479A','CellIDConvert','CellID (換算)','varchar(20)',1,'',37,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
282,'1616P0GUJA','1616P0479A','LastRegistrationTime','最後註冊時間','datetime',1,'',38,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
283,'1616P0GVVA','1616P0479A','OnlineTimeOn3DayRetrunCount','','int(11)',1,'',39,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
284,'1616P0GX6A','1616P0479A','Event7Day','7日事件數','int(11)',1,'',40,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
285,'1616P0GYLA','1616P0479A','FirmwareVersion','韌體版本','varchar(50)',1,'',41,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
286,'1616P0GZXA','1616P048PA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
287,'1616P0H18A','1616P048PA','DcuNo','DCU編號','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
288,'1616P0H2NA','1616P048PA','SurveyDate','會勘日期','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
289,'1616P0H3ZA','1616P048PA','ImgNo','圖面座標','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
290,'1616P0H5DA','1616P048PA','Latitude','緯度','decimal(10,6)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
291,'1616P0H6TA','1616P048PA','Longitude','經度','decimal(10,6)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
292,'1616P0H84A','1616P048PA','DistrictCode','台電區處代碼','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
293,'1616P0H9JA','1616P048PA','BusinessCode','台電營業區代碼','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
294,'1616P0HAVA','1616P048PA','Floor','??','int(11)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
295,'1616P0HC9A','1616P048PA','LocationType','位置類型','varchar(50)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
296,'1616P0HDLA','1616P048PA','ConnectionMethod','連線方式','varchar(50)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
297,'1616P0HEXA','1616P048PA','InductionType','引電類型','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
298,'1616P0HGBA','1616P048PA','Remark','備註','varchar(150)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
299,'1616P0HHNA','1616P048PA','ConnectionOperator','連線業者','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
300,'1616P0HJZA','1616P048PA','SignalStrength','訊號強度','int(11)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
301,'1616P0HMTA','1616P048PA','ElectricNo1','測試點-1電號','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
302,'1616P0HP4A','1616P048PA','MacCode1','測試點-1 MAC碼','varchar(50)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
303,'1616P0HQMA','1616P048PA','Latitude1','測試點-1 緯度','decimal(10,6)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
304,'1616P0HRYA','1616P048PA','Longitude1','測試點-1 經度','decimal(10,6)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
305,'1616P0HTFA','1616P048PA','ElectricNo2','測試點-2電號','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
306,'1616P0HUVA','1616P048PA','MacCode2','測試點-2 MAC碼','varchar(50)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
307,'1616P0HW6A','1616P048PA','Latitude2','測試點-2 緯度','decimal(10,6)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
308,'1616P0HXHA','1616P048PA','Longitude2','測試點-2 經度','decimal(10,6)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
309,'1616P0HYXA','1616P048PA','ElectricNo3','測試點-3電號','varchar(50)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
310,'1616P0J08A','1616P048PA','MacCode3','測試點-3 MAC碼','varchar(50)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
311,'1616P0J1NA','1616P048PA','Latitude3','測試點-3 緯度','decimal(10,6)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
312,'1616P0J32A','1616P048PA','Longitude3','測試點-3 經度','decimal(10,6)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
313,'1616P0J4DA','1616P048PA','ElectricNo4','測試點-4電號','varchar(50)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
314,'1616P0J5QA','1616P048PA','MacCode4','測試點-4 MAC碼','varchar(50)',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
315,'1616P0J74A','1616P048PA','Latitude4','測試點-4 緯度','decimal(10,6)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
316,'1616P0J8FA','1616P048PA','Longitude4','測試點-4 經度','decimal(10,6)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
317,'1616P0J9SA','1616P048PA','ElectricNo5','測試點-5電號','varchar(50)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
318,'1616P0JB6A','1616P048PA','MacCode5','測試點-5 MAC碼','varchar(50)',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
319,'1616P0JCLA','1616P048PA','Latitude5','測試點-5 緯度','decimal(10,6)',1,'',34,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
320,'1616P0JDXA','1616P048PA','Longitude5','測試點-5 經度','decimal(10,6)',1,'',35,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
321,'1616P0JF8A','1616P048PA','ElectricNo6','測試點-6電號','varchar(50)',1,'',36,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
322,'1616P0JGNA','1616P048PA','MacCode6','測試點-6 MAC碼','varchar(50)',1,'',37,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
323,'1616P0JHZA','1616P048PA','Latitude6','測試點-6 緯度','decimal(10,6)',1,'',38,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
324,'1616P0JKDA','1616P048PA','Longitude6','測試點-6 經度','decimal(10,6)',1,'',39,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
325,'1616P0JLQA','1616P048PA','WorkNo','工單號碼','varchar(50)',1,'',40,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
326,'1616P0JN1A','1616P048PA','WorkStatus','工作狀態','int(11)',1,'',41,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
327,'1616P0JPFA','1616P048PA','WorkEmp','工程人員','varchar(50)',1,'',42,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
328,'1616P0JQVA','1616P048PA','VerifyEmp','審核人員','varchar(50)',1,'',43,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
329,'1616P0JS6A','1616P048PA','UnitManager','主管單位','varchar(50)',1,'',44,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
330,'1616P0JTLA','1616P048PA','City','縣市','varchar(50)',1,'',45,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
331,'1616P0JV0A','1616P048PA','Area','區域','varchar(50)',1,'',46,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
332,'1616P0JWEA','1616P048PA','ZipCode','郵遞區號','varchar(50)',1,'',47,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
333,'1616P0JXRA','1616P048PA','EmployeeAreaId','','varchar(50)',1,'',48,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
334,'1616P0JZ2A','1616P048PA','WorkCategoryId','','varchar(50)',1,'',49,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
335,'1616P0K0DA','1616P048PA','CreateDate','','datetime',1,'',50,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
336,'1616P0K1TA','1616P048PA','Img1','','varchar(100)',1,'',51,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
337,'1616P0K34A','1616P048PA','Img2','','varchar(100)',1,'',52,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
338,'1616P0K4FA','1616P048PA','Img3','','varchar(100)',1,'',53,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
339,'1616P0K5SA','1616P048PA','Img4','','varchar(100)',1,'',54,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
340,'1616P0K76A','1616P048PA','Img5','','varchar(100)',1,'',55,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
341,'1616P0K8LA','1616P048PA','Img6','','varchar(100)',1,'',56,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
342,'1616P0K9XA','1616P048PA','Img7','','varchar(100)',1,'',57,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
343,'1616P0KB8A','1616P048PA','Img8','','varchar(100)',1,'',58,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
344,'1616P0KCKA','1616P048PA','Img9','','varchar(100)',1,'',59,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
345,'1616P0KDWA','1616P048PA','Img10','','varchar(100)',1,'',60,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
346,'1616P0KFAA','1616P048PA','RelatedId','','varchar(100)',1,'',61,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
347,'1616P0KGMA','1616P048PA','Resistance','','tinyint(1)',1,'',62,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
348,'1616P0KHYA','1616P048PA','ElectricNo7','','varchar(50)',1,'',63,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
349,'1616P0KKCA','1616P048PA','MacCode7','','varchar(50)',1,'',64,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
350,'1616P0KLPA','1616P048PA','Latitude7','','decimal(10,6)',1,'',65,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
351,'1616P0KN3A','1616P048PA','Longitude7','','decimal(10,6)',1,'',66,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
352,'1616P0KPEA','1616P048PA','ElectricNo8','','varchar(50)',1,'',67,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
353,'1616P0KQUA','1616P048PA','MacCode8','','varchar(50)',1,'',68,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
354,'1616P0KS5A','1616P048PA','Latitude8','','decimal(10,6)',1,'',69,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
355,'1616P0KTKA','1616P048PA','Longitude8','','decimal(10,6)',1,'',70,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
356,'1616P0KUZA','1616P048PA','Img11','','varchar(100)',1,'',71,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
357,'1616P0KWAA','1616P048PA','Img12','','varchar(100)',1,'',72,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
358,'1616P0KXQA','1616P048PA','UploadSpeed','','decimal(10,3)',1,'',73,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
359,'1616P0KZ1A','1616P048PA','FETNetSignalStrength','','int(11)',1,'',74,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
360,'1616P0L0FA','1616P048PA','FETNetUploadSpeed','','decimal(10,3)',1,'',75,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
361,'1616P0L1SA','1616P048PA','Img13','','varchar(100)',1,'',76,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
362,'1616P0L33A','1616P048PA','Img14','','varchar(100)',1,'',77,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
363,'1616P0L4HA','1616P048PA','Img15','','varchar(100)',1,'',78,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
364,'1616P0L5UA','1616P048PA','AuditorEmp','','varchar(50)',1,'',79,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
365,'1616P0L78A','1616P04A0A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
366,'1616P0L8KA','1616P04A0A','ElectricNo','電號','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
367,'1616P0L9WA','1616P04A0A','ElectricMeterNo','表號','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
368,'1616P0LBAA','1616P04A0A','CurrentStatus','目前狀態','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
369,'1616P0LCMA','1616P04A0A','CreateDate','建立日期','datetime',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
370,'1616P0LDYA','1616P04BBA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
371,'1616P0LFCA','1616P04BBA','DistrictId','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
372,'1616P0LGPA','1616P04BBA','BusinessCode','營業區代碼','varchar(2)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
373,'1616P0LJ3A','1616P04BBA','ElectricNo','電號','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
374,'1616P0LKEA','1616P04BBA','ElectricMeterNo','表號','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
375,'1616P0LLUA','1616P04BBA','ElectricType','表型','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
376,'1616P0LN5A','1616P04BBA','ElectricMeterType','類別','varchar(20)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
377,'1616P0LPKA','1616P04BBA','Address','地址','varchar(200)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
378,'1616P0LQWA','1616P04BBA','ZipCode','郵遞區號','varchar(10)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
379,'1616P0LSAA','1616P04BBA','Latitude','緯度','decimal(10,6)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
380,'1616P0LTMA','1616P04BBA','Longitude','經度','decimal(10,6)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
381,'1616P0LV1A','1616P04BBA','LocationType','位置類型','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
382,'1616P0LWCA','1616P04BBA','Floor','樓層','int(11)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
383,'1616P0LXPA','1616P04BBA','ModuleType','模組類型','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
384,'1616P0LZ0A','1616P04BBA','ConnectionMethod','通訊技術','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
385,'1616P0M0BA','1616P04BBA','ModuleNo','模組序號','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
386,'1616P0M1RA','1616P04BBA','ModuleIMSI','FAN IMSI','varchar(50)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
387,'1616P0M35A','1616P04BBA','ModuleIMEI','FAN MAC/IMEI','varchar(50)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
388,'1616P0M4GA','1616P04BBA','FirmwareVersion','FAN韌體版本','varchar(50)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
389,'1616P0M5TA','1616P04BBA','DcuNo','DCU編號','varchar(20)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
390,'1616P0M77A','1616P04BBA','DcuNumber','DCU序號','varchar(20)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
391,'1616P0M8JA','1616P04BBA','SignUp','註冊','tinyint(4)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
392,'1616P0M9YA','1616P04BBA','Connect','連線','tinyint(4)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
393,'1616P0MBCA','1616P04BBA','OnlineDcuNo','上線DCU序號','varchar(20)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
394,'1616P0MCPA','1616P04BBA','LastOnlineDateTime','最後上線時間','datetime',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
395,'1616P0ME3A','1616P04BBA','MeterLP','最後LP時間','datetime',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
396,'1616P0MFEA','1616P04BBA','LastLPIndex','最後LP index','varchar(20)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
397,'1616P0MGRA','1616P04BBA','LPkWh','最後LP kWh','varchar(50)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
398,'1616P0MJ5A','1616P04BBA','MeterATL','最後ALT時間','datetime',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
399,'1616P0MKKA','1616P04BBA','MeterMN','最後MN時間','datetime',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
400,'1616P0MLZA','1616P04BBA','LastMNIndex','最後MN index','varchar(50)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
401,'1616P0MNAA','1616P04BBA','LastMNkWh','最後MN kWh','varchar(50)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
402,'1616P0MPQA','1616P04BBA','LastDRRDatetime','最後DRR時間','datetime',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
403,'1616P0MR1A','1616P04BBA','Event7Day','7日事件數','int(11)',1,'',34,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
404,'1616P0MSFA','1616P04BBA','KeyUpdateDateTime','金鑰更新時間','datetime',1,'',35,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
405,'1616P0MTSA','1616P04BBA','IP','IP','varchar(15)',1,'',36,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
406,'1616P0MV6A','1616P04BBA','CellID','Cell ID','varchar(20)',1,'',37,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
407,'1616P0MWHA','1616P04BBA','CellIDConvert','CellID (換算)','varchar(20)',1,'',38,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
408,'1616P0MXXA','1616P04BBA','SignalStrength','訊號強度','int(11)',1,'',39,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
409,'1616P0MZ8A','1616P04BBA','SignalDate','訊號強度時間','datetime',1,'',40,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
410,'1616P0N0NA','1616P04BBA','PT','PT','int(11)',1,'',41,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
411,'1616P0N1ZA','1616P04BBA','CT','CT','int(11)',1,'',42,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
412,'1616P0N3DA','1616P04BBA','TOUID','TOU ID','int(11)',1,'',43,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
413,'1616P0N4QA','1616P04BBA','MeterFirmwareVersion','電表韌體版本','varchar(50)',1,'',44,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
414,'1616P0N64A','1616P04BBA','OnlineTimeOn3Day','過去3天上線時數','int(2)',1,'',45,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
415,'1616P0N7FA','1616P04BBA','OnlineTimeOn3DayRetrunCount','','int(11)',1,'',46,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
416,'1616P0N8SA','1616P04BBA','Status','狀態','int(11)',1,'',47,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
417,'1616P0NA6A','1616P04BBA','Remarks','備註','varchar(100)',1,'',48,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
418,'1616P0NBLA','1616P04BBA','Remarks2','備註二','varchar(100)',1,'',49,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
419,'1616P0ND0A','1616P04BBA','InstallDateTime','安裝時間','datetime',1,'',50,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
420,'1616P0NEBA','1616P04BBA','InstallMeter','安裝抄表','int(11)',1,'',51,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
421,'1616P0NFRA','1616P04BBA','AMIContractNo','AMI契約編號','varchar(50)',1,'',52,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
422,'1616P0NH2A','1616P04BBA','ElectricContract','用電契約','varchar(50)',1,'',53,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
423,'1616P0NJGA','1616P04BBA','LastRegistrationTime','最後註冊時間','datetime',1,'',54,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
424,'1616P0NKWA','1616P04BBA','MeterDDR','讀表DRR','datetime',1,'',55,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
425,'1616P0NM7A','1616P04CRA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
426,'1616P0NNJA','1616P04CRA','ElectricNo','電號','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
427,'1616P0NPVA','1616P04CRA','UserName','用戶名稱','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
428,'1616P0NR9A','1616P04CRA','ElectricZipCode','用電郵遞區號','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
429,'1616P0NSLA','1616P04CRA','ElectricAddress','用電地址','varchar(150)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
430,'1616P0NU0A','1616P04CRA','ModuleNo','模組型號','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
431,'1616P0NVEA','1616P04CRA','DcuNo','DCU編號','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
432,'1616P0NWRA','1616P04CRA','SignalStrength','訊號強度','int(11)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
433,'1616P0NY5A','1616P04CRA','UploadSpeed','上傳速度','decimal(10,3)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
434,'1616P0NZGA','1616P04CRA','Latitude','緯度','decimal(10,6)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
435,'1616P0P0WA','1616P04CRA','Longitude','經度','decimal(10,6)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
436,'1616P0P2AA','1616P04CRA','SurveyDate','會勘日期','datetime',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
437,'1616P0P3MA','1616P04CRA','MeterFloor','電表樓層','int(11)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
438,'1616P0P4YA','1616P04CRA','LocationType','位置類型','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
439,'1616P0P6CA','1616P04CRA','Remark','備註','varchar(150)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
440,'1616P0P7SA','1616P04CRA','WorkNo','工單號碼','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
441,'1616P0P93A','1616P04CRA','WorkStatus','工作狀態','int(11)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
442,'1616P0PAEA','1616P04CRA','WorkEmp','工程人員','varchar(50)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
443,'1616P0PBRA','1616P04CRA','VerifyEmp','審核人員','varchar(50)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
444,'1616P0PD5A','1616P04CRA','UnitManager','主管單位','varchar(50)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
445,'1616P0PEKA','1616P04CRA','City','??','varchar(50)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
446,'1616P0PFWA','1616P04CRA','Area','??','varchar(50)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
447,'1616P0PHAA','1616P04CRA','EmployeeAreaId','','varchar(50)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
448,'1616P0PJQA','1616P04CRA','WorkCategoryId','','varchar(50)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
449,'1616P0PL1A','1616P04CRA','CreateDate','','datetime',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
450,'1616P0PMFA','1616P04CRA','DistrictCode','','varchar(50)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
451,'1616P0PNSA','1616P04CRA','Img1','','varchar(100)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
452,'1616P0PQ3A','1616P04CRA','Img2','','varchar(100)',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
453,'1616P0PRHA','1616P04CRA','Img3','','varchar(100)',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
454,'1616P0PSUA','1616P04CRA','Img4','','varchar(100)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
455,'1616P0PU8A','1616P04CRA','Img5','','varchar(100)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
456,'1616P0PVKA','1616P04CRA','Img6','','varchar(100)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
457,'1616P0PWZA','1616P04CRA','RelatedId','','varchar(100)',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
458,'1616P0PYDA','1616P04CRA','Resistance','','tinyint(1)',1,'',34,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
459,'1616P0PZTA','1616P04CRA','ConnectionOperator','連線業者','varchar(50)',1,'',35,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
460,'1616P0Q14A','1616P04CRA','AmmeterCategory','電表類別','varchar(50)',1,'',36,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
461,'1616P0Q2FA','1616P04CRA','CommunityName','社區大樓名稱','varchar(50)',1,'',37,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
462,'1616P0Q3VA','1616P04CRA','ImprovedSignal','需改善訊號','tinyint(1)',0,'',38,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
463,'1616P0Q5CA','1616P04CRA','FETNetSignalStrength','','int(11)',1,'',39,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
464,'1616P0Q6SA','1616P04CRA','Img7','','varchar(100)',1,'',40,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
465,'1616P0Q83A','1616P04CRA','AuditorEmp','','varchar(50)',1,'',41,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
466,'1616P0Q9HA','1616P04E2A','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
467,'1616P0QAUA','1616P04E2A','DateTime','發生時間','datetime',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
468,'1616P0QC5A','1616P04E2A','EmployeeId','登入帳號','varchar(45)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
469,'1616P0QDGA','1616P04E2A','Environment','環境 (Web、App)','varchar(45)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
470,'1616P0QETA','1616P04E2A','ExceptionPath','例外發生位置','varchar(45)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
471,'1616P0QG4A','1616P04E2A','ExceptionMessageJson','例外訊息Json','varchar(1000)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
472,'1616P0QHJA','1616P04FAA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
473,'1616P0QJVA','1616P04FAA','IMGNo','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
474,'1616P0QL9A','1616P04FAA','StationNo','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
475,'1616P0QMLA','1616P04FAA','PhoneNo','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
476,'1616P0QP0A','1616P04FAA','Latitude','','decimal(10,6)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
477,'1616P0QQBA','1616P04FAA','Longitude','','decimal(10,6)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
478,'1616P0QRRA','1616P04FAA','PoleNo','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
479,'1616P0QT2A','1616P04FAA','City','','int(11)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
480,'1616P0QUDA','1616P04FAA','ZipCode','','varchar(10)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
481,'1616P0QVQA','1616P04FAA','IMEI','','varchar(50)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
482,'1616P0QX1A','1616P04FAA','Address','','varchar(100)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
483,'1616P0QYFA','1616P04FAA','Town','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
484,'1616P0QZSA','1616P04FAA','Vill','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
485,'1616P0R13A','1616P04GQA','LoginId','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
486,'1616P0R2EA','1616P04GQA','EmpId','','varchar(20)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
487,'1616P0R3UA','1616P04GQA','LoginDate','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
488,'1616P0R55A','1616P04GQA','LoginOutDate','','datetime',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
489,'1616P0R6GA','1616P04GQA','LoginType','','varchar(45)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
490,'1616P0R7TA','1616P04J4A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
491,'1616P0R94A','1616P04J4A','OrderId','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
492,'1616P0RAJA','1616P04J4A','ImgSrc','','varchar(100)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
493,'1616P0RBYA','1616P04KFA','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
494,'1616P0RD9A','1616P04KFA','WorkOrderId','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
495,'1616P0RELA','1616P04KFA','DCUSerialNo','DCU序號','varchar(20)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
496,'1616P0RFXA','1616P04KFA','InstallDate','','varchar(16)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
497,'1616P0RHBA','1616P04KFA','InstallTime','','varchar(16)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
498,'1616P0RJNA','1616P04KFA','Floor','','int(11)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
499,'1616P0RL2A','1616P04KFA','LocationType','','varchar(10)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
500,'1616P0RMDA','1616P04KFA','ConnectionType','連線方式','varchar(10)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
501,'1616P0RNQA','1616P04KFA','DCUPowerSource','DCU引電類型','varchar(10)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
502,'1616P0RQ1A','1616P04KFA','Desc','','varchar(100)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
503,'1616P0RRCA','1616P04KFA','CloseReasonDetailId','','varchar(50)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
504,'1616P0RSPA','1616P04KFA','CloseReason_Id','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
505,'1616P0RU0A','1616P04KFA','Img1','','varchar(100)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
506,'1616P0RVEA','1616P04KFA','Img2','','varchar(100)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
507,'1616P0RWRA','1616P04KFA','Img3','','varchar(100)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
508,'1616P0RY5A','1616P04KFA','Img4','','varchar(100)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
509,'1616P0RZKA','1616P04KFA','Img5','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
510,'1616P0S0WA','1616P04LVA','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
511,'1616P0S2AA','1616P04LVA','WorkOrderId','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
512,'1616P0S3MA','1616P04LVA','IMEI_MAC','','varchar(16)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
513,'1616P0S51A','1616P04LVA','Lat','','decimal(10,6)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
514,'1616P0S6FA','1616P04LVA','Lon','','decimal(10,6)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
515,'1616P0S7SA','1616P04LVA','InstallDate','','varchar(16)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
516,'1616P0S93A','1616P04LVA','InstallTime','','varchar(16)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
517,'1616P0SAHA','1616P04LVA','Degree','','int(11)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
518,'1616P0SBXA','1616P04LVA','Floor','','int(11)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
519,'1616P0SD8A','1616P04LVA','LocationType','','varchar(10)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
520,'1616P0SENA','1616P04LVA','Desc','','varchar(50)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
521,'1616P0SFZA','1616P04LVA','CloseReasonDetailId','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
522,'1616P0SHDA','1616P04LVA','CloseReason_Id','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
523,'1616P0SJTA','1616P04LVA','OldSealNo1','','varchar(16)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
524,'1616P0SL7A','1616P04LVA','OldSealNo2','','varchar(16)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
525,'1616P0SMJA','1616P04LVA','OldSealNo3','','varchar(16)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
526,'1616P0SNVA','1616P04LVA','NewSealNo1','','varchar(16)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
527,'1616P0SQ6A','1616P04LVA','NewSealNo2','','varchar(16)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
528,'1616P0SRHA','1616P04LVA','NewSealNo3','','varchar(16)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
529,'1616P0SSXA','1616P04LVA','Img1','','varchar(100)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
530,'1616P0SUBA','1616P04LVA','Img2','','varchar(100)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
531,'1616P0SVNA','1616P04LVA','Img3','','varchar(100)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
532,'1616P0SX2A','1616P04LVA','Img4','','varchar(100)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
533,'1616P0SYDA','1616P04LVA','Img5','','varchar(100)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
534,'1616P0SZQA','1616P04LVA','Img6','','varchar(100)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
535,'1616P0T11A','1616P04N6A','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
536,'1616P0T2FA','1616P04N6A','WorkOrderId','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
537,'1616P0T3SA','1616P04N6A','DCUSerialNo','DCU序號','varchar(20)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
538,'1616P0T56A','1616P04N6A','Floor','','int(11)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
539,'1616P0T6HA','1616P04N6A','LocationType','','varchar(10)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
540,'1616P0T7XA','1616P04N6A','ConnectionType','連線方式','varchar(10)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
541,'1616P0T98A','1616P04N6A','DCUPowerSource','DCU引電類型','varchar(10)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
542,'1616P0TAKA','1616P04N6A','Desc','','varchar(100)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
543,'1616P0TBWA','1616P04N6A','ObstacleStatus','障礙狀態','varchar(50)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
544,'1616P0TDAA','1616P04N6A','CloseReasonDetailId','','varchar(50)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
545,'1616P0TEMA','1616P04N6A','CloseReason_Id','','varchar(50)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
546,'1616P0TG1A','1616P04N6A','SendTime','','datetime',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
547,'1616P0THCA','1616P04N6A','CloseTime','','datetime',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
548,'1616P0TJPA','1616P04N6A','Img1','','varchar(100)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
549,'1616P0TL3A','1616P04N6A','Img2','','varchar(100)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
550,'1616P0TMEA','1616P04N6A','Img3','','varchar(100)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
551,'1616P0TNUA','1616P04N6A','Img4','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
552,'1616P0TQ5A','1616P04N6A','FETNetSignalStrength','','int(11)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
553,'1616P0TRKA','1616P04N6A','SignalStrength','訊號強度','int(11)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
554,'1616P0TSWA','1616P04PLA','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
555,'1616P0TU7A','1616P04PLA','WorkOrderId','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
556,'1616P0TVMA','1616P04PLA','IMEI_MAC','','varchar(16)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
557,'1616P0TX1A','1616P04PLA','ElectricMeterType','','varchar(15)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
558,'1616P0TY9A','1616P04PLA','Floor','','int(11)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
559,'1616P0TZLA','1616P04PLA','LocationType','','varchar(10)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
560,'1616P0U10A','1616P04PLA','Desc','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
561,'1616P0U2EA','1616P04PLA','CloseReasonDetailId','','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
562,'1616P0U3RA','1616P04PLA','CloseReason_Id','','varchar(50)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
563,'1616P0U55A','1616P04PLA','OldSealNo1','','varchar(16)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
564,'1616P0U6KA','1616P04PLA','OldSealNo2','','varchar(16)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
565,'1616P0U7WA','1616P04PLA','OldSealNo3','','varchar(16)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
566,'1616P0U9AA','1616P04PLA','NewSealNo1','','varchar(16)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
567,'1616P0UAMA','1616P04PLA','NewSealNo2','','varchar(16)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
568,'1616P0UC1A','1616P04PLA','NewSealNo3','','varchar(16)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
569,'1616P0UD9A','1616P04PLA','Img1','','varchar(100)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
570,'1616P0UELA','1616P04PLA','Img2','','varchar(100)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
571,'1616P0UG0A','1616P04PLA','Img3','','varchar(100)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
572,'1616P0UHBA','1616P04PLA','Img4','','varchar(100)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
573,'1616P0UJRA','1616P04PLA','BillDate_Recently','','varchar(16)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
574,'1616P0UL2A','1616P04PLA','SendTime','','datetime',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
575,'1616P0UMGA','1616P04PLA','CloseTime','','datetime',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
576,'1616P0UNTA','1616P04PLA','FETNetSignalStrength','','int(11)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
577,'1616P0UQ7A','1616P04PLA','SignalStrength','訊號強度','int(11)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
578,'1616P0URJA','1616P04QXA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
579,'1616P0USYA','1616P04QXA','PriceItem','','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
580,'1616P0UU9A','1616P04S8A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
581,'1616P0UVLA','1616P04S8A','MasterID','','varchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
582,'1616P0UWXA','1616P04S8A','City','','int(11)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
583,'1616P0UYBA','1616P04S8A','PriceAmount','','int(11)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
584,'1616P0UZNA','1616P04TNA','EmpID','','varchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
585,'1616P0V12A','1616P04TNA','ScreeningDate','','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
586,'1616P0V2DA','1616P04TNA','ScreeningResult','','varchar(1)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
587,'1616P0V3QA','1616P04TNA','UploadImage1','','varchar(100)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
588,'1616P0V51A','1616P04TNA','UploadImage2','','varchar(100)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
589,'1616P0V6FA','1616P04TNA','UploadImage3','','varchar(100)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
590,'1616P0V7SA','1616P04TNA','Remark','','varchar(150)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
591,'1616P0V96A','1616P04TNA','CreateTime','','datetime',1,'CURRENT_TIMESTAMP',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
592,'1616P0VALA','1616P04V2A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
593,'1616P0VBXA','1616P04V2A','Status','','tinyint(1)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
594,'1616P0VDBA','1616P04V2A','LastUpload','','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
595,'1616P0VENA','1616P04V2A','PowerCategory','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
596,'1616P0VFZA','1616P04V2A','IMEI','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
597,'1616P0VHAA','1616P04V2A','IMEIUpload','','datetime',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
598,'1616P0VJQA','1616P04V2A','PM10','','decimal(10,0)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
599,'1616P0VL1A','1616P04V2A','PM25','','decimal(10,0)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
600,'1616P0VMFA','1616P04V2A','VOC','','int(11)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
601,'1616P0VNSA','1616P04V2A','Temperature','','decimal(10,0)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
602,'1616P0VQ3A','1616P04V2A','Rh','','decimal(10,0)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
603,'1616P0VRHA','1616P04V2A','RSSI','','tinyint(4)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
604,'1616P0VSUA','1616P04V2A','Voltage1','','int(11)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
605,'1616P0VU8A','1616P04V2A','Voltage2','','int(11)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
606,'1616P0VVKA','1616P04V2A','Current1','','int(11)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
607,'1616P0VWZA','1616P04V2A','Current2','','int(11)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
608,'1616P0VYAA','1616P04V2A','Noted','','varchar(200)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
609,'1616P0VZQA','1616P04V2A','InspectPeriod','巡檢週期','int(11)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
610,'1616P0W11A','1616P04V2A','DisableFlag','是否停用','tinyint(1)',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
611,'1616P0W2CA','1616P04V2A','Location_Id','','varchar(50)',0,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
612,'1616P0W3SA','1616P04WDA','ID','','int(11)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
613,'1616P0W53A','1616P04WDA','Testcol','','float(10,6)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
614,'1616P0W6EA','1616P04XTA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
615,'1616P0W7RA','1616P04XTA','Category','','varchar(20)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
616,'1616P0W95A','1616P04XTA','Class','','varchar(20)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
617,'1616P0WAGA','1616P04Z4A','Id','guid','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
618,'1616P0WBTA','1616P04Z4A','Reason','原因','varchar(100)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
619,'1616P0WD7A','1616P04Z4A','Definition','定義','varchar(100)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
620,'1616P0WEMA','1616P050FA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
621,'1616P0WFYA','1616P050FA','WorkNo','','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
622,'1616P0WH9A','1616P050FA','Address','','varchar(100)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
623,'1616P0WJPA','1616P050FA','Latitude','','decimal(10,6)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
624,'1616P0WL0A','1616P050FA','Longitude','','decimal(10,6)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
625,'1616P0WMEA','1616P050FA','WorkEmp','','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
626,'1616P0WNRA','1616P050FA','VerifyEmp','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
627,'1616P0WQ2A','1616P050FA','CheckEmp','','varchar(50)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
628,'1616P0WRGA','1616P050FA','UnitManager','','varchar(50)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
629,'1616P0WSTA','1616P050FA','Noted','','varchar(50)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
630,'1616P0WU7A','1616P050FA','WorkClass_Id','','varchar(50)',0,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
631,'1616P0WVJA','1616P050FA','PriceSet_Id','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
632,'1616P0WWYA','1616P050FA','WorkStatusMapping_Id','','int(11)',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
633,'1616P0WYCA','1616P050FA','CreateDate','','datetime',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
634,'1616P0WZPA','1616P050FA','Location_Id','','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
635,'1616P0X13A','1616P050FA','IMEI','當下設備IMEI','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
636,'1616P0X2EA','1616P050FA','WorkDispatch_Id','','varchar(50)',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
637,'1616P0X3UA','1616P050FA','City','','int(11)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
638,'1616P0X55A','1616P051VA','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
639,'1616P0X6GA','1616P051VA','WorkNo','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
640,'1616P0X7WA','1616P051VA','DCUNo','DCU編號','varchar(20)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
641,'1616P0X9AA','1616P051VA','DCUType','DCU型號','varchar(20)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
642,'1616P0XAMA','1616P051VA','DCUSerialNo','','varchar(20)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
643,'1616P0XBYA','1616P051VA','ChannelType','頻道組別','varchar(2)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
644,'1616P0XD9A','1616P051VA','IMGNo','圖號座標','varchar(11)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
645,'1616P0XELA','1616P051VA','TaipowerDistrict','','varchar(2)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
646,'1616P0XFXA','1616P051VA','TaipowerBusinessArea','','varchar(2)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
647,'1616P0XH8A','1616P051VA','PostCode','','varchar(15)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
648,'1616P0XJNA','1616P051VA','Address','','varchar(200)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
649,'1616P0XL2A','1616P051VA','ListLock','','varchar(5)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
650,'1616P0XMDA','1616P051VA','WorkEmp','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
651,'1616P0XNQA','1616P051VA','VerifyEmp','','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
652,'1616P0XQ1A','1616P051VA','CheckEmp','','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
653,'1616P0XRFA','1616P051VA','UnitManager','','varchar(50)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
654,'1616P0XSVA','1616P051VA','WorkClass_Id','','varchar(50)',0,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
655,'1616P0XU9A','1616P051VA','WorkStatusMapping_Id','','int(11)',0,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
656,'1616P0XWUA','1616P051VA','CreateDate','','datetime',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
657,'1616P0XY8A','1616P051VA','CityName','','varchar(15)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
658,'1616P0XZKA','1616P051VA','AreaName','','varchar(15)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
659,'1616P0Y0WA','1616P051VA','City','','int(11)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
660,'1616P0Y2AA','1616P051VA','CloseReasonDetailId','','varchar(50)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
661,'1616P0Y3QA','1616P051VA','CloseReason_Id','','varchar(50)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
662,'1616P0Y51A','1616P051VA','Collected','','tinyint(4)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
663,'1616P0Y6FA','1616P051VA','AuditorEmp','','varchar(50)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
664,'1616P0Y7SA','1616P051VA','WorkDispatch_Id','','varchar(50)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
665,'1616P0Y96A','1616P051VA','PickDate','領單時間','datetime',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
666,'1616P0YAHA','1616P051VA','EndDate','結案時間','datetime',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
667,'1616P0YBXA','1616P051VA','LocationType','','varchar(50)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
668,'1616P0YD8A','1616P051VA','InductionType','引電方式','varchar(50)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
669,'1616P0YEKA','1616P051VA','ConnectionMethod','通訊方式','varchar(50)',1,'',32,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
670,'1616P0YFZA','1616P051VA','Floor','樓層','int(11)',1,'',33,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
671,'1616P0YHAA','1616P0539A','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
672,'1616P0YJQA','1616P0539A','WorkNo','','varchar(36)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
673,'1616P0YL1A','1616P0539A','ElectricNo','','varchar(15)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
674,'1616P0YMFA','1616P0539A','AccountName','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
675,'1616P0YNSA','1616P0539A','PostCode','','varchar(15)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
676,'1616P0YQ6A','1616P0539A','Address','','varchar(200)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
677,'1616P0YRLA','1616P0539A','DCUNo','','varchar(20)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
678,'1616P0YSXA','1616P0539A','ElectricMeterNo','','varchar(12)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
679,'1616P0YUBA','1616P0539A','ElectricMeterCode','型式代碼','varchar(15)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
680,'1616P0YVNA','1616P0539A','ModuleType','模組型號','varchar(15)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
681,'1616P0YWZA','1616P0539A','ElectricMeterType','電表類別','varchar(15)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
682,'1616P0YYDA','1616P0539A','WorkEmp','','varchar(50)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
683,'1616P0YZQA','1616P0539A','VerifyEmp','','varchar(50)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
684,'1616P0Z11A','1616P0539A','CheckEmp','','varchar(50)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
685,'1616P0Z2FA','1616P0539A','UnitManager','','varchar(50)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
686,'1616P0Z3VA','1616P0539A','WorkClass_Id','','varchar(50)',0,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
687,'1616P0Z56A','1616P0539A','WorkStatusMapping_Id','','int(11)',0,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
688,'1616P0Z6HA','1616P0539A','WorkDispatch_Id','','varchar(50)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
689,'1616P0Z7UA','1616P0539A','CreateDate','','datetime',1,'',19,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
690,'1616P0Z98A','1616P0539A','CityName','','varchar(15)',1,'',20,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
691,'1616P0ZAKA','1616P0539A','AreaName','','varchar(15)',1,'',21,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
692,'1616P0ZBZA','1616P0539A','City','','int(11)',1,'',22,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
693,'1616P0ZDAA','1616P0539A','CloseReasonDetailId','','varchar(50)',1,'',23,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
694,'1616P0ZEMA','1616P0539A','CloseReason_Id','','varchar(50)',1,'',24,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
695,'1616P0ZG1A','1616P0539A','Collected','是否已從app領取','tinyint(4)',1,'',25,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
696,'1616P0ZHCA','1616P0539A','ModuleSN','','varchar(15)',1,'',26,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
697,'1616P0ZJSA','1616P0539A','AuditorEmp','','varchar(50)',1,'',27,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
698,'1616P0ZL3A','1616P0539A','PickDate','領單時間','datetime',1,'',28,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
699,'1616P0ZMHA','1616P0539A','EndDate','結案時間','datetime',1,'',29,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
700,'1616P0ZNUA','1616P0539A','LocationType','','varchar(20)',1,'',30,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
701,'1616P0ZQ8A','1616P0539A','Floor','樓層','int(11)',1,'',31,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
702,'1616P0ZRKA','1616P054LA','Id','','int(11)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
703,'1616P0ZSWA','1616P054LA','Product','工單字軌','varchar(1)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
704,'1616P0ZU7A','1616P054LA','WorkNo','工單單日流水號','int(11)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
705,'1616P0ZVMA','1616P054LA','MaxNo','單日流水號最大值','int(11)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
706,'1616P0ZX1A','1616P054LA','MinNo','單日流水號最小值','int(11)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
707,'1616P0ZYCA','1616P0560A','Id','','int(11)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
708,'1616P0ZZSA','1616P0560A','Product','','varchar(2)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
709,'1616P1013A','1616P0560A','WorkNo','','int(11)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
710,'1616P102EA','1616P0560A','MaxNo','','int(11)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
711,'1616P103RA','1616P0560A','MinNo','','int(11)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
712,'1616P1052A','1616P057BA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
713,'1616P106DA','1616P057BA','WorkOrderId','工單GUID','varchar(50)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
714,'1616P107TA','1616P057BA','AuditorDate','審核日期','datetime',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
715,'1616P1097A','1616P057BA','AuditorDescription','審核描述','varchar(100)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
716,'1616P10AJA','1616P057BA','AuditorEmp','審核人員','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
717,'1616P10BYA','1616P057BA','CheckPoint','關卡','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
718,'1616P10D9A','1616P057BA','AuditorStatus','審核狀態','tinyint(1)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
719,'1616P10EPA','1616P058NA','Id','','int(11)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
720,'1616P10G3A','1616P058NA','status','','varchar(20)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
721,'1616P10HEA','1616P058NA','Desc','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
722,'1616ZCEAKA','1616ZCDM6A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
723,'1616ZCEBZA','1616ZCDM6A','RoleName','角色名稱','varchar(45)',1,'',2,'角色名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
724,'1616ZCEDDA','1616ZCDNLA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
725,'1616ZCEEQA','1616ZCDNLA','ContractNo','合約編號','varchar(20)',0,'',2,'合約編號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
726,'1616ZCEG4A','1616ZCDNLA','ProjectNo','專案代碼','varchar(20)',0,'',3,'專案代碼',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
727,'1616ZCEHFA','1616ZCDNLA','ProjectName','專案名稱','varchar(30)',1,'',4,'專案名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
728,'1616ZCEKAA','1616ZCDNLA','TaxId','客戶統一編號','char(8)',0,'',5,'客戶統一編號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
729,'1616ZCEMPA','1616ZCDNLA','Name','客戶名稱','varchar(50)',1,'',6,'客戶名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
730,'1616ZCEP0A','1616ZCDNLA','Address','公司地址','varchar(100)',1,'',7,'公司地址',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
731,'1616ZCEQBA','1616ZCDNLA','Telephone','電話','varchar(20)',1,'',8,'電話',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
732,'1616ZCERRA','1616ZCDNLA','Email','Email','varchar(100)',1,'',9,'Email',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
733,'1616ZCET5A','1616ZCDNLA','ContractStart','合約有效期-起','datetime',0,'',10,'合約有效期-起',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
734,'1616ZCEUGA','1616ZCDNLA','ContractEnd','合約有效期-迄','datetime',0,'',11,'合約有效期-迄',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
735,'1616ZCEVWA','1616ZCDNLA','ContactName','客戶聯絡窗口','varchar(50)',1,'',12,'客戶聯絡窗口',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
736,'1616ZCEX7A','1616ZCDNLA','FhProductDesc','富鴻網產品描述','varchar(100)',1,'',13,'富鴻網產品描述',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
737,'1616ZCEYJA','1616ZCDNLA','FhContactName','富鴻網聯絡窗口','varchar(50)',1,'',14,'富鴻網聯絡窗口',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
738,'1616ZCEZVA','1616ZCDNLA','ProductPDM','富鴻網產品PDM','varchar(50)',1,'',15,'富鴻網產品PDM',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
739,'1616ZCF16A','1616ZCDNLA','ProductPJM','富鴻網產品PJM','varchar(50)',1,'',16,'富鴻網產品PJM',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
740,'1616ZCF2LA','1616ZCDNLA','AutoRepair','啟動自動派維修工單','tinyint(1)',1,'0',17,'啟動自動派維修工單',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
741,'1616ZCF3XA','1616ZCDQ0A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
742,'1616ZCF58A','1616ZCDQ0A','UniNumber','','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
743,'1616ZCF6NA','1616ZCDQ0A','CategoryName','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
744,'1616ZCF82A','1616ZCDQ0A','MixCategoryId','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
745,'1616ZCFK9A','1616ZCDRBA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
746,'1616ZCFMUA','1616ZCDRBA','WorkOrderNo','','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
747,'1616ZCFP8A','1616ZCDRBA','CustomerContractId','','varchar(50)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
748,'1616ZCFQNA','1616ZCDRBA','RepairDateTime','報修日期、時間','datetime',0,'',4,'報修日期、時間',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
749,'1616ZCFRZA','1616ZCDRBA','ProblemMain','障礙主類','varchar(50)',0,'',5,'障礙主類',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
750,'1616ZCFTGA','1616ZCDRBA','ProblemSub','障礙次類','varchar(50)',0,'',6,'障礙次類',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
751,'1616ZCFW4A','1616ZCDRBA','ProblemDesc','描述障礙內容','varchar(100)',1,'',7,'描述障礙內容',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
752,'1616ZCFYVA','1616ZCDRBA','ContactrName','描述障礙內容','varchar(100)',1,'',8,'描述障礙內容',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
753,'1616ZCG09A','1616ZCDRBA','ContactrTel','描述障礙內容','varchar(100)',1,'',9,'描述障礙內容',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
754,'1616ZCG1LA','1616ZCDRBA','ContactrEmail','描述障礙內容','varchar(100)',1,'',10,'描述障礙內容',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
755,'1616ZCG30A','1616ZCDRBA','VideoPath','','varchar(200)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
756,'1616ZCG4EA','1616ZCDSNA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
757,'1616ZCG5RA','1616ZCDSNA','Dept','部門','varchar(50)',1,'',2,'部門',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
758,'1616ZCG72A','1616ZCDSNA','Team','組別','varchar(50)',1,'',3,'組別',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
759,'1616ZCG8GA','1616ZCDSNA','OriginSource','原始來源','varchar(50)',1,'',4,'原始來源',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
760,'1616ZCG9WA','1616ZCDTZA','EmployeeId','帳號','varchar(20)',0,'',1,'帳號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
761,'1616ZCGBAA','1616ZCDTZA','Name','員工姓名','varchar(30)',1,'',2,'員工姓名',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
762,'1616ZCGJ6A','1616ZCDTZA','ENGName','員工英文名稱','varchar(30)',1,'',3,'員工英文名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
763,'1616ZCGN8A','1616ZCDTZA','Phone','聯絡電話','varchar(20)',1,'',4,'聯絡電話',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
764,'1616ZCGTWA','1616ZCDTZA','Email','電子信箱','varchar(50)',1,'',5,'電子信箱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
765,'1616ZCGVAA','1616ZCDTZA','PWD','密碼','varchar(50)',1,'',6,'密碼',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
766,'1616ZCGWQA','1616ZCDTZA','Origin','來源','varchar(50)',1,'',7,'來源',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
767,'1616ZCH3HA','1616ZCDTZA','PhoneToken','','varchar(100)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
768,'1616ZCHAGA','1616ZCDTZA','DepartmentId','部門','varchar(50)',0,'',9,'部門',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
769,'1616ZCHETA','1616ZCDTZA','EmployeeStatus','帳號狀態','int(11)',1,'',10,'帳號狀態',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
770,'1616ZCHHCA','1616ZCDVAA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
771,'1616ZCHJSA','1616ZCDVAA','CityCode','城市代碼','varchar(45)',1,'',2,'城市代碼',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
772,'1616ZCHKKA','1616ZCDVAA','CityName','城市名稱','varchar(45)',1,'',3,'城市名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
773,'1616ZCHMEA','1616ZCDVAA','AreaCode','郵遞區號','varchar(45)',1,'',4,'郵遞區號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
774,'1616ZCHNRA','1616ZCDVAA','AreaName','區域名稱(鄉鎮市區)','varchar(45)',1,'',5,'區域名稱(鄉鎮市區)',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
775,'1616ZCHQ5A','1616ZCDVAA','SerialNum','','int(11)',1,'0',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
776,'1616ZCHRGA','1616ZCDWQA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
777,'1616ZCHSFA','1616ZCDWQA','EmployeeId','','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
778,'1616ZCHT5A','1616ZCDWQA','WorkCategoryId','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
779,'1616ZCHVJA','1616ZCDWQA','RegionWorkClass','Region/WorkClass','varchar(10)',1,'',4,'Region/WorkClass',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
780,'1616ZCHWVA','1616ZCDWQA','EmployeeAreaId','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
781,'1616ZCHZPA','1616ZCDWQA','WorkClassId','','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
782,'1616ZCJ0XA','1616ZCDWQA','AuthRolesId','','varchar(50)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
783,'1616ZCJ3NA','1616ZCDWQA','CanCreate','','tinyint(1)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
784,'1616ZCJLPA','1616ZCDWQA','CanRead','','tinyint(1)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
785,'1616ZCJNQA','1616ZCDWQA','CanDelete','','tinyint(1)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
786,'1616ZCKF6A','1616ZCDWQA','CanUpdate','','tinyint(1)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
787,'1616ZCKGLA','1616ZCDY1A','Id','','varchar(36)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
788,'1616ZCKJ0A','1616ZCDY1A','DateTime','發生時間','datetime',0,'',2,'發生時間',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
789,'1616ZCKKBA','1616ZCDY1A','EmployeeId','登入帳號','varchar(45)',0,'',3,'登入帳號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
790,'1616ZCKLNA','1616ZCDY1A','Environment','環境 (Web、App)','varchar(45)',0,'',4,'環境 (Web、App)',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
791,'1616ZCKN2A','1616ZCDY1A','ExceptionPath','例外發生位置','varchar(100)',0,'',5,'例外發生位置',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
792,'1616ZCKPDA','1616ZCDY1A','ExceptionMessageJson','例外訊息Json','varchar(1000)',0,'',6,'例外訊息Json',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
793,'1616ZCKQQA','1616ZCDZFA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
794,'1616ZCKS4A','1616ZCDZFA','Category','','varchar(30)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
795,'1616ZCKTJA','1616ZCDZFA','ColumnDescribe','','varchar(50)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
796,'1616ZCKUVA','1616ZCDZFA','ColumnValue','','varchar(50)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
797,'1616ZCKW6A','1616ZCDZFA','ColumnType','','varchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
798,'1616ZCKXHA','1616ZCDZFA','ParentCategoryId','','varchar(50)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
799,'1616ZCKYUA','1616ZCDZFA','ColumnSort','','int(11)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
800,'1616ZCL08A','1616ZCE0VA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
801,'1616ZCL1KA','1616ZCE0VA','ClassName','類別名稱','varchar(45)',1,'',2,'類別名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
802,'1616ZCL2ZA','1616ZCE0VA','ClassPath','類別路徑','varchar(45)',1,'',3,'類別路徑',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
803,'1616ZCL4AA','1616ZCE0VA','ParentId','上層類別 Id','varchar(50)',1,'',4,'上層類別 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
804,'1616ZCL5MA','1616ZCE0VA','Sort','','int(11)',1,'0',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
805,'1616ZCL77A','1616ZCE29A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
806,'1616ZCL8CA','1616ZCE29A','WorkOrderId','工單號碼 Id','varchar(50)',0,'',2,'工單號碼 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
807,'1616ZCL9PA','1616ZCE29A','ImageSort','影像排序','int(11)',0,'',3,'影像排序',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
808,'1616ZCLB3A','1616ZCE29A','ImageType','影像分類','varchar(50)',1,'',4,'影像分類',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
809,'1616ZCLCEA','1616ZCE29A','ImagePath','影像名稱','varchar(100)',0,'',5,'影像名稱',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
810,'1616ZCLDRA','1616ZCE3PA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
811,'1616ZCLF5A','1616ZCE3PA','Product','工單字軌','varchar(1)',0,'',2,'工單字軌',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
812,'1616ZCLGGA','1616ZCE3PA','WorkNo','工單單日流水號','int(11)',0,'',3,'工單單日流水號',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
813,'1616ZCLHTA','1616ZCE3PA','MaxNo','單日流水號最大值','int(11)',0,'',4,'單日流水號最大值',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
814,'1616ZCLK7A','1616ZCE3PA','MinNo','單日流水號最小值','int(11)',0,'',5,'單日流水號最小值',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
815,'1616ZCLLMA','1616ZCE3PA','Date','工單號碼分配日期','datetime',0,'',6,'工單號碼分配日期',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
816,'1616ZCLMYA','1616ZCE56A','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
817,'1616ZCLPCA','1616ZCE56A','WorkOrderId','工單號碼 Id','varchar(50)',0,'',2,'工單號碼 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
818,'1616ZCLQPA','1616ZCE56A','AuditorDate','審核時間','datetime',1,'',3,'審核時間',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
819,'1616ZCLS0A','1616ZCE56A','AuditorDescription','審核結果說明','varchar(100)',1,'',4,'審核結果說明',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
820,'1616ZCLTEA','1616ZCE56A','AuditorEmployeeId','審核人員 Id ','varchar(20)',1,'',5,'審核人員 Id ',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
821,'1616ZCLUUA','1616ZCE56A','CheckPoint','審核節點','varchar(50)',1,'',6,'審核節點',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
822,'1616ZCLW8A','1616ZCE56A','AuditorStatus','審核結果','tinyint(1)',1,'',7,'審核結果',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
823,'1616ZCLXKA','1616ZCE6HA','Id','','varchar(50)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
824,'1616ZCLYZA','1616ZCE6HA','CustomerRepairId','報修工單 Id','varchar(50)',0,'',2,'報修工單 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
825,'1616ZCM0DA','1616ZCE6HA','WorkDatetime','派工日期時間','datetime',1,'',3,'派工日期時間',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
826,'1616ZCM1TA','1616ZCE6HA','ProcessDatetime','處理日期時間','datetime',1,'',4,'處理日期時間',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
827,'1616ZCM34A','1616ZCE6HA','MaintainProcessDesc','維運處理描述','varchar(100)',1,'',5,'維運處理描述',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
828,'1616ZCM4JA','1616ZCE6HA','WorkEmpId','施工人員 Id','varchar(20)',1,'',6,'施工人員 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
829,'1616ZCM5VA','1616ZCE6HA','AuditEmpId','審核人員 Id','varchar(20)',1,'',7,'審核人員 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
830,'1616ZCM76A','1616ZCE6HA','PmEmpId','主管單位 Id','varchar(20)',1,'',8,'主管單位 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
831,'1616ZCM8HA','1616ZCE6HA','WorkStatusMappingId','工單進程 Id','varchar(50)',1,'',9,'工單進程 Id',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
832,'161D2APJUA','161D2APDCA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
833,'161D2APL5A','161D2APDCA','Name','活動名稱','nvarchar(100)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
834,'161D2APMKA','161D2APDCA','AssistId','贊助來源','varchar(10)',0,'''''',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
835,'161D2APNZA','161D2APDCA','PlanCoin','預計使用幣數','decimal',0,'0',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
836,'161D2APQAA','161D2APDCA','UseCoin','實際使用幣數','decimal',0,'0',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
837,'161D2APRQA','161D2APDCA','FileName','上傳檔名','nvarchar(100)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
838,'161D2APT1A','161D2APDCA','Note','備註','nvarchar(-1)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
839,'161D2APUFA','161D2APDCA','Status','資料狀態','bit',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
840,'161D2APVSA','161D2APDCA','Creator','建檔人員','varchar(10)',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
841,'161D2APX3A','161D2APDCA','Created','建檔日期','datetime',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
842,'161D2APYHA','161D2APDCA','Revised','異動日期','datetime',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
843,'165R6BC9MA','165R6BBPBA','CategoryID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
844,'165R6BCB1A','165R6BBPBA','CategoryName','','nvarchar(15)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
845,'165R6BCCFA','165R6BBPBA','Description','','ntext(1073741823)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
846,'165R6BCDVA','165R6BBPBA','Picture','','image(2147483647)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
847,'165R6BCF6A','165R6BBQRA','CustomerID','','nchar(5)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
848,'165R6BCGHA','165R6BBQRA','CustomerTypeID','','nchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
849,'165R6BCHUA','165R6BBS2A','CustomerTypeID','','nchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
850,'165R6BCK5A','165R6BBS2A','CustomerDesc','','ntext(1073741823)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
851,'165R6BCLGA','165R6BBTDA','CustomerID','','nchar(5)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
852,'165R6BCMWA','165R6BBTDA','CompanyName','','nvarchar(40)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
853,'165R6BCPAA','165R6BBTDA','ContactName','','nvarchar(30)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
854,'165R6BCQMA','165R6BBTDA','ContactTitle','','nvarchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
855,'165R6BCRYA','165R6BBTDA','Address','','nvarchar(60)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
856,'165R6BCT9A','165R6BBTDA','City','','nvarchar(15)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
857,'165R6BCULA','165R6BBTDA','Region','','nvarchar(15)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
858,'165R6BCVXA','165R6BBTDA','PostalCode','','nvarchar(10)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
859,'165R6BCXBA','165R6BBTDA','Country','','nvarchar(15)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
860,'165R6BCYNA','165R6BBTDA','Phone','','nvarchar(24)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
861,'165R6BD02A','165R6BBTDA','Fax','','nvarchar(24)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
862,'165R6BD2WA','165R6BBUQA','EmployeeID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
863,'165R6BD6YA','165R6BBUQA','LastName','','nvarchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
864,'165R6BD89A','165R6BBUQA','FirstName','','nvarchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
865,'165R6BD9LA','165R6BBUQA','Title','','nvarchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
866,'165R6BDB0A','165R6BBUQA','TitleOfCourtesy','','nvarchar(25)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
867,'165R6BDCEA','165R6BBUQA','BirthDate','','datetime',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
868,'165R6BDDUA','165R6BBUQA','HireDate','','datetime',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
869,'165R6BDF5A','165R6BBUQA','Address','','nvarchar(60)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
870,'165R6BDGGA','165R6BBUQA','City','','nvarchar(15)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
871,'165R6BDHWA','165R6BBUQA','Region','','nvarchar(15)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
872,'165R6BDKAA','165R6BBUQA','PostalCode','','nvarchar(10)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
873,'165R6BDLQA','165R6BBUQA','Country','','nvarchar(15)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
874,'165R6BDN4A','165R6BBUQA','HomePhone','','nvarchar(24)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
875,'165R6BDPFA','165R6BBUQA','Extension','','nvarchar(4)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
876,'165R6BDQSA','165R6BBUQA','Photo','','image(2147483647)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
877,'165R6BDS3A','165R6BBUQA','Notes','','ntext(1073741823)',1,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
878,'165R6BDTLA','165R6BBUQA','ReportsTo','','int',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
879,'165R6BDUXA','165R6BBUQA','PhotoPath','','nvarchar(255)',1,'',18,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
880,'165R6BDW8A','165R6BBW4A','EmployeeID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
881,'165R6BDXKA','165R6BBW4A','TerritoryID','','nvarchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
882,'165R6BDYZA','165R6BBXFA','OrderID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
883,'165R6BE0AA','165R6BBXFA','ProductID','','int',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
884,'165R6BE1QA','165R6BBXFA','UnitPrice','','money',0,'0',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
885,'165R6BE31A','165R6BBXFA','Quantity','','smallint',0,'1',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
886,'165R6BE4CA','165R6BBXFA','Discount','','real',0,'0',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
887,'165R6BE5PA','165R6BBYVA','OrderID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
888,'165R6BE73A','165R6BBYVA','CustomerID','','nchar(5)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
889,'165R6BE8EA','165R6BBYVA','EmployeeID','','int',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
890,'165R6BE9UA','165R6BBYVA','OrderDate','','datetime',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
891,'165R6BEB5A','165R6BBYVA','RequiredDate','','datetime',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
892,'165R6BECGA','165R6BBYVA','ShippedDate','','datetime',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
893,'165R6BEDWA','165R6BBYVA','ShipVia','','int',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
894,'165R6BF0MA','165R6BBYVA','Freight','','money',1,'0',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
895,'165R6BFA5A','165R6BBYVA','ShipName','','nvarchar(40)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
896,'165R6BFBKA','165R6BBYVA','ShipAddress','','nvarchar(60)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
897,'165R6BFCWA','165R6BBYVA','ShipCity','','nvarchar(15)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
898,'165R6BFEAA','165R6BBYVA','ShipRegion','','nvarchar(15)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
899,'165R6BFFMA','165R6BBYVA','ShipPostalCode','','nvarchar(10)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
900,'165R6BFGYA','165R6BBYVA','ShipCountry','','nvarchar(15)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
901,'165R6BFJCA','165R6BC06A','ProductID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
902,'165R6BFKSA','165R6BC06A','ProductName','','nvarchar(40)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
903,'165R6BFM3A','165R6BC06A','SupplierID','','int',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
904,'165R6BFNHA','165R6BC06A','CategoryID','','int',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
905,'165R6BFPUA','165R6BC06A','QuantityPerUnit','','nvarchar(20)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
906,'165R6BFR5A','165R6BC06A','UnitPrice','','money',1,'0',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
907,'165R6BFSKA','165R6BC06A','UnitsInStock','','smallint',1,'0',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
908,'165R6BFTWA','165R6BC06A','UnitsOnOrder','','smallint',1,'0',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
909,'165R6BFV7A','165R6BC06A','ReorderLevel','','smallint',1,'0',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
910,'165R6BFWJA','165R6BC06A','Discontinued','','bit',0,'0',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
911,'165R6BFXYA','165R6BC2XA','RegionID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
912,'165R6BFZCA','165R6BC2XA','RegionDescription','','nchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
913,'165R6BG0SA','165R6BC48A','ShipperID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
914,'165R6BG20A','165R6BC48A','CompanyName','','nvarchar(40)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
915,'165R6BG3EA','165R6BC48A','Phone','','nvarchar(24)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
916,'165R6BG4RA','165R6BC5KA','SupplierID','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
917,'165R6BG65A','165R6BC5KA','CompanyName','','nvarchar(40)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
918,'165R6BG7KA','165R6BC5KA','ContactName','','nvarchar(30)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
919,'165R6BG8WA','165R6BC5KA','ContactTitle','','nvarchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
920,'165R6BGANA','165R6BC5KA','Address','','nvarchar(60)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
921,'165R6BGBMA','165R6BC5KA','City','','nvarchar(15)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
922,'165R6BGD1A','165R6BC5KA','Region','','nvarchar(15)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
923,'165R6BGECA','165R6BC5KA','PostalCode','','nvarchar(10)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
924,'165R6BGFPA','165R6BC5KA','Country','','nvarchar(15)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
925,'165R6BGH0A','165R6BC5KA','Phone','','nvarchar(24)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
926,'165R6BGJEA','165R6BC5KA','Fax','','nvarchar(24)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
927,'165R6BGKRA','165R6BC5KA','HomePage','','ntext(1073741823)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
928,'165R6BGM5A','165R6BC6ZA','TerritoryID','','nvarchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
929,'165R6BGNGA','165R6BC6ZA','TerritoryDescription','','nchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
930,'165R6BGPWA','165R6BC6ZA','RegionID','','int',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
931,'5X9RB37ZKA','5X9RB36MYA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
932,'5X9RB381FA','5X9RB36MYA','TableId','資料表Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
933,'5X9RB3845A','5X9RB36MYA','Name','欄位名稱','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
934,'5X9RB3890A','5X9RB36MYA','DataType','資料型態','varchar(20)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
935,'5X9RB38APA','5X9RB36MYA','Nullable','可空值','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
936,'5X9RB38E9A','5X9RB36MYA','DefaultValue','預設值','varchar(100)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
937,'5X9RB38G3A','5X9RB36MYA','Sort','排序','int',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
938,'5X9RB38HTA','5X9RB36MYA','Note','說明','nvarchar(255)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
939,'5X9RB38KTA','5X9RB36MYA','Status','資料狀態','bit',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
940,'5X9RB38NHA','5X9RB36PRA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
941,'5X9RB38QJA','5X9RB36PRA','ProjectId','專案Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
942,'5X9RB395WA','5X9RB36PRA','LabelHori','水平Label','bit',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
943,'5X9RB397PA','5X9RB36PRA','ReadSql','查詢Sql','varchar(500)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
944,'5X9RB39DFA','5X9RB36PRA','TableAs','資料表別名','varchar(10)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
945,'5X9RB39FLA','5X9RB36PRA','HasCreate','Create功能','bit',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
946,'5X9RB39HDA','5X9RB36PRA','HasUpdate','Update功能','bit',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
947,'5X9RB39L2A','5X9RB36PRA','HasDelete','Delete功能','bit',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
948,'5X9RB39NSA','5X9RB36PRA','HasView','View功能','bit',0,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
949,'5X9RB39QUA','5X9RB36PRA','HasExport','Export功能','bit',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
950,'5X9RB39TLA','5X9RB36PRA','HasReset','Reset功能','bit',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
951,'5X9RB39VJA','5X9RB36PRA','Status','資料狀態','bit',0,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
952,'5X9RB39XPA','5X9RB36TCA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
953,'5X9RB3A19A','5X9RB36TCA','EtableId','EtableId','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
954,'5X9RB3A4CA','5X9RB36TCA','InputType','輸入類型','varchar(10)',0,'',4,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
955,'5X9RB3A6GA','5X9RB36TCA','InputData','輸入資料','nvarchar(50)',1,'',5,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
956,'5X9RB3A9JA','5X9RB36TCA','Required','必填','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
957,'5X9RB3ABDA','5X9RB36TCA','HasCreate','Create功能','bit',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
958,'5X9RB3ACRA','5X9RB36TCA','HasUpdate','Update功能','bit',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
959,'5X9RB3AE4A','5X9RB36TCA','PlaceHolder','PlaceHolder','varchar(10)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
960,'5X9RB3AHCA','5X9RB36TCA','DefaultValue','預設值','varchar(10)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
961,'5X9RB3AT3A','5X9RB36TCA','PosGroup','同列','varchar(10)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
962,'5X9RB3BH2A','5X9RB36TCA','LayoutCols','版位','varchar(10)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
963,'5X9RB3DMHA','5X9RB36TCA','Width','欄位寬度','int',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
964,'5X9RB3E38A','5X9RB36TCA','CheckType','檢查類型','varchar(10)',0,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
965,'5X9RB3E4QA','5X9RB36TCA','CheckData','檢查資料','varchar(10)',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
966,'5X9RB3E6SA','5X9RB36TCA','Sort','排序','int',0,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
967,'5X9RB3E8JA','5X9RB36VLA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
968,'5X9RB3EAAA','5X9RB36VLA','CrudId','CrudId','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
969,'5X9RB3EBUA','5X9RB36VLA','TableId','資料表Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
970,'5X9RB3EDAA','5X9RB36VLA','Kid','主鍵Id','varchar(10)',0,'',4,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
971,'5X9RB3EEPA','5X9RB36VLA','MapFid','外鍵Id','varchar(10)',1,'',5,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
972,'5X9RB3EG4A','5X9RB36VLA','Col4','Col4','varchar(30)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
973,'5X9RB3EHJA','5X9RB36VLA','OrderBy','OrderBy','varchar(10)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
974,'5X9RB3EK8A','5X9RB36VLA','Sort','排序','int',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
975,'5X9RB3ELQA','5X9RB36XEA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
976,'5X9RB3ENRA','5X9RB36XEA','CrudId','CrudId','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
977,'5X9RB3F0AA','5X9RB36XEA','TableAs','資料表別名','varchar(20)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
978,'5X9RB3FABA','5X9RB36XEA','InputType','輸入類型','varchar(20)',0,'',5,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
979,'5X9RB3FC9A','5X9RB36XEA','InputData','輸入資料','varchar(20)',1,'',6,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
980,'5X9RB3FELA','5X9RB36XEA','Op','比對方式','varchar(10)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
981,'5X9RB3FG9A','5X9RB36XEA','IsRange','Range比對','bit',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
982,'5X9RB3FHUA','5X9RB36XEA','IsFind2','進階查詢','bit',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
983,'5X9RB3FKDA','5X9RB36XEA','PosGroup','同列','varchar(10)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
984,'5X9RB3FM3A','5X9RB36XEA','LayoutCols','版位','varchar(20)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
985,'5X9RB3FNUA','5X9RB36XEA','ExtInfo','其他資料','varchar(20)',1,'',12,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
986,'5X9RB3FQ1A','5X9RB36XEA','Sort','排序','int',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
987,'5X9RB3FRUA','5X9RB36ZCA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
988,'5X9RB3FTJA','5X9RB36ZCA','CrudId','CrudId','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
989,'5X9RB3G21A','5X9RB36ZCA','Width','欄位寬度','int',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
990,'5X9RB3G3PA','5X9RB36ZCA','RitemType','結果欄位類型','varchar(10)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
991,'5X9RB3G5KA','5X9RB36ZCA','ExtInfo','其他資料','varchar(30)',1,'',7,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
992,'5X9RB3G71A','5X9RB36ZCA','Sort','排序','int',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
993,'5X9RB3G8EA','5X9RB3720A','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
994,'5X9RB3GG2A','5X9RB3720A','DbName','Db名稱','varchar(20)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
995,'5X9RB3GK9A','5X9RB3720A','ProjectPath','專案路徑','varchar(255)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
996,'5X9RB3GLJA','5X9RB3720A','ConnectStr','Db連線字串','varchar(255)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
997,'5X9RB3GN2A','5X9RB3720A','Status','資料狀態','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
998,'5X9RB3GPHA','5X9RB373ZA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
999,'5X9RB3GRZA','5X9RB373ZA','ProjectId','專案Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1000,'5X9RB3GT3A','5X9RB373ZA','Name','資料表名稱','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1001,'5X9RB3GWNA','5X9RB373ZA','Note','說明','nvarchar(255)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1002,'5X9RB3GZ3A','5X9RB373ZA','Status','資料狀態','bit',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1003,'5XBA43L8QA','5X9RB36TCA','ColumnId','欄位Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1004,'5XBA43LBNA','5X9RB36XEA','ColumnId','欄位Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1005,'5XD29XCRAA','5XD29XBSMA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1006,'5XD29XCUNA','5XD29XBSMA','Name','部門名稱','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1007,'5XD29XCW1A','5XD29XBSMA','MgrId','主管Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1008,'5XD29XD5LA','5XD29XC3BA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1009,'5XD29XD72A','5XD29XC3BA','Account','帳號','varchar(20)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1010,'5XD29XD8JA','5XD29XC3BA','Name','使用者名稱','nvarchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1011,'5XD29XDARA','5XD29XC3BA','DeptId','部門','varchar(10)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1012,'5XD29XDBYA','5XD29XC3BA','Status','資料狀態','bit',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1013,'5XD29XDDDA','5XD29XC6LA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1014,'5XD29XDF1A','5XD29XC6LA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1015,'5XD29XDGTA','5XD29XC6LA','JobName','工作名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1016,'5XD29XDKZA','5XD29XC6LA','JobType','工作類型','nvarchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1017,'5XD29XDN0A','5XD29XC6LA','JobPlace','工作地點','nvarchar(30)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1018,'5XD29XDPVA','5XD29XC6LA','StartEnd','起迄時間','varchar(30)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1019,'5XD29XDUAA','5XD29XC6LA','CorpName','公司名稱','nvarchar(30)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1020,'5XD29XDVWA','5XD29XC6LA','CorpUsers','公司人數','int',0,'0',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1021,'5XD29XDXPA','5XD29XC6LA','IsManaged','管理職','bit',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1022,'5XD29XE1AA','5XD29XC6LA','JobDesc','工作說明','varchar(-1)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1023,'5XD29XE2UA','5XD29XC7WA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1024,'5XD29XE9LA','5XD29XC7WA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1025,'5XD29XFPMA','5XD29XC7WA','LangName','語言名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1026,'5XD29XFX1A','5XD29XC7WA','ListenLevel','聴力','tinyint',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1027,'5XD29XFZXA','5XD29XC7WA','SpeakLevel','說','tinyint',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1028,'5XD29XG6HA','5XD29XC7WA','ReadLevel','閱讀','tinyint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1029,'5XD29XG8HA','5XD29XC7WA','WriteLevel','書寫','tinyint',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1030,'5XD29XGACA','5XD29XC7WA','Sort','排序','int',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1031,'5XD29XGC3A','5XD29XC9AA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1032,'5XD29XGE9A','5XD29XC9AA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1033,'5XD29XGG3A','5XD29XC9AA','LicenseName','證照名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1034,'5XD29XGHSA','5XD29XC9AA','StartEnd','起迄時間','varchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1035,'5XD29XGKPA','5XD29XC9AA','FileName','上傳檔名','nvarchar(100)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1036,'5XD29XGNVA','5XD29XCAWA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1037,'5XD29XGR4A','5XD29XCAWA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1038,'5XD29XGSRA','5XD29XCAWA','SchoolName','學校名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1039,'5XD29XGV8A','5XD29XCAWA','SchoolDept','科系','nvarchar(20)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1040,'5XD29XGWUA','5XD29XCAWA','SchoolType','學歷種類','nvarchar(20)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1041,'5XD29XGZGA','5XD29XCAWA','StartEnd','起迄時間','varchar(30)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1042,'5XD29XH1CA','5XD29XCAWA','Graduated','是否畢業','bit',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1043,'5XD29XH4HA','5XD29XCDPA','Id','Id','varchar(10)',0,'',1,'PKey',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1044,'5XD29XH6EA','5XD29XCDPA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1045,'5XD29XH8EA','5XD29XCDPA','SkillName','技能名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1046,'5XD29XHA2A','5XD29XCDPA','SkillDesc','技能說明','nvarchar(500)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1047,'5XLQ99LTVA','5XD29XC9AA','Sort','排序','int',0,'',6,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1048,'5XLQ99LV9A','5XD29XCDPA','Sort','排序','int',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1049,'5YFVGEZSJA','5XD29XC3BA','Pwd','密碼','varchar(32)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1050,'5YFVJXBYXA','5X9RB36MYA','Code','欄位代碼','varchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1051,'5YFVJXC0WA','5X9RB36PRA','ProgCode','功能代碼','varchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1052,'5YFVJXC2BA','5X9RB36PRA','ProgName','功能名稱','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1053,'5YFVJXC3RA','5X9RB36PRA','AuthType','權限種類','tinyint',0,'',14,'see Code, 0(無), 1(Ctrl), 2(Action)',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1054,'5YFVJXC4ZA','5X9RB36PRA','Created','建檔時間','datetime',0,'',16,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1055,'5YFVJXC6KA','5X9RB36PRA','Revised','修改時間','datetime',1,'',17,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1056,'5YFVJXC7TA','5X9RB36ZCA','ColumnCode','欄位代碼','varchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1057,'5YFVJXC9YA','5X9RB36ZCA','Name','顯示名稱','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1058,'5YFVJXCB7A','5X9RB3720A','Code','專案代碼','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1059,'5YFVJXCCVA','5X9RB373ZA','Code','資料表代碼','varchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1060,'5Z5BHXMCMA','5Z5BHXK86A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1061,'5Z5BHXME5A','5Z5BHXK86A','UserId','請假人','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1062,'5Z5BHXMFJA','5Z5BHXK86A','AgentId','代理人','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1063,'5Z5BHXMGLA','5Z5BHXK86A','LeaveType','假別','char(1)',0,'',4,'Code LeaveType',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1064,'5Z5BHXMJ7A','5Z5BHXK86A','StartTime','開始時間','datetime',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1065,'5Z5BHXMKSA','5Z5BHXK86A','EndTime','結束時間','datetime',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1066,'5Z5BHXMM5A','5Z5BHXK86A','Hours','請假時數','decimal',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1067,'5Z5BHXMS5A','5Z5BHXK86A','FlowSignStatus','流程簽核狀態','char(1)',0,'',9,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1068,'5Z5BHXMU0A','5Z5BHXK86A','Status','資料狀態','bit',0,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1069,'5Z5BHXMVTA','5Z5BHXK86A','Creator','建檔人員','varchar(10)',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1070,'5Z5BHXMXVA','5Z5BHXK86A','Created','建檔日期','datetime',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1071,'5Z5BHXMZRA','5Z5BHXK86A','Reviser','修改人員','varchar(10)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1072,'5Z5BHXN1KA','5Z5BHXK86A','Revised','修改日期','datetime',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1073,'5ZKB7A6VPA','5X9RB36VLA','HalfWidth','是否半幅寬度','bit',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1074,'D58FUTP10A','5X9RB36TCA','EitemType','編輯欄位種類','varchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1075,'D58FUTPHMA','5X9RB36TCA','ItemData','欄位資料','nvarchar(50)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1076,'D58FUTPZ6A','5X9RB36VLA','PkeyFid','主鍵欄位Id','varchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1077,'D58FUTQEQA','5X9RB36VLA','FkeyFid','外鍵欄位Id','varchar(10)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1078,'D58FUTQVNA','5X9RB36XEA','QitemType','查詢欄位種類','varchar(20)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1079,'D58FUTRAMA','5X9RB36XEA','ItemData','欄位資料','varchar(20)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1080,'D58FUTT5TA','5X9RB373ZA','TranLog','是否記錄交易','bit',0,'0',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1081,'D58FV79WAA','5Z5BHXK86A','FlowLevel','流程目前Level','tinyint',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1082,'D58FV7ABUA','5Z5BHXK86A','FlowStatus','流程狀態','char(1)',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1083,'D58FV7ATEA','5Z5BHXK86A','FileName','上傳檔名','nvarchar(100)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1084,'D58FV7B84A','5XD29XC3BA','PhotoFile','相片檔名','nvarchar(100)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1085,'D58J2RNGAA','D58J2RM39A','Type','資料類別','varchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1086,'D58J2RNXYA','D58J2RM39A','Value','Key值','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1087,'D58J2RPC0A','D58J2RM39A','Name','顯示內容','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1088,'D58J2RPTKA','D58J2RM39A','Sort','排序','int',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1089,'D58J2RQ9CA','D58J2RM39A','Ext','擴充資訊','varchar(30)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1090,'D58J2RR6RA','D58J2RM39A','Note','備註','nvarchar(255)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1091,'D58LXL78TA','D58LXKZJUA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1092,'D58LXL7PHA','D58LXKZJUA','CmsType','Cms類別','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1093,'D58LXL84GA','D58LXKZJUA','DataType','資料型態','varchar(10)',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1094,'D58LXL8LJA','D58LXKZJUA','Title','標題','nvarchar(255)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1095,'D58LXL926A','D58LXKZJUA','Text','文字內容','nvarchar(-1)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1096,'D58LXL9JRA','D58LXKZJUA','Html','HTML內容','nvarchar(-1)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1097,'D58LXL9ZYA','D58LXKZJUA','Note','備註','nvarchar(255)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1098,'D58LXLAE4A','D58LXKZJUA','FileName','上傳檔名','nvarchar(100)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1099,'D58LXLAWDA','D58LXKZJUA','StartTime','開始時間','datetime',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1100,'D58LXLBBRA','D58LXKZJUA','EndTime','結束時間','datetime',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1101,'D58LXLBS3A','D58LXKZJUA','Status','資料狀態','bit',0,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1102,'D58LXLC7BA','D58LXKZJUA','Creator','建檔人員','varchar(10)',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1103,'D58LXLCNPA','D58LXKZJUA','Created','建檔日期','datetime',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1104,'D58LXLD4AA','D58LXKZJUA','Reviser','修改人員','varchar(10)',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1105,'D58LXLDKHA','D58LXKZJUA','Revised','修改日期','datetime',1,'',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1106,'D58LXLE05A','D58LXL00BA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1107,'D58LXLEGNA','D58LXL00BA','FldText','文字欄位','nchar(10)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1108,'D58LXLEXFA','D58LXL00BA','FldNum','整數欄位','int',1,'',3,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1109,'D58LXLFDXA','D58LXL00BA','FldNum2','小數欄位','float',1,'',4,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1110,'D58LXLFVLA','D58LXL00BA','FldCheck','Check欄位','bit',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1111,'D58LXLGATA','D58LXL00BA','FldRadio','Radio欄位','tinyint',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1112,'D58LXLGR2A','D58LXL00BA','FldSelect','下拉式欄位','varchar(10)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1113,'D58LXLH7YA','D58LXL00BA','FldDate','日期欄位','date',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1114,'D58LXLHNJA','D58LXL00BA','FldDatetime','時間欄位','datetime',1,'',9,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1115,'D58LXLJ38A','D58LXL00BA','FldFile','檔案欄位','nvarchar(100)',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1116,'D58LXLJJKA','D58LXL00BA','FldColor','Color欄位','varchar(10)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1117,'D58LXLJZDA','D58LXL00BA','FldTextarea','多行文字欄位','nvarchar(-1)',1,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1118,'D58LXLKFWA','D58LXL00BA','FldHtml','HTML欄位','nvarchar(-1)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1119,'D58LXLKXXA','D58LXL0GHA','Type','資料類別','varchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1120,'D58LXLLC9A','D58LXL0GHA','Value','Key值','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1121,'D58LXLLTNA','D58LXL0GHA','Name_zhTW','名稱(繁中)','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1122,'D58LXLM8FA','D58LXL0GHA','Name_zhCN','名稱(簡中)','nvarchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1123,'D58LXLMQTA','D58LXL0GHA','Name_enUS','名稱(英文)','nvarchar(30)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1124,'D58LXLN5BA','D58LXL0GHA','Sort','排序','int',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1125,'D58LXLNLEA','D58LXL0GHA','Ext','擴充資訊','varchar(30)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1126,'D58LXLP29A','D58LXL0GHA','Note','備註','nvarchar(255)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1127,'D58LXLPJHA','D58LXL0Y0A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1128,'D58LXLPZMA','D58LXL0Y0A','Name','名稱','nvarchar(50)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1129,'D58LXLQF2A','D58LXL0Y0A','TplFile','範本檔名','nvarchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1130,'D58LXLQWKA','D58LXL0Y0A','ToEmails','收件者','varchar(500)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1131,'D58LXLRCUA','D58LXL0Y0A','Sql','SQL內容','nvarchar(500)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1132,'D58LXLRT0A','D58LXL0Y0A','Status','資料狀態','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1133,'D58LXLS80A','D58LXL1D4A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1134,'D58LXLSQUA','D58LXL1D4A','Code','代碼','varchar(20)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1135,'D58LXLT5GA','D58LXL1D4A','Name','名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1136,'D58LXLTMCA','D58LXL1D4A','Portrait','是否直立','bit',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1137,'D58LXLU24A','D58LXL1D4A','Status','資料狀態','bit',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1138,'D58LXLUH6A','D58LXL1VTA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1139,'D58LXLUY9A','D58LXL1VTA','FlowId','流程Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1140,'D58LXLVE4A','D58LXL1VTA','StartNode','開始節點','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1141,'D58LXLVVGA','D58LXL1VTA','EndNode','結束節點','varchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1142,'D58LXLWA6A','D58LXL1VTA','CondStr','條件字串','varchar(255)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1143,'D58LXLWR6A','D58LXL1VTA','Sort','排序','smallint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1144,'D58LXLX7DA','D58LXL2A8A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1145,'D58LXLXPBA','D58LXL2A8A','FlowId','流程Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1146,'D58LXLY5WA','D58LXL2A8A','Name','名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1147,'D58LXLYM9A','D58LXL2A8A','NodeType','節點類別','char(1)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1148,'D58LXLZ2TA','D58LXL2A8A','PosX','位置X','smallint',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1149,'D58LXLZHUA','D58LXL2A8A','PosY','位置Y','smallint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1150,'D58LXLZZFA','D58LXL2A8A','SignerType','簽核者類別','varchar(2)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1151,'D58LXM0F2A','D58LXL2A8A','SignerValue','簽核者值','varchar(30)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1152,'D58LXM0XDA','D58LXL2A8A','PassType','通過類別','char(1)',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1153,'D58LXM1D6A','D58LXL2A8A','PassNum','通過數量','smallint',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1154,'D58LXM1UJA','D58LXL2SLA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1155,'D58LXM2ADA','D58LXL2SLA','FlowId','流程Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1156,'D58LXM2SWA','D58LXL2SLA','SourceId','來源資料Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1157,'D58LXM374A','D58LXL2SLA','NodeName','節點名稱','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1158,'D58LXM3PDA','D58LXL2SLA','FlowLevel','流程Level','smallint',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1159,'D58LXM44MA','D58LXL2SLA','TotalLevel','合計Level','smallint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1160,'D58LXM4STA','D58LXL2SLA','SignerId','簽核者Id','varchar(10)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1161,'D58LXM51YA','D58LXL2SLA','SignerName','簽核者姓名','nvarchar(20)',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1162,'D58LXM5GQA','D58LXL2SLA','SignStatus','簽核狀態','char(1)',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1163,'D58LXM5YEA','D58LXL2SLA','SignTime','簽核時間','datetime',1,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1164,'D58LXM6DAA','D58LXL2SLA','Note','說明','nvarchar(255)',1,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1165,'D58LXM6UQA','D58LXL378A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1166,'D58LXM7ABA','D58LXL378A','Type','資料類別','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1167,'D58LXM7R3A','D58LXL378A','FileName','上傳檔名','nvarchar(100)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1168,'D58LXM861A','D58LXL378A','OkCount','成功筆數','smallint',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1169,'D58LXM8MUA','D58LXL378A','FailCount','失敗筆數','smallint',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1170,'D58LXM93BA','D58LXL378A','TotalCount','合計筆數','smallint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1171,'D58LXM9J1A','D58LXL378A','CreatorName','建檔人員','nvarchar(30)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1172,'D58LXM9ZEA','D58LXL378A','Created','建檔日期','datetime',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1173,'D58LXMAE9A','D58LXL3N4A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1174,'D58LXMAWMA','D58LXL3N4A','Code','代碼','varchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1175,'D58LXMBB0A','D58LXL3N4A','Name','名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1176,'D58LXMBSCA','D58LXL3N4A','Icon','圖示','varchar(20)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1177,'D58LXMC85A','D58LXL3N4A','Url','Url','varchar(100)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1178,'D58LXMCQ7A','D58LXL3N4A','Sort','排序','smallint',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1179,'D58LXMD5AA','D58LXL3N4A','AuthRow','資料權限','tinyint',0,'0',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1180,'D58LXMDL8A','D58LXL3N4A','FunCreate','FunCreate','tinyint',0,'0',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1181,'D58LXME1HA','D58LXL3N4A','FunRead','FunRead','tinyint',0,'0',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1182,'D58LXMEGYA','D58LXL3N4A','FunUpdate','FunUpdate','tinyint',0,'0',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1183,'D58LXMEX3A','D58LXL3N4A','FunDelete','FunDelete','tinyint',0,'0',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1184,'D58LXMFD9A','D58LXL3N4A','FunPrint','FunPrint','tinyint',0,'0',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1185,'D58LXMFVYA','D58LXL3N4A','FunExport','FunExport','tinyint',0,'0',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1186,'D58LXMGAPA','D58LXL3N4A','FunView','FunView','tinyint',0,'0',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1187,'D58LXMGRPA','D58LXL3N4A','FunOther','FunOther','tinyint',0,'0',15,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1188,'D58LXMH73A','D58LXL44TA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1189,'D58LXMHPPA','D58LXL44TA','Name','名稱','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1190,'D58LXMJ4NA','D58LXL4KKA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1191,'D58LXMJKJA','D58LXL4KKA','RoleId','角色Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1192,'D58LXMK1QA','D58LXL4KKA','ProgId','功能Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1193,'D58LXMKHDA','D58LXL4KKA','FunCreate','FunCreate','tinyint',0,'0',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1194,'D58LXMKYWA','D58LXL4KKA','FunRead','FunRead','tinyint',0,'0',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1195,'D58LXMLD7A','D58LXL4KKA','FunUpdate','FunUpdate','tinyint',0,'0',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1196,'D58LXMLUYA','D58LXL4KKA','FunDelete','FunDelete','tinyint',0,'0',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1197,'D58LXMMAHA','D58LXL4KKA','FunPrint','FunPrint','tinyint',0,'0',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1198,'D58LXMMSRA','D58LXL4KKA','FunExport','FunExport','tinyint',0,'0',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1199,'D58LXMN8NA','D58LXL4KKA','FunView','FunView','tinyint',0,'0',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1200,'D58LXMNPHA','D58LXL4KKA','FunOther','FunOther','tinyint',0,'0',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1201,'D58LXMP45A','D58LXL50NA','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1202,'D58LXMPLVA','D58LXL50NA','RowId','資料Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1203,'D58LXMQ1QA','D58LXL50NA','TableName','資料表名稱','varchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1204,'D58LXMQG0A','D58LXL50NA','ColName','欄位名稱','varchar(30)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1205,'D58LXMQYKA','D58LXL50NA','OldValue','舊值','nvarchar(500)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1206,'D58LXMRE7A','D58LXL50NA','NewValue','新值','nvarchar(500)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1207,'D58LXMRVJA','D58LXL50NA','Act','執行動作','varchar(10)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1208,'D58LXMSB0A','D58LXL50NA','Created','建檔日期','datetime',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1209,'D58LXMSSCA','D58LXL5FUA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1210,'D58LXMT79A','D58LXL5FUA','UserId','用戶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1211,'D58LXMTNNA','D58LXL5FUA','RoleId','角色Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1212,'D58WX65UJA','D58WX60WVA','UserId','用戶Id','varchar(10)',0,'',1,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1213,'D58WX66AAA','D58WX60WVA','BaoId','尋寶Id','varchar(10)',0,'',2,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1214,'D58WX66RHA','D58WX60WVA','Created','建檔日期','datetime',0,'',3,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1215,'D58WX677AA','D58WX61CCA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1216,'D58WX67N5A','D58WX61CCA','Name','尋寶名稱','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1217,'D58WX683EA','D58WX61CCA','StartTime','開始時間','datetime',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1218,'D58WX68JCA','D58WX61CCA','EndTime','結束時間','datetime',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1219,'D58WX68ZGA','D58WX61CCA','IsBatch','是否批次解謎','bit',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1220,'D58WX69E7A','D58WX61CCA','IsMove','是否移動地點','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1221,'D58WX6ABUA','D58WX61CCA','GiftName','獎品內容','nvarchar(100)',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1222,'D58WX6ATUA','D58WX61CCA','Note','注意事項','nvarchar(500)',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1223,'D58WX6C6SA','D58WX61CCA','LaunchStatus','上架狀態','char(1)',0,'''0''',11,'refer XpCode.LaunchStatus',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1224,'D58WX6CNVA','D58WX61CCA','Status','資料狀態','bit',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1225,'D58WX6D3LA','D58WX61CCA','Creator','建檔人員','varchar(10)',0,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1226,'D58WX6E0GA','D58WX61TFA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1227,'D58WX6EFQA','D58WX61TFA','CmsType','CMS種類','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1228,'D58WX6EWHA','D58WX61TFA','Title','標題','nvarchar(255)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1229,'D58WX6FC1A','D58WX61TFA','Text','文字內容','nvarchar(-1)',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1230,'D58WX6FT1A','D58WX61TFA','Html','Html內容','nvarchar(-1)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1231,'D58WX6G8UA','D58WX61TFA','Note','備註','nvarchar(255)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1232,'D58WX6GPJA','D58WX61TFA','FileName','上傳檔名','nvarchar(100)',1,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1233,'D58WX6H4WA','D58WX61TFA','StartTime','開始時間','datetime',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1234,'D58WX6HL3A','D58WX61TFA','EndTime','結束時間','datetime',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1235,'D58WX6J13A','D58WX61TFA','Status','資料狀態','bit',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1236,'D58WX6JHKA','D58WX61TFA','Creator','建檔人員','varchar(10)',0,'',11,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1237,'D58WX6JZ4A','D58WX61TFA','Created','建檔日期','datetime',0,'',12,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1238,'D58WX6KEGA','D58WX61TFA','Reviser','修改人員','varchar(10)',1,'',13,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1239,'D58WX6KVNA','D58WX61TFA','Revised','修改日期','datetime',1,'',14,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1240,'D58WX6LB5A','D58WX627KA','Id','Id','varchar(10)',0,'',1,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1241,'D58WX6LSHA','D58WX627KA','BaoId','尋寶Id','varchar(10)',0,'',2,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1242,'D58WX6M70A','D58WX627KA','UserId','用戶Id','varchar(10)',0,'',3,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1243,'D58WX6MNHA','D58WX627KA','Reply','答題內容','nvarchar(500)',0,'',4,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1244,'D58WX6N48A','D58WX627KA','Created','建檔日期','datetime',0,'',5,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1245,'D58WX6NKEA','D58WX62PGA','Id','Id','varchar(10)',0,'',1,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1246,'D58WX6P1NA','D58WX62PGA','BaoId','尋寶Id','varchar(10)',0,'',2,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1247,'D58WX6PHDA','D58WX62PGA','FileName','上傳檔案名稱','nvarchar(100)',0,'',3,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1248,'D58WX6PZDA','D58WX62PGA','Hint','提示','nvarchar(100)',1,'',4,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1249,'D58WX6QEEA','D58WX62PGA','Answer','正確答案','varchar(22)',0,'',5,'MD5加密',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1250,'D58WX6QWGA','D58WX62PGA','Sort','排序','smallint',0,'',6,'',0);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1251,'D58WX6RBPA','D58WX634WA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1252,'D58WX6RT8A','D58WX634WA','Name','姓名','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1253,'D58WX6S9UA','D58WX634WA','Account','帳號','varchar(20)',0,'',3,'可修改',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1254,'D58WX6SRJA','D58WX634WA','Pwd','密碼','varchar(22)',0,'''''',4,'MD5加密',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1255,'D58WX6T64A','D58WX634WA','Status','資料狀態','bit',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1256,'D58WX6TMNA','D58WX634WA','IsAdmin','是否管理者','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1257,'D58WX6U3JA','D58WX63L5A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1258,'D58WX6UKQA','D58WX63L5A','Name','姓名','nvarchar(30)',1,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1259,'D58WX6V0WA','D58WX63L5A','Phone','手機號碼','varchar(15)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1260,'D58WX6VFNA','D58WX63L5A','Email','Email','varchar(100)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1261,'D58WX6VXLA','D58WX63L5A','Address','地址','nvarchar(255)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1262,'D58WX6WCUA','D58WX63L5A','Created','建檔日期','datetime',0,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1263,'D58WX6WUUA','D58WX63L5A','Revised','修改日期','datetime',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1264,'D58WX6XA1A','D58WX6485A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1265,'D58WX6XRPA','D58WX6485A','Name','姓名','nvarchar(30)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1266,'D58WX6Y7NA','D58WX6485A','Account','帳號','varchar(30)',0,'',3,'可修改',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1267,'D58WX6YNSA','D58WX6485A','Pwd','密碼','varchar(22)',0,'''''',4,'MD5加密',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1268,'D58WX6Z41A','D58WX6485A','Phone','手機號碼','varchar(15)',0,'',5,'不可修改',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1269,'D58WX6ZKCA','D58WX6485A','Email','Email','varchar(100)',0,'',6,'不可修改',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1270,'D58WX70B0A','D58WX6485A','Address','地址','nvarchar(255)',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1271,'D58WX70X9A','D58WX6485A','IsCorp','是否公司','bit',0,'',8,'公司才能設定Bao.IsMove=true',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1272,'D58WX71C0A','D58WX6485A','Created','建檔日期','datetime',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1273,'D70XCQLA3A','D58LXL00BA','FldInt','','int',1,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1274,'D70XCQLSCA','D58LXL00BA','FldDec','','float',1,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1275,'D70XCQM7TA','D58LXL00BA','FldDt','','datetime',1,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1276,'D8ZRXEVPDA','D58WX61CCA','StageCount','關卡數目','tinyint',0,'',10,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1277,'D8ZRXEW46A','D58WX61CCA','Revised','異動日期','datetime',0,'',14,'含建檔日期',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1278,'D8ZRXEWK8A','D8ZRXETU8A','UserId','App用戶Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1279,'D8ZRXEX1RA','D8ZRXETU8A','BaoId','尋寶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1280,'D8ZRXEXHBA','D8ZRXETU8A','AttendStatus','參加狀態','char(1)',0,'',3,'refer XpCode AttendStatus',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1281,'D8ZRXEXY2A','D8ZRXETU8A','Created','建檔日期','datetime',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1282,'D8ZRXEYE4A','D8ZRXEUAEA','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1283,'D8ZRXEYVPA','D8ZRXEUAEA','BaoId','尋寶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1284,'D8ZRXEZB3A','D8ZRXEUAEA','UserId','App用戶Id','varchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1285,'D8ZRXEZTXA','D8ZRXEUAEA','Reply','答題內容','nvarchar(500)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1286,'D8ZRXF08SA','D8ZRXEUAEA','Created','建檔日期','datetime',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1287,'D8ZRXF0Q4A','D8ZRXEUS7A','Id','Id','varchar(10)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1288,'D8ZRXF163A','D8ZRXEUS7A','BaoId','尋寶Id','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1289,'D8ZRXF1LKA','D8ZRXEUS7A','FileName','上傳檔案名稱','nvarchar(100)',0,'',3,'關卡圖檔',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1290,'D8ZRXF21QA','D8ZRXEUS7A','AppHint','App用戶提示','nvarchar(100)',1,'',4,'顯示在App',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1291,'D8ZRXF2GXA','D8ZRXEUS7A','CustHint','客戶提示','nvarchar(100)',1,'',5,'for 客戶維護用途',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1292,'D8ZRXF2YXA','D8ZRXEUS7A','Answer','正確答案','varchar(22)',0,'',6,'MD5加密',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1293,'D8ZRXF3D4A','D8ZRXEUS7A','Sort','排序','smallint',0,'',7,'base 0',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1294,'D8ZRXF3V7A','D58WX63L5A','Status','資料狀態','bit',0,'0',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1295,'D8ZRXF4ARA','D58WX6485A','Status','資料狀態','bit',0,'',9,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1296,'D9QS7Q771A','D58WX61CCA','IsMoney','是否獎金','bit',0,'',7,'0(獎品), 1(獎金)',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1297,'D9QS7Q7NDA','D8ZRXETU8A','NowLevel','目前關卡','smallint',0,'1',4,'base 1',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1298,'D9QS7Q84SA','D58WX63L5A','AuthCode','認證號碼','varchar(10)',1,'',6,'App用戶建立帳號或是回復帳號時, 必須經過認證',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1299,'D9QTSQG2QA','D9QTSQF55A','Type','資料類別','varchar(20)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1300,'D9QTSQGHUA','D9QTSQF55A','Value','Key值','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1301,'D9QTSQGYWA','D9QTSQF55A','Name','顯示名稱','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1302,'D9QTSQHD9A','D9QTSQF55A','Sort','排序','int',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1303,'D9QTSQHVPA','D9QTSQF55A','Ext','擴充資訊','varchar(30)',1,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1304,'D9QTSQJAGA','D9QTSQF55A','Note','備註','nvarchar(255)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1305,'ZK7mtvgQED','IBxwfrp6Sl','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1306,'xGZiOLBCDA','IBxwfrp6Sl','Id','Id','varchar(6)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1307,'XTcUBUjVth','IBxwfrp6Sl','VoteNo','候選號碼','char(1)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1308,'Gq7rq5L2RG','IBxwfrp6Sl','Name','姓名','nvarchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1309,'rCOf19gjwB','IBxwfrp6Sl','Count','得票數','int',0,'0',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1310,'ifCuP5qqGX','qIebMI42WA','Account','管理者帳號','varchar(30)',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1311,'FW382eyAsG','qIebMI42WA','Pwd','管理者密碼','varchar(22)',0,'',2,'md5加密',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1312,'MlmNdc2SdB','qIebMI42WA','VoteName','投票活動名稱','nvarchar(50)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1313,'Hj5SIu8IjL','qIebMI42WA','VoteStatus','投票狀態','bit',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1314,'qQC05HcWQA','tKUNoEv1qp','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1315,'num6xRqazw','tKUNoEv1qp','VoterId','投票者Id','varchar(16)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1316,'iG9rDPoOqG','rDrG0sqtuf','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1317,'OX7hmRCbeH','rDrG0sqtuf','Id','Id','varchar(16)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1318,'fcmkyjHA3O','rDrG0sqtuf','Name','姓名','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1319,'AUsuAQ4SJd','rDrG0sqtuf','Account','登入帳號','varchar(30)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1320,'lSydgPtaO8','rDrG0sqtuf','Pwd','密碼','varchar(22)',1,'',5,'md5加密',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
1321,'SdslmZPic1','rDrG0sqtuf','Status','資料狀態','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
2305,'4r6HGLZa4M','IBxwfrp6Sl','PhotoFile','上傳圖檔','nvarchar(100)',1,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3305,'KMfcyezYB1','kTvOnXy3sj','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3306,'V4ZR1m3J8T','kTvOnXy3sj','Ym','民國年月','nvarchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3307,'FSjaSs4PmB','kTvOnXy3sj','PortName','港口名稱','nvarchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3308,'aP3ONcJrCI','kTvOnXy3sj','InOut','國內外','nvarchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3309,'R2BunFdJRk','kTvOnXy3sj','AreaName','區域名稱','nvarchar(20)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3310,'aVNx8fsNq0','kTvOnXy3sj','CargoType','貨品','nvarchar(20)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3311,'vwylLi9Zbd','kTvOnXy3sj','Weight','噸重','int',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3312,'BQYTHtp9CB','JqeuC6ODS7','Sn','序號','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3313,'g1o647eCOk','JqeuC6ODS7','Ym','民國年月','nvarchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3314,'EbxisXaXSt','JqeuC6ODS7','PortName','港口名稱','nvarchar(10)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3315,'Uev01uBvlS','JqeuC6ODS7','InOut','國內外','nvarchar(10)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3316,'Z4LTc85wsP','JqeuC6ODS7','AreaName','區域名稱','nvarchar(20)',0,'',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3317,'8DHHk4t4yB','JqeuC6ODS7','CargoType','貨品','nvarchar(20)',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3318,'L9Pz7L7rVf','JqeuC6ODS7','Weight','噸重','int',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3319,'zAQxK4h6d3','UMXgXA56dn','Sn','','int',0,'',1,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3320,'r7kWngSNqZ','UMXgXA56dn','Id','','varchar(10)',0,'',2,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3321,'vI4PtZD1tS','UMXgXA56dn','Name','','nvarchar(30)',0,'',3,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3322,'gJWERgxeqP','UMXgXA56dn','Account','','varchar(20)',0,'',4,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3323,'K4TC6R9g9h','UMXgXA56dn','Pwd','','varchar(22)',0,'''''',5,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3324,'XERm44cRyN','UMXgXA56dn','Status','','bit',0,'',6,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3325,'SwDoktAkKt','UMXgXA56dn','IsAdmin','','bit',0,'',7,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3326,'HSaMmpm0JR','kTvOnXy3sj','Note','備註','nvarchar(500)',1,'',8,'',1);
INSERT INTO [Column] ([Sn],[Id],[TableId],[Code],[Name],[DataType],[Nullable],[DefaultValue],[Sort],[Note],[Status]) VALUES (
3327,'W5XokSnE2F','JqeuC6ODS7','Note','備註','nvarchar(500)',1,'',8,'',1);
CREATE INDEX [tmpColumn_ix_tmpColumn] ON [tmpColumn] ([Code] ASC);
CREATE UNIQUE INDEX [Table_Table_Id] ON [Table] ([Id] ASC);
CREATE UNIQUE INDEX [Project_Project_Id] ON [Project] ([Id] ASC);
CREATE UNIQUE INDEX [CrudRitem_CrudRitem_Id] ON [CrudRitem] ([Id] ASC);
CREATE UNIQUE INDEX [CrudQitem_CrudQitem_Id] ON [CrudQitem] ([Id] ASC);
CREATE UNIQUE INDEX [CrudEitem_CrudEitem_Id] ON [CrudEitem] ([Id] ASC);
CREATE UNIQUE INDEX [Crud_Crud_Id] ON [Crud] ([Id] ASC);
CREATE UNIQUE INDEX [Column_Column_Id] ON [Column] ([Id] ASC);
CREATE TRIGGER [fki_CrudEitem_EtableId_CrudEtable_Id] BEFORE Insert ON [CrudEitem] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Insert on table CrudEitem violates foreign key constraint FK_CrudEitem_CrudEtable') WHERE (SELECT Id FROM CrudEtable WHERE  Id = NEW.EtableId) IS NULL; END;
CREATE TRIGGER [fku_CrudEitem_EtableId_CrudEtable_Id] BEFORE Update ON [CrudEitem] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Update on table CrudEitem violates foreign key constraint FK_CrudEitem_CrudEtable') WHERE (SELECT Id FROM CrudEtable WHERE  Id = NEW.EtableId) IS NULL; END;
COMMIT;

