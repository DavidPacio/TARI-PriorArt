Unit DMUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, auchTypes,
  {$IFDEF Embedded}IB_Session511, {$ENDIF}IB_Components, IB_Session,
  IBODataset, registry, {stsystem, StBase, StSpawn,} DataCollector,
	ExtCtrls, IDGlobal, variants, LGlobals, IB_Process, IB_Script, IB_Access, clMultiDC, LicenceCalc,
	clSingleDC, clUploader, clHtmlParser, clHttpRequest, clConnection;
type
  TDMUserM = class(TDataModule)
    FBMADMINDB: TIBODatabase;
    DSUsers: TDataSource;
    DSTARIDatabases: TDataSource;
    TARIDatabases: TIBOTable;
    TARIDatabasesDATABASE_ALIAS: TStringField;
    TARIDatabasesBUSINESS_NAME: TStringField;
    TARIDatabasesFILE_NAME: TStringField;
    TARIDatabasesLICENCED_TO_ACCESS: TSmallintField;
    TARIDatabasesIS_MASTER: TSmallintField;
    UserRoles: TIBOTable;
    UserRolesROLE_NAME: TStringField;
    DSUserRoles: TDataSource;
    DBServers: TIBOTable;
    DBServersSERVERNAME: TStringField;
    DBServersSERVERDESC: TStringField;
    DBServersADMINFOLDER: TStringField;
    DBServersLOKONFOLDER: TStringField;
    DBServersNETWORKPATH: TStringField;
    DSDBServers: TDataSource;
    UserRolesROLE_DESCRIPTION: TStringField;
    Rolesref: TIBOTable;
    DSRolesref: TDataSource;
    RolesrefROLE_NAME: TStringField;
    RolesrefROLE_DESCRIPTION: TStringField;
    Users: TIBOTable;
    UsersUSER_NAME: TStringField;
    UsersFIRST_NAME: TStringField;
    UsersMIDDLE_NAME: TStringField;
    UsersLAST_NAME: TStringField;
    UsersLOK_ON_ROLE: TStringField;
    usersROLE_DESCRIPTION: TStringField;
    qryListofTables: TIB_Query;
    CreateLicencingScript: TIB_Script;
//    clInternetConnection1: TclInternetConnection;
//		clHtmlParser1: TclHtmlParser;
//    clUploader1: TclUploader;
    Licencing: TIBOTable;
    LicencingLIC_ID: TIntegerField;
    LicencingBUSINESS_NAME: TStringField;
    LicencingCONTACT_NAME: TStringField;
    LicencingADDRESS1: TStringField;
    LicencingADDRESS2: TStringField;
    LicencingSUBURB: TStringField;
    LicencingSTATE_REGION: TStringField;
    LicencingPOST_CODE: TStringField;
    LicencingCOUNTRY: TStringField;
    LicencingPHONE_NUMBER: TStringField;
    LicencingFAX_NUMBER: TStringField;
    LicencingEMAIL_ADDRESS: TStringField;
    LicencingSERIALNUMBER: TStringField;
    LicencingSUPPLIER_ID: TIntegerField;
    LicencingSITENUMBER: TIntegerField;
    LicencingLICENCEENAME: TStringField;
    LicencingLICENCETYPE: TStringField;
    LicencingBUSINESSFILENAME: TStringField;
    LicencingEXPIRYDATE: TDateField;
    LicencingNUMBEROFUSERS: TIntegerField;
    LicencingLICENCENUMBER: TStringField;
    clInternetConnection1: TclInternetConnection;
    clUploader1: TclUploader;
    clHttpRequest1: TclHttpRequest;
    clHtmlParser1: TclHtmlParser;
    UsersDBPASSWORD: TVarBytesField;
    dbCheckConnect: TIBODatabase;
    checkDBCursor: TIBOQuery;
    GrantScript: TIB_Script;
    TblLOSystem: TIBOTable;
    TblLOSystemDBVERSION: TStringField;
    TblLOSystemDBPASSWORD: TVarBytesField;
    TblLOSystemGRANT_SET: TSmallintField;
    procedure UsersBeforeEdit(IB_Dataset: TIB_Dataset);
    procedure UsersBeforePost(IB_Dataset: TIB_Dataset);
    procedure UsersBeforeInsert(IB_Dataset: TIB_Dataset);
    procedure FBMADMINDBAfterConnect(Sender: TIB_Connection);
    procedure FBMADMINDBBeforeConnect(Sender: TIB_Connection);
    procedure UsersQLOK_ON_ROLEChange(Sender: TField);
    procedure UsersAfterInsert(DataSet: TDataSet);
    procedure UsersAfterEdit(DataSet: TDataSet);
    procedure UsersAfterDelete(DataSet: TDataSet);
    procedure UsersAfterPost(DataSet: TDataSet);
    procedure UsersPASSSTRINGGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UsersPASSSTRINGSetText(Sender: TField; const Text: string);
    procedure dbCheckConnectAfterConnect(Sender: TIB_Connection);
    procedure dbCheckConnectBeforeDisconnect(Sender: TIB_Connection);
  private
    { Private declarations }
    UserAction : TIB_AlterUserAction;
    function TestAlias(FileAlias : string): Boolean;
    function parsedate(instr: string): TDateTime;
  public
    { Public declarations }
    EditingAdmin : Boolean;
		DMLicrec : TLicenceRecPtr;
    Function SetLoginPassword(Username, Password: string): boolean;
    function getadminpwd: string;
    function getDataFilename(FileAlias : string): string;
    function CreateAlias(newfileName : string): string;
    function GetDBAlias(BusinessFileName : String): string;
    function GetAliasfromFilename(FileName : string): string;
    function DoHttpLicence(showerrors : boolean): Boolean;
  end;

