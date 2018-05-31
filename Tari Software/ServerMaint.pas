unit ServerMaint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, auchtypes, registry, DMUsers,
	DBCtrls, DataCollector, inifiles,
  LGlobals, cxCheckBox, cxRadioGroup, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, DMrep1U, cxLabel, cxGroupBox, cxMaskEdit,
  cxCustomData, cxDataStorage, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxListBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxFilter, cxData, cxCurrencyEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;
const
  // Grid column constants
  SERVER_NAME = 0;
  S_DESCRIPTION = 1;
  S_PORT = 2;
  IS_LINUX = 3;
  IS_EMBEDDED = 4;

type
  TServerMaintF = class(TForm)
    FindFBMFBINI: TOpenDialog;
    cxAddServer: TcxButton;
    CloseBtn: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridTVServers: TcxGridTableView;
    cxGridTVServerName: TcxGridColumn;
    cxGridTVServerDesc: TcxGridColumn;
    cxGridTVIS_Unix: TcxGridColumn;
    cxGridTVIS_Embedded: TcxGridColumn;
    cxOtherServers: TcxListBox;
    cxLabel1: TcxLabel;
    CxDeleteServer: TcxButton;
    cxGridTVServersPort: TcxGridColumn;
    cxLabel2: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CxDeleteServerClick(Sender: TObject);
    procedure cxAddserverClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateNewServerRecord;
    procedure OpenRemoteinifile(Remoteini: String);
    procedure FillOtherServers;
    Function FindServerBasePath(ServerName: String): String;
  public
    { Public declarations }
  end;

  TServerDataSource = class(TcxCustomDataSource)
  private
    Servers: TList;
    FModified: boolean;
  protected
    function GetRecordCount: Integer; override;
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    function IsNativeCompare: Boolean; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(AServers: TList);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;
  procedure GenerateColumns(AGridTableView: TcxGridTableView);

var
  ServerMaintF: TServerMaintF;
  Deletingserver : Boolean;
  currentIdx : Integer;

implementation

uses showcaption;

{$R *.dfm}

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

procedure TServerMaintF.CreateNewServerRecord;
begin
  Currentidx := GGlobals.Servers.FBServers.Add(TFBServer.create('New Server', False));
end;

procedure TServerMaintF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Currentidx := 0;
  GenerateColumns(cxGridTVServers);
  cxGridTVServers.DataController.CustomDataSource := TServerDataSource.Create(GGLobals.Servers.FBServers);
  cxGridTVServers.DataController.CustomDataSource.DataChanged;
  FillOtherServers;
//  putdata(currentidx);
end;

procedure TServerMaintF.FormClose(Sender: TObject;
	var Action: TCloseAction);
var
	EmbedName, gdsname : string;
begin
  EmbedName := 'fbembed.dll';
	gdsName := 'gds32.dll';
  // If there is only one server
  if (GGlobals.Servers.FBServers.Count = 1) and (TFBServer(GGlobals.Servers.FBServers.Last).isEmbedded) then
    begin
    if (fileexists(EmbedName)) and (not fileExists(gdsName)) then
      RenameFile(EmbedName, gdsName);
    end;
  if (GGlobals.Servers.FBServers.count > 1) and (FileExists(gdsName)) then
    begin
    if FileExists(embedName) then
      DeleteFile(embedName);
    RenameFile(gdsName, EmbedName);
    end;
  Action := caFree;
end;

procedure TServerMaintF.OpenRemoteinifile(Remoteini: String);
Var
  Dataini : TiniFile;
  isUnixFS : Boolean;
begin
  isunixFS := False;
  DataIni := TiniFile.create(Remoteini);
	TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerName := DataIni.ReadString('Serverinfo', 'Name', '');
  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).Protocol := DataIni.ReadString('Serverinfo', 'Protocol', '');
  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerFullName := Dataini.ReadString('Serverinfo', 'Description','');
  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).AdminFolder := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'Admin Path','')), isUnixFS));
  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerPath := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'App Path','')), isUnixFS));
  if length(TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerPath) < 1 then // check to see if it is still an old file
    TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerPath := StrPas(chkaddslash(Pchar(Dataini.ReadString('Serverinfo', 'Tari Path','')), isUnixFS));
  Dataini.Free;

  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).NetworkFolder := ExtractFileDir(Remoteini) + '\TARI for Business\';
  TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).Port := '3050';
end;

procedure TServerMaintF.FillOtherServers;
var
  Drive : Char;
	Newbase, UNCName : string;
