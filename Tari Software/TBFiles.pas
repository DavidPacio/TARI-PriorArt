unit TBFiles;
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
	Windows, Classes, Controls, SysUtils, stdctrls, DMClient, DMUsers, AuchTypes,
	variants, registry, inifiles, dialogs, LGLobals, DataCollector, LicenceEngine,
  DateUtils, DB, strUtils, IOUtils, DBTables, IB_Components, IB_Access,
  IB_Script, Forms;

type

  TTBFiles = class(TObject)
  private
  public
    function CreateNewFile(): boolean;
    function ConnectFile(FileAlias, Fname : String): Boolean;
    function GetDBVersion(FileAlias: string): string;
    function setDBVersion(FileAlias, newversion: string): Boolean;
    procedure UpdateAliasinfo(Filename, AliasName : string);
    procedure SetupNew;
    procedure CreateNewBusiness(NewName : string; NewFile: Boolean);
    procedure DisconnectFile;
  end;
var
  TBFile : TTBFiles;

implementation

// Data need to create a new file is provided by GGlobals.newBusiness Record.
Function TTBFiles.CreateNewFile():Boolean;
var
  MasterC, FileC : string;
  Newcopied : Boolean;
  Copysuccess : longbool;
begin
    if DataCollect.Planloaded = True then
      begin
      DataCollect.setPlanningData;
      DataCollect.ClearPlanDataList;
      end;
    DataModuleClient.ClientDatabase.Connected := False;
    if (GGlobals.FileLicence) and (DMuserM.getDataFilename(GGlobals.Servers.CurrentServer.CurrentDBAlias) = DEMOFILE) then
      begin
      sleep(1000);
      GGlobals.renewSampleDB;
      end;
    GGlobals.DebugOut('Old File Disconnected');
    if (Not GGlobals.FileLicence) or (Not GGlobals.NewDemoFile) then
      MasterC := GGlobals.Servers.CurrentServer.NetworkFolder + 'proto\Master.fdb'
    else
      MasterC := GGlobals.Servers.CurrentServer.NetworkFolder + 'proto\DemoMaster.fdb';
		GGLobals.Newbusiness.NewFileName := TPath.changeExtension(GGLobals.Newbusiness.NewFileName, 'FDB');  // Must be upper case for Linux and must have the extension
		Filec := AnsiUpperCase(GGlobals.Servers.CurrentServer.NetworkFolder + 'Data' + slashchar + GGLobals.Newbusiness.NewFileName);  // Must be upper case for Linux and must have the extension
    GGlobals.NewBusiness.DatabaseAlias := DMuserM.CreateAlias(GGLobals.Newbusiness.NewFileName);
    GGlobals.DebugOut('Created a New Alias for the new File' + GGlobals.NewBusiness.DatabaseAlias);
    DMUserM.TariDatabases.Insert;
		DMUserM.TariDatabasesDATABASE_ALIAS.AsString := GGlobals.NewBusiness.DatabaseAlias;
		DMUserM.TariDatabasesBUSINESS_NAME.AsString := GGlobals.NewBusiness.BusinessName;
		DMuserM.TariDatabasesFILE_NAME.AsString := GGLobals.Newbusiness.NewFileName;
    if AnsiSameText(LicEngine.licenceRec.BusinessFileName, GGLobals.Newbusiness.NewFileName) then
      DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 1
    else
      DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 0;
    DMUserM.TariDatabasesIS_MASTER.value := 0;
    DMUserM.TariDatabases.Post;
    GGlobals.DebugOut('Posted Entry into Mast DB for ' + GGlobals.NewBusiness.DatabaseAlias);
//    newcopied := CopyFileto(MasterC, FileC);
    Newcopied := True;
    Copysuccess := GGlobals.CopyMastFile(MasterC, FileC);
//    ShowMessage('AfterCopynew');
    if not Copysuccess then
      newcopied := False;
    GGlobals.DebugOut('Copies File for ' + GGlobals.NewBusiness.DatabaseAlias);
    if GGlobals.newDemoFile then
      GGlobals.LicenceThisFile := False;
    Sleep(cardinal(2000));
    result := newcopied;
