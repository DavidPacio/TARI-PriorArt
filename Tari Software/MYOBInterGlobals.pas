unit MYOBInterGlobals;

interface

Uses  Windows, Messages, SysUtils, registry, inifiles, Classes,
      controls, forms, StSpawn, auchTypes,{$IFNDEF Embedded} DMTestCon,{$ENDIF}
      IB_Session, dialogs, ststrS, Graphics, DateUtils, strUtils, stsystem;


Const
  SYSTEMNAME = 'System';
  PRODUCT_NAME = 'MYOB to TARI for Business';
  CONFIGURATIONNAME = 'Configuration';
  COPYRIGHTNAME = 'Auchinlea Pty Ltd';
  ADMINISTRATIONNAME = 'Administration';
  MAXSERVERS = 10;

Type
  TDatabaseType = (dtParadox, dtmssql, dtfirebird, dtmsaccess, dtdbase, dtmysql, dtinterbase);

  TDetailedBalArray = array[0 .. 324] of currency;
  TDetailedBalArrayPtr = ^TDetailedBalArray;

  TFBServer = class(Tobject)
    ServerName : string;
    ServerFullName : String;
    AdminFolder : string;
    NetworkFolder : string;
    ServerPath : string;
    Protocol : string;
    isUnix : Boolean;
    isEmbedded : Boolean;
    CorrectAdmin : Boolean;
    Available : boolean;
    CurrentDBAlias : string[20];
    CurrentUserAccess : Integer;
    CurrentUserName : string[40];
    CurrentUserRole : String[40];
    CurrentUserPwd : string[40];
    SysdbaPassword : string[40];
    RealProtocol : TIB_Protocol;
  Private
    Deleted : Boolean;
    function TestSingleConnection: Boolean;
    Procedure SetServerRegister;
  Public
    constructor create(MachineName : string; Getregistry : Boolean);
    destructor Destroy; override;
    Procedure GetServerRegister(Test : Boolean);
    function DelRegServer: Boolean;
  End;

  TFBServers = class(Tobject)
    FBServers : array[0..MAXSERVERS - 1] of TFBServer;
    Count : integer;
    Availablecount : Integer;
    CurrentServer : ^TFBServer;
    ServernameMRU : String;
    Licserver : String;
    nbLicserver : String;
    NavMenuView : String;
  Private
  Public
    constructor Create;
    destructor Destroy; override;
    procedure GetRegservers;
    Procedure SetCurrentServer(Sname : String);
    procedure SetMRUServer;
    Function Indexof(SName : String): Integer;
    function IndexofRealName(Sname : string): Integer;
    procedure StartFirebird;
    Procedure PutRegServer(ServerRec : TServerRecPtr);
    function deleteServer(SName : String): Boolean;
  end;

  TSCInterGlobals = class(Tobject)
    SecondInstance : Boolean;
    PStartDate: TDateTime;
    PEndDate: TDateTime;
    PPastStartDate : TDateTime;
    PPastEndDate : TDateTime;
    TrialLic : Boolean;
    LicDir, NBLicDir : String; // Licence Directory and Notebook  Licence Directory
    BaseDir : string;
    DataDir : string;
    DateFDE, DateFSTD, DateFENH : String[20];
    DaysToRun : Integer;
    LockFileHandle : THandle;
    CurrentDBPWD, adminPwd : string;
    LastAccessDate : TDateTime;
    UnitRounding : integer;