var
  DMUserM: TDMUserM;

implementation

{$R *.DFM}

function TDMUserM.getadminpwd: string;
begin
  users.first;
  Result := 'admins';
  while (users.eof = False) and (UsersUSER_NAME.Value <> 'Admins') do ;
  if UsersUSER_NAME.Value = 'Admins' then Result := usersdbpassword.value;
end;

function TDMUserM.SetLoginPassword(Username, Password: string): boolean;
var
  varg : variant;
begin
  result := True;
  varg := UserName;
end;

procedure TDMUserM.UsersBeforeEdit(IB_Dataset: TIB_Dataset);
begin
  if UsersUser_Name.value = 'Admins' then
    EditingAdmin := True
  else
    EditingAdmin := False;
end;

procedure TDMUserM.UsersBeforePost(IB_Dataset: TIB_Dataset);
begin
  if EditingAdmin then
  begin
    UsersUser_name.Value := 'Admins';
  end
  else if length(UsersDbPassword.value) = 0 then
  begin
    if not (DSUsers.State in [dsInsert, dsEdit]) then DSUsers.Edit;
    UsersDbPassword.value := 'admins';
  end;
end;

procedure TDMUserM.UsersPASSSTRINGGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := UsersDBPASSWORD.AsString;
end;

procedure TDMUserM.UsersPASSSTRINGSetText(Sender: TField; const Text: string);
begin
  UsersDBPASSWORD.AsString := text;
end;

procedure TDMUserM.UsersBeforeInsert(IB_Dataset: TIB_Dataset);
begin
  EditingAdmin := False;
end;

function Dirfilter(const SR: TSearchRec; Forinclusion : Boolean;
  var Abort : Boolean): Boolean;
begin
    Result := True;
end;

function TDMUserM.GetAliasfromFilename(FileName : string): string;
var
  varg : Variant;
begin
  Result := '';
  varg := UpperCase(FileName);
  if TariDatabases.Locate('FILE_NAME', Varg, []) then
		Result := TariDatabasesDATABASE_ALIAS.AsString
  else
    result := '';
end;

function TDMUserM.getDataFilename(FileAlias : string): string;
var
  varg : Variant;
begin
  Result := '';
  varg := FileAlias;
  if TariDatabases.Locate('DATABASE_ALIAS', Varg, []) then
		Result := AnsiUpperCase(TariDatabasesFILE_NAME.asstring)
  else
    result := AnsiUpperCase(DEMOFILE);