end;

function TTBFiles.ConnectFile(FileAlias, Fname : String): Boolean;
var
  tempAlias : String;
  i : integer;
begin
  DataModuleClient.ClientDatabase.Connected := False;
  if GGlobals.FileLicence and (GGlobals.LicTemp) then
    begin
    // save the original alias
    tempalias := FileAlias;
    // Get Business File Name from licence file
    Fname := GGlobals.getLicenceFileName;
    FileAlias := DMuserM.GetAliasfromFilename(Fname);
    // create an alias
    if length(FileAlias) < 1 then
      FileAlias := DmUserM.CreateAlias(Fname);
    // if all else fails, get the original
    if length(FileAlias) < 1 then
      FileAlias := tempAlias;
    end;
  DataModuleClient.ClientDatabase.AliasName := FileAlias;
  DataModuleClient.ClientDatabase.Path := GGlobals.Servers.CurrentServer.ServerPath + 'data' + slashChar + DMuserM.getDataFilename(FileAlias);
    try
      DataModuleClient.ClientDatabase.Connected := True;
    except
      on E: EDBEngineError do
        begin
        for i:= 0 to E.ErrorCount - 1 do
          begin
          GGlobals.DebugOut('DBopen Error - File : ' + FileAlias);
          GGlobals.DebugOut('               Code : ' + inttoStr(E.Errors[i].Errorcode));
          GGlobals.DebugOut('               SubCode : ' + InttoStr(E.Errors[i].subCode));
          GGlobals.DebugOut('               Message : ' + E.Errors[i].Message);
          GGlobals.DebugOut('               NativeError : ' + InttoStr(E.Errors[i].NativeError));
          end;
        end;
    else
      ; //raise;
    end;
  result := DataModuleClient.ClientDatabase.Connected;
end;

function TTBFiles.GetDBVersion(FileAlias: string): string;
var
  dbCheckConnect : TIB_Connection;
  CheckdbTrans : TIB_Transaction;
  Checkdbcursor : TIB_Query;
  GrantScript : TIB_Script;
