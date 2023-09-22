-- Script Date: 2023/9/19 下午 04:58  - ErikEJ.SqlCeScripting version 3.5.2.88
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [XpUserRole] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [RoleId] nvarchar(10) NOT NULL COLLATE NOCASE
, CONSTRAINT [PK_UserRole] PRIMARY KEY ([Id])
);
CREATE TABLE [XpTranLog] (
  [Sn] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [RowId] nvarchar(10) NOT NULL COLLATE NOCASE
, [TableName] nvarchar(30) NOT NULL COLLATE NOCASE
, [ColName] nvarchar(30) NULL COLLATE NOCASE
, [OldValue] nvarchar(500) NULL COLLATE NOCASE
, [NewValue] nvarchar(500) NULL COLLATE NOCASE
, [Act] nvarchar(10) NOT NULL COLLATE NOCASE
, [Created] datetime NOT NULL
);
CREATE TABLE [XpRoleProg] (
  [Id] nvarchar(10) NOT NULL
, [RoleId] nvarchar(10) NOT NULL COLLATE NOCASE
, [ProgId] nvarchar(10) NOT NULL COLLATE NOCASE
, [FunCreate] tinyint DEFAULT (0) NOT NULL
, [FunRead] tinyint DEFAULT (0) NOT NULL
, [FunUpdate] tinyint DEFAULT (0) NOT NULL
, [FunDelete] tinyint DEFAULT (0) NOT NULL
, [FunPrint] tinyint DEFAULT (0) NOT NULL
, [FunExport] tinyint DEFAULT (0) NOT NULL
, [FunView] tinyint DEFAULT (0) NOT NULL
, [FunOther] tinyint DEFAULT (0) NOT NULL
, CONSTRAINT [PK_RoleProg] PRIMARY KEY ([Id])
);
CREATE TABLE [XpRole] (
  [Id] nvarchar(10) NOT NULL
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
);
CREATE TABLE [XpProg] (
  [Id] nvarchar(10) NOT NULL
, [Code] nvarchar(30) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [Icon] nvarchar(20) NULL COLLATE NOCASE
, [Url] nvarchar(100) NULL COLLATE NOCASE
, [Sort] smallint NOT NULL
, [AuthRow] tinyint DEFAULT (0) NOT NULL
, [FunCreate] tinyint DEFAULT (0) NOT NULL
, [FunRead] tinyint DEFAULT (0) NOT NULL
, [FunUpdate] tinyint DEFAULT (0) NOT NULL
, [FunDelete] tinyint DEFAULT (0) NOT NULL
, [FunPrint] tinyint DEFAULT (0) NOT NULL
, [FunExport] tinyint DEFAULT (0) NOT NULL
, [FunView] tinyint DEFAULT (0) NOT NULL
, [FunOther] tinyint DEFAULT (0) NOT NULL
, CONSTRAINT [PK_Prog] PRIMARY KEY ([Id])
);
CREATE TABLE [XpImportLog] (
  [Id] nvarchar(10) NOT NULL
, [Type] nvarchar(10) NOT NULL COLLATE NOCASE
, [FileName] nvarchar(100) NOT NULL COLLATE NOCASE
, [OkCount] smallint NOT NULL
, [FailCount] smallint NOT NULL
, [TotalCount] smallint NOT NULL
, [CreatorName] nvarchar(30) NOT NULL COLLATE NOCASE
, [Created] datetime NOT NULL
, CONSTRAINT [PK_XpImportLog] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlowTest] (
  [Id] nvarchar(10) NOT NULL
, [InputJson] nvarchar(500) NOT NULL COLLATE NOCASE
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [Created] datetime NOT NULL
, [FlowLevel] tinyint NOT NULL
, [FlowStatus] nchar(1) NOT NULL COLLATE NOCASE
, CONSTRAINT [PK_XpFlowTest] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlowSignTest] (
  [Id] nvarchar(10) NOT NULL
, [FlowId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SourceId] nvarchar(10) NOT NULL COLLATE NOCASE
, [NodeName] nvarchar(30) NOT NULL COLLATE NOCASE
, [FlowLevel] smallint NOT NULL
, [TotalLevel] smallint NOT NULL
, [SignerId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SignerName] nvarchar(20) NOT NULL COLLATE NOCASE
, [SignStatus] nchar(1) NOT NULL COLLATE NOCASE
, [SignTime] datetime NULL
, [Note] nvarchar(255) NULL COLLATE NOCASE
, CONSTRAINT [PK_XpFlowSignTest] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlowSign] (
  [Id] nvarchar(10) NOT NULL
, [FlowId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SourceId] nvarchar(10) NOT NULL COLLATE NOCASE
, [NodeName] nvarchar(30) NOT NULL COLLATE NOCASE
, [FlowLevel] smallint NOT NULL
, [TotalLevel] smallint NOT NULL
, [SignerId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SignerName] nvarchar(20) NOT NULL COLLATE NOCASE
, [SignStatus] nchar(1) NOT NULL COLLATE NOCASE
, [SignTime] datetime NULL
, [Note] nvarchar(255) NULL COLLATE NOCASE
, CONSTRAINT [PK_FlowSign] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlowNode] (
  [Id] nvarchar(10) NOT NULL
, [FlowId] nvarchar(10) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [NodeType] nchar(1) NOT NULL COLLATE NOCASE
, [PosX] smallint NOT NULL
, [PosY] smallint NOT NULL
, [SignerType] nvarchar(2) NULL COLLATE NOCASE
, [SignerValue] nvarchar(30) NULL COLLATE NOCASE
, [PassType] nchar(1) NOT NULL COLLATE NOCASE
, [PassNum] smallint NULL
, CONSTRAINT [PK_FlowNode] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlowLine] (
  [Id] nvarchar(10) NOT NULL
, [FlowId] nvarchar(10) NOT NULL COLLATE NOCASE
, [StartNode] nvarchar(10) NOT NULL COLLATE NOCASE
, [EndNode] nvarchar(10) NOT NULL COLLATE NOCASE
, [CondStr] nvarchar(255) NULL COLLATE NOCASE
, [Sort] smallint NOT NULL
, CONSTRAINT [PK_FlowLine] PRIMARY KEY ([Id])
);
CREATE TABLE [XpFlow] (
  [Id] nvarchar(10) NOT NULL
, [Code] nvarchar(20) NOT NULL COLLATE NOCASE
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [Portrait] bit NOT NULL
, [Status] bit NOT NULL
, CONSTRAINT [PK_Flow] PRIMARY KEY ([Id])
);
CREATE TABLE [XpEasyRpt] (
  [Id] nvarchar(10) NOT NULL
, [Name] nvarchar(50) NOT NULL COLLATE NOCASE
, [TplFile] nvarchar(100) NOT NULL COLLATE NOCASE
, [ToEmails] nvarchar(500) NOT NULL COLLATE NOCASE
, [Sql] nvarchar(500) NOT NULL COLLATE NOCASE
, [Status] bit NOT NULL
, CONSTRAINT [PK_XpEasyRpt] PRIMARY KEY ([Id])
);
CREATE TABLE [XpCode] (
  [Type] nvarchar(20) NOT NULL
, [Value] nvarchar(10) NOT NULL COLLATE NOCASE
, [Name_zhHant] nvarchar(30) NOT NULL COLLATE NOCASE
, [Name_zhHans] nvarchar(30) NULL COLLATE NOCASE
, [Name_enUS] nvarchar(30) NULL COLLATE NOCASE
, [Sort] int NOT NULL
, [Ext] nvarchar(30) NULL COLLATE NOCASE
, [Note] nvarchar(255) NULL COLLATE NOCASE
, CONSTRAINT [PK_XpCode] PRIMARY KEY ([Type],[Value])
);
CREATE TABLE [UserSkill] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SkillName] nvarchar(30) NOT NULL COLLATE NOCASE
, [SkillDesc] nvarchar(500) NULL COLLATE NOCASE
, [Sort] int NOT NULL
, CONSTRAINT [PK_UserSkill] PRIMARY KEY ([Id])
);
CREATE TABLE [UserSchool] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [SchoolName] nvarchar(30) NOT NULL COLLATE NOCASE
, [SchoolDept] nvarchar(20) NULL COLLATE NOCASE
, [SchoolType] nvarchar(20) NULL COLLATE NOCASE
, [StartEnd] nvarchar(30) NULL COLLATE NOCASE
, [Graduated] bit NOT NULL
, CONSTRAINT [PK_UserSchool] PRIMARY KEY ([Id])
);
CREATE TABLE [UserLicense] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [LicenseName] nvarchar(30) NOT NULL COLLATE NOCASE
, [StartEnd] nvarchar(30) NULL COLLATE NOCASE
, [FileName] nvarchar(100) NULL COLLATE NOCASE
, CONSTRAINT [PK_UserLicense] PRIMARY KEY ([Id])
);
CREATE TABLE [UserLang] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [LangName] nvarchar(30) NOT NULL COLLATE NOCASE
, [ListenLevel] nchar(1) NOT NULL COLLATE NOCASE
, [SpeakLevel] nchar(1) NOT NULL COLLATE NOCASE
, [ReadLevel] nchar(1) NOT NULL COLLATE NOCASE
, [WriteLevel] nchar(1) NOT NULL COLLATE NOCASE
, [Sort] int NOT NULL
, CONSTRAINT [PK_UserLang] PRIMARY KEY ([Id])
);
CREATE TABLE [UserJob] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [JobName] nvarchar(30) NOT NULL COLLATE NOCASE
, [JobType] nvarchar(30) NULL COLLATE NOCASE
, [JobPlace] nvarchar(30) NULL COLLATE NOCASE
, [StartEnd] nvarchar(30) NULL COLLATE NOCASE
, [CorpName] nvarchar(30) NULL COLLATE NOCASE
, [CorpUsers] int DEFAULT (0) NOT NULL
, [IsManaged] bit NOT NULL
, [JobDesc] ntext NULL
, CONSTRAINT [PK_UserJob] PRIMARY KEY ([Id])
);
CREATE TABLE [User] (
  [Id] nvarchar(10) NOT NULL
, [Name] nvarchar(20) NOT NULL COLLATE NOCASE
, [Account] nvarchar(20) NOT NULL COLLATE NOCASE
, [Pwd] nvarchar(32) NOT NULL COLLATE NOCASE
, [DeptId] nvarchar(10) NOT NULL COLLATE NOCASE
, [PhotoFile] nvarchar(100) NULL COLLATE NOCASE
, [Status] bit NOT NULL
, CONSTRAINT [PK_User] PRIMARY KEY ([Id])
);
CREATE TABLE [Leave] (
  [Id] nvarchar(10) NOT NULL
, [UserId] nvarchar(10) NOT NULL COLLATE NOCASE
, [AgentId] nvarchar(10) NOT NULL COLLATE NOCASE
, [LeaveType] nchar(1) NOT NULL COLLATE NOCASE
, [StartTime] datetime NOT NULL
, [EndTime] datetime NOT NULL
, [Hours] numeric(5,1) NOT NULL
, [FileName] nvarchar(100) NULL COLLATE NOCASE
, [Status] bit NOT NULL
, [Creator] nvarchar(10) NOT NULL COLLATE NOCASE
, [Created] datetime NOT NULL
, [Reviser] nvarchar(10) NULL COLLATE NOCASE
, [Revised] datetime NULL
, [FlowLevel] tinyint NOT NULL
, [FlowStatus] nchar(1) NOT NULL COLLATE NOCASE
, CONSTRAINT [PK_Leave] PRIMARY KEY ([Id])
);
CREATE TABLE [Dept] (
  [Id] nvarchar(10) NOT NULL
, [Name] nvarchar(30) NOT NULL COLLATE NOCASE
, [MgrId] nvarchar(10) NOT NULL COLLATE NOCASE
, CONSTRAINT [PK_Dept] PRIMARY KEY ([Id])
);
CREATE TABLE [CustInput] (
  [Id] nvarchar(10) NOT NULL
, [FldText] nvarchar(10) NULL COLLATE NOCASE
, [FldInt] int NULL
, [FldDec] float NULL
, [FldCheck] bit NULL
, [FldRadio] tinyint NULL
, [FldSelect] nvarchar(10) NULL COLLATE NOCASE
, [FldDate] datetime NULL
, [FldDt] datetime NULL
, [FldFile] nvarchar(100) NULL COLLATE NOCASE
, [FldColor] nvarchar(10) NULL COLLATE NOCASE
, [FldTextarea] ntext NULL
, [FldHtml] ntext NULL
, CONSTRAINT [PK_CustInput] PRIMARY KEY ([Id])
);
CREATE TABLE [Cms] (
  [Id] nvarchar(10) NOT NULL
, [CmsType] nvarchar(10) NOT NULL COLLATE NOCASE
, [DataType] nvarchar(10) NULL COLLATE NOCASE
, [Title] nvarchar(255) NOT NULL COLLATE NOCASE
, [Text] ntext NULL
, [Html] ntext NULL
, [Note] nvarchar(255) NULL COLLATE NOCASE
, [FileName] nvarchar(100) NULL COLLATE NOCASE
, [StartTime] datetime NOT NULL
, [EndTime] datetime NOT NULL
, [Status] bit NOT NULL
, [Creator] nvarchar(10) NOT NULL COLLATE NOCASE
, [Created] datetime NOT NULL
, [Reviser] nvarchar(10) NULL COLLATE NOCASE
, [Revised] datetime NULL
, CONSTRAINT [PK_Cms] PRIMARY KEY ([Id])
);
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D56N9NW7WA','Peter','Adm');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D58BCT5HDA','Alex','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D58BCT5Z1A','Nick','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D58BCT6GNA','Peter','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC135FMA','Emma','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC135JYA','JS','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC1360KA','Kevin','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC136GAA','May','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC136YRA','Vincent','All');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC1Y04FA','Vincent','GM');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC249LWA','May','HR1');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SC298QMA','JS','DGM');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SGFY676A','Emma','DM');
INSERT INTO [XpUserRole] ([Id],[UserId],[RoleId]) VALUES (
'D8SGFY6PQA','Nick','DM');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
1,'Alex','User','Name','Alex Chen','Alex Chen2','Update','2021-12-24 17:47:13.810');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2,'Alex','User','Name','Alex Chen2','Alex Chen','Update','2021-12-24 19:09:34.533');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
1002,'Alex','User','PhotoFile',NULL,'Photo.png','Update','2022-01-09 22:48:18.640');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
1003,'Alex','User','PhotoFile','Photo.png','PhotoFile_Alex.jpg','Update','2022-01-09 22:52:02.527');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
1004,'D6ZMH4E87A','User','PhotoFile',NULL,'PhotoFile_Alex.jpg','Update','2022-01-09 23:20:30.367');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
1005,'Alex','User','PhotoFile','PhotoFile_Alex.jpg','Photo.png','Update','2022-01-09 23:41:14.253');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2002,'D8SBEGKE3A','User',NULL,NULL,NULL,'Create','2022-01-24 16:56:17.450');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2003,'D8SBEGKE3A','User','DeptId','GM','HR','Update','2022-01-24 16:56:43.317');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2004,'D8SBEGKE3A','User','Id','D8SBEGKE3A','Emma','Update','2022-01-24 16:57:18.150');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2005,'Emma','User','Account','Emma','ee','Update','2022-01-24 16:57:21.383');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2006,'Nick','User','Name','Nick Wang','Nick Chen','Update','2022-01-24 16:57:36.437');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2007,'Alex','User','Name','Alex Chen','Alex Li','Update','2022-01-24 16:57:47.123');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2008,'Luke','User',NULL,NULL,NULL,'Create','2022-01-24 16:58:26.630');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2009,'Kevin','User',NULL,NULL,NULL,'Create','2022-01-24 16:59:09.940');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2010,'May','User',NULL,NULL,NULL,'Create','2022-01-24 17:00:25.617');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2011,'JS','User',NULL,NULL,NULL,'Create','2022-01-24 17:01:05.573');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2012,'Vincent','User',NULL,NULL,NULL,'Create','2022-01-24 17:01:27.670');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2013,'D6ZMH4E87A','User',NULL,NULL,NULL,'Delete','2022-01-24 17:01:42.060');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2014,'D6ZMH4NU5A','User',NULL,NULL,NULL,'Delete','2022-01-24 17:01:42.067');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
2015,'Luke','User',NULL,NULL,NULL,'Delete','2022-01-24 17:04:16.367');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
3002,'D8TTR8LAKA','Leave',NULL,NULL,NULL,'Create','2022-01-25 11:36:57.303');
INSERT INTO [XpTranLog] ([Sn],[RowId],[TableName],[ColName],[OldValue],[NewValue],[Act],[Created]) VALUES (
4002,'Alex','User','PhotoFile','Photo.png','','Update','2022-01-30 00:09:49.940');
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'15YZSGVQSA','HR1','User',1,9,9,9,9,9,9,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'A01','Adm','User',1,1,1,1,1,1,1,1);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'A02','Adm','XpRole',1,1,1,1,1,1,1,1);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'A03','Adm','XpProg',1,1,1,1,1,1,1,1);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58A7JDDQA','All','Leave',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58A7JDJ9A','All','LeaveSign',0,1,1,0,0,0,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58A7JDU6A','All','XpFlowSign',0,1,0,0,0,0,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58A7JE9EA','All','CustInput',1,1,1,1,0,0,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58AUNJ8LA','DM','Leave',0,2,0,0,0,2,2,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58AUNJP2A','DM','LeaveSign',0,2,0,0,0,2,0,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58AUNK5DA','DM','XpFlowSign',0,2,0,0,0,2,0,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D58AWMKYTA','Adm','XpFlow',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6XLEHQXPA','Adm','UserExt',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6XLJ4J08A','Adm','UserImport',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y6ANAKQA','Adm','XpTranLog',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y6EJWKFA','Adm','CmsMsg',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y6EJWPQA','Adm','XpEasyRpt',1,1,1,1,1,1,1,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y708NTHA','Adm','Leave',0,9,0,0,0,9,9,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y708P7YA','Adm','LeaveSign',0,9,0,0,0,9,9,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D6Y708PK4A','Adm','XpFlowSign',0,9,0,0,0,9,9,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D8QT1VEETA','All','XpFlow',0,9,1,0,0,0,9,0);
INSERT INTO [XpRoleProg] ([Id],[RoleId],[ProgId],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'D8SGHYFMBA','All','XpFlowTest',0,9,0,0,0,0,9,0);
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'Adm','管理者');
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'All','所有人員');
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'DGM','副總經理');
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'DM','部門主管');
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'GM','總經理');
INSERT INTO [XpRole] ([Id],[Name]) VALUES (
'HR1','HR專員');
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'CmsMsg','CmsMsg','CmsMsg',NULL,'/CmsMsg/Read',11,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'CustInput','CustInput','CustInput',NULL,'/CustInput/Read',9,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'Leave','Leave','Leave',NULL,'/Leave/Read',1,1,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'LeaveSign','LeaveSign','LeaveSign',NULL,'/LeaveSign/Read',2,0,0,1,1,0,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'User','User','User',NULL,'/User/Read',5,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'UserExt','UserExt','UserExt',NULL,'/UserExt/Read',8,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'UserImport','UserImport','UserImport',NULL,'/UserImport/Read',10,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpEasyRpt','XpEasyRpt','XpEasyRpt',NULL,'/XpEasyRpt/Read',12,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpFlow','XpFlow','XpFlow',NULL,'/XpFlow/Read',3,0,1,1,1,1,0,0,0,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpFlowSign','XpFlowSign','XpFlowSign',NULL,'/XpFlowSign/Read',4,0,0,1,0,0,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpFlowTest','XpFlowTest','XpFlowTest',NULL,'/XpFlowTest/Read',3,0,0,1,1,0,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpProg','XpProg','XpProg',NULL,'/XpProg/Read',7,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpRole','XpRole','XpRole',NULL,'/XpRole/Read',6,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpProg] ([Id],[Code],[Name],[Icon],[Url],[Sort],[AuthRow],[FunCreate],[FunRead],[FunUpdate],[FunDelete],[FunPrint],[FunExport],[FunView],[FunOther]) VALUES (
'XpTranLog','XpTranLog','XpTranLog',NULL,'/XpTranLog/Read',13,0,1,1,1,1,0,0,1,0);
INSERT INTO [XpImportLog] ([Id],[Type],[FileName],[OkCount],[FailCount],[TotalCount],[CreatorName],[Created]) VALUES (
'D6ZMH4PAWA','User','UserImport.xlsx',2,0,2,'Peter Lin','2021-12-23 18:48:04.000');
INSERT INTO [XpImportLog] ([Id],[Type],[FileName],[OkCount],[FailCount],[TotalCount],[CreatorName],[Created]) VALUES (
'D6ZMS8SDBA','User','UserImport.xlsx',0,2,2,'Peter Lin','2021-12-23 18:54:02.000');
INSERT INTO [XpFlowTest] ([Id],[InputJson],[UserId],[Created],[FlowLevel],[FlowStatus]) VALUES (
'D8SVMQ1SMA','UserId: "Alex",
AgentId: "Kevin",
LeaveType: "S",
Hours: 8,','Alex','2022-01-24 23:41:55.407',0,'Y');
INSERT INTO [XpFlowTest] ([Id],[InputJson],[UserId],[Created],[FlowLevel],[FlowStatus]) VALUES (
'D8SWX5PQNA','UserId: "Alex",
AgentId: "Kevin",
LeaveType: "B",
Hours: 8,','Alex','2022-01-25 00:10:23.590',1,'0');
INSERT INTO [XpFlowTest] ([Id],[InputJson],[UserId],[Created],[FlowLevel],[FlowStatus]) VALUES (
'D8ZS2XDSVA','UserId: "Alex",
AgentId: "Kevin",
LeaveType: "S",
Hours: 8,','Alex','2022-01-28 14:43:35.967',1,'0');
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SVMQ6YCA','D8SJ9GL2CA','D8SVMQ1SMA','Start',0,3,'Alex','Alex Li','1','2022-01-24 23:41:55.310',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SVMQ7MFA','D8SJ9GL2CA','D8SVMQ1SMA','代理人',1,3,'Kevin','Kevin Lin','Y','2022-01-24 23:48:27.373',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SVMQ8J3A','D8SJ9GL2CA','D8SVMQ1SMA','部門主管',2,3,'Nick','Nick Chen','Y','2022-01-24 23:49:32.080',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SVMQ906A','D8SJ9GL2CA','D8SVMQ1SMA','HR專員',3,3,'May','May Chang','Y','2022-01-24 23:50:11.680',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5TYTA','D8SJ9GL2CA','D8SWX5PQNA','Start',0,5,'Alex','Alex Li','1','2022-01-25 00:10:23.447',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5UX0A','D8SJ9GL2CA','D8SWX5PQNA','代理人',1,5,'Kevin','Kevin Lin','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5VTBA','D8SJ9GL2CA','D8SWX5PQNA','部門主管',2,5,'Nick','Nick Chen','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5WQ9A','D8SJ9GL2CA','D8SWX5PQNA','HR專員',3,5,'May','May Chang','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5X6PA','D8SJ9GL2CA','D8SWX5PQNA','HR主管',4,5,'Emma','Emma Wang','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8SWX5XN1A','D8SJ9GL2CA','D8SWX5PQNA','副總',5,5,'JS','JS Lin','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8ZS2XFK0A','D8SJ9GL2CA','D8ZS2XDSVA','Start',0,3,'Alex','Alex Li','1','2022-01-28 14:43:35.877',NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8ZS2XGF8A','D8SJ9GL2CA','D8ZS2XDSVA','代理人',1,3,'Kevin','Kevin Lin','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8ZS2XGWWA','D8SJ9GL2CA','D8ZS2XDSVA','部門主管',2,3,'Nick','Nick Chen','0',NULL,NULL);
INSERT INTO [XpFlowSignTest] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8ZS2XHCNA','D8SJ9GL2CA','D8ZS2XDSVA','HR專員',3,3,'May','May Chang','0',NULL,NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'5ZMJQQQZZA','5ZM5H6ED1A','5ZMJQQQBYA','Start',0,2,'Alex','Alex Chen','1','2021-03-07 22:19:00.860',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'5ZMJQQR6KA','5ZM5H6ED1A','5ZMJQQQBYA','代理人',1,2,'Nick','Nick Wang','Y','2021-03-07 22:20:10.060',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'5ZMJQQRBCA','5ZM5H6ED1A','5ZMJQQQBYA','主管',2,2,'Nick','Nick Wang','Y','2021-03-07 22:20:28.310',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z20WX0AA','5ZM5H6ED1A','D6Z20WUQGA','Start',0,3,'Alex','Alex Chen','1','2021-12-23 11:34:15.750',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z20WXFKA','5ZM5H6ED1A','D6Z20WUQGA','代理人',1,3,'Nick','Nick Wang','Y','2021-12-23 11:44:08.340',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z20WXWCA','5ZM5H6ED1A','D6Z20WUQGA','主管',2,3,'Nick','Nick Wang','Y','2021-12-23 11:45:03.300',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z20WYBSA','5ZM5H6ED1A','D6Z20WUQGA','總經理',3,3,'Peter','Peter Lin','Y','2021-12-23 11:48:54.710',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z2T9YJXA','5ZM5H6ED1A','D6Z2T9WRSA','Start',0,3,'Alex','Alex Chen','1','2021-12-23 11:51:32.733',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z2T9Z0HA','5ZM5H6ED1A','D6Z2T9WRSA','代理人',1,3,'Nick','Nick Wang','Y','2021-12-23 11:52:25.713',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z2TA0C5A','5ZM5H6ED1A','D6Z2T9WRSA','主管',2,3,'Nick','Nick Wang','Y','2021-12-23 11:59:26.037',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D6Z2TA0TSA','5ZM5H6ED1A','D6Z2T9WRSA','總經理',3,3,'Peter','Peter Lin','Y','2021-12-23 11:59:49.550',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8P86BA8HA','5ZM5H6ED1A','D8P86B79QA','Start',0,3,'Peter','Peter Lin','1','2022-01-23 01:52:21.483',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8P8D6Y1JA','5ZM5H6ED1A','D8P8D638XA','Start',0,3,'Peter','Peter Lin','1','2022-01-23 01:56:51.610',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8P8GAN50A','5ZM5H6ED1A','D8P8GAM71A','Start',0,3,'Peter','Peter Lin','1','2022-01-23 01:58:53.803',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8QCLBDSTA','5ZM5H6ED1A','D8QCLBBS7A','Start',0,3,'Peter','Peter Lin','1','2022-01-23 16:07:52.647',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8QCLBKANA','5ZM5H6ED1A','D8QCLBBS7A','主管',2,3,'Peter','Peter Lin','0',NULL,NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8QCLBL7HA','5ZM5H6ED1A','D8QCLBBS7A','總經理',3,3,'Peter','Peter Lin','0',NULL,NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8TTR8PZTA','5ZM5H6ED1A','D8TTR8LAKA','Start',0,2,'Alex','Alex Li','1','2022-01-25 11:36:57.357',NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8TTR8QWLA','5ZM5H6ED1A','D8TTR8LAKA','代理人',1,2,'Kevin','Kevin Lin','0',NULL,NULL);
INSERT INTO [XpFlowSign] ([Id],[FlowId],[SourceId],[NodeName],[FlowLevel],[TotalLevel],[SignerId],[SignerName],[SignStatus],[SignTime],[Note]) VALUES (
'D8TTR8RBYA','5ZM5H6ED1A','D8TTR8LAKA','主管',2,2,'Nick','Nick Chen','0',NULL,NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZM5H6EFGA','5ZM5H6ED1A','Start','S',430,30,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZM5H6EGHA','5ZM5H6ED1A','代理人','N',410,140,'F','AgentId','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZM5H6EHCA','5ZM5H6ED1A','主管','N',450,250,'UM','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZM5H6EJBA','5ZM5H6ED1A','總經理','N',540,340,'DM','GM','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZM5H6EK3A','5ZM5H6ED1A','End','E',380,410,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZMDKNA2VA','5ZMDKNA0CA','Start','S',390,60,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZMDKNA3LA','5ZMDKNA0CA','Node','N',480,180,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'5ZMDKNA4HA','5ZMDKNA0CA','End','E',410,280,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D6Z38YQHRA','D6Z38YPM2A','Start','S',480,50,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D6Z38YQZ7A','D6Z38YPM2A','Node1','N',440,160,'U','UserId','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D6Z38YREEA','D6Z38YPM2A','Node2','N',530,260,'U','AgentId','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D6Z38YRV7A','D6Z38YPM2A','End','E',500,390,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GLJ9A','D8SJ9GL2CA','Start','S',490,10,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GLZWA','D8SJ9GL2CA','總經理','N',480,440,'R','GM','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GME9A','D8SJ9GL2CA','副總','N',420,360,'R','DGM','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GMW2A','D8SJ9GL2CA','HR主管','N',480,290,'DM','HR','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GNEDA','D8SJ9GL2CA','HR專員','N',420,230,'R','HR1','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GNV7A','D8SJ9GL2CA','部門主管','N',480,150,'UM','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GPARA','D8SJ9GL2CA','代理人','N',480,80,'F','AgentId','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GPRAA','D8SJ9GL2CA','End','E',630,490,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GQ79A','D8SJ9GL2CA','End','E',370,440,'','','0',NULL);
INSERT INTO [XpFlowNode] ([Id],[FlowId],[Name],[NodeType],[PosX],[PosY],[SignerType],[SignerValue],[PassType],[PassNum]) VALUES (
'D8SJ9GQQLA','D8SJ9GL2CA','End','E',350,280,'','','0',NULL);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZM8EBAEMA','5ZM5H6ED1A','5ZM5H6EFGA','5ZM5H6EGHA','',0);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZM8EBAFJA','5ZM5H6ED1A','5ZM5H6EGHA','5ZM5H6EHCA','',1);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZM8EBAGPA','5ZM5H6ED1A','5ZM5H6EHCA','5ZM5H6EJBA','Hours,GE,24',2);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZM8EBAHJA','5ZM5H6ED1A','5ZM5H6EHCA','5ZM5H6EK3A','',3);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZM8EBAJQA','5ZM5H6ED1A','5ZM5H6EJBA','5ZM5H6EK3A','',4);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZMDKNA5PA','5ZMDKNA0CA','5ZMDKNA2VA','5ZMDKNA3LA','',0);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'5ZMDKNA6NA','5ZMDKNA0CA','5ZMDKNA3LA','5ZMDKNA4HA','',1);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D6Z38YSBRA','D6Z38YPM2A','D6Z38YQHRA','D6Z38YQZ7A','',0);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D6Z38YSSSA','D6Z38YPM2A','D6Z38YQZ7A','D6Z38YREEA','',1);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D6Z38YT8TA','D6Z38YPM2A','D6Z38YREEA','D6Z38YRV7A','',2);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GR5DA','D8SJ9GL2CA','D8SJ9GLJ9A','D8SJ9GPARA','',0);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GRLUA','D8SJ9GL2CA','D8SJ9GPARA','D8SJ9GNV7A','',1);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GS2YA','D8SJ9GL2CA','D8SJ9GNV7A','D8SJ9GNEDA','',2);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GSLEA','D8SJ9GL2CA','D8SJ9GNEDA','D8SJ9GMW2A','Hours,GT,8{O}LeaveType,EQ,B{O}LeaveType,EQ,P',3);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GT0HA','D8SJ9GL2CA','D8SJ9GMW2A','D8SJ9GME9A','',4);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GTF7A','D8SJ9GL2CA','D8SJ9GME9A','D8SJ9GLZWA','Hours,GT,24',5);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GTXSA','D8SJ9GL2CA','D8SJ9GNEDA','D8SJ9GQQLA','',6);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GUE9A','D8SJ9GL2CA','D8SJ9GME9A','D8SJ9GQ79A','',7);
INSERT INTO [XpFlowLine] ([Id],[FlowId],[StartNode],[EndNode],[CondStr],[Sort]) VALUES (
'D8SJ9GUVLA','D8SJ9GL2CA','D8SJ9GLZWA','D8SJ9GPRAA','',8);
INSERT INTO [XpFlow] ([Id],[Code],[Name],[Portrait],[Status]) VALUES (
'5ZM5H6ED1A','Leave','請假',1,1);
INSERT INTO [XpFlow] ([Id],[Code],[Name],[Portrait],[Status]) VALUES (
'5ZMDKNA0CA','Test1','測試1',1,1);
INSERT INTO [XpFlow] ([Id],[Code],[Name],[Portrait],[Status]) VALUES (
'D6Z38YPM2A','Test2','測試2',1,1);
INSERT INTO [XpFlow] ([Id],[Code],[Name],[Portrait],[Status]) VALUES (
'D8SJ9GL2CA','Leave2','請假2',1,1);
INSERT INTO [XpEasyRpt] ([Id],[Name],[TplFile],[ToEmails],[Sql],[Status]) VALUES (
'D71J9T4NYA','用戶資料報表','User.xlsx','youremail@gmail.com','select Name,Account,DeptId,Status 
from dbo.[User]
where status=1
order by Id',1);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AndOr','{A}','And','And','And',1,'Flow','括號for避開regular');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AndOr','{O}','Or','Or','Or',2,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AuthRange','0','無','無','無',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AuthRange','1','個人','個人','個人',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AuthRange','2','部門','部門','部門',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'AuthRange','9','全部','全部','全部',9,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'FlowStatus','0','簽核中','簽核中','簽核中',1,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'FlowStatus','N','拒絶','拒絶','拒絶',3,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'FlowStatus','Y','同意','同意','同意',2,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LangLevel','1','略懂','略懂','略懂',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LangLevel','2','普通','普通','普通',2,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LangLevel','3','精通','精通','精通',3,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LeaveType','B','公假','公假','公假',3,NULL,'business');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LeaveType','P','事假','事假','事假',2,NULL,'private');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LeaveType','S','病假','病假','病假',1,NULL,'sick');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','EQ','=','=','=',1,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','GE','>=','>=','>=',4,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','GT','>','>','>',3,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','NEQ','!=','!=','!=',2,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','SE','<=','<=','<=',6,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'LineOp','ST','<','<','<',5,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','CmsMsg','11.最新消息維護','11.最新消息維護','11.最新消息維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','CustInput','9.自訂輸入欄位','9.自訂輸入欄位','9.自訂輸入欄位',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','Leave','1.請假作業','1.請假作業','1.請假作業',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','LeaveSign','2.待簽核假單','2.待簽核假單','2.待簽核假單',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','User','5.用戶管理','5.用戶管理','5.用戶管理',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','UserExt','8.用戶經歷維護','8.用戶經歷維護','8.用戶經歷維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','UserImport','10.匯入用戶資料','10.匯入用戶資料','10.匯入用戶資料',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpEasyRpt','12.簡單報表維護','12.簡單報表維護','12.簡單報表維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpFlow','3.流程維護','3.流程維護','3.流程維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpFlowSign','4.簽核資料查詢','4.簽核資料查詢','4.簽核資料查詢',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpFlowTest','3b.流程(測試)','3b.流程(測試)','3b.流程(測試)',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpProg','7.功能維護','7.功能維護','7.功能維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpRole','6.角色維護','6.角色維護','6.角色維護',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'Menu','XpTranLog','13.異動記錄查詢','13.異動記錄查詢','13.異動記錄查詢',1,NULL,NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeLimitType','1','不限制','不限制','不限制',1,'Flow','暫不使用');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeLimitType','2','立即執行','立即執行','立即執行',2,'Flow','暫不使用');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeLimitType','3','限制時間','限制時間','限制時間',3,'Flow','暫不使用');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeType','A','自動','自動','自動',4,'Flow','暫不使用');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeType','E','結束','結束','結束',2,'Flow','end');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeType','N','一般','一般','一般',3,'Flow','normal');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'NodeType','S','開始','開始','開始',1,'Flow','start');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'PassType','1','任一人簽核','任一人簽核','任一人簽核',1,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'PassType','C','達簽核人數','達簽核人數','達簽核人數',2,'Flow','count');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignerType','DM','部門主管','部門主管','部門主管',5,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignerType','F','指定欄位','指定欄位','指定欄位',2,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignerType','R','指定角色','指定角色','指定角色',3,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignerType','U','指定用戶','指定用戶','指定用戶',1,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignerType','UM','用戶主管','用戶主管','用戶主管',4,'Flow','用戶部門主管');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignStatus','0','未簽核','未簽核','未簽核',1,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignStatus','1','送出','送出','送出',2,'Flow',NULL);
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignStatus','N','拒絶','拒絶','拒絶',4,'1','for LeaveSign');
INSERT INTO [XpCode] ([Type],[Value],[Name_zhHant],[Name_zhHans],[Name_enUS],[Sort],[Ext],[Note]) VALUES (
'SignStatus','Y','同意','同意','同意',3,'1','for LeaveSign');
INSERT INTO [UserSkill] ([Id],[UserId],[SkillName],[SkillDesc],[Sort]) VALUES (
'5XLQHPB6KA','Alex','系統框架開發','',0);
INSERT INTO [UserSkill] ([Id],[UserId],[SkillName],[SkillDesc],[Sort]) VALUES (
'5YG7AZMS4A','Alex','專案管理','',1);
INSERT INTO [UserSchool] ([Id],[UserId],[SchoolName],[SchoolDept],[SchoolType],[StartEnd],[Graduated]) VALUES (
'5XL9R3JE9A','Alex','大學1','資訊','大學','2005/9 ~ 2009/6',1);
INSERT INTO [UserSchool] ([Id],[UserId],[SchoolName],[SchoolDept],[SchoolType],[StartEnd],[Graduated]) VALUES (
'5YG7AZMHCA','Alex','研究所1','資訊','研究所','2009/9 ~ 2011/6',1);
INSERT INTO [UserLicense] ([Id],[UserId],[LicenseName],[StartEnd],[FileName]) VALUES (
'5XTM6SN9FA','Alex','系統分析師','2016/12 ~ 2017/9','');
INSERT INTO [UserLicense] ([Id],[UserId],[LicenseName],[StartEnd],[FileName]) VALUES (
'5Y1MNT0KXA','Alex','專案管理師','2018/12 ~ 2019/9','dog.jpg');
INSERT INTO [UserLang] ([Id],[UserId],[LangName],[ListenLevel],[SpeakLevel],[ReadLevel],[WriteLevel],[Sort]) VALUES (
'5XL9RMXH3A','Alex','中文',' ',' ',' ',' ',0);
INSERT INTO [UserLang] ([Id],[UserId],[LangName],[ListenLevel],[SpeakLevel],[ReadLevel],[WriteLevel],[Sort]) VALUES (
'5YG7AZMLFA','Alex','英文',' ',' ',' ',' ',1);
INSERT INTO [UserJob] ([Id],[UserId],[JobName],[JobType],[JobPlace],[StartEnd],[CorpName],[CorpUsers],[IsManaged],[JobDesc]) VALUES (
'5XLQJ73PZA','Alex','程式設計師','PG','台北市','2011/12 ~ 2015/9','公司1',10,0,'77123');
INSERT INTO [UserJob] ([Id],[UserId],[JobName],[JobType],[JobPlace],[StartEnd],[CorpName],[CorpUsers],[IsManaged],[JobDesc]) VALUES (
'5YG7AZMCJA','Alex','系統分析師','SA','台北市','2016/12 ~ 2019/9','公司2',50,0,'test');
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Alex','Alex Li','aa','aa','RD','',1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Emma','Emma Wang','ee','ee','HR',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'JS','JS Lin','jj','jj','GM',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Kevin','Kevin Lin','kk','kk','RD',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'May','May Chang','mm','mm','HR',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Nick','Nick Chen','nn','nn','RD',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Peter','Peter Lin','pp','pp','GM',NULL,1);
INSERT INTO [User] ([Id],[Name],[Account],[Pwd],[DeptId],[PhotoFile],[Status]) VALUES (
'Vincent','Vincent Wang','vv','vv','GM',NULL,1);
INSERT INTO [Leave] ([Id],[UserId],[AgentId],[LeaveType],[StartTime],[EndTime],[Hours],[FileName],[Status],[Creator],[Created],[Reviser],[Revised],[FlowLevel],[FlowStatus]) VALUES (
'5ZMJQQQBYA','Alex','Nick','S','2021-03-10 09:00:00.000','2021-03-10 18:00:00.000',8.0,'醫院証明.jpg',1,'Alex','2021-03-07 22:19:00.000','Alex','2021-12-23 13:15:50.000',3,'Y');
INSERT INTO [Leave] ([Id],[UserId],[AgentId],[LeaveType],[StartTime],[EndTime],[Hours],[FileName],[Status],[Creator],[Created],[Reviser],[Revised],[FlowLevel],[FlowStatus]) VALUES (
'D6Z20WUQGA','Alex','Nick','P','2021-12-01 09:00:00.000','2021-12-01 18:00:00.000',8.0,'',1,'Alex','2021-12-23 11:34:15.000',NULL,NULL,4,'Y');
INSERT INTO [Leave] ([Id],[UserId],[AgentId],[LeaveType],[StartTime],[EndTime],[Hours],[FileName],[Status],[Creator],[Created],[Reviser],[Revised],[FlowLevel],[FlowStatus]) VALUES (
'D6Z2T9WRSA','Alex','Nick','P','2021-12-03 09:00:00.000','2021-12-03 18:00:00.000',8.0,'',1,'Alex','2021-12-23 11:51:32.000',NULL,NULL,4,'Y');
INSERT INTO [Leave] ([Id],[UserId],[AgentId],[LeaveType],[StartTime],[EndTime],[Hours],[FileName],[Status],[Creator],[Created],[Reviser],[Revised],[FlowLevel],[FlowStatus]) VALUES (
'D8TTR8LAKA','Alex','Kevin','S','2022-01-01 08:00:00.000','2022-01-01 17:00:00.000',8.0,'',1,'Kevin','2022-01-25 11:36:57.000',NULL,NULL,1,'0');
INSERT INTO [Dept] ([Id],[Name],[MgrId]) VALUES (
'GM','管理部(GM)','Peter');
INSERT INTO [Dept] ([Id],[Name],[MgrId]) VALUES (
'HR','人事部(HR)','Emma');
INSERT INTO [Dept] ([Id],[Name],[MgrId]) VALUES (
'RD','研發部(RD)','Nick');
INSERT INTO [CustInput] ([Id],[FldText],[FldInt],[FldDec],[FldCheck],[FldRadio],[FldSelect],[FldDate],[FldDt],[FldFile],[FldColor],[FldTextarea],[FldHtml]) VALUES (
'D6Z5Q6JUSA','test3',2,1.5,0,1,'1','2021-12-01 00:00:00.000','2021-12-03 09:20:00.000','cat3.jpg',NULL,'line1
line2','<p><b style=""><font color="#ff9c00">123</font><font color="#0000ff">456</font></b></p><p>abc</p><p><img src="/image/CustInput/D93MTE720A.jpg"><br></p>');
INSERT INTO [Cms] ([Id],[CmsType],[DataType],[Title],[Text],[Html],[Note],[FileName],[StartTime],[EndTime],[Status],[Creator],[Created],[Reviser],[Revised]) VALUES (
'D6ZF8WZ96A','Msg',NULL,'系統維護公告','系統為提升更好的服務品質，並因應 Windows 公告重大修補漏洞更新，本系統安排於 110/12/30 (星期四) AM 10:00-12:00 進行系統維護作業，屆時將暫停相關服務。
造成不便，敬請見諒！',NULL,'','','2021-12-30 00:00:00.000','2021-12-30 12:00:00.000',1,'Peter','2021-12-23 16:29:02.000',NULL,NULL);
COMMIT;