//  getProtocol : TIB_Protocol;
    NewDBSetup : Boolean;
    MultiDept : Boolean;
    Initfailed : Boolean;
    SetAdminFailed : Boolean;
    TimeSheetRate : Boolean;
    TestConnectionCreated : Boolean;
    Loopcount : integer;
    FormColour : TColor;
    FontColour : TColor;
    DominantMainColor : TColor;
    PUsername : array[0..50] of char;
    PUserPwd : array[0..50] of char;
    PUserRole : array[0..50] of char;
    Servers : TFBServers;
    CurrentDept : Variant;
  private
    procedure OpenTextFile;
    procedure OutputParameters;
    procedure debugClose;
  public
    LicTemp : Boolean;
    FileLicence : Boolean;
    LicenceThisFile : Boolean;
    NewDemoFile : Boolean;
    LicencingFailed : Boolean;
    DemoFileLicenced : Boolean;
    TrainingLicence : Boolean;
    TARIServer : string;
    TARIPath : string;
    TARIStartDate : TDateTime;
    TARIEndDate : TDateTime;
    TARIInterfaceDBPath : string;
    TARIInterfaceServer : string;
    TARIBusinessName : String;
    Constructor Create;
    destructor Destroy; override;
    function IsWIN95:  Boolean;
    Procedure CheckForApp;
    procedure LoadData;
    procedure DebugOut(str : string);
    Procedure GetRegistry;
    Procedure SetRegistry;
    Function GetLicenceFilename : String;
//    Procedure GetMRURegistry;
    procedure GetDatePreferences;
    procedure SetDatePreferences;
//    function ChkAddSlash(Path : String; IsUnix : Boolean): string;
    function GetOperatingSystem: String;
    procedure renewSampleDB;
    function GetDateFDE: String;
    function GetDateFSTD: String;
    function GetDateFENH: String;
    function CopyMastFile(srcS, DestS: string): longbool;
    End;
var
  GGlobals : TSCInterGlobals;
  FTextFile : TextFile; // Used for Debug

// Utility Functions /////
  function ChkAddSlash(Path : Pchar; IsUnix : Boolean): Pchar;
  function ExtractFirstName(Fullname: string): string;
  function ExtractLastName(Fullname: string): string;
  function CreateFullName(FName, Lname: string): string;

implementation

constructor TFBServer.create(MachineName : string; Getregistry : Boolean);
begin
  Inherited Create;
  serverName := MachineName;
  SysdbaPassword := 'masterkey';
  Deleted := False;
  if Getregistry then
    GetServerRegister(True);
end;

destructor TFBServer.Destroy;
begin
  if Deleted = False then
    SetServerRegister;
  inherited destroy;
end;

Procedure TFBServer.GetServerRegister(Test : Boolean);
var
//  I: Integer;
  Reg: TRegistry;
  Regini : TRegIniFile;
  tempS : array[0..200] of char;
//  ReportKey : Boolean;
//  numItems : Integer;
begin
  Reg := TRegistry.Create;
  RegIni := TReginiFile.create;
  GGlobals.DebugOut('GetServerRegistry');
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\Servers\' + Servername, False) then
      begin
      ServerFullName := Reg.ReadString('SERVERFULLNAME');
      isUnix := False;
      if reg.ValueExists('Unix') then
        isUnix := reg.ReadBool('Unix');
      IsEmbedded := False;
      if reg.ValueExists('FBPASSWORD') then
        SysdbaPassword := reg.ReadString('FBPASSWORD');
      if reg.ValueExists('EMBEDDED') then
        isEmbedded := reg.ReadBool('EMBEDDED');
//      tempstr := Reg.ReadString('ADMINFOLDER');
//      strPcopy(temps, tempstr);
//      ChkAddSlash(temps, isunix);
//      AdminFolder := strpas(temps);
      AdminFolder := strPas(chkaddslash(strPcopy(temps, Reg.ReadString('ADMINFOLDER')), isunix));
      GGlobals.DebugOut('Adminfolder = ' + AdminFolder);
      NetworkFolder := strPas(chkaddslash(strPcopy(temps, Reg.ReadString('NETWORKFOLDER')), False));