end;

function TDMUserM.GetDBAlias(BusinessFileName : String): string;
var
  varg : Variant;
begin
  Result := '';
  varg := UpperCase(BusinessFileName);
  if TariDatabases.Locate('FILE_NAME', Varg, []) then
		Result := TariDatabasesDATABASE_ALIAS.asstring;
end;

function TDMUserM.TestAlias(FileAlias : string): Boolean;
var
  varg : Variant;
begin
  Result := False;
  varg := FileAlias;
  TariDatabases.First;
  while TariDatabases.Eof = False do
  begin
		if TariDatabasesDATABASE_ALIAS.asstring = filealias then
    begin
      Result := True;
      exit;
    end;
    TariDatabases.Next;
  end;
end;

function TDMUserM.CreateAlias(newfileName : string): string;
Var
  I : integer;
  FI : Double;
  Tempstr : string;
  tempC : array[0..200] of char;
  temp1C : array[0..200] of char;
begin
  // lets try the first word up to space or .
  StrPcopy(tempC, newfilename);
  I := 0;
  while (TempC[I] <> ' ') and (TempC[I] <> '.') and (TempC[I] <> #0) and (I < 199) do
  begin
    Temp1C[I] := TempC[I];
    Inc(i);
  end;    // while
  Temp1C[I] := #0;
  Tempstr := STRPas(Temp1C);
  if not TestAlias(TempStr) then
    Result := TempStr
  else
  begin
    FI := 0;
    while TestAlias(TempStr+ FormatFloat('000', FI)) do
    FI := FI + 1;
    result := TempStr+ FormatFloat('000', FI);
  end;
end;

procedure TDMUserM.FBMADMINDBAfterConnect(Sender: TIB_Connection);
var
  NeedtoAdd, Adminfound : Boolean;
	Fextension : string;
begin
	TariDatabases.Active := True;
	Users.Active := True;
	UserRoles.Active := True;
	RolesRef.Active := True;
	AdminFound := False;
	Users.first;
	if FBMADMINDB.Protocol <> cplocal then
    begin
    while Users.eof = False do
      begin
			needtoadd := False;
			if UsersUser_name.AsString = 'Admins' then
				Adminfound := True;
			if not (UsersUSER_NAME.AsString = 'SYSDBA') then
				begin
				try
//					strPLCopy(LPassword, trim(UsersDBPassword.AsString), 8);
					FBMADMINDB.AlterUser(uaModifyUser,
						trim(UsersUSER_NAME.asstring),
						system.String(UsersDBPassword.AsAnsiString),
            '',
						Trim(UsersFIRST_NAME.AsString),
						Trim(UsersMIDDLE_NAME.asstring),
						Trim(UsersLAST_NAME.AsString));
        except // wrap up
        on e: EIB_ISCError do NeedtoAdd := True;
        end;    // try/finally
        if NeedtoAdd then
          begin
            try
            FBMADMINDB.AlterUser(uaAddUser,
							trim(UsersUSER_NAME.AsString),
							system.String(UsersDBPassword.AsAnsiString),
              '',
							Trim(UsersFIRST_NAME.AsString),
							Trim(UsersMIDDLE_NAME.AsString),
							Trim(UsersLAST_NAME.AsString));
            except // wrap up
              on e: EIB_ISCError do ;
            end;    // try/finally
          end;
        end;
        Users.Next;
      end;    // while
    If Not AdminFound Then
      begin
      Users.Insert;
			UsersUSER_NAME.AsString := 'Admins';
			Usersdbpassword.AsString := 'admins';
			UsersLOK_ON_ROLE.AsString := 'FBMADMIN';
      Users.Post;
      end;
    end;
  if TariDatabases.RecordCount = 0 then
  begin
    Taridatabases.Insert;
		TariDatabasesDatabase_alias.AsString := DEMONAME;
		TariDatabasesBusiness_Name.AsString := 'Sample Pty Ltd';
		TariDatabasesFile_Name.asstring := DEMOFILE;
		TariDatabasesLICENCED_TO_ACCESS.value := 1;
		TariDatabasesIS_Master.Value := 0;
    Taridatabases.Post;
  end;
  if GGlobals.Servers.CurrentServer.CorrectAdmin then
    begin
    Taridatabases.First;
    while Taridatabases.Eof = False do
      begin
			Fextension := ExtractFileExt(TariDatabasesFile_Name.AsString);
      if Fextension = '.GDB' then
        begin
        Taridatabases.Edit;
				TariDatabasesFile_Name.asstring := ChangeFileExt(TariDatabasesFile_Name.AsString,'.fdb');
				Taridatabases.post;
        end;
      Taridatabases.Next;
      end;    // while
    // set the registry as done!
    GGlobals.Servers.CurrentServer.CorrectAdmin := False; // Value is always False
    end;
//  Timeout('Admin Added Admin User');
end;

procedure TDMUserM.FBMADMINDBBeforeConnect(Sender: TIB_Connection);
begin
  FBMADMINDB.Username := 'SYSDBA';
  if Length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
    FBMADMINDB.password := GGLobals.Servers.CurrentServer.SysdbaPassword
  else
    FBMADMINDB.password := 'masterkey';
  FBMADMINDB.Path := GGLobals.Servers.CurrentServer.AdminFolder + 'FBMPRODUCTADMIN.FDB';
  if GGLobals.Servers.CurrentServer.isUnix then // the value gets set in the GetADMINPath function call
    slashchar := '/'
  else
    slashchar := '\';
  if (not GGLobals.Servers.CurrentServer.isEmbedded) or (not fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'fbclient.dll'))then
    FBMADMINDB.Server := GGLobals.Servers.CurrentServer.Servername + '/' + GGLobals.Servers.CurrentServer.Port
  else
    FBMADMINDB.Server := '';
  FBMADMINDB.Protocol := GGlobals.Servers.CurrentServer.RealProtocol;
