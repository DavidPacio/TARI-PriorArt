unit LGlobals;

interface

Uses  Windows, Messages, SysUtils, registry, inifiles, Classes,
      controls, forms, {StSpawn,} auchTypes, IB_Session, dialogs,
			Graphics, DateUtils, strUtils, IOUtils, Types, IdTCPConnection, IdTCPClient;


Const
  SYSTEMNAME = 'System';
  PRODUCT_NAME = 'TARI for Business';
  CONFIGURATIONNAME = 'Configuration';
  COPYRIGHTNAME = 'Auchinlea Pty Ltd';
  ADMINISTRATIONNAME = 'Administration';
	MAXSERVERS = 10;
  CFDEPT_OFFSET = 1000000;

Type

  TJournalEntryRecPtr = ^TJournalEntryRecType;TJournalEntryRecType = record
    JournalNo : integer;
    JournalIndex : Integer;
    AccountNo : integer;
		AccountTitle : String;
    DRAmount : currency;
    CRAmount : currency;
    DREntry : Boolean;
		EntryNote : String;
  end;

  TReportingOptionsPtr = ^TReportingOptions; TReportingOptions = Record
		ReportFont : String;
    PreviewZoom : integer;
    ReportingDate : integer;
    ReportingPeriod : Integer;
    Concatentation : Integer;
    GroupingSort : Integer;
    TargetingOptionsList : array[0..5] of integer;
    TrackingOptionsList : array[0..5] of integer;
  end;

  TIncludeItemFunc = function (const SR : TSearchRec;  ForInclusion : Boolean; var Abort : Boolean) : Boolean;

  TNewBusinessRecPtr = ^TNewBusinessRecType; TNewBusinessRecType = record
    BusinessName : string;
    DatabaseAlias : String;
    NewFileName : string;
    Departments : TStringList;
    LastDayofWeek : integer;
    PastStartDate : TDate;
    PastEndDate : TDate;
    StartTargetDate : TDate;
  end;

  TFBServer = class(Tobject)
    ServerName : string;
    ServerFullName : String;
    AdminFolder : string;
    NetworkFolder : string;
    ServerPath : string;
    Protocol : string;
    Port: string;
    isUnix : Boolean;
    isEmbedded : Boolean;
    CorrectAdmin : Boolean;
    Available : boolean;
		CurrentDBAlias : string;
		CurrentUserAccess : Integer;
		CurrentUserName : string;
		CurrentUserRole : String;
		CurrentUserPwd : string;
    SysdbaPassword : string;
    RealProtocol : TIB_Protocol;
  Private
    Deleted : Boolean;
    function TestSingleConnection(ServerIdx: TFBServer): Boolean;
    Procedure SetServerRegister;
  Public
    constructor create(MachineName : string; Getregistry : Boolean);
    destructor Destroy; override;
    Procedure GetServerRegister(Test : Boolean);
    function DelRegServer: Boolean;
  End;

  TFBServers = class(Tobject)
    FBServers : TList;
//    FBServers : array[0..MAXSERVERS - 1] of TFBServer;
//    Count : integer;
    Availablecount : Integer;
    CurrentServer : TFBServer;
    ServernameMRU : String;
//    Licserver : String;
    TARISplashDate : TDateTime;
    TARISplashCount : Integer;
    NavMenuView : String;
  Private
//    procedure CorrectHoles;
  Public
    constructor Create;
    destructor Destroy; override;
    procedure GetRegservers;
    Function SetCurrentServer(Sname : String): Boolean;
    procedure SetMRUServer;
    Function Indexof(SName : String): Integer;
    function IndexofRealName(Sname : string): Integer;
		function deleteServer(SName : String): Boolean;
  end;

  TLGlobals = class(Tobject)
    SecondInstance : Boolean;
    PStartDate: TDateTime;
    PEndDate: TDateTime;
    PPastStartDate : TDateTime;
    PPastEndDate : TDateTime;
    TrialLic : Boolean;
    LicDir, NBLicDir : String; // Licence Directory and Notebook  Licence Directory
    BaseDir : string;
    DataDir : string;
    DateFDE, DateFSTD, DateFENH : String;
    DaysToRun : Integer;
    LockFileHandle : THandle;
    CurrentDBPWD, adminPwd : string;
    LastAccessDate : TDateTime;
    UnitRounding : integer;
