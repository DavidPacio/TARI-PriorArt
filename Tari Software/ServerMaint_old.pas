unit ServerMaint_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, auchtypes, registry, DMUsers,
  stsystem, stbase, DBCtrls, DataCollector, inifiles,
  LGlobals, cxCheckBox, cxRadioGroup, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, DMrep1U, cxLabel, cxGroupBox, cxMaskEdit;

type
  TServerMaint_oldF = class(TForm)
    FindTARIINI: TOpenDialog;
    ServerNam: TcxTextEdit;
    FirstBtn: TcxButton;
    PrevBtn: TcxButton;
    NextBtn: TcxButton;
    LastBtn: TcxButton;
    InsertBtn: TcxButton;
    DeleteBtn: TcxButton;
    cxButton1: TcxButton;
    PROTOCOLRB: TcxRadioGroup;
    IsUnixChk: TcxCheckBox;
    MFindNetworkPath: TcxButton;
    Server_Desc: TcxTextEdit;
    ServerAdmin: TcxTextEdit;
    TariFolder: TcxTextEdit;
    NetworkPath: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    CloseBtn: TcxButton;
    EmbeddedCB: TcxCheckBox;
    SysdbaPassword: TcxMaskEdit;
    cxLabel5: TcxLabel;
    cxLabel14: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcBtnFirstClick(Sender: TObject);
    procedure fcBtnPriorClick(Sender: TObject);
    procedure fcBtnNextClick(Sender: TObject);
    procedure fcBtnLastClick(Sender: TObject);
    procedure fcBtnInsertClick(Sender: TObject);
    procedure fcBtnDeleteClick(Sender: TObject);
    procedure GetServerregClick(Sender: TObject);
    procedure XMFindNetworkPathClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateNewServerRecord;
    function DeleteServer(index: integer): boolean;
    procedure putdata(ItemNo: Integer);
    procedure getdata(ItemNo: integer);
    procedure FindNetworkPath;
    procedure OpenRemoteinifile(RemoteFolder: String);
  public
    { Public declarations }
  end;

var
  ServerMaint_oldF: TServerMaint_oldF;
  Deletingserver : Boolean;
  currentIdx : Integer;

implementation

uses showcaption;

{$R *.dfm}

function Dirfilter(const SR: TSearchRec; Forinclusion : Boolean;
  var Abort : Boolean): Boolean;
begin
    Result := True;
end;

function ExtractServerName(UNCPath : string): string;
var
  I: Integer;
  tempstrS : array[0..100] of char;
  ResultS : array[0..100] of char;
begin
  strPcopy(tempStrS, UNCPath);
  for I := 2 to strlen(tempstrS) - 1 do    // Iterate
  begin
    if TempstrS[I] <> '\' then
    ResultS[I - 2] := TempStrS[i]
    else
    begin
      ResultS[I - 2] := #0;
      break;
    end;
  end;    // for
  result := strPas(ResultS);
end;


procedure TServerMaint_oldF.CreateNewServerRecord;
var
  I: Integer;
  idx : integer;
begin
  Idx := -1;
  for I := 0 to MAXSERVERS - 1 do    // Iterate
    begin
    if (idx = -1 ) and (GGlobals.Servers.FBServers[I] = nil) then
      Idx := i;
    end;    // for
  GGlobals.Servers.FBServers[idx] := TFBServer.create('New Server', False);
  inc(GGlobals.Servers.count);
  currentidx := idx;
  putdata(currentidx);
end;

procedure TServerMaint_oldF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  DMrep1.ButtonGlyphList.GetBitmap(0, CloseBtn.Glyph);
  Currentidx := 0;
  putdata(currentidx);
end;

procedure TServerMaint_oldF.putdata(ItemNo: Integer);
begin
  Servernam.text := GGlobals.Servers.fbServers[ItemNo].ServerName;
  Server_Desc.text := GGlobals.Servers.fbServers[ItemNo].ServerFullName;
  ServerAdmin.text := GGlobals.Servers.fbServers[ItemNo].AdminFolder;
  TariFolder.text := GGlobals.Servers.fbServers[ItemNo].ServerPath;
  NetworkPath.text := GGlobals.Servers.fbServers[ItemNo].NetWorkFolder;
  ProtocolRB.ItemIndex := 0;
  if Length(GGlobals.Servers.fbServers[ItemNo].SysdbaPassword) > 0 then
  SysdbaPassword.Text := GGlobals.Servers.fbServers[ItemNo].SysdbaPassword;
  IsUnixChk.checked := GGlobals.Servers.fbServers[ItemNo].IsUnix;
  EmbeddedCB.Checked := GGlobals.Servers.FBServers[ItemNo].isEmbedded;
  if GGlobals.Servers.fbServers[ItemNo].Protocol = 'TCP_IP' then
    ProtocolRb.ItemIndex := 1;
  if GGlobals.Servers.fbServers[ItemNo].Protocol = 'NetBEUI' then
    ProtocolRb.ItemIndex := 2;