begin
  cxOtherServers.Clear;
  for Drive := 'A' to 'Z' do
  begin
		if DirectoryExists(Drive + ':\') then
		begin
      newbase := Drive + ':\';
			UNCName :=  uppercase(ExtractServerName(ExpandUNCFileName(newBase)));
			if (length(UNCName) > 0) and (Not AnsiSameStr(UNCName, TFBServer(GGlobals.Servers.FBServers[CurrentIdx]).ServerName)) then
				begin
				if (GGlobals.Servers.Indexof(UNCName) < 0) and (cxOtherServers.Items.IndexOf(UNCName) < 0) then
					cxOtherServers.Items.Add(UNCName);
				end;
		end;
  end;
end;

Function TServerMaintF.FindServerBasePath(ServerName: String): String;
var
  Drive : Char;
  Newbase, UNCName : string;
begin
  cxOtherServers.Clear;
  Result := '';
  for Drive := 'A' to 'Z' do
    begin
		if DirectoryExists(Drive + ':\') then
		begin
      newbase := Drive + ':\';
			UNCName :=  uppercase(ExtractServerName(ExpandUNCFileName(newBase)));
			if (length(UNCName) > 0) and ansisametext(UNCName, ServerName) then
        begin
        Result := Newbase;
        break;
        end;
      end;
    end;
end;

constructor TServerDataSource.Create(AServers: TList);
begin
  inherited Create;
  Servers := AServers;
end;

destructor TserverDataSource.Destroy;
begin
  inherited Destroy;
end;

function TServerDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TServerDataSource.GetRecordCount: Integer;
begin
  Result := Servers.Count;
end;

function TServerDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  CurrentServer : TFBServer;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  CurrentServer := TFBServer(Servers[Integer(ARecordHandle)]);
  case Integer(ADataBinding.Data) of    //
    1: Result := CurrentServer.ServerName;
    2: Result := CurrentServer.ServerFullName;
    3: Result := CurrentServer.Port;
    4: Result := CurrentServer.isUnix;
    5: Result := CurrentServer.isEmbedded;
  end;    // case
end;

function TServerDataSource.IsNativeCompare: Boolean;
begin
  Result := False;
end;

procedure TServerDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  CurrentServer : TFBServer;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  CurrentServer := TFBServer(Servers[Integer(ARecordHandle)]);
  case Integer(ADataBinding.Data) of    //
    SERVER_NAME + 1:
      CurrentServer.ServerName := AValue;
    S_DESCRIPTION + 1:
      CurrentServer.ServerFullName := AValue;
    S_PORT + 1:
      CurrentServer.Port := AValue;
    IS_LINUX + 1:
      CurrentServer.isUnix := AValue;
    IS_EMBEDDED + 1:
      CurrentServer.isEmbedded := AValue;
  end;
end;

function TServerDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure GenerateColumns(AGridTableView: TcxGridTableView);
var
  I: Integer;
begin
  for I := 0 to AGridTableView.ColumnCount - 1 do    // Iterate
    begin
    with AGridTableView.Columns[I] do
      begin
       DataBinding.Data := Pointer(Tag);
        case tag of    //
          1, 2, 3:
            DataBinding.ValueTypeClass := TcxStringValueType;
          4, 5:
            DataBinding.ValueTypeClass := TcxBooleanValueType;
        end;    // case
      end;
    end;    // for
end;

procedure TServerMaintF.CxDeleteServerClick(Sender: TObject);
var
  lServerName : string;
begin
  // Check we have the right server to delete
  if length(TFBServer(GGlobals.Servers.FBServers[cxGridTVServers.DataController.GetFocusedRecordIndex]).ServerFullName) > 0 then
    Lservername := TFBServer(GGlobals.Servers.FBServers[cxGridTVServers.DataController.GetFocusedRecordIndex]).ServerFullName
  else
    lServerName := TFBServer(GGlobals.Servers.FBServers[cxGridTVServers.DataController.GetFocusedRecordIndex]).ServerName;
  if Messagedlg('You are about to delete server - ' + LserverName + #13#10 + ' Are you sure ?', mtwarning, [mbYes, mbCancel], 0) = mrYes then
    begin
    //  if Yes - Delete it and Rebuild the other server List
    TFBServer(GGlobals.Servers.FBServers[cxGridTVServers.DataController.GetFocusedRecordIndex]).DelRegServer;
    TFBServer(GGlobals.Servers.FBServers[cxGridTVServers.DataController.GetFocusedRecordIndex]).Free;
    GGlobals.Servers.FBServers.Delete(cxGridTVServers.DataController.GetFocusedRecordIndex);
    cxGridTVServers.DataController.CustomDataSource.DataChanged;
    FillOtherServers;
    end;
  // else we give up
end;

procedure TServerMaintF.cxAddserverClick(Sender: TObject);
var
  TargetFolder : String;
begin
// Do we have a server selected? if not and there is only one use that one else prompt
  if (cxOtherServers.ItemIndex = -1) and (cxOtherservers.Count > 1) then
    begin
    showmessage('Please select a server from the list and try again');
    exit;
    end;
  // Find Drive mapping to server and start the File search in X:\Focus Based Management if the folder exists else in X:\
  TargetFolder := FindServerBasePath(cxOtherServers.Items.Strings[cxOtherServers.ItemIndex]);
  if not Fileexists(TargetFolder + 'Focus Based Management\FBMfb.ini') Then
    begin
    if DirectoryExists(targetFolder + 'Focus Based Management') then
      FindFBMFBini.InitialDir := TargetFolder + 'Focus Based Management\'
    else
      FindFBMFBini.InitialDir := TargetFolder;
    if FindFBMFBini.Execute then
      TargetFolder := FindFBMFBini.FileName
    else
      TargetFolder := '';
    end
  else
    TargetFolder := TargetFolder + 'Focus Based Management\FBMfb.ini';
  // if we find FBMFb.ini we create a server entry and update our list of servers and remove from our list of possible servers.
  if Length(TargetFolder) > 0 then
    begin
    CreateNewServerRecord;
    OpenRemoteinifile(TargetFolder);
    cxGridTVServers.DataController.CustomDataSource.DataChanged;
    FillOtherServers;
    end;
end;

end.