begin
  dbCheckConnect := TIB_Connection.Create(Application);
  Checkdbcursor := TIB_Query.Create(Application);
  CheckdbTrans := TIB_Transaction.Create(Application);
  GrantScript := TIB_Script.Create(Application);
  dbCheckConnect.DefaultTransaction := CheckdbTrans;
  Checkdbcursor.IB_Connection := dbcheckconnect;
  GrantScript.IB_Connection := dbCheckConnect;
  GrantScript.IB_Transaction := CheckdbTrans;
  Result := '';
  try
    try
    // the last _ is a connect string
      DBcheckConnect.server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;

      if AnsiSameText(Filealias, 'Master.fdb') then
        DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashchar + 'MASTER.FDB'
      else
        DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'data' + slashchar + DMUserM.getDataFilename(FileAlias);
      GGlobals.DebugOut('DBVersionCheck - Path = ' + DBcheckConnect.Path);
      dbCheckconnect.username := 'SYSDBA'; //'Admins';
      if length(GGlobals.Servers.CurrentServer.SysdbaPassword) > 0 then
        dbCheckConnect.password := GGlobals.Servers.CurrentServer.SysdbaPassword
      else
        dbCheckConnect.password := 'masterkey'; //GGlobals.Adminpwd;
      dbcheckConnect.SQLRole := 'FBMADMIN';
      dbCheckConnect.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
      GGlobals.DebugOut('DBVersionCheck - after Protocol');
      Checkdbtrans.IB_Connection := dbCheckConnect;
      dbCheckConnect.connected := True;

      Checkdbcursor.SQL.Clear;
      Checkdbcursor.SQL.Add('Select * from losystem for update;');
      Checkdbcursor.active := True;
      if Checkdbcursor.active then
        result := Checkdbcursor.fieldbyname('dbversion').value;
      GGlobals.CurrentDBPWD  := Checkdbcursor.fieldbyname('dbPassword').value;
      if CheckdbCursor.Fields.ColumnCount < 3 then
        begin
        if not AnsiSameText(Filealias, 'Master.fdb') then
          begin
          GrantScript.SQL.Clear;
          GrantScript.SQL.LoadFromFile(GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashchar + 'GrantSQL.sql'); //  Add('Grant ' + GGlobals.Servers.CurrentServer.CurrentUserrole + ' to ' + GGlobals.Servers.CurrentServer.CurrentuserName + ';');
          GrantScript.Prepare;
          GrantScript.Execute;
          CheckdbTrans.Commit;
          end;
        GrantScript.SQL.Clear;
        GrantScript.SQL.Add('ALTER TABLE losystem ADD GRANT_SET D_BOOLEAN NOT NULL;');
        GrantScript.Prepare;
        GrantScript.Execute;
        CheckdbTrans.Commit;

        GrantScript.SQL.Clear;
        GrantScript.SQL.Add('alter table LOSYSTEM alter GRANT_SET position 3;');
        GrantScript.Prepare;
        GrantScript.Execute;
        CheckdbTrans.Commit;

        dbCheckConnect.connected := false;
        dbCheckConnect.connected := True;
        Checkdbcursor.SQL.Clear;
        Checkdbcursor.SQL.Add('SELECT * FROM LOSYSTEM FOR UPDATE;');
        Checkdbcursor.Prepare;
        Checkdbcursor.active := True;
        Checkdbcursor.First;
        Checkdbcursor.Edit;
        Checkdbcursor.Fields.SetColumnValue('GRANT_SET', 1);
        checkdbcursor.Post;
        checkdbtrans.Commit;
        end;
      Checkdbcursor.SQL.Clear;
      Checkdbcursor.SQL.Add('Grant ' + GGlobals.Servers.CurrentServer.CurrentUserrole + ' to ' + GGlobals.Servers.CurrentServer.CurrentuserName + ';');
      Checkdbcursor.Execute;
      Checkdbtrans.Refresh(True);
    finally
      Checkdbcursor.active := False;
      dbCheckConnect.connected := false;
    end;
  except
  end;
  checkdbcursor.Free;
  GrantScript.Free;
  CheckdbTrans.Free;
  dbCheckConnect.Free;
  GGlobals.DebugOut('DBVersionCheck - Finished');
end;