end;

procedure TDMUserM.UsersQLOK_ON_ROLEChange(Sender: TField);
begin
//  UsersLOK_ON_ROLE.Value := RolesrefRole_name.value;
end;

procedure TDMUserM.UsersAfterInsert(DataSet: TDataSet);
begin
Useraction := uaAddUser;
end;

procedure TDMUserM.UsersAfterEdit(DataSet: TDataSet);
begin
Useraction := uaModifyUser;
end;

procedure TDMUserM.UsersAfterDelete(DataSet: TDataSet);
begin
  Useraction := uaDeleteUser;
end;

procedure TDMUserM.UsersAfterPost(DataSet: TDataSet);
begin
  try
		FBMADMINDB.AlterUser(Useraction,
				trim(UsersUSER_NAME.AsString),
				trim(String(UsersDBPASSWORD.AsAnsiString)),  // done to ensure varbytesarray is converted correctly
				'',
				Trim(UsersFIRST_NAME.AsString),
				Trim(UsersMIDDLE_NAME.AsString),
				Trim(UsersLAST_NAME.AsString));
  except // wrap up
    ;
  end;    // try/finally
end;

function TDMUserM.parsedate(instr: string): TDateTime;
var
  I: Integer;
  y,m,d : word;
  Buffer: array [0..20] of char;
  pbuf : Pchar;
  num, cnt : integer;
begin
	y := 0;
	m := 0;
	d := 0;
	num := length(instr);
  strPcopy(Buffer, instr);
  pbuf := Buffer;
  cnt := 0;
  for I := 0 to num - 1 do    // Iterate
    begin
    if buffer[I] = '-' then
      begin
      buffer[I] := char(0);
      if(cnt = 0) then
        y := strtoint(strpas(pbuf));
      if(cnt = 1) then
        m := strtoint(strpas(pbuf));
      pbuf := @buffer[I +1];
      inc(cnt);
      end;
    end;    // for
   if(cnt = 2)then
     d := strtoint(strpas(pbuf));
  result := encodeDate(y, m, d);
end;

procedure TDMUserM.dbCheckConnectAfterConnect(Sender: TIB_Connection);
begin
  tblLOSystem.Active := true;
end;