//      ServerPath := Reg.ReadString('SERVERFOLDER');
      ServerPath := StrPas(chkaddslash(strPcopy(temps, Reg.ReadString('SERVERFOLDER')), isunix));
      Protocol := Reg.ReadString('PROTOCOL');
      if Length(Protocol) = 0 then
        ProtoCol := 'TCP_IP';
      if protocol = 'NetBEUI' then
        RealProtocol := cpNetBEUI
      else
        if protocol = 'TCP_IP' then
          RealProtocol := cpTCP_IP
        else
          RealProtocol := cpLocal;
      if (isEmbedded) and (fileexists(NetworkFolder + 'gds32.dll')) then
        RealProtocol := cpLocal;
      if reg.ValueExists('CORRECTADMIN') then
        CorrectAdmin := Reg.ReadBool('CORRECTADMIN');
      if Test then
        Available := TestSingleConnection; //Assume as true until
      end;
      GGlobals.DebugOut('Server - ' +  Servername);
      Reg.CloseKey;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    {$IFDEF Advisor}
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\'  + PRODUCT_NAME + '\Users\' + getcurrentuser + '\Servers\' + Servername, false) then
      begin
      CurrentUserName := Reg.ReadString('User');
      CurrentDBAlias := Reg.ReadString('DataBase');
      Reg.CloseKey;
//      end
//    else
//    {$ENDIF}
//    if Reg.OpenKey('\SOFTWARE\Focus Based Management\Servers\' + Servername + '\MRU', false) then
//      begin
//      CurrentUserName := Reg.ReadString('User');
//      CurrentDBAlias := Reg.ReadString('DataBase');
//      Reg.CloseKey;
      end;
// Reporting Settings
//    ReportKey := True;
    RegIni.RootKey := HKey_Local_Machine;
  finally
    Reg.Free;
    Regini.Free;
  end;
end;

Procedure TFBServer.SetServerRegister;
var
//  I: Integer;
  Reg: TRegistry;