{
function TTBFiles.GetDBVersion(FileAlias: string): string;
begin
  // This routine merely attempts to open and get DBVersion and DBPassword only then closes
  // Result carries DBversion, DBPassword is set globally
  Result := '';
  try
    try
    // the last _ is a connect string
      DMUserM.dbCheckConnect.Disconnect;
      DMUserM.dbCheckConnect.server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;
      if AnsiSameText(Filealias, 'Master.fdb') then
        DMUserM.DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashchar + 'MASTER.FDB'
      else
        DMUserM.DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'data' + slashchar + DMUserM.getDataFilename(FileAlias);
      GGlobals.DebugOut('DBVersionCheck - Path = ' + DMUserM.DBcheckConnect.Path);
      DMUserM.dbCheckconnect.username := 'SYSDBA'; //'Admins';
      if length(GGlobals.Servers.CurrentServer.SysdbaPassword) > 0 then
        DMUserM.dbCheckConnect.password := GGlobals.Servers.CurrentServer.SysdbaPassword
      else
        DMUserM.dbCheckConnect.password := 'masterkey'; //GGlobals.Adminpwd;
//      dbCheckConnect.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
      GGlobals.DebugOut('DBVersionCheck - after Protocol');
//      Checkdbtrans.IB_Connection := dbCheckConnect;
      DMUserM.dbCheckConnect.Connect; //ed := True;
      result := '';
      if (DMUserM.dbCheckConnect.connected) and DMUserM.TblLOSystem.Active then
        begin
}
{        DMUserM.GrantScript.SQL.Clear;
        DMUserM.GrantScript.SQL.Add('SET AUTODDL ON; UPDATE RDB$FIELDS SET RDB$Character_Set_ID = (Select C.Rdb$Character_Set_ID from Rdb$Character_Sets C where C.Rdb$Character_Set_Name=''ASCII'');');
        DMUserM.GrantScript.Prepare;
        DMUserM.GrantScript.Execute;
        DMUserM.dbCheckConnect.Commit;
}
{        if (DMUserM.TblLOSystem.FieldCount > 2) then
          begin
          Result := DMUserM.TblLOSystemDBVERSION.Asstring;
          GGlobals.CurrentDBPWD  := string(DMUserM.TblLOSystemDBPASSWORD.AsAnsiString);
          end;
}
{
        DMUserM.Checkdbcursor.active := False;
        DMUserM.Checkdbcursor.SQL.Clear;
        DMUserM.Checkdbcursor.SQL.Add('Select * from losystem');
        DMUserM.Checkdbcursor.Prepare;
        DMUserM.Checkdbcursor.active := True;
        if DMUserM.Checkdbcursor.active then
          result := DMUserM.Checkdbcursor.fieldbyname('dbversion').value;
        GGlobals.CurrentDBPWD  := DMUserM.Checkdbcursor.fieldbyname('dbPassword').value;
        if DMUserM.CheckdbCursor.FieldCount < 3 then
          begin
          if not AnsiSameText(Filealias, 'Master.fdb') then
            begin
            DMUserM.GrantScript.SQL.Clear;
            DMUserM.GrantScript.SQL.LoadFromFile(GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashchar + 'GrantSQL.sql'); //  Add('Grant ' + GGlobals.Servers.CurrentServer.CurrentUserrole + ' to ' + GGlobals.Servers.CurrentServer.CurrentuserName + ';');
            DMUserM.GrantScript.Prepare;
            DMUserM.GrantScript.Execute;
            DMUserM.dbCheckConnect.Commit;
            end;
          DMUserM.GrantScript.SQL.Clear;
          DMUserM.GrantScript.SQL.Add('ALTER TABLE losystem ADD GRANT_SET D_BOOLEAN NOT NULL;');
          DMUserM.GrantScript.Prepare;
          DMUserM.GrantScript.Execute;
          DMUserM.dbCheckConnect.Commit;

          DMUserM.GrantScript.SQL.Clear;
          DMUserM.GrantScript.SQL.Add('alter table LOSYSTEM alter GRANT_SET position 3;');
          DMUserM.GrantScript.Prepare;
          DMUserM.GrantScript.Execute;
          DMUserM.dbCheckConnect.Commit;

          DMUserM.dbCheckConnect.connected := false;
          DMUserM.dbCheckConnect.connected := True;
          DMUserM.Checkdbcursor.SQL.Clear;
          DMUserM.Checkdbcursor.SQL.Add('SELECT * FROM LOSYSTEM FOR UPDATE;');
          DMUserM.Checkdbcursor.Prepare;
          DMUserM.Checkdbcursor.active := True;
          DMUserM.Checkdbcursor.First;
          DMUserM.Checkdbcursor.Edit;
          DMUserM.Checkdbcursor.Fields.FieldByName('GRANT_SET').AsInteger := 1;
          DMUserM.checkdbcursor.Post;
          DMUserM.dbCheckConnect.Commit;
          end;
}
{
        DMUserM.GrantScript.SQL.Clear;
        DMUserM.GrantScript.SQL.Add('Grant ' + GGlobals.Servers.CurrentServer.CurrentUserrole + ' to ' + GGlobals.Servers.CurrentServer.CurrentuserName + ';');
        DMUserM.GrantScript.Prepare;
        DMUserM.GrantScript.Execute;
        DMUserM.dbCheckConnect.Commit;
}
{        end;
    finally
      ;
    end;
  except
  end;
  if (DMUserM.dbCheckConnect.Connected) then
    DMUserM.dbCheckConnect.Disconnect;
end;
}