procedure TDMUserM.dbCheckConnectBeforeDisconnect(Sender: TIB_Connection);
begin
  tblLOSystem.Active := False;
end;

function TDMUserM.DoHttpLicence(showerrors : boolean): Boolean;
var
  I : Integer;
//  initError : Boolean;
	LErrorMessage : string;
begin
  result := False;
	clHttpRequest1.Clear;
	clHttpRequest1.AddFormField('ContactName', DMLicrec.FirstName + ' ' + DMLicrec.LastName);
	clHttpRequest1.AddFormField('EmailAddress', DMLicrec.EmailAddress);
	clHttpRequest1.AddFormField('ComputerName', DMLicrec.Computername);
	clHttpRequest1.AddFormField('OperatingSystem', DMLicrec.OperatingSystemName);
	clHttpRequest1.AddFormField('OSVersion', DMLicrec.OSVersion);
	clHttpRequest1.AddFormField('BusinessName', DMLicrec.LicenceeName);
	clHttpRequest1.AddFormField('BusinessNameLicenced', DMLicrec.BusinessName);
	clHttpRequest1.AddFormField('BusinessFileLicenced', DMLicrec.BusinessFileName);
	clHttpRequest1.AddFormField('SerialNumber', DMLicrec.SerialNumber);
	clHttpRequest1.AddFormField('LicenceType', 'N');
	clHttpRequest1.AddFormField('SiteNumber', inttostr(DMLicrec.SiteNumber));
	clHttpRequest1.AddFormField('ChannelID', inttostr(DMLicrec.Channel_ID));
	clHttpRequest1.AddFormField('TBVersion', versioninfo);
	clHttpRequest1.AddFormField('UpdateLog', inttostr(DMLicrec.UpdateLog));

  clUploader1.UseHTTPRequest := True;
  clUploader1.UserName := 'FBM';
  clUploader1.Password := 'fbmmaster';
  clUploader1.URL := 'http://www.tari.com.au/TariLicence.php';
  try
    clUploader1.Start(false);
  finally
    clUploader1.Stop;
//    clUploader1.URL := 'http://www.Tari.com.au/TariLicence.php';
//    clUploader1.Start(False);
  end;

  clHtmlparser1.Clear;
  clhtmlparser1.ParseMethod := pmAll;
  clhtmlparser1.Parse(clUploader1.HttpResponse);
  for I := 0 to clHtmlParser1.Tags.Count - 1 do    // Iterate
    begin
    if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'ErrorMessage') then
      LErrorMessage := clHtmlParser1.tags.Items[i].AttributeValue('value');
    if (length(LErrorMessage) > 0) and (showerrors) then
      begin
      messagedlg('Internet Licencing:' + #13#10 + LErrorMessage, mtError, [Mbok], 0);
      break;
      end
    else
      begin
      Result := true;
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'BusinessName') then
        DMLicrec.LicenceeName := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'BusinessNameLicenced') then
        DMLicrec.BusinessName := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'BusinessFileLicenced') then
        DMLicrec.BusinessFileName := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'SerialNumber') then
        DMLicrec.SerialNumber := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'LicenceType') then
        DMLicrec.LicenceType := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'SiteNumber') then
        DMLicrec.SiteNumber := strtoint(clHtmlParser1.tags.Items[i].AttributeValue('value'));
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'ExpiryDate') then
        DMLicrec.ExpiryDate := parsedate(clHtmlParser1.tags.Items[i].AttributeValue('value'));
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'ChannelID') then
        DMLicrec.Channel_ID := strtoint(clHtmlParser1.tags.Items[i].AttributeValue('value'));
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'LicenceNumber') then
        DMLicrec.LicenceNumber := clHtmlParser1.tags.Items[i].AttributeValue('value');
{  // not implemented
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'CurrVersion') then
        begin
        GGlobals.SetReleaseVersion(clHtmlParser1.tags.Items[i].AttributeValue('value'));
        GGlobals.ConvertReleaseInfo(clHtmlParser1.tags.Items[i].AttributeValue('value'));
        end;
}
      end;
    end;    // for
    DMLicrec.UpdateLog := 0;
end;

end.