end;

procedure TServerMaint_oldF.getdata(ItemNo: integer);
begin
  GGlobals.Servers.fbServers[ItemNo].ServerName := UpperCase(Trim(Servernam.text));
  GGlobals.Servers.fbServers[ItemNo].ServerFullName := Trim(Server_Desc.text);
  GGlobals.Servers.fbServers[ItemNo].AdminFolder := StrPas(chkaddslash(Pchar(Trim(ServerAdmin.text)), IsUnixChk.Checked));

  GGlobals.Servers.fbServers[ItemNo].ServerPath := StrPas(chkaddslash(Pchar(Trim(TariFolder.text)), IsUnixChk.Checked));

  GGlobals.Servers.fbServers[ItemNo].NetworkFolder := StrPas(chkaddslash(Pchar(Trim(NetworkPath.text)), False));
  if SysdbaPassword.Text > '' then
    GGlobals.Servers.fbServers[ItemNo].SysdbaPassword := SysdbaPassword.Text;
  GGlobals.Servers.fbServers[ItemNo].Protocol := '';
  GGlobals.Servers.fbServers[ItemNo].IsUnix := IsUnixChk.Checked;
  GGlobals.Servers.fbServers[ItemNo].isEmbedded := EmbeddedCB.Checked;
  if ProtocolRb.ItemIndex = 1 then
    GGlobals.Servers.fbServers[ItemNo].Protocol := 'TCP_IP';
  if ProtocolRb.ItemIndex = 2 then
    GGlobals.Servers.fbServers[ItemNo].Protocol := 'NetBEUI';
end;

procedure TServerMaint_oldF.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  EmbedName, gdsname : string;
begin
  EmbedName := 'fbembed.dll';
  gdsName := 'gds32.dll';
  if (GGlobals.Servers.count = 1) and (GGlobals.Servers.CurrentServer.isEmbedded) then
    begin
    if (fileexists(EmbedName)) and (not fileExists(gdsName)) then
      RenameFile(EmbedName, gdsName);
    end;
  if (GGlobals.Servers.count > 1) and (FileExists(gdsName)) then
    begin
    if FileExists(embedName) then
      DeleteFile(embedName);
    RenameFile(gdsName, EmbedName);
    end;
  Action := caFree;
end;

function TServerMaint_oldF.DeleteServer(index: integer): boolean;
begin
  result := True;
  GGlobals.Servers.deleteServer(UpperCase(Trim(Servernam.text)));
  Currentidx := 0;
  Putdata(currentidx);
end;

procedure TServerMaint_oldF.FindNetworkPath;
var
  I: Integer;
  Drive : Char;
  UNCName : string;
  CurrentFolder, NewBase : String;
  listfolders : TStringlist;
  SREC : TSearchRec;
  ServerFound : boolean;
  TariFound : boolean;