function TTBFiles.setDBVersion(FileAlias, newversion: string): Boolean;
var
  dbCheckConnect : TIB_Connection;
  CheckdbTrans : TIB_Transaction;
  Checkdbcursor : TIB_Query;
begin
  dbCheckConnect := TIB_Connection.Create(Application);
  Checkdbcursor := TIB_Query.Create(Application);
  CheckdbTrans := TIB_Transaction.Create(Application);
  dbCheckConnect.DefaultTransaction := CheckdbTrans;
  Checkdbcursor.IB_Connection := dbcheckconnect;
  Result := False;
  try
    try
    // the last _ is a connect string
      DBcheckConnect.server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;

      if AnsiSameText(Filealias, 'Master.fdb') then
        DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashChar + ansiuppercase('master.fdb')
      else
        DBcheckConnect.Path := GGlobals.Servers.CurrentServer.ServerPath + 'data' + slashchar + ansiuppercase(DMuserM.getDataFilename(FileAlias));
      GGlobals.DebugOut('DBVersionCheck - Path = ' + DBcheckConnect.Path);
      dbCheckconnect.username := 'SYSDBA'; //'Admins';
      if length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
        dbCheckConnect.password := GGLobals.Servers.CurrentServer.SysdbaPassword
      else
        dbCheckConnect.password := 'masterkey'; //GGlobals.Adminpwd;
      dbcheckConnect.SQLRole := 'FBMAdmin';
      dbCheckConnect.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
      GGlobals.DebugOut('DBVersionCheck - after Protocol');
      Checkdbtrans.IB_Connection := dbCheckConnect;
      dbCheckConnect.connected := True;
      Checkdbcursor.SQL.Clear;
      Checkdbcursor.SQL.Add('SELECT * FROM LOSYSTEM FOR UPDATE;');
      Checkdbcursor.Prepare;
      Checkdbcursor.active := True;
      Checkdbcursor.First;
      Checkdbcursor.Edit;
      Checkdbcursor.Fields.SetColumnValue('DBVERSION', newversion);
      checkdbcursor.Post;
      checkdbtrans.Commit;
    finally
      result := True;
      checkdbcursor.Unprepare;
      Checkdbcursor.active := False;
      dbCheckConnect.connected := false;
    end;
  except
  end;
  checkdbcursor.Free;
  CheckdbTrans.Free;
  dbCheckConnect.Free;
  GGlobals.DebugOut('DBVersionCheck - Finished');
end;

procedure TTBFiles.UpdateAliasinfo(Filename, AliasName : string);
begin
  if DmUserM.TariDatabases.Locate('DATABASE_ALIAS', variant(AliasName), []) then
    DMUserM.TariDatabases.edit
  else
    DMUserM.TariDatabases.Insert;
	DMUserM.TariDatabasesDATABASE_ALIAS.asstring := AliasName;
  DMUserM.TariDatabasesBUSINESS_NAME.Value := ' ';
  if length(FileName) > 0 then
		DMuserM.TariDatabasesFILE_NAME.asstring := FileName;
	DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 0;
	DMUserM.TariDatabasesIS_MASTER.value := 0;
  if DataModuleClient.ClientDatabase.Connected then
		DMUserM.TariDatabasesBUSINESS_NAME.Value := DataModuleClient.BusinessDetailsBUSINESS_NAME.Value;
  DMUserM.TariDatabases.Post;
end;

procedure TTBFiles.SetupNew;
var
  I : integer;
