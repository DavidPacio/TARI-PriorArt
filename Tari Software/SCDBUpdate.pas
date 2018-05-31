unit SCDBUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SCDM, SCInterGlobals, inifiles, auchtypes, ExtCtrls,
  DBCtrls, Grids, DBGrids;

type
  TSCDBUpdateF = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SCDBUpdateF: TSCDBUpdateF;
  NewFileName : string;


implementation

{$R *.dfm}

function GetTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    GGlobals.TARIServer := DataIni.ReadString('TARI', 'TARIServer', '');
    GGlobals.TARIPath := DataIni.ReadString('TARI', 'TARIFBPath', '');
    GGlobals.TARIStartDate := DataIni.ReadDate('TARI', 'TARIStartDate', 0);
    GGlobals.TARIEndDate := DataIni.ReadDate('TARI', 'TARIEndDate', 0);
    GGLobals.TARIInterfaceDBPath := DataIni.ReadString('TARIInterface', 'DBPath', '');
    GGLobals.TARIInterfaceServer := DataIni.ReadString('TARIInterface', 'InterfaceServer', '');
    Dataini.Free;
    Result := True;
    end;
end;

function UpdateTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    DataIni.WriteString('TARIInterface', 'DBPath', GGLobals.TARIInterfaceDBPath);
    if length(GGLobals.TARIInterfaceServer) = 0 then
      DataIni.WriteString('TARIInterface', 'InterfaceServer', GGLobals.TARIServer);
    Dataini.UpdateFile;
    DataIni.Free;
    Result := True;
    end;
end;


procedure TSCDBUpdateF.Button1Click(Sender: TObject);
begin
// Make sure we can write to DB
  DMInterface.SCDatabase.ReadOnly := False;
  if Not DMInterface.SCDatabase.Connected then
    DMInterface.SCDatabase.Connected := True;
end;

initialization
  GGlobals := TSCInterGlobals.Create;
  if Not GGlobals.SecondInstance then
    begin
    GGlobals.initFailed := False;
    GGlobals.LoadData;
    NewFileName := '';
    if (Not GetTARIInterfaceINI) then
       GGlobals.initFailed := True;

    if (not GGlobals.initFailed) and (not Fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + ExtractFileName(GGlobals.TARIInterfaceDBPath))) then
      begin
      If (InputQuery('New Shortcuts Interface File', 'Enter File Name', NewFileName)) then
        begin
        newFileName := ChangeFileext(NewFileName, '.FDB');
        GGlobals.TARIInterfaceDBPath := GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + NewFileName;
        if not GGlobals.CopyMastFile(GGlobals.Servers.CurrentServer.NetworkFolder + 'proto\SHORTCUTSMASTER.FDB', GGlobals.TARIInterfaceDBPath) then
          begin
          showmessage('Failed to create Interface Master File');
          GGlobals.initFailed := True;
          end
        else
          begin
          UpdateTARIInterfaceINI;
          end;
        end
      else
        GGlobals.initFailed := True;
      end;
    GGlobals.DebugOut('Init Phase 1');
    if not GGlobals.initFailed then
      begin
      GGlobals.DebugOut('Init Phase 2');
      Application.CreateForm(TDMInterface, DMInterface);
      if not SameText(GGLobals.Servers.CurrentServer.ServerName, GGLobals.TARIServer) then
        GGLobals.Servers.SetCurrentServer(GGLobals.TARIServer);
      GGlobals.DebugOut('Init Phase 3');

      GGlobals.DebugOut('Init Phase 4 - Interface Server is ' + GGlobals.TARIInterfaceServer);
      DMInterface.SC2TARIDB.Server := GGlobals.TARIInterfaceServer;
      GGlobals.DebugOut('Init Phase 5 - Path is ' + GGlobals.TARIInterfaceDBPath);
      DMInterface.SC2TARIDB.Path := GGlobals.TARIInterfaceDBPath;
      GGlobals.DebugOut('Init Phase 6');
      DMInterface.SC2TARIDB.Connected := True;
      GGlobals.DebugOut('Init Phase 7');
      DMInterface.SCPath := DMInterface.GetSCPath;
      GGlobals.DebugOut('Init Phase 8');
      end;
    end;

Finalization
if Not GGlobals.Secondinstance then
  begin
  GGlobals.DebugOut('On Finalization');
  GGlobals.Destroy;
  end;
end.