//  Regini : TRegIniFile;
//  ReportKey : Boolean;
//  numItems : Integer;
begin
  if Servername > '' then
    begin
    Reg := TRegistry.Create;
      try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey('\SOFTWARE\Focus Based Management\Servers\' + Servername, True) then
        begin
        Reg.writeString('SERVERFULLNAME', ServerFullName);
        Reg.writeString('PROTOCOL', Protocol);
        Reg.WriteBool('Unix', isUnix);
        Reg.WriteBool('EMBEDDED', isEmbedded);
        Reg.WriteString('ADMINFOLDER', AdminFolder);
        Reg.WriteString('SERVERFOLDER', ServerPath);
        Reg.WriteString('NETWORKFOLDER', NetworkFolder);
        Reg.WriteString('FBPASSWORD', SysdbaPassword);
        Reg.WriteBool('CORRECTADMIN', CorrectAdmin);
        Reg.CloseKey;
        end;
      if Servername = GGlobals.Servers.ServernameMRU then
        begin
//        {$IFDEF Advisor}
        if Reg.OpenKey('\SOFTWARE\Focus Based Management\'  + PRODUCT_NAME + '\Users\' + getcurrentuser + '\Servers\' + Servername, True) then
          begin
          Reg.WriteString('User', CurrentUserName);
          Reg.WriteString('DataBase', CurrentDBAlias);
          Reg.CloseKey;
          end;
//        {$ELSE}
//        if Reg.OpenKey('\SOFTWARE\Focus Based Management\Servers\' + Servername + '\MRU', True) then
//          begin
//          Reg.WriteString('User', CurrentUserName);
//          Reg.WriteString('DataBase', CurrentDBAlias);
//          Reg.CloseKey;
//          end;
//        {$ENDIF}
        end;
      finally
      Reg.Free;
      end;
    end;
end;

function TFBServer.DelRegServer: Boolean;
begin
end;



function TFBServer.TestSingleConnection: Boolean;
begin
  if Not isEmbedded then
    begin
    DMTestConM.ExoConnection1.Host := servername;
    DMTestConM.EchoConnected := 0;
    DMTestConM.ExoConnection1.Disconnect;
    DMTestConM.ExoConnection1.SeekServerTimeOut := 2000;
    DMTestConM.ExoConnection1.TimeOut := 2000;
      try
      DMTestConM.ExoConnection1.Connect;
      except
      on e: Exception do
      ;
      end;
    if DMTestConM.EchoConnected > 0 then
      begin
      DMTestConM.ExoConnection1.Disconnect;
      Result := True;
      end
    else
      begin
      Result := False;
      if ansisametext(GetMachineName, serverName) or (Protocol = 'NetBEUI') then
        begin
        if Length(AdminFolder) < 1 then
          begin
          RESULT := fALSE;
          Exit;
          end;
        DMTestConM.TESTCONNECTION.Username := 'SYSDBA';
        if length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
          DMTestConM.TESTCONNECTION.Password := GGLobals.Servers.CurrentServer.SysdbaPassword
        else
          DMTestConM.TESTCONNECTION.Password := 'masterkey';
        DMTestConM.TESTCONNECTION.Server := serverName;
        DMTestConM.TESTCONNECTION.Path := AdminFolder + 'FBMPRODUCTADMIN.FDB';
        Result := True;
        DMTestConM.TESTCONNECTION.Protocol := RealProtocol;
          try
          DMTestConM.TESTCONNECTION.Connect;
          except  // wrap up
          on EIB_ISCError do
            begin
            Result := False;
            end;
          end;
        DMTestConM.TESTCONNECTION.Disconnect;
        end;
      end;
    end
  else
    begin
    Result := False;
    if AnsiSameText(Servername, getMachineName) then
    Result := True;
    end;
end;

constructor TFBServers.create;
var
  I: Integer;
begin
  Inherited Create;
  GGlobals.DebugOut('before getRegServers');
  GetRegServers;
  if Availablecount = 0 then
    begin
    GGlobals.DebugOut('Starting FB');
    StartFirebird;
    for I := 0 to Count - 1 do    // Iterate
      begin
      FBServers[I].Available := FBServers[I].TestSingleConnection;
      if FBServers[I].Available then
        inc(AvailableCount);
      end;    // for
    end;
  if AvailableCount = 0 then
    GGlobals.Initfailed := True;
  if (ServernameMRU > '') and (FBServers[Indexof(ServernameMRU)].Available)then
    SetCurrentServer(ServernameMRU)
  else // select the LicenceServer
    if (Licserver > '') and (FBServers[Indexof(Licserver)].Available) then
      SetCurrentServer(LicServer)
    else // select the local machine if its available
      if FbServers[indexof(GetMachinename)].Available then
        SetCurrentServer(GetMachineName);
end;

destructor TFBServers.Destroy;
var
  I: Integer;
begin
//  SetMRUServer;
  for I := 0 to Count - 1 do    // Iterate
    begin
    Fbservers[I].Destroy;
    end;    // for
  inherited destroy;
end;

procedure TFBServers.GetRegServers;
var
  I: Integer;
  Reg: TRegistry;
  Servers : Tstringlist;
  Limit : Integer;
  tempS : array[0..200] of char;
begin
  Servers := Tstringlist.Create;
  Servers.Clear;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\TARI for Business', False)then
      begin
      GGlobals.Basedir := StrPas(chkaddslash(strPcopy(temps, Reg.ReadString('BASEFOLDER')), False));
      Licserver := Reg.ReadString('LICENCESERVER');
      NBLicserver := Reg.readstring('NBLICENCESERVER');
      Reg.CloseKey;
      end;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    {$IFDEF Advisor}
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\TARI for Business\Users\' + GetCurrentUser + '\MRU', False) then
      begin
      ServerNameMRU := Reg.ReadString('SERVER');
      Reg.CloseKey;
//      end
//    else
//    {$ENDIF}
//    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\MRU', False) then
//      begin
//      ServerNameMRU := Reg.ReadString('SERVER');
//      Reg.CloseKey;
      end;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\servers', False) then
      reg.GetKeyNames(servers);
    GGlobals.DebugOut('Got Server List');
    servers.Sort;
    GGlobals.DebugOut('Got Server Sort');
    // Eliminate MRU if present
    if Servers.IndexOf('MRU') > -1 then Servers.Delete(Servers.IndexOf('MRU'));
    Reg.CloseKey;
    Limit := Servers.Count;
    if Limit > MAXSERVERS then
      Limit := MAXSERVERS;
    Availablecount := 0;
    count := 0;
    GGlobals.DebugOut('Before Available');
    for I := 0 to Limit - 1 do    // Iterate
      begin
      Fbservers[I] := TFBServer.create(Servers.Strings[I], True);
      inc(Count);
      if AnsiSameText(Licserver, FBServers[i].ServerName) then
        GGlobals.LicDir := FBServers[i].NetworkFolder;
      if fbservers[I].Available then
        inc(Availablecount);
      end;
  finally
    Reg.Free;
    Servers.Free;
  end;
  if AnsiSameText(GetMachineName, NBLicserver) then
    GGlobals.NBLicDir := FBServers[Indexof(NBLicserver)].NetworkFolder;
end;

procedure TFBServers.SetCurrentServer(Sname : String);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do    // Iterate
    begin
    if (FbServers[I] <> nil) and (AnsiSameText(FBServers[I].ServerName, Sname)) then
      begin
      CurrentServer := @FBServers[I];
      end;
    end;    // for
end;

function TFBServers.Indexof(Sname : string): Integer;
var
  I: Integer;
begin
  result := -1;
  if Sname = '' then exit;
  for I := 0 to Count - 1 do    // Iterate
    begin
    if ansisametext(FBServers[I].ServerName, Sname) then
      Result := I;
    end;    // for
end;

function TFBServers.IndexofRealName(Sname : string): Integer;
var
  I: Integer;
begin
  result := -1;
  if Sname = '' then exit;
  for I := 0 to Count - 1 do    // Iterate
    begin
    if ansisametext(FBServers[I].ServerFullName, Sname) then
      Result := I;
    end;    // for
end;

procedure TFBServers.SetMRUServer;
begin
end;

procedure TFBServers.StartFirebird;
begin
end;

procedure TFBServers.PutRegServer(ServerRec : TServerRecPtr);
begin
end;

function TFBServers.deleteServer(SName : String): Boolean;
begin
end;

constructor TSCInterGlobals.create;
begin
  Inherited Create;
  TestConnectionCreated := False;
  LicenceThisFile := False;
  NewDemoFile := False;
  DemoFileLicenced := False;
  CheckForApp;
end;

destructor TSCInterGlobals.Destroy;
begin
//  if TestConnectionCreated then
//    DMTestConM.Free;
  Servers.destroy;      // 27/8/2003 was calling free should be destroy
  debugClose;
  SetRegistry;
  inherited destroy;
end;

function TSCInterGlobals.IsWIN95:  Boolean;
var
  osversion :  _OSVERSIONINFOA;
begin
  osversion.dwOSVersionInfoSize := sizeof(_OSVERSIONINFOA);
  getversionEx(osversion);
  if osversion.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
    result := True
  else
    result := False;
end;

Procedure TSCInterGlobals.CheckForApp;
var
  Whandle : HWND;
begin
  SecondInstance := False;
  whandle := CreateFileMapping(THandle($FFFFFFFF), nil, PAGE_READONLY, 0, 32, PRODUCT_NAME);
  if Whandle <> 0 then
    begin
    if (getlasterror = ERROR_ALREADY_EXISTS) then
      SecondInstance := True;
    end
  else
    SecondInstance := True; // The File Mapping failed but we exist anyway
end;

procedure TSCInterGlobals.LoadData;
var
  Blue, Green, Red : WORD;
begin
  OpenTextFile; // Based on whether TextDebug is Defined
  OutputParameters;
  Application.CreateForm(TDMTestConM, DMTestConM); // Create this Test Connection Module
  TestConnectionCreated := True;
  DebugOut('Created DMTtestconM');
  Servers := TFBServers.Create;
  DebugOut('Servers Created');
  GetRegistry;
  Blue :=  LOBYTE(HIWORD(Formcolour));
  Green := HIBYTE(LOWORD(FormColour));
  Red := LOBYTE(LOWORD(FormColour));
  if (Blue > Green) and (Blue > Red) then
    begin
    DominantMainColor := TColor(135 shl 16);
    end;
  if (Green > Blue) and (Green > Red) then
    begin
    DominantMainColor := TColor(135 shl 8);
    end;
  if (Red > Green) and (Red > Blue) then
    begin
    DominantMainColor := TColor(135);
    end;
  DebugOut('Got Registry');
  GetDatePreferences;
end;

procedure TSCInterGlobals.OpenTextFile;
{$IFDEF TextDebug}
var
  I: Integer;
  Fname, FPath : string;
  FileList : TstringList;
  function MyFileFilter(const SR : TSearchRec;  ForInclusion : Boolean; var Abort : Boolean) : Boolean;
  var FileMTime : TDateTime;
  begin
    FileMTime := FileDateToDateTime(SR.Time);
    if (((CompUCStringS(JustExtensionS(SR.Name), 'txt') = 0) or
       (SR.Attr and faDirectory = faDirectory)) and
       (double(FileMTime) < (double(now()) - 366)))  then
      Result := True
    else
      Result := False;
  end;
{$ENDIF}

begin
  {$IFDEF TextDebug}
  if (not Directoryexists('log')) then
    createDir('Log');
  FPath := 'Log';
  // tidy up old files
  FileList := TStringList.Create;
  EnumerateFiles(Fpath, FileList, False, @MyFileFilter);
  for I := 0 to FileList.Count - 1 do    // Iterate
    begin
    DeleteFile(FileList.Strings[I]);
    end;    // for
  FileList.Free;
//  CreateTempFile(aFolder : AnsiString;  aPrefix : AnsiString) : AnsiString;
  fname := formatDateTime('yyyymmddhhnnsszzz', now());
  AssignFile(FTextFile, LicDir + 'log\Interface' + fname + '.txt');  // File selected in dialog box
  ReWrite(FTextFile);
  {$ENDIF}
  ;
end;

procedure TSCInterGlobals.OutputParameters;
  {$IFDEF TextDebug}
var
  I : Integer;
  {$ENDIF}
begin
  {$IFDEF TextDebug}
  DebugOut('Start');
  for i := 0 to paramCount - 1 do
    DebugOut(paramStr(i));
  {$ENDIF}
  ;
end;

Procedure TSCInterGlobals.GetRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  GGlobals.DebugOut('Getregistry');
  FormColour := $00CFF5CF;; // Old Blue $00FAE9DE;
  FontColour := clBlack;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Default Planning Period', False) then
      begin
      PStartDate := Reg.ReadDateTime('Start Date');
      PEndDate := Reg.ReadDateTime('End Date');
      Reg.CloseKey;
      end;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Default Colours', False) then
      begin
      Reg.ReadBinaryData('Form Colour', FormColour, 4);
      Reg.ReadBinaryData('Font Colour', FontColour, 4);
      Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

procedure TSCInterGlobals.GetDatePreferences;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  DateFDE := '';
  DateFSTD := '';
  DateFENH := '';
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\DatePreferences', False) then
      begin
      DateFDE := Reg.ReadString('DATE_DATA_ENTRY');
      DateFSTD := Reg.ReadString('DATE_STANDARD');
      DateFENH := Reg.ReadString('DATE_ENHANCED');
      end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

procedure TSCInterGlobals.SetDatePreferences;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\DatePreferences', True) then
      begin
      Reg.WriteString('DATE_DATA_ENTRY', DateFDE);
      Reg.WriteString('DATE_STANDARD', DateFSTD);
      Reg.WriteString('DATE_ENHANCED', DateFENH);
      end;
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

function TSCInterGlobals.GetOperatingSystem: String;
Var
  Dataini : TiniFile;
begin
  Result := '';
  if fileexists(Servers.CurrentServer.AdminFolder + 'FBMfb.ini') then
    begin
    DataIni := TiniFile.create(Servers.CurrentServer.AdminFolder + 'FBMfb.ini');
    result := DataIni.ReadString('Serverinfo', 'Operating System', '');
    Dataini.Free;
    end;
end;

function TSCInterGlobals.CopyMastFile(srcS, DestS: string): longbool;
var
  PSrc, PDest : PAnsichar;
begin
  getmem(Psrc, length(SrcS) + 10);
  Getmem(Pdest, length(DestS) + 10);
  StrPcopy(Psrc, SrcS);
  StrPcopy(PDest, DestS);
  result := copyFile(Psrc, PDest, False);
  FreeMem(Psrc);
  FreeMem(PDest);
end;

procedure TSCInterGlobals.renewSampleDB;
begin
end;

function TSCInterGlobals.GetDateFDE: String;
begin
  GetFormatSettings;
  Result := Shortdateformat;
  if Length(DateFDE) > 0 then
    Result := DateFDE;
end;

function TSCInterGlobals.GetDateFSTD: String;
begin
  GetFormatSettings;
  Result := ShortDateformat;
  if Length(DateFSTD) > 0 then
    Result := DateFSTD;
end;

function TSCInterGlobals.GetDateFENH: String;
begin
  result := 'dd-MMM-yyyy';
  if Length(DateFENH) > 0 then
    Result := DateFENH;
end;

procedure TSCInterGlobals.DebugOut(str : string);
begin
  {$IFDEF TextDebug}
  writeln(FTextFile, str);
  flush(FTextFile);
  {$ENDIF}
  ;
end;

procedure TSCInterGlobals.debugClose;
begin
  {$IFDEF TextDebug}
  CloseFile(FTextFile);
  {$ENDIF}
  ;
end;

Procedure TSCInterGlobals.SetRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Default Planning Period', True) then
      begin
      Reg.WriteDateTime('Start Date', PStartDate);
      Reg.WriteDateTime('End Date', PEndDate);
      Reg.CloseKey;
      end;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Default Colours', True) then
      begin
      Reg.WriteBinaryData('Form Colour', FormColour, 4);
      Reg.WriteBinaryData('Font Colour', FontColour, 4);
      Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

function TSCInterGlobals.GetLicenceFilename : String;
var
  DataIni : TIniFile;
begin
  Result := '';
  if fileexists(GGlobals.Licdir + 'TempLic.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.Licdir + 'TempLic.ini');
    GGlobals.DebugOut('Get Licence File Name from ' + GGlobals.Licdir + 'TempLic.ini');
    Dataini.Free;
    Result := DataIni.ReadString('Licence', 'Business File Name', '');
    Dataini.Free;
    end;
end;

/// Utility Functions ///
function ChkAddSlash(Path : Pchar; IsUnix : Boolean): Pchar;
var
  I, K : Integer;
  schar, nschar : char;
begin
  schar := '\';
  nschar := '/';
  if isUnix then
    begin
    sChar := '/';
    nschar := '\';
    end;
  i := strlen(Path);
  for K := 0 to I -1 do
    if Path[K] = nschar then
       Path[K] := schar;  // corrects any bad slashs!!
  i := strlen(Path);
  if Path[I - 1] <> sChar then
    begin
    Path[I] := sChar;
    Path[I + 1] := #0;
    end;
  Result := Path;
end;

function ExtractFirstName(Fullname: string): string;
var
  delpos : integer;
begin
  delpos := pos(' + ', Fullname);
  if Delpos > 0 then
    Result := leftstr(Fullname, Delpos - 1)
  else
    Result := '';
end;

function ExtractLastName(Fullname: string): string;
var
  delpos : integer;
begin
  delpos := pos(' + ', Fullname);
  if Delpos > 0 then
    Result := Rightstr(Fullname, length(Fullname) - Delpos - 2)
  else
    Result := '';
end;

Function CreateFullname(Fname, Lname : string): String;
begin
  Result := Fname + ' + ' + Lname;
end;

end.