//  getProtocol : TIB_Protocol;
    Newbusiness : TNewBusinessRecType;
    NewDBSetup : Boolean;
    NewBusinesssettingUp : Boolean;
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
    Reporting : TReportingOptions;
    CurrentDept : Variant;
  private
    procedure OpenTextFile;
    procedure OutputParameters;
    procedure debugClose;
    procedure Loadtariconfig;
//    Procedure getOSInfoIsWIN95;
  public
    LicTemp : Boolean;
    FileLicence : Boolean;
    LicenceThisFile : Boolean;
    NewDemoFile : Boolean;
    LicencingFailed : Boolean;
    DemoFileLicenced : Boolean;
    TrainingLicence : Boolean;
    Config_Accountingfmt : Boolean;
    Produce_AccountFmt : Boolean;
    OSMajorVersion : Dword;
    IsWIN95 : Boolean;
    MRUSkin : string;
    TS_Login, TS_Password: string;
    constructor Create;
    destructor Destroy; override;
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
  GGlobals : TLGlobals;
  FTextFile : TextFile; // Used for Debug
// Utility Functions /////
  function ChkAddSlash(Path : Pchar; IsUnix : Boolean): Pchar;
  function ExtractFirstName(Fullname: string): string;
  function ExtractLastName(Fullname: string): string;
  function CreateFullName(FName, Lname: string): string;
	function CopyFileto(srcS, DestS: string): longbool;
	function GetMachineName: string;
	Function GetCurrentUser: string;
	Function IsFirebirdServerRunning(Host: string; Port : integer): Boolean;

implementation

constructor TFBServer.create(MachineName : string; Getregistry : Boolean);
begin
  Inherited Create;
  serverName := MachineName;
  SysdbaPassword := 'masterkey';
  ProtoCol := 'TCP_IP';
  Port:= '3050';
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
  I: Integer;
  Reg: TRegistry;
  Regini : TRegIniFile;
  tempS : array[0..200] of char;
  ReportKey : Boolean;
  numItems : Integer;