begin
  Screen.Cursor := crHourglass;
  ListFolders := Tstringlist.Create;
  Application.CreateForm(TShowLabelF, ShowlabelF);
  Serverfound := false;
  Tarifound := false;
  for Drive := 'A' to 'Z' do
  begin
    if ValidDrive(Drive) and (getdiskclass(Drive) = RemoteDrive) then
    begin
      newbase := Drive + ':\';
      UNCName :=  ExpandUNCFileName(newBase);
      if AnsiSameText(ExtractServerName(UNCName), ServerNam.text) then
      begin
        serverfound := True;
        ShowlabelF.SetLabel('Searching for TARI for Business files on ' + ServerNam.text + '  ....' );
        ShowlabelF.Show;
        ShowlabelF.Refresh;
        CurrentFolder := GetCurrentDir;
        setcurrentdir(Newbase);
        // build directory tree
        EnumerateDirectories(newbase, ListFolders, True, Dirfilter);
        for I := 0 to ListFolders.Count - 1 do    // Iterate
        begin
          Setcurrentdir(Listfolders.strings[I]);
          if findfirst('FBMfb.ini', faAnyFile, SREC) = 0 then
          begin
            OpenRemoteinifile(ListFolders.strings[i]);
            Putdata(Currentidx);
            Setcurrentdir(currentfolder);
            Findclose(SREC);
            ShowlabelF.Close;
            ShowlabelF.Free;
            Screen.Cursor := crDefault;
            Exit;
          end;
        end;    // for
      end;
    end;
  end;
  Listfolders.Free;
  Screen.Cursor := crDefault;
  if not serverfound then
    messagedlg('Server Name is incorrect or no drive has been mapped to it.', mtWarning, [mbOK], 0)
  else
  if not Tarifound then
    messagedlg('TARI for Business has not been installed and licenced on this drive OR' + #13#10 + 'The network Path does not inclide the TARI for Business Installation', Mtwarning, [mbok], 0);
end;

procedure TServerMaint_oldF.OpenRemoteinifile(RemoteFolder: String);
Var
  Dataini : TiniFile;
begin
  if fileexists(StrPas(chkaddslash(Pchar(RemoteFolder), IsUnixChk.Checked)) + 'FBMfb.ini') then
  begin
    DataIni := TiniFile.create(StrPas(chkaddslash(Pchar(RemoteFolder), IsUnixChk.Checked)) + 'FBMfb.ini');
    GGlobals.Servers.FBServers[CurrentIdx].ServerName := DataIni.ReadString('Serverinfo', 'Name', '');
    GGlobals.Servers.FBServers[CurrentIdx].Protocol := DataIni.ReadString('Serverinfo', 'Protocol', '');
    GGlobals.Servers.FBServers[CurrentIdx].ServerFullName := Dataini.ReadString('Serverinfo', 'Description','');
    GGlobals.Servers.FBServers[CurrentIdx].AdminFolder := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'Admin Path','')), IsUnixChk.Checked));
    GGlobals.Servers.FBServers[CurrentIdx].ServerPath := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'App Path','')), IsUnixChk.Checked));
    if length(GGlobals.Servers.FBServers[CurrentIdx].ServerPath) < 1 then // check to see if it is still an old file
      GGlobals.Servers.FBServers[CurrentIdx].ServerPath := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'Tari Path','')), IsUnixChk.Checked));
    Dataini.Free;
    GGlobals.Servers.FBServers[CurrentIdx].NetworkFolder := StrPas(chkaddslash(Pchar(RemoteFolder), False)) + 'TARI for Business\';
  end;
end;

procedure TServerMaint_oldF.fcBtnFirstClick(Sender: TObject);
begin
  getdata(CurrentIdx);
  CurrentIdx := 0;
  putdata(Currentidx);
end;

procedure TServerMaint_oldF.fcBtnPriorClick(Sender: TObject);
begin
  getdata(CurrentIdx);
  if Currentidx > 0 then
    dec(currentidx);
  putdata(Currentidx);
end;

procedure TServerMaint_oldF.fcBtnNextClick(Sender: TObject);
begin
  getdata(CurrentIdx);
  if Currentidx + 1 < GGlobals.Servers.count then
    inc(currentidx);
  putdata(Currentidx);
end;

procedure TServerMaint_oldF.fcBtnLastClick(Sender: TObject);
begin
  getdata(CurrentIdx);
  Currentidx := GGlobals.Servers.count -1;
  putdata(Currentidx);
end;

procedure TServerMaint_oldF.fcBtnInsertClick(Sender: TObject);
begin
  CreateNewServerRecord;
end;

procedure TServerMaint_oldF.fcBtnDeleteClick(Sender: TObject);
begin
  if GGlobals.Servers.Count = 1 then
    begin
    if messageDlg('Are you sure you want to delete your only server?' + #13#10 + 'TARI for Business will need to be re-Installed if you answer ''Yes''', mtWarning, [mbYes,mbNo], 0) = mrNo then
      exit;
    end;
  DeleteServer(CurrentIdx);
end;

procedure TServerMaint_oldF.GetServerregClick(Sender: TObject);
begin
  getdata(currentidx);
  FindNetworkPath;
  putdata(currentidx);
end;

procedure TServerMaint_oldF.XMFindNetworkPathClick(Sender: TObject);
var
  Drive : Char;
  Newbase, UNCName : string;
  found : boolean;
begin
  found := false;
  for Drive := 'A' to 'Z' do
  begin
    if ValidDrive(Drive) and (getdiskclass(Drive) = RemoteDrive) then
    begin
      newbase := Drive + ':\';
      UNCName :=  ExpandUNCFileName(newBase);
      if AnsiSameText(ExtractServerName(UNCName), ServerNam.text) then
      begin
        FindTariini.InitialDir := Newbase;
        if FindTariini.Execute() then
          NetworkPath.Text := ExtractFilePath(FindTariini.FileName);
        found := True;
      end;
      if found then
        exit;
    end;
  end;
end;

end.