begin
  GGlobals.DebugOut('File Opened for ' + GGlobals.NewBusiness.DatabaseAlias);
  DataModuleClient.BusinessDetails.Insert;
	DataModuleClient.BusinessDetailsBusiness_Name.AsString := GGlobals.NewBusiness.BusinessName;
  DataModuleClient.BusinessDetailsDATE_LAST_ACCESSED.Value := now;
  DataModuleClient.BusinessDetails.Post;

  // Setup Business / branch record
  CreateNewBusiness('Main Business', True);
  GGlobals.DebugOut('Updated Business Details for ' + GGlobals.NewBusiness.DatabaseAlias);
  if GGlobals.NewBusiness.Departments.Count < 1 then
    GGlobals.NewBusiness.Departments.Append(GGlobals.NewBusiness.BusinessName);
  if GGlobals.NewBusiness.Departments.Count > 1 then
    GGlobals.multidept := True
  else
    GGlobals.multidept := false;
  for I := 0 to GGlobals.NewBusiness.Departments.Count - 1 do    // Iterate
    begin
    DataModuleClient.Departments.Insert;
    DataModuleClient.DepartmentsDept_ID.value := I + 1;
		DataModuleClient.DepartmentsCurrency.AsString := GetLocaleCurrency;
		DataModuleClient.DepartmentsRevenue_Group_Name.AsString := GGlobals.NewBusiness.Departments.strings[I];
    DataModuleClient.DepartmentsLastDayofWeek.value := GGlobals.NewBusiness.lastDayofWeek;
    DataModuleClient.DepartmentsEXCLUDE_FROM_REPORTING.Value := 0;
    DataModuleClient.DepartmentsBRANCH_ID.Value := DataModuleClient.BusinessesBRANCH_ID.Value;
    DataModuleClient.Departments.Post;
    end;    // for
  GGlobals.DebugOut('Created Departments for ' + GGlobals.NewBusiness.DatabaseAlias);
  DataModuleClient.ClientDatabase.Refresh(True);
  DataModuleClient.DeptRef.Active := False;
  DataModuleClient.Departments.Active := False;
  DataModuleClient.DeptRef.Active := True;
  DataModuleClient.Departments.Active := True;
  GGlobals.NewBusiness.Departments.Free;
  GGlobals.NewBusiness.Departments := nil;
  GGlobals.DebugOut('Created Date Ranges for ' + GGlobals.NewBusiness.DatabaseAlias);
  GGLobals.NewDBSetup := True;
end;

procedure TTBFiles.CreateNewBusiness(NewName : string; NewFile: Boolean);
var
	Fsettings : TFormatSettings;
begin
// add
	Fsettings := TFormatSettings.Create();
//	GetLocaleFormatSettings(LOCALE_USER_DEFAULT, Fsettings);
  DataModuleClient.spCreateBusiness.ParamByName('BUS_NAME').Value := NewName;
  DataModuleClient.spCreateBusiness.ParamByName('CURR_SYMBOL').Value := Fsettings.CurrencyString;
  DataModuleClient.spCreateBusiness.ParamByName('CONVERSION').Value := 1.00;
  if DataModuleClient.Businesses.RecordCount > 0 then
    begin
    DataModuleClient.spCreateBusiness.ParamByName('CURR_NAME').Value := DataModuleClient.BusinessesCURRENCY.Value;
    DataModuleClient.spCreateBusiness.ParamByName('P_START').Value := DataModuleClient.BusinessesTARGET_START.Value;
    DataModuleClient.spCreateBusiness.ParamByName('P_END').Value := DataModuleClient.BusinessesTARGET_END.Value;
    end;
  DataModuleClient.spCreateBusiness.ParamByName('DEFAULT_DEPT').Value := DataModuleClient.DepartmentsDEPT_ID.Value;
  if NewFile then
    DataModuleClient.spCreateBusiness.ParamByName('LAST_DAY').Value := GGlobals.NewBusiness.lastDayofWeek;
  DataModuleClient.SPCreateBusiness.Execute;
  DataModuleClient.SPCreateBusiness.IB_Transaction.Commit;
  DataModuleClient.Businesses.Active := false;
  DataModuleClient.Businesses.Active := True;
end;

procedure TTBFiles.DisconnectFile;
begin
  if DataModuleClient.ClientDatabase.Connected then
    DataModuleClient.ClientDatabase.Connected := False;
end;

end.