begin
  Reg := TRegistry.Create;
  RegIni := TReginiFile.create;
  GGlobals.DebugOut('GetServerRegistry');
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\Servers\' + Servername, False) then
      begin
      ServerFullName := Reg.ReadString('SERVERFULLNAME');
      Port := Reg.ReadString('PORT');
      if length(port) < 4 then
        Port := '3050';
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
      if (isEmbedded) and (fileexists(NetworkFolder + 'fbclient.dll')) then
        RealProtocol := cpLocal;
      if reg.ValueExists('CORRECTADMIN') then
        CorrectAdmin := Reg.ReadBool('CORRECTADMIN');
      if Test then
        Available := True; //TestSingleConnection; //Assume as true until
      end;
      GGlobals.DebugOut('Server - ' +  Servername + '/' + port);
      Reg.CloseKey;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    {$IFDEF Advisor}
		if Reg.OpenKey('\SOFTWARE\Focus Based Management\'  + PRODUCT_NAME + '\Users\' + GetCurrentUser + '\Servers\' + Servername, false) then
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
    ReportKey := True;
    RegIni.RootKey := HKEY_LOCAL_MACHINE;
    if (not isEmbedded) then
      begin
      if (not Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Users\' + GetcurrentUser + '\Report Options', False)) then
        ReportKey := Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Report Options', False);
      end
    else
      ReportKey := Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Report Options', False);
    if ReportKey then
      begin
      GGlobals.Reporting.Concatentation := regini.ReadInteger('General','Concatenation State', 0);
      GGlobals.Reporting.ReportFont := Regini.ReadString('General','Report Font', 'Arial');
      GGlobals.Reporting.PreviewZoom := regini.ReadInteger('General','Preview Setting', 3);
      GGlobals.Reporting.ReportingDate := regini.ReadInteger('General','Reporting Date', 0);
      GGlobals.Reporting.ReportingPeriod := regini.ReadInteger('General','Reporting Period', 0);
      GGlobals.Reporting.GroupingSort := regini.ReadInteger('General','Grouping Sort', 0);
      GGlobals.Produce_AccountFmt := regini.ReadBool('General','Produce_AccountFmt', False);
      NumItems := regini.ReadInteger('TargetingList','Count', 5);
      for I := 0 to Numitems - 1 do    // Iterate
        GGlobals.Reporting.TargetingOptionsList[I] := regini.ReadInteger('TargetingList','Item' + inttostr(I), 0);
      NumItems := regini.ReadInteger('TrackingList','Count', 6);
      for I := 0 to Numitems - 1 do    // Iterate
        GGlobals.Reporting.TrackingOptionsList[I] := regini.ReadInteger('TrackingList','Item' + inttostr(I), 0);
      RegIni.closekey;
      end;
  finally
    Reg.Free;
    Regini.Free;
  end;
end;

Procedure TFBServer.SetServerRegister;
var
  I: Integer;
  Reg: TRegistry;
  Regini : TRegIniFile;
  ReportKey : Boolean;
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
        Reg.writeString('PORT', Port);
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
      RegIni := TReginiFile.create;
        try
          RegIni.RootKey := HKEY_LOCAL_MACHINE;
          if (not isEmbedded) then
            ReportKey := Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Users\' + GetcurrentUser + '\Report Options', True)
          else
            ReportKey := Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Report Options', True);
          if ReportKey then
            begin
            Regini.writeInteger('General','Concatenation State', GGlobals.Reporting.Concatentation);
            Regini.writeString('General','Report Font', GGlobals.Reporting.ReportFont);
            Regini.writeInteger('General','Reporting Period', GGlobals.Reporting.ReportingPeriod);
            Regini.writeInteger('General','Reporting Date', GGlobals.Reporting.ReportingDate);
            Regini.writeInteger('General','Preview Setting', GGlobals.Reporting.PreviewZoom);
            Regini.writeInteger('General','Grouping Sort', GGlobals.Reporting.GroupingSort);
            Regini.writeBool('General','Produce_AccountFmt', GGlobals.Produce_AccountFmt);
            Regini.writeInteger('TargetingList','Count', 5);
            for I := 0 to 4 do    // Iterate
              Regini.WriteInteger('TargetingList','Item' + inttostr(I), GGlobals.Reporting.TargetingOptionsList[I]);
            Regini.writeInteger('TrackingList','Count', 6);
            for I := 0 to 5 do    // Iterate
              Regini.WriteInteger('TrackingList','Item' + inttostr(I), GGlobals.Reporting.TrackingOptionsList[I]);
            RegIni.closekey;
            end;
        finally
        regini.Free;
        end;
      finally
      Reg.Free;
      end;
    end;
end;

function TFBServer.DelRegServer: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Result := False;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if (length(ServerName) > 0) then
      Result := Reg.DeleteKey('\SOFTWARE\Focus Based Management\Servers\' + Servername);
//    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;



function TFBServer.TestSingleConnection(ServerIdx: TFBServer): Boolean;
begin
	if Not isEmbedded then
		begin
		GGlobals.DebugOut('Testing Connection to ' +  Servername + '/' + TFBServer(ServerIdx).port);
		Result := IsFirebirdServerRunning(Servername, strtoint(TFBServer(ServerIdx).port));
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
  HaveSetServer : boolean;
begin
	Inherited Create;
	HaveSetServer := False;
  GGlobals.DebugOut('before getRegServers');
  FBServers := TList.Create;
  GetRegServers;
  GGlobals.DebugOut('Server Count = ' + inttostr(FBServers.Count));
  for I := 0 to FBServers.Count - 1 do    // Iterate
    begin
    GGlobals.DebugOut('Test Server: ' + TFBServer(FBServers[I]).ServerName);
    TFBServer(FBServers[I]).Available := TFBServer(FBServers[I]).TestSingleConnection(FBServers[I]);
    if AnsiSameText(TFBServer(FBServers[I]).ServerName, getMachineName) and (not TFBServer(FBServers[I]).Available) then
      begin
			TFBServer(FBServers[I]).Available := TFBServer(FBServers[I]).TestSingleConnection(FBServers[I]);
      end;
    if TFBServer(FBServers[I]).Available then
      begin
      GGlobals.DebugOut('Server: ' + TFBServer(FBServers[I]).ServerName + ' available.');
      inc(AvailableCount);
      end;
    end;    // for
//    end;
  GGlobals.DebugOut('Got ' + inttostr(availablecount) + ' server(s) available');
  if AvailableCount = 0 then
    GGlobals.Initfailed := True
  else
    begin
    if (length(ServernameMRU) = 0) and (FBServers.Count = 1) then
      begin
      ServernameMRU := TFBServer(FBServers[0]).Servername;
      end;
    If (length(ServernameMRU) > 0) and (TFBServer(FBServers[Indexof(ServernameMRU)]).Available)then
      begin
      HaveSetServer := SetCurrentServer(ServernameMRU);
      GGlobals.DebugOut('Set Server: ' + ServernameMRU + ' (MRU)');
      end
    else // select the local machine if its available
      begin
      if TFBServer(FbServers[indexof(GetMachinename)]).Available then
        begin
        HaveSetServer := SetCurrentServer(GetMachineName);
        GGlobals.DebugOut('Set Server: ' + GetMachineName + ' (GetMachineName)');
        end;
      end;
    end;
   GGlobals.DebugOut('Setting server(s)');
	if (not HaveSetServer) then
    begin
    i := 0;
    while (I < FBServers.Count) and (not TFBServer(FBServers[I]).Available) do
      inc(I);
    SetCurrentServer(TFBServer(FBServers[I]).ServerName);
    GGlobals.DebugOut('Set Server: ' + TFBServer(FBServers[I]).ServerName + ' ' + inttostr(I));
    end;
end;

destructor TFBServers.Destroy;
var
  I: Integer;
begin
  SetMRUServer;
  for I := 0 to FBServers.Count - 1 do    // Iterate
    TFBServer(Fbservers[I]).Free;
  FBServers.Free;
  inherited destroy;
end;

procedure TFBServers.GetRegServers;
var
  I: Integer;
  Reg: TRegistry;
  Servers : Tstringlist;
begin
  Servers := Tstringlist.Create;
  Servers.Clear;
  ServerNameMRU := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
//    {$IFDEF Advisor}
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Users\' + GetCurrentUser + '\MRU', False) then
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
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME, False) then
      begin
      TariSplashDate := Reg.ReadDate('TARI Splash Date');
      TARISplashCount := Reg.ReadInteger('TARI Splash Count');
      NavMenuView := Reg.ReadString('Nav Menu View');
      Reg.CloseKey;
      end;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\servers', False) then
      reg.GetKeyNames(servers);
    GGlobals.DebugOut('Got Server List');
    servers.Sort;
    GGlobals.DebugOut('Got Server Sort');
    // Eliminate MRU if not present
    if Servers.IndexOf('MRU') > -1 then
      Servers.Delete(Servers.IndexOf('MRU'));
    Reg.CloseKey;
    While Servers.Count > MAXSERVERS do
      Servers.Delete(Servers.Count - 1);
    Availablecount := 0;
//    count := Servers.Count;
    GGlobals.DebugOut('Before Available');
    for I := 0 to Servers.Count - 1 do    // Iterate
      FBServers.Add(TFBServer.create(Servers.Strings[I], True));
  finally
    Reg.Free;
    Servers.Free;
  end;
end;

Function TFBServers.SetCurrentServer(Sname : String): Boolean;
var
  I: Integer;
begin
  Result := False;
  GGlobals.DebugOut('Setting Current server:' + Sname);
  I := Indexof(Sname);
  if I < 0 then Exit;
  Result := True;
  CurrentServer := TFBServer(FBServers[I]);
  GGlobals.LicDir := CurrentServer.NetworkFolder;
end;

function TFBServers.Indexof(Sname : string): Integer;
var
  I: Integer;
begin
  result := -1;
  if Sname = '' then exit;
  for I := 0 to FBServers.Count - 1 do    // Iterate
    begin
    if ansisametext(TFBServer(FBservers[I]).ServerName, Sname) then
      Result := I;
    end;    // for
end;

function TFBServers.IndexofRealName(Sname : string): Integer;
var
  I: Integer;
begin
  result := -1;
  if Sname = '' then exit;
  for I := 0 to FBServers.Count - 1 do    // Iterate
    begin
    if ansisametext(TFBServer(FBServers[I]).ServerFullName, Sname) then
      Result := I;
    end;    // for
end;

procedure TFBServers.SetMRUServer;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    ServernameMRU := CurrentServer.ServerName;
//    {$IFDEF Advisor}
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Users\' + getcurrentuser + '\MRU', True) then
      begin
      Reg.WriteString('Server', ServernameMRU);
      Reg.CloseKey;
      end;
//    {$ELSE}
//    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\MRU', True) then
//      begin
//      Reg.WriteString('Server', CurrentServer.ServerName);
//      Reg.CloseKey;
//      end;
//    {$ENDIF}
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME, True) then
      begin
      if CompareDateTime(Reg.ReadDate('TARI Splash Date'), (now - 1460){StrToDate('01/01/2000')}) < 0 then
        Reg.WriteDate('TARI Splash Date', Now);
      Reg.WriteInteger('TARI Splash Count', TARISplashCount);
      NavMenuView := AnsiReplaceStr(NavMenuView, '&', '');
      Reg.WriteString('Nav Menu View', NavMenuView);
      Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

{
procedure TFBServers.CorrectHoles;
var
  I: Integer;
begin
  Count := 0;
  Availablecount := 0;
  for I := 0 to FBServers.Count - 1 do    // Iterate
    begin
    if FBServers[I] <> nil then
      begin
      inc(count);
      if FBServers[I].Available then
        inc(Availablecount);
      if (I > 0) and (FBServers[I -1] = nil) then // move it back one slot
        begin
        FBServers[I - 1] := Fbservers[I];
        FBServers[I] := nil;
        end;
      end;
    end;    // for
end;
}

function TFBServers.deleteServer(SName : String): Boolean;
var
  SIndex : Integer;
begin
  Sindex := Indexof(SName);
  if (Currentserver = nil) or (ansiSameText(CurrentServer.ServerName, SName) = False) then
    begin
    TFBServer(FBServers[Sindex]).Deleted := TFBServer(Fbservers[Sindex]).DelRegServer;
    TFBServer(FBServers[Sindex]).free;
    Result := True;
    end
  else
    begin
    Messagedlg('Can''t delete currently selected Server'
      + #13#10 + 'Select another server before deleting', mtWarning, [mbOk], 0);
    Result := False;
    end;
end;

constructor TLGlobals.create;
begin
  Inherited Create;
//  getOSInfoIsWIN95;
  TestConnectionCreated := False;
  LicenceThisFile := False;
  NewDemoFile := False;
  NewBusinesssettingUp := False;
  DemoFileLicenced := False;
  OpenTextFile; // Based on whether TextDebug is Defined
  GetRegistry;
  Loadtariconfig;
  CheckForApp;
end;

destructor TLGlobals.Destroy;
begin
//  if TestConnectionCreated then
//    DMTestConM.Free;
  Servers.destroy;      // 27/8/2003 was calling free should be destroy
  debugClose;
  SetRegistry;
  inherited destroy;
end;

procedure TLGlobals.Loadtariconfig;
Var
  Dataini : TiniFile;
begin
  Config_Accountingfmt := False;
  if fileexists(Basedir + 'tariconfig.ini') then
    begin
    DataIni := TiniFile.create(Basedir + 'tariconfig.ini');
    if Dataini.ValueExists('Options', 'PNLFormat') then
      Config_Accountingfmt := Dataini.ReadBool('Options', 'PNLFormat', False);
    if Config_Accountingfmt then
      begin
      DebugOut('Found tariconfig.ini. Result True');
      end
    else
      DebugOut('Found tariconfig.ini. Result False');
    Dataini.Free;
    end;
end;

Procedure TLGlobals.CheckForApp;
var
  Whandle : HWND;
begin
  SecondInstance := False;
  whandle := CreateFileMapping(THandle($FFFFFFFF), nil, PAGE_READONLY, 0, 32, 'TARI for Business');
  if Whandle <> 0 then
    begin
    if (getlasterror = ERROR_ALREADY_EXISTS) then
      SecondInstance := True;
    end
  else
    SecondInstance := True; // The File Mapping failed but we exist anyway
end;

procedure TLGlobals.LoadData;
var
  Blue, Green, Red : WORD;
begin
//  OpenTextFile; // Based on whether TextDebug is Defined
  OutputParameters;
//  Application.CreateForm(TDMTestConM, DMTestConM); // Create this Test Connection Module
  TestConnectionCreated := True;
  DebugOut('Created DMTtestconM');
  Servers := TFBServers.Create;
  DebugOut('Servers Created');
  // this is where we get the config info
//  Loadtariconfig;
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
end;

procedure TLGlobals.OpenTextFile;
{$IFDEF TextDebug}
var
//  I: Integer;
	Fname, FPath : System.string;
//	FileList : TstringList;
//	dFiles : TStringDynArray;
	function MyFileFilter(const NextFile: String; const SR : TSearchRec) : Boolean;
  var FileMTime : TDateTime;
  begin
		FileMTime := SR.TimeStamp;
		if (((AnsiCompareStr(ExtractFileExt(NextFile), 'txt') = 0) or
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
  FPath := getcurrentdir + '\Log';
	// tidy up old files
 //	FileList := TStringList.Create;
 //	dFiles := TDirectory.getFiles(FPath, System.String('*.txt'), TDirectory.TFilterPredicate(@MyFileFilter));
	//dfiles
//	for I := low(dFiles) to High(Dfiles) do    // Iterate
//		begin
//		DeleteFile(dfiles[I]);
//    end;    // for
//  FileList.Free;
//  CreateTempFile(aFolder : AnsiString;  aPrefix : AnsiString) : AnsiString;
  fname := formatDateTime('yyyymmddhhnnsszzz', now());
  AssignFile(FTextFile, 'Log\' + fname + '.txt');  // File selected in dialog box
  ReWrite(FTextFile);
  {$ENDIF}
  ;
end;

procedure TLGlobals.OutputParameters;
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

Procedure TLGlobals.GetRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  GGlobals.DebugOut('Getregistry');
  FormColour := $00E6E6E6; //$00CFF5CF;; // Old Blue $00FAE9DE;
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
      MRUSkin := reg.ReadString('Skin Name');
      Reg.CloseKey;
      if length(MRUSkin) < 2  then
        MRUSkin := 'MoneyTwins';
      end;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME, False) then
      begin
      Basedir := Reg.ReadString('BASEFOLDER');
      Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

procedure TLGlobals.GetDatePreferences;
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

procedure TLGlobals.SetDatePreferences;
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

function TLGlobals.GetOperatingSystem: String;
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

function TLGlobals.CopyMastFile(srcS, DestS: string): longbool;
var
	PSrc, PDest : PAnsichar;
begin
  getmem(Psrc, 200);
  Getmem(Pdest, 200);
  StrPcopy(Psrc, AnsiString(SrcS));
  StrPcopy(PDest, AnsiString(DestS));

	result := copyFileA(Psrc, PDest, False);
  FreeMem(Psrc);
  FreeMem(PDest);
end;

procedure TLGlobals.renewSampleDB;
var
//  OutFileP, InfileP : array[0..200] of char;
  CopySuccess : Longbool;
begin
  deleteFile(Servers.CurrentServer.NetworkFolder + 'Data\' + DEMOFILE);
  if FileExists(Servers.CurrentServer.NetworkFolder + 'Proto\' + MASTERTBL) then
    begin
//    StrPcopy(InFileP, Servers.CurrentServer.NetworkFolder + 'Proto\' + MASTERTBL);
//    StrPcopy(OutFileP, Servers.CurrentServer.NetworkFolder + 'data\' + DEMOFILE);
    CopySuccess := CopyMastFile(Servers.CurrentServer.NetworkFolder + 'Proto\' + MASTERTBL, Servers.CurrentServer.NetworkFolder + 'data\' + DEMOFILE);
    if (not copySuccess) then
      ShowMessage('Error copying file: ' + Servers.CurrentServer.NetworkFolder + 'Proto\' + MASTERTBL);
//    CopyFile( InFileP, OutFileP);
//    SetFileAttributes(InFileP, FILE_ATTRIBUTE_NORMAL);
    end;
end;

function TLGlobals.GetDateFDE: String;
begin
	GetFormatSettings;
	Result := FormatSettings.Shortdateformat;
  if Length(DateFDE) > 0 then
    Result := DateFDE;
end;

function TLGlobals.GetDateFSTD: String;
begin
	GetFormatSettings;
	Result := FormatSettings.ShortDateformat;
  if Length(DateFSTD) > 0 then
    Result := DateFSTD;
end;

function TLGlobals.GetDateFENH: String;
begin
  result := 'dd-MMM-yyyy';
  if Length(DateFENH) > 0 then
    Result := DateFENH;
end;

procedure TLGlobals.DebugOut(str : string);
begin
  {$IFDEF TextDebug}
  writeln(FTextFile, str);
  flush(FTextFile);
  {$ENDIF}
  ;
end;

procedure TLGlobals.debugClose;
begin
  {$IFDEF TextDebug}
  CloseFile(FTextFile);
  {$ENDIF}
  ;
end;

Procedure TLGlobals.SetRegistry;
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
      Reg.WriteString('Skin Name', MRUskin);
      Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

function TLGlobals.GetLicenceFilename : String;
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

function CopyFileto(srcS, DestS: string): longbool;
var
  PSrc, PDest : Pwidechar;
begin
  getmem(Psrc, length(SrcS) + 10);
  Getmem(Pdest, length(DestS) + 10);
  StrPcopy(Psrc, SrcS);
  StrPcopy(PDest, DestS);
	result := copyFile(Psrc, PDest, False);
  FreeMem(Psrc);
  FreeMem(PDest);
end;

function GetMachineName: string;
var
	buffer: array[0..255] of char;
	size: dword;
begin
	size := 256;
	if GetComputerName(buffer, size) then
		Result := buffer
	else
		Result := ''
end;

Function GetCurrentUser: string;
Var
	 UserName : string;
	 UserNameLen : Dword;
Begin
	 UserNameLen := 255;
	 SetLength(userName, UserNameLen) ;
	 If GetUserName(PChar(UserName), UserNameLen) Then
		 Result := Copy(UserName,1,UserNameLen - 1)
	 Else
		 Result := 'Unknown';
End;

Function IsFirebirdServerRunning(Host: string; Port : integer): Boolean;
var
		TCPClient1: TIdTCPClient;
begin
	TCPClient1 := TIdTCPClient.Create();
	TCPClient1.host := host;
	TCPClient1.port := port;
	Result := false;
	try
		try
			TCPClient1.Connect;
			if TCPClient1.Connected then
				begin
				Result := true;
				TCPClient1.IOHandler.CloseGracefully;
				end;
		except on E: Exception do
			;
		end;
	finally
	TCPClient1.Free;
	end;
end;

end.
