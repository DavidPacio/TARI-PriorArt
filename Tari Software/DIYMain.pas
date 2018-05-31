unit DIYMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ImgList, ComCtrls, ToolWin, Buttons, Grids, DBCtrls, Mask,
  dbtables, registry, ExtCtrls, MaintainUsers, DMUsers, consts, auchtypes, ShellAPI, inifiles,
	TARILoginDlg, lok_onhlp, DateUtils, IOUtils,
  syncobjs, jpeg, AppEvnts, idGlobal,
  IB_Components, IB_Script, db,  IB_Access,
	IB_SESSION, serverSel, DatePrefers, CashFlowDE,
	XPMan, cxControls, cxGroupBox, cxStyles, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, cxContainer, cxEdit,
  cxLabel, cxHint, cxLookAndFeels, cxGridDBTableView, cxTextEdit, cxDBEdit,
  ActnList, {dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxBarExtItems, dxBar,} cxButtons, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxImageComboBox, cxCalendar, cxCheckBox,
  cxCurrencyEdit, cxLookAndFeelPainters, {dxNavBarViewsFact,}
  dxBar, dxBarExtItems, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinsdxNavBarPainter, dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxSkinsdxStatusBarPainter, dxStatusBar{, StBase, StSpawn, Variants};
//  AppEvnts;


type
  TDIYMainF = class(TForm)
    FileOpenDlg: TOpenDialog;
    CamTimer: TTimer;
    cxGroupBox3: TcxGroupBox;
    DBDepartmentsTable: TcxGridDBTableView;
    LvBusiness: TcxGridLevel;
    MainGrid: TcxGrid;
    DBDepartmentsGroupName: TcxGridDBColumn;
    DBDepartmentsLastMonitored: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    Menu_File_New: TdxBarButton;
    Menu_File_Open: TdxBarButton;
    Menu_File_Exit: TdxBarButton;
    Menu_File: TdxBarSubItem;
    DataMonitor: TdxBarButton;
    Menu_Data_Entry: TdxBarSubItem;
    ReportsTargeting: TdxBarButton;
    ReportsTracking: TdxBarButton;
    Menu_Reports: TdxBarSubItem;
    BackupSendDBMenu: TdxBarButton;
    DatePreferencesM: TdxBarButton;
    MaintainServersM: TdxBarButton;
    UtilUsers: TdxBarButton;
    ChangeServer: TdxBarButton;
    ChangeDBPWD: TdxBarButton;
    DBMaintenance: TdxBarButton;
    Utilities: TdxBarSubItem;
    HelpContents: TdxBarButton;
    IntroNotes: TdxBarButton;
    Aboutdlg1: TdxBarButton;
    Meni_Help: TdxBarSubItem;
    NewFileBtn: TdxBarLargeButton;
    OpenSpeedBtn: TdxBarLargeButton;
    ActionList1: TActionList;
    ActAnalysePast: TAction;
    ActTargetReports: TAction;
    ExitBtn: TcxButton;
    FormColorDialog1: TColorDialog;
    actPLWhatif: TAction;
    ActFineTuneTargets: TAction;
    ActFullCashFlow: TAction;
    ActUltimateWhatIf: TAction;
    ActTrackingDataEntry: TAction;
    ActTrackingExpenses: TAction;
    ActTrackingOtherIncome: TAction;
    ActRevenueGrouping: TAction;
    ActNewFile: TAction;
    ActOpenFile: TAction;
    ActTrackingReports: TAction;
    actBackupSendDatabase: TAction;
    ActPreferences: TAction;
    ActMaintainServers: TAction;
    ActMaintainUsers: TAction;
    ActChangeServers: TAction;
    ActChangeDatabasePassword: TAction;
    ActDeleteOldData: TAction;
    ActHelpContents: TAction;
    ActIntroductoryNotes: TAction;
    ActAbout: TAction;
    ActExit: TAction;
    dxBarSubTargeting: TdxBarSubItem;
    dxBarSubTracking: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    UltimateWhatIFBtn: TdxBarLargeButton;
    BusinessNameEdit: TcxDBTextEdit;
    ActTBImport: TAction;
    TrialbalanceImportBtn: TdxBarLargeButton;
    TBImportBtn: TdxBarButton;
    ImportTBMen: TdxBarButton;
    ActLicenceFile: TAction;
    LicenceFileM: TdxBarButton;
    ActTARIParables: TAction;
    dxBarButton5: TdxBarButton;
    DBBusinessTable: TcxGridDBTableView;
    DBBusinessTableBRANCH_NAME: TcxGridDBColumn;
    DBBusinessTableCURRENCY: TcxGridDBColumn;
    LvDepartments: TcxGridLevel;
    ActSetup_Departments: TAction;
    ActSetup_Business: TAction;
    ActQuickCashFlow: TAction;
    Menu_setup: TdxBarSubItem;
    Menu_CashFlow: TdxBarSubItem;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    DBBusinessTableCurrency_Symbol: TcxGridDBColumn;
    DBBusinessTableTargetEnd: TcxGridDBColumn;
    DBBusinessTableTrackingEnd: TcxGridDBColumn;
    DBDepartmentsActivityUnits: TcxGridDBColumn;
    DBDepartmentsTargetEnd: TcxGridDBColumn;
    DBDepartmentsTrackEnd: TcxGridDBColumn;
    DBDepartmentsLastDayofweek: TcxGridDBColumn;
    DBDepartmentsTableDeptID: TcxGridDBColumn;
    DBBusinessTableBranchID: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    DBDepartmentsTableBranchID: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    dxNavBar2: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    dxNavBarGroup3: TdxNavBarGroup;
    dxNavBarGroup4: TdxNavBarGroup;
    dxNavBarGroup5: TdxNavBarGroup;
    dxNavBarItem1: TdxNavBarItem;
    dxNavBarItem2: TdxNavBarItem;
    dxNavBarItem3: TdxNavBarItem;
    dxNavBarItem4: TdxNavBarItem;
    dxNavBarItem5: TdxNavBarItem;
    dxNavBarItem6: TdxNavBarItem;
    dxNavBarItem7: TdxNavBarItem;
    dxNavBarItem8: TdxNavBarItem;
    dxNavBarItem9: TdxNavBarItem;
    dxNavBarItem10: TdxNavBarItem;
    dxNavBarItem11: TdxNavBarItem;
    dxNavBarItem12: TdxNavBarItem;
    dxNavBarItem13: TdxNavBarItem;
    dxNavBarItem14: TdxNavBarItem;
    StatusBar1: TdxStatusBar;
    ActTariCloud: TAction;
    dxBarButton19: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton20: TdxBarButton;
    TariCloudLargeBtn: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
//    procedure UtilUsersClick(Sender: TObject);
//    procedure C1Click(Sender: TObject);
//    procedure ChangeDBPWDClick(Sender: TObject);
//    procedure R1Click(Sender: TObject);
//    procedure Menu_File_OpenClick(Sender: TObject);
    procedure NewDeptBtnClick(Sender: TObject);
    procedure DelDeptBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CamTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActFullCashFlowExecute(Sender: TObject);
    procedure ActAnalysePastExecute(Sender: TObject);
    procedure ActTargetReportsExecute(Sender: TObject);
    procedure ActTrackingDataEntryExecute(Sender: TObject);
    procedure ActNewFileExecute(Sender: TObject);
    procedure ActOpenFileExecute(Sender: TObject);
    procedure ActTrackingReportsExecute(Sender: TObject);
    procedure actBackupSendDatabaseExecute(Sender: TObject);
    procedure ActPreferencesExecute(Sender: TObject);
    procedure ActMaintainServersExecute(Sender: TObject);
    procedure ActMaintainUsersExecute(Sender: TObject);
    procedure ActChangeServersExecute(Sender: TObject);
    procedure ActChangeDatabasePasswordExecute(Sender: TObject);
    procedure ActDeleteOldDataExecute(Sender: TObject);
    procedure ActHelpContentsExecute(Sender: TObject);
    procedure ActIntroductoryNotesExecute(Sender: TObject);
    procedure ActAboutExecute(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure ActTrackingOtherIncomeExecute(Sender: TObject);
    procedure ActTrackingExpensesExecute(Sender: TObject);
    procedure ActRevenueGroupingExecute(Sender: TObject);
    procedure ActSetup_DepartmentsExecute(Sender: TObject);
    procedure actPLWhatifExecute(Sender: TObject);
    procedure ActFineTuneTargetsExecute(Sender: TObject);
    procedure ActUltimateWhatIfExecute(Sender: TObject);
    procedure ActTBImportExecute(Sender: TObject);
    procedure ActLicenceFileExecute(Sender: TObject);
    procedure ActTARIParablesExecute(Sender: TObject);
    procedure ActQuickCashFlowExecute(Sender: TObject);
    procedure Business_DeleteBtnClick(Sender: TObject);
    procedure ActSetup_BusinessExecute(Sender: TObject);
    procedure AddBusinessBtnClick(Sender: TObject);
    procedure MainGridExit(Sender: TObject);
    procedure DBDepartmentsTableDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure DBDepartmentsTableDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure DBDepartmentsTableGetDragDropText(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AText: String);
    procedure DBBusinessTableTargetEndPropertiesEditValueChanged(
      Sender: TObject);
    procedure DBBusinessTableTrackingEndPropertiesEditValueChanged(
      Sender: TObject);
    procedure DBDepartmentsTableStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ActTariCloudExecute(Sender: TObject);
  private
    { Private declarations }
    MenuItemArray : array[0..20] of TMenuItem;
    function CheckUpdate(FileAlias : string): Boolean;
    procedure LaunchTargetWizard;
    procedure UpdateBusinessName;
    procedure SetupCFAssumptions;
    function DeptCreated: Boolean;
    function SetupComplete: Boolean;
    //    procedure ResetSampleDB;
    function GetMasterBranchID(AView: TcxCustomGridView): Integer;
    procedure SetupBusiness;
  public
    { Public declarations }
    Function OpenClientDB(FileAlias: string): Boolean;
    Function CheckLicenceAfterOpening(FileAlias: String): Boolean;
  end;

Const
  SOFTWAREDBVERSION = '1.3.9';
var
	DIYMainF: TDIYMainF;

  LicenceFile : string;
	Adminvarg : Variant;
  LFileName : string;
  LiniFile : string;
  CurrentDBVersion : string;
  FileVersion : string;
  FullVersionInfo : TEXEVersionData;  // declared in AuchTypes
  LoginDlg: TTARILoginDlg;
  ClosingApp : Boolean;
//  ODAHandle : THandle;
  LcheckResult : TLicCheck;
  ReplaceFile : LongBool;
  ExpiryText : string;
  MenuSelectserver : Boolean;
  DeptDragID : integer;
//  procedure getversioninfo;

implementation

{$R *.DFM}
uses LGlobals, DMrep1U, DMClient, DataCollector,
  ReportingTargets,
  ReportingTracking, About, Splash1,
  DBUpdate, DBMaint,
  LicenceA,
  ServerMaint, BackupRestore, LicenceExpiry, MonitoringSales,
  TrackingPeriod, MonitoringOtherIncome, MonitoringExpenses, quotes,
  DepartmentSetup, NewBusiness, PastInformation, PNLWhatIf, TargetingProfit,
  UltimateWhatif, LicenceEngine, LicenceCalc, TariParablesSplash,
  BSWhatif, BusinessSetup, TBFiles, MWClientIBO, DMTariMWCli;

function setadmin: boolean;
var
  I, j : Integer;
  RealName : string;
begin
  Result := True;
  GGlobals.DebugOut('Created User Data Module');
  if GGlobals.servers.availablecount > 0 Then
    begin
    Splashform.ProgressBar.Position := 24;
    if GGlobals.servers.Availablecount > 1 then
      begin
      Application.CreateForm(TServerSelF, ServerSelF);
      if MenuSelectServer then
        Begin
        ServerSelF.BorderStyle := bsSingle;
        ServerSelF.Position := poScreenCenter;
        ServerSelF.Height := 207;
        end
      else
        ServerSelF.BorderStyle := bsNone;
      ServerSelF.ServerCB.Properties.Items.Clear;
      for I := 0 to GGlobals.Servers.FBServers.Count - 1 do    // Iterate
        begin
        if TFBServer(GGlobals.servers.fbservers[I]).available then
          begin
          GGlobals.Servers.SetCurrentServer(TFBServer(GGlobals.Servers.fbservers[i]).ServerName);
          if GGlobals.Servers.currentserver.ServerFullName = '' then
            j := ServerSelF.ServerCB.Properties.Items.Add(GGlobals.Servers.currentserver.ServerName)
          else
            J := ServerSelF.ServerCB.Properties.Items.Add(GGlobals.Servers.currentserver.ServerFullName);
          if GGlobals.Servers.currentserver.ServerName = GGlobals.servers.ServernameMRU then
            RealName := serverSelF.ServerCB.Properties.Items[J];
          end;
        end;    // for
      Serverself.ServerCB.ItemIndex := Serverself.ServerCB.Properties.Items.IndexOf(RealName);
      if Serverself.ServerCB.ItemIndex < 0 then
        Serverself.ServerCB.ItemIndex := 0;
      if GGlobals.servers.Availablecount > 1 then
        begin
          try
          if ServerSelF.ShowModal = mrOK then
            begin
            J := GGlobals.Servers.indexof(ServerSelf.ServerCB.Text);
            if J < 0 then
              J := GGlobals.Servers.indexofRealName(ServerSelf.ServerCB.Text);
            GGlobals.Servers.SetCurrentServer(TFBServer(GGlobals.Servers.fbservers[j]).ServerName);
            end
          else
            Result := False;
          finally // wrap up
            ServerselF.Free;
          end;    // try/finally
        end;
      end
    else
      begin  // find the one that is available
      for I := 0 to GGlobals.Servers.FBServers.Count - 1 do    // Iterate
        if TFBServer(GGlobals.Servers.FBServers[I]).Available Then
          GGlobals.Servers.SetCurrentServer(TFBServer(GGlobals.Servers.fbservers[i]).ServerName);
      end;
    Splashform.ProgressBar.Position := 28;
    end
  else
    Result := False;
  Splashform.update;
  if Result then
    DMuserM.FBMADMINDB.Connected := True;
end;


{
procedure getversioninfo;
var
  fileInfo : pVS_FIXEDFILEINFO;
begin
  fileinfo := GetFixedVersionInfo;
  with fileinfo^ do
  begin
    Versioninfo := Format('%d.%d.%d.%d', [major, minor, release, build]);
  end;
end;
}

function TDIYMainF.CheckUpdate(FileAlias : string): Boolean;
var
  CurrentVersion : string;
begin
  // This needs to be simply a call to update metadata
//  if GGlobals.NewBusinesssettingUp then
//    begin
//    Result := true;  // this is a redundant check when its a new file.
//    exit;
//    end;
  Result := False;
  CurrentVersion := TBFile.GetDBVersion(FileAlias);
  // check the version of the database
  // If the version is the same, exit
  if (length(CurrentVersion) = 0) then
    exit
  else
    begin
    Result := True;
    if (CurrentDBVersion > CurrentVersion) then
      begin
      Result := False;   //The file needs updating
      DataModuleClient.ClientDatabase.Commit;
			DataModuleClient.ClientDatabase.Disconnect;
      FilePath1 := GGlobals.Servers.CurrentServer.ServerPath + 'data' + slashchar + DMuserM.getDataFilename(FileAlias);
      Application.CreateForm(TDBUpdateF, DBUpdateF);
      DBUpdateF.Updateto := CurrentDBVersion;
      DbUpdateF.CurrentVersion := CurrentVersion;
      DBUpdateF.SetMemo;
        try
          if DBUpdateF.showModal = mrok then
            begin
            TBFile.setDBVersion(FileAlias, currentDBversion);
            result := true;
            end;
        finally
          DBUpDateF.free;
        end;
      end
    else
      if SOFTWAREDBVERSION < CurrentVersion then
        begin
        ShowMessage('TARI for Business is not the latest version. Please Install the latest version to open this database');
        Result := False;
        end;
    end;
end;

procedure TDIYMainF.UpdateBusinessName;
begin
  DataModuleClient.BusinessDetails.Edit;
	DataModuleClient.BusinessDetailsBUSINESS_NAME.AsString := LicEngine.LicenceRec.BusinessName;
  DataModuleClient.BusinessDetails.Post;
end;

Function TDIYMainF.OpenClientDB(FileAlias: string): Boolean;
var
  dbpass, Fname : string;
  ExeDate : TDateTime;
  DBConnected : Boolean;
//  UpdateB : Boolean;
begin
  Result := False;  // Assume the worst
  GGlobals.DebugOut('Open File - Start');
  if (Not GGlobals.NewBusinesssettingUp) and (not CheckUpdate(FileAlias)) then
    exit;
  GGlobals.DebugOut('Open File - Update Checked');
  if (FileAlias = DEMONAME) and (GGlobals.FileLicence) then
    begin
    Exedate := GetFileModDate(GGlobals.BaseDir + 'Tari.exe') + 10;
    GGlobals.DebugOut('Open File - Checking dates');
    if (GetFileModDate(GGlobals.Licdir + 'Proto\' + MASTERTBL) > exedate) then
      begin
      MessageDlg('The ' + MASTERTBL + ' file appears to be have changed.'
      + #13#10 + 'This file must not be changed. See Licence Agreement.'
      + #13#10 + 'Please re-install the software to restore this file.', mtInformation, [mbOk], 0);
      DeleteFile(GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + DMuserm.getDataFilename(FileAlias));
      DeleteFile(GGlobals.Licdir + 'Proto\' + MASTERTBL);
      exit;
      end;
    end;

  if GGlobals.FileLicence then
    begin
    GGlobals.DebugOut('Open File - renewSampleDB');
    while (DataModuleClient.ClientDatabase.ConnectionStatus <> csDisconnected) do
      sleep(1000);
    if GGlobals.Servers.CurrentServer.CurrentDBAlias > '' then
      begin
      if (GGlobals.FileLicence) and (DMuserM.getDataFilename(GGlobals.Servers.CurrentServer.CurrentDBAlias) = DEMOFILE) then
        begin
        sleep(1000);
        GGlobals.renewSampleDB;
        end;
      end;
    End;

  GGlobals.DebugOut('Attempting to Open - ' + FileAlias);
  Result := True;
  if (Length(GGlobals.CurrentDBPWD) > 0) Then
    If (InputPwdQuery('Database Password', 'Enter the Password', dbpass, False, GGlobals.FormColour)) then
      begin
      if not ansisametext(GGlobals.CurrentDBPWD, dbPass) then
        Result := False;
      end
    else
      Result := False;

  DBConnected := False;
  if Result = True then
    DBConnected := TBFile.ConnectFile(FileAlias, fName);
  GGlobals.DebugOut('Connected to - ' + FileAlias);
  gglobals.LicencingFailed := False;   // Assume it always succeeds
  if Result and DBConnected then
    Result := CheckLicenceAfterOpening(FileAlias);
//  if not Result then
//    showMessage('Opening Failed after LicenceCheck');
end;

Function TDIYMainF.CheckLicenceAfterOpening(FileAlias: String): Boolean;
var
  DoRestoreLicence : Boolean;
begin
  Result := true;
  DoRestoreLicence := false;
  GGlobals.Servers.CurrentServer.CurrentDBAlias := FileAlias;
  TBFile.UpdateAliasinfo('', GGlobals.Servers.CurrentServer.CurrentDBAlias);
  BusinessNameEdit.Refresh;
  // do we have to licence this file
  if (GGlobals.FileLicence) or (GGlobals.LicenceThisFile) then
    begin
    GGlobals.FileLicence := True;
    if GGlobals.LicenceThisFile then
      begin
      LicEngine.SaveCurrentLicenceRec;
      DoRestoreLicence := True;
      end;
    if Not GGlobals.NewDBSetup then
      TBFile.SetupNew;
    BusinessNameEdit.Refresh;
    LicEngine.UseFBMConnection := False; //.DBName := DataModuleClient.ClientDatabase.DatabaseName;
    LCheckresult := LicEngine.FileLicenced;
    if LCheckResult = LCGrace then
      begin
      Application.CreateForm(TLicExpiryDlg, LicExpiryDlg);
      LicExpiryDlg.Daystorun := GGlobals.daystorun;
      if LicexpiryDlg.showModal = mrNo then
        LCheckResult := LCNoLic;
      LicExpiryDlg.Free;
      end;
    if ((LcheckResult = LCExpired)) //and (ansisametext(GGlobals.LicDir, GGlobals.BaseDir)))
      or (LCheckResult = LCNoLic)
      or (LCheckResult = LCInvalidLic) then
      begin
      Application.CreateForm(TLicenceFA, LicenceFA);
      LicEngine.LicenceRec.businessname := DataModuleClient.BusinessDetailsBUSINESS_NAME.AsString;
      LicenceFA.ShowModal;
      GGlobals.DebugOut('Second check');
      LicenceFA.free;
      LcheckResult := LicEngine.CheckLicenceDetails;
      DoRestoreLicence := False;
      end;
    if (GGlobals.LicenceThisFile) and (DoRestoreLicence) then
      LicEngine.RestoreLicenceRec;
    if LCheckresult = LCFileNameIncorrect then
      begin
      MessageDlg('The Name of the File does not match the Licenced File Name:' +
                #13#10 + LicEngine.LicenceRec.BusinessFileName +
                #13#10 + 'Renaming the file to this name may help.', mtInformation, [mbOk], 0);
      end;
    // End of licencing - Site Licence Only
    if (not GGlobals.TrialLic) and (LCheckResult <> LCLicOK) and (LCheckResult <> LCGrace) then
      begin
      GGlobals.LicencingFailed := True;
      Result := False;
      end;
    end;
  if Result = False then
    DataModuleClient.ClientDatabase.Disconnect
  else
    begin
    StatusBar1.Panels.Items[2].Text := 'Serial Number: ' + LicEngine.LicenceRec.SerialNumber;
    DataModuleClient.Businesses.First;
    DataModuleClient.SetBusinessTargetStart(DataModuleClient.BusinessesBRANCH_ID.Value, DataModuleClient.BusinessesTARGET_END.Value);
    DBBusinessTable.ViewData.Expand(True);
    if (GGlobals.FileLicence) and (Not GGlobals.LicencingFailed)  and (Not GGlobals.DemoFileLicenced) then
      begin
      UpdateBusinessName;
      BusinessNameEdit.Enabled := False;
      end;
    if GGlobals.DemoFileLicenced then
      begin
      BusinessNameEdit.Properties.ReadOnly := False;
      BusinessNameEdit.TabStop := True;
      BusinessNameEdit.Enabled := True;
      ActFineTuneTargets.Enabled := False;
//        ActFullCashFlow.Enabled := False;
      ActTrackingDataEntry.Enabled := False;
      ActTrackingExpenses.Enabled := False;
      ActTrackingOtherIncome.Enabled := False;
      ActRevenueGrouping.Enabled := False;
      ActTrackingReports.Enabled := False;
      ActUltimateWhatIf.Enabled := False;
      ActChangeServers.Enabled := False;
      ActMaintainServers.Enabled := False;
      end
    else
      begin
      ActChangeServers.Enabled := True;
      ActMaintainServers.Enabled := True;
      if (GGlobals.FileLicence) then
        begin
        BusinessNameEdit.Properties.ReadOnly := True;
        BusinessNameEdit.TabStop := False;
        ActChangeServers.Enabled := False;
        ActMaintainServers.Enabled := False;
        end;
      ActFineTuneTargets.Enabled := True;
//        ActFullCashFlow.Enabled := True;
      ActTrackingDataEntry.Enabled := True;
      ActTrackingExpenses.Enabled := True;
      ActTrackingOtherIncome.Enabled := True;
      ActRevenueGrouping.Enabled := True;
      ActTrackingReports.Enabled := True;
//        ActUltimateWhatIf.Enabled := False;
      end;
    end;
end;

procedure TDIYMainF.FormCreate(Sender: TObject);
begin
  DMrep1.TariButtonList.GetImage( 0, ExitBtn.Glyph);
  GGlobals.DebugOut('DIYMain Created');
  StatusBar1.Panels.Items[0].Text := 'Version: ' + FullVersionInfo.ProductVersion; // Versioninfo;
  if GGlobals.Servers.CurrentServer.CurrentUserAccess > 1 then
    UtilUsers.Enabled := False
  else
    UtilUsers.Enabled := True;
end;

procedure TDIYMainF.NewDeptBtnClick(Sender: TObject);
begin
  DBDepartmentsTable.DataController.Insert;
end;

procedure TDIYMainF.DelDeptBtnClick(Sender: TObject);
begin
	if messagedlg('All information for this Department / Revenue Group (' + DataModuleClient.DeptrefREVENUE_GROUP_NAME.AsString  +') will be deleted. Are you sure?', mtWarning, [mbOK,mbCancel], 0)= mrOK then
    DBDepartmentsTable.DataController.DeleteRecord(DBDepartmentsTable.DataController.RecNo);
end;

procedure TDIYMainF.LaunchTargetWizard;
begin
  if PastInformationF = nil then
    Application.CreateForm(TPastInformationF, PastInformationF);
  if (DataModuleClient.DepartmentsFirstPlanDate.value < (now - 5*365)) then
  begin
    DataModuleClient.Departments.edit;
    if DataModuleClient.DepartmentsCurrentPlanStart.value < (now - 5*365) then
      begin
      DataModuleClient.DepartmentsCurrentPlanStart.value := GGlobals.PStartDate;
      DataModuleClient.DepartmentsCurrentPlanEnd.Value := GGlobals.PEndDate;
      end
    else
      begin
      GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
      GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataModuleClient.Departments.Post;
  end;

  PastInformationF.showmodal;
//  PastInformationF.free;
  Screen.Cursor := crDefault;
  PastInformationF := nil;
  GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
end;

procedure TDIYMainF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	DataModuleClient.ClientDatabase.Disconnect;
  GGlobals.DebugOut('On Close  - Disconnect');
  while (DataModuleClient.ClientDatabase.ConnectionStatus <> csDisconnected) do
    sleep(1000);
  if (GGlobals.FileLicence) and (DMuserM.getDataFilename(GGlobals.Servers.CurrentServer.CurrentDBAlias) = DEMOFILE) then
    begin
    sleep(1000);
    GGlobals.DebugOut('On Close  - Backing up Sample DB');
   GGlobals.renewSampleDB;
		end;
	DMUserM.FBMADMINDB.Disconnect;
  ClosingApp := True;
end;

procedure TDIYMainF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  I : Integer;
begin
  for I := 0 to 20 do    // Iterate
    begin
    if assigned(MenuItemArray[I]) then
      menuItemArray[I].free;
    end;    // for
  CanClose := True;
end;

procedure TDIYMainF.CamTimerTimer(Sender: TObject);
begin
  CamTimer.Enabled := False;
  Close;
end;

procedure TDIYMainF.FormShow(Sender: TObject);
begin
  GGlobals.DebugOut('DIYMain Show Start');
  if (GGlobals.FileLicence) then
    begin
    GGlobals.DebugOut('DIYMain Show - Is File Licence');
    BusinessNameEdit.Properties.ReadOnly := True;
    BusinessNameEdit.TabStop := False;
    ActUltimateWhatIf.Visible := False;
    ActTBImport.Visible := False;
    if GGlobals.Servers.CurrentServer.CurrentDBAlias = 'New' then
      begin
      GGlobals.Servers.CurrentServer.CurrentdbAlias := DEMONAME;
      ActNewFileExecute(Sender);
      exit;
      end;
    end;
  if GGlobals.Servers.CurrentServer.CurrentUserName <> 'Admins' then
    MaintainServersM.Enabled := False
  else
    MaintainServersM.Enabled := True;
  if GGlobals.Servers.FBServers.Count = 1 then
    ChangeServer.Enabled := False
  else
    ChangeServer.Enabled := True;
  GGlobals.NewDBSetup := True; // Assume that DB setup has been done!!
  GGlobals.DebugOut('Could not open - ' + GGlobals.Servers.CurrentServer.CurrentDBAlias);
  GGlobals.DebugOut('Attempting to check version of DB - ' + GGlobals.Servers.CurrentServer.CurrentDBAlias);

  StatusBar1.Panels.Items[1].Text := 'Current Server: ' + GGlobals.Servers.CurrentServer.Servername;
//  ServerLabel.Caption := 'Current Server - ' + GGlobals.Servers.CurrentServer.Servername;

  Caption := PRODUCT_NAME;
  GGlobals.DebugOut('Form Show - Reopen file');
  if OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) and (Not GGlobals.LicencingFailed) then
    begin
    GGlobals.DebugOut('Form Show - Reopened file');
    if (GGlobals.FileLicence) and (Not GGlobals.DemoFileLicenced) then
      UpdateBusinessName;
    end
  else
    ActOpenFileExecute(Sender);
end;

procedure TDIYMainF.ActFullCashFlowExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if not Datacollect.DoesUserOptionExist(OARDAYSAVERAGE) then
    SetupCFAssumptions;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  if (DataModuleClient.DepartmentsFirstPlanDate.value < (now - 5*365)) then
  begin
    DataModuleClient.Departments.edit;
    if DataModuleClient.DepartmentsCurrentPlanStart.value < (now - 5*365) then
      begin
      DataModuleClient.DepartmentsCurrentPlanStart.value := GGlobals.PStartDate;
      DataModuleClient.DepartmentsCurrentPlanEnd.Value := GGlobals.PEndDate;
      end
    else
      begin
      GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
      GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataModuleClient.Departments.Post;
  end;

  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := '';
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := '';
  Application.CreateForm(TCashFlowDEF, CashFlowDEF);
  CashFlowDEF.showmodal;
  CashFlowDEF.free;
end;

procedure TDIYMainF.ActAnalysePastExecute(Sender: TObject);
var
  currentdept : integer;
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  if DataModuleClient.DSDepartments.State in [dsInsert,dsedit] then
    begin
    currentdept := DataModuleClient.DepartmentsDEPT_ID.Value;
    DataModuleClient.Departments.post;
    DataModuleClient.DeptRef.Refresh;
    DataModuleClient.Departments.Refresh;
    DataModuleClient.Departments.Locate('DEPT_ID', variant(CurrentDept), []);
{    DataModuleClient.Departments.first;
    while (DataModuleClient.Departments.eof = False) and (DataModuleClient.DepartmentsDEPT_ID.Value <> CurrentDept) do
      begin
      DataModuleClient.Departments.next;
      end;    // while
}
    DataModuleClient.Departments.edit;
    end;
  DataModuleClient.DeptRef.Refresh;
  DATAMODULECLIENT.DateRangers.Refresh;
  LaunchTargetWizard;
end;

procedure TDIYMainF.ActTargetReportsExecute(Sender: TObject);
begin
  if (Not DeptCreated) OR GGlobals.TrainingLicence then exit;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  DataModuleClient.DeptRef.Refresh;
  Application.CreateForm(TReportingTargetsF, ReportingTargetsF);
  ReportingTargetsF.showModal;
  ReportingTargetsF.free;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.GetDateFSTD;
end;

procedure TDIYMainF.ActTariCloudExecute(Sender: TObject);
begin
// here's where we launch the Tari Cloud Window
  if not assigned(DMTariMWClient) then
    Application.CreateForm(TDMTariMWClient, DMTariMWClient);
  screen.Cursor := crHourGlass;
  DataModuleClient.Departments.Locate('Dept_id',  DataModuleClient.DeptRefDEPT_ID.AsVariant, []);
  Application.CreateForm(TMWClientForm, MWClientForm);
  DataModuleClient.DMCHandle := MWClientForm.Handle;
  DataModuleClient.TSActive := true;
  MWClientForm.ShowModal;
  screen.Cursor := crDefault;
  DataModuleClient.TSActive := False;
  MWClientForm.Free;
end;

procedure TDIYMainF.ActTrackingDataEntryExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if (Not SetupComplete) or (DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value < (Now - 1500)) then
     ActSetup_DepartmentsExecute(Sender);
  screen.Cursor := crHourGlass;
  Application.CreateForm(TMonitoringSalesF, MonitoringSalesF);
  MonitoringSalesF.showModal;
  MonitoringSalesF.free;
  screen.Cursor := crDefault;
end;

procedure TDIYMainF.ActNewFileExecute(Sender: TObject);
var
  Newcopied, notCancelled : Boolean;
begin
// Start New Wizard
// disable mouse over stuff on the main Business table
  GGlobals.NewBusinesssettingUp := true;
  Application.CreateForm(TNewBusinessF, NewBusinessF);
  NewBusinessF.NewBusinessName := '';
  NewBusinessF.NewFileName := '';
  GGLobals.NewDBSetup := False;
  NewBusinessF.BaseFolder := GGlobals.Servers.CurrentServer.NetworkFolder + 'Data' + slashchar;
  GGlobals.DebugOut('Starting New Business Wizard');
  notCancelled := false;
  if NewBusinessF.ShowModal = mrOK then
    notCancelled := true;
  newBusinessF.free;
  if notCancelled then
    begin
    screen.Cursor := crHourGlass;
    GGlobals.NewBusinesssettingUp := true;
    NewCopied := TBFile.CreateNewFile;
    if (not Newcopied) or (not OpenClientDB(GGlobals.NewBusiness.Databasealias)) then
      begin
      GGlobals.DebugOut('Not Copied or Not Opened');
      DataModuleClient.ClientDatabase.Connected := False; // Make Sure its not open
      if not OpenClientDB(GGlobals.servers.CurrentServer.CurrentDBAlias) then  // Open Previous One
        // always attempt to open "DEMONAME"
         OpenClientDB(DEMONAME);
      screen.Cursor := crDefault;
      end
    else
      begin
      GGlobals.DebugOut('Copied or Opened');
      if (Not GGlobals.NewDBSetup) and (Not GGlobals.NewDemoFile) then
        begin
        GGlobals.DebugOut('Before Setup New');
        TBFile.SetupNew;
        BusinessNameEdit.Refresh;
        end;
      if (not GGlobals.multidept) then
        begin
        GGlobals.DebugOut('Before Setup Business');
        Screen.Cursor := crDefault;
        SetupBusiness;
//        ActSetup_BusinessExecute(Sender);

        GGlobals.DebugOut('After Setup Business');
        end;
      end;
    end;
  GGlobals.NewBusinesssettingUp := false;
end;

procedure TDIYMainF.ActOpenFileExecute(Sender: TObject);
var
  tmp : string;
//  FileOpen : TOpenDialog;
  OldFile : string;
  opened : boolean;
begin
//  FileOpen := TOpenDialog.Create(Self);
  Opened := False;
  OldFile := '';
  GGlobals.DebugOut('Starting Openfile');
  if DataModuleClient.ClientDatabase.Connected then
    begin
    OldFile := GGlobals.Servers.currentserver.CurrentDBAlias;
    DataModuleClient.ClientDatabase.Connected := False;
    end;
  FileOpenDlg.DefaultExt := 'fdb';
//  {$IFNDEF Advisor}
//  if LicenceType = 'S' then
//    begin
//    MessageDlg('Your Standalone Licence only permits you to open your'
//      + #13#10 + 'Licenced Database - ' + BusinessLicFile + ' or the'
//      + #13#10 + 'TARI for Business sample database - ' + DEMOFILE, mtInformation, [mbOk], 0);
//    if ansisametext(OldFile, DEMONAME) then
//      FileOpen.FileName := BusinessLicFile
//    else
//      FileOpen.FileName := DEMOFILE;
//    end;
//  {$ELSE}
  FileOpenDlg.FileName := '*.fdb';
//  {$ENDIF}
  FileOpenDlg.Filter := 'Firebird Database (fdb)|*.fdb';
  FileOpenDlg.FilterIndex := 1;
  //ensure we get the current paths
  FileOpenDlg.InitialDir := GGlobals.Servers.CurrentServer.NetworkFolder + 'Data';
  FileOpenDlg.Options := [ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofEnableSizing];
  if FileOpenDlg.Execute() then
    begin
    tmp := DMuserM.GetAliasfromFilename(ExtractFileName(FileOpenDlg.FileName));
    if tmp = '' then
      begin
      tmp := DMUserM.CreateAlias(ExtractFileName(FileOpenDlg.FileName));
      TBFile.UpdateAliasinfo(ExtractFileName(FileOpenDlg.FileName), tmp);
      end;
    GGlobals.DebugOut('Execute OK ' + tmp);
    if (OpenClientDB(tmp)) then
      Opened := True
    else
      if not GGlobals.LicencingFailed then
        MessageDlg('The database you attempted to open is not of the correct type.'
        + #13#10 + 'If you consider it to be of the correct type, please forward'
        + #13#10 + 'it to our support staff.', mtInformation, [mbOk], 0);
      // Else it will fall through and they know about licencing already
    end;
  if (not Opened) and (Not OpenClientDB(OldFile)) then
    begin
    GGlobals.DebugOut('Open Initially Failed');
    // try to open Sample
    OpenClientDB(DEMONAME);
    end;
//  FileOpen.free;
end;

procedure TDIYMainF.ActTrackingReportsExecute(Sender: TObject);
begin
  if (Not DeptCreated) OR GGlobals.TrainingLicence then exit;
  Application.CreateForm(TReportingTrackingF, ReportingTrackingF);
  ReportingTrackingF.showModal;
  ReportingTrackingF.free;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.GetDateFSTD;
end;

procedure TDIYMainF.actBackupSendDatabaseExecute(Sender: TObject);
begin
// Call Backup Send
  DataModuleClient.ClientDatabase.Disconnect;
  while (DataModuleClient.ClientDatabase.ConnectionStatus <> csDisconnected) do
    sleep(1000);
  if (GGlobals.FileLicence) and (DMuserM.getDataFilename(GGlobals.Servers.CurrentServer.CurrentDBAlias) = DEMOFILE) then
    begin
    sleep(1000);
    GGlobals.renewSampleDB;
    end;
  Application.CreateForm(TBackupFrm, BackupFrm);
  BackupFrm.ShowModal;
  Backupfrm.Free;
  if OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) and (Not GGlobals.LicencingFailed) then
    begin
    GGlobals.DebugOut('Form Show - Reopened file');
    if (GGlobals.FileLicence) and (Not GGlobals.DemoFileLicenced) then
      UpdateBusinessName;
    end
  else
    ActOpenFileExecute(Sender);
end;

procedure TDIYMainF.ActPreferencesExecute(Sender: TObject);
begin
  Application.CreateForm(TDatePrefersF, DatePrefersF);
  DatePrefersF.showmodal;
  DatePrefersF.free;
//  Color := GGlobals.FormColour;
//  dxBarManager1.DockColor := GGlobals.FormColour;
//  dxBarManager1.Bars[0].Color := GGlobals.FormColour;
//  dxBarManager1.Bars[1].Color := GGlobals.FormColour;
//  StatusBar1.Color := GGlobals.FormColour;
end;

procedure TDIYMainF.ActMaintainServersExecute(Sender: TObject);
var
  CurrentServerName : String;
begin
  if GGlobals.Servers.CurrentServer.CurrentUserName = 'Admins' then
  begin
    CurrentServerName := GGlobals.servers.currentserver.servername;
    if DataModuleClient.ClientDatabase.Connected then
      DataModuleClient.ClientDatabase.Connected := False;
    if DMUserM.FBMADMINDB.Connected then
      DMUserM.FBMADMINDB.Connected := false;
    GGlobals.servers.currentServer := nil;
    Application.CreateForm(TServerMaintF, ServerMaintF);
    ServerMaintf.showmodal;
    ServerMaintf.free;
    if GGlobals.Servers.indexof(CurrentServerName) > -1 then
      begin
      GGlobals.Servers.SetCurrentServer(CurrentServerName);
//      Reopen the file
      DMUserM.FBMADMINDB.Connected := True;
      if integer(CheckUpdate(GGlobals.Servers.CurrentServer.CurrentDBAlias)) <> 0 then
        if not OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) then
          ActOpenFileExecute(Sender);
      end
    else
      setadmin;
  end
  else
    messagedlg('Only the ''Admins'' user may perform the function.', mtInformation, [MbOK], 0);
end;

procedure TDIYMainF.ActMaintainUsersExecute(Sender: TObject);
begin
  Application.CreateForm(TMaintainUserF, MaintainUserF);
  MaintainUserF.showmodal;
  MaintainUserF.free;
end;

procedure TDIYMainF.ActChangeServersExecute(Sender: TObject);
var
  Currentserver : integer;
  changefailed : boolean;
begin
  changefailed := True;
  MenuSelectServer := True;
  if DataModuleClient.ClientDatabase.Connected then
    DataModuleClient.ClientDatabase.Connected := False;
  Currentserver := GGlobals.Servers.Indexof(GGlobals.Servers.CurrentServer.ServerName);
  if DMUserM.FBMADMINDB.Connected then
    DMUserM.FBMADMINDB.Connected := false;
  if SetAdmin then
    begin
    if GGlobals.Servers.CurrentServer.CurrentDBAlias  = '' then
      GGlobals.Servers.CurrentServer.CurrentDBAlias := DEMONAME;
    LoginDlg := TTARILoginDlg.create(nil);
    LoginDlg.PostStartup := True;
    StrpCopy(GGlobals.PUserName, GGlobals.Servers.CurrentServer.CurrentUsername);
    StrPcopy(GGlobals.PUserPwd, GGlobals.Servers.CurrentServer.currentUserPwd);
    if (LoginDlg.execute(GGlobals.PUserName, GGlobals.PUserPwd, GGlobals.PUserRole) = mrOK) then
      begin
      GGlobals.Servers.CurrentServer.CurrentUserName := StrPas(GGlobals.PUserName);
      GGlobals.Servers.CurrentServer.CurrentUserPwd := StrPas(GGlobals.PUserPwd);
      GGlobals.Servers.CurrentServer.CurrentUserRole := StrPas(GGlobals.PUserRole);
      Adminvarg := 'Admins';
      GGlobals.Servers.CurrentServer.CurrentUserPwd := DMUserM.Users.Lookup('User_Name', Adminvarg,'DBPassword');
      CurrentDBVersion := TBFile.GetDBVersion('Master.fdb');
      if integer(CheckUpdate(GGlobals.Servers.CurrentServer.CurrentDBAlias)) <> 0 then
        if not OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) then
          ActOpenFileExecute(Sender);
      changefailed := false;
      end;
    LoginDlg.Free;
    end;
//  15/7/2004 This seemed to be redundant considering the following condition
//  else
//    begin
//    changefailed := false;
//    Application.Terminate;
//    end;
  if changefailed then
  begin
    GGlobals.Servers.CurrentServer := TFBServer(GGlobals.Servers.fbservers[Currentserver]);
    DMUserM.FBMADMINDB.Connected := true;
    if Not OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) then
      OpenClientDB(DEMONAME);
  end;
  StatusBar1.Panels.Items[1].Text := 'Current Server: ' + GGlobals.Servers.CurrentServer.Servername;
end;

procedure TDIYMainF.ActChangeDatabasePasswordExecute(Sender: TObject);
var
  Encryptedpwd : string;
  NewPwd : String;
begin
  if (InputPwdQuery('Set Database Password', 'Enter New Password (Twice)', NewPwd, True, GGlobals.FormColour)) then
    begin
    if length(NewPwd) > 0 then
      EncryptedPwd := Newpwd
    else
      EncryptedPwd := '';
    DataModuleClient.SetDbPassword(EncryptedPwd);
    end;
end;

procedure TDIYMainF.ActDeleteOldDataExecute(Sender: TObject);
begin
  Application.CreateForm(TDBMaintF, DBMaintF);
  dbMaintf.showmodal;
  dbMaintf.free;
end;

procedure TDIYMainF.ActHelpContentsExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TDIYMainF.ActIntroductoryNotesExecute(Sender: TObject);
var
  ConcatfileS, directory, params  : array[0..200] of char;
begin
 strPcopy(directory, GGlobals.BaseDir);
 strPcopy(params, '');
 strPcopy(ConcatfileS, 'Help\TARI for Business Introductory Notes.pdf');
 ShellExecute(0, nil, concatfileS, nil, directory, SW_SHOWNORMAL );
end;

procedure TDIYMainF.ActAboutExecute(Sender: TObject);
begin
  dbversion := CurrentDBVersion;
  with TAboutDialog.Create(self)
  do try
    Execute;
  except
    close;
  end;
end;

procedure TDIYMainF.ActExitExecute(Sender: TObject);
begin

  if assigned(DMTariMwClient) and (DMTariMwClient.kbmMWClientConnectionPool1.CurConnections > 0) then
    DMTariMwClient.BreakConnections;
  ModalResult := MrOk;
	Close;
end;

procedure TDIYMainF.ActTrackingOtherIncomeExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value < (Now - 1500) then
    ActSetup_DepartmentsExecute(Sender);
  Application.CreateForm(TMonitoringOtherIncomeF, MonitoringOtherIncomeF);
  MonitoringOtherIncomeF.ShowModal;
  MonitoringOtherIncomeF.free;
end;

procedure TDIYMainF.ActTrackingExpensesExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value < (Now - 1500) then
    ActSetup_DepartmentsExecute(Sender);
  screen.Cursor := crHourGlass;
  Application.CreateForm(TMonitoringExpensesF, MonitoringExpensesF);
  MonitoringExpensesF.showModal;
  MonitoringExpensesF.free;
  screen.Cursor := crDefault;
end;

procedure TDIYMainF.ActRevenueGroupingExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  DataModuleClient.InvoiceLU.Active := False;
  DataModuleClient.InvoiceLU.Active := True;
  Application.CreateForm(TQuotesF, QuotesF);
	QuotesF.setUnitsDesc(DataModuleClient.DepartmentsSingular_UnitDesc.AsString, DataModuleClient.DepartmentsPlural_UnitDesc.asstring);
  QuotesF.showModal;
  QuotesF.free;
end;

procedure TDIYMainF.ActSetup_DepartmentsExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  SelectedType := stAll;
  DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := '';
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := '';
  DataModuleClient.Departments.Post;
  Application.CreateForm(TDepartmentSetupF, DepartmentSetupF);
  DepartmentSetupF.showmodal;
  DepartmentSetupF.free;
  DataModuleClient.Departments.Active := False;
  DataModuleClient.DeptRef.Active := False;
  DataModuleClient.Departments.Active := True;
  DataModuleClient.DeptRef.Active := True;
end;

procedure TDIYMainF.actPLWhatifExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  Application.CreateForm(TPNLWhatIfF, PNLWhatIfF);
  PNLWhatIfF.showmodal;
  PNLWhatIfF.free;
end;

procedure TDIYMainF.ActFineTuneTargetsExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  if TargetingProfitF = nil then
    Application.CreateForm(TTargetingProfitF, TargetingProfitF);
{
  if (DataModuleClient.DepartmentsFirstPlanDate.value < (now - 5*365)) then
  begin
    DataModuleClient.Departments.edit;
    if DataModuleClient.DepartmentsCurrentPlanStart.value < (now - 5*365) then
      begin
      DataModuleClient.DepartmentsCurrentPlanStart.value := GGlobals.PStartDate;
      DataModuleClient.DepartmentsCurrentPlanEnd.Value := GGlobals.PEndDate;
      end
    else
      begin
      GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
      GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataModuleClient.Departments.Post;
  end;
}
  TargetingProfitF.showmodal;
  TargetingProfitF.free;
  Screen.Cursor := crDefault;
  TargetingProfitF := nil;
  GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
end;

function TDIYMainF.DeptCreated: Boolean;
begin
  Result := true;
  if DataModuleClient.Departments.RecordCount = 0 then
    begin
    showmessage('Please create a Department/Revenue Group using the ''Add Department'' button.');
    Result := False;
    end
  else
    DataModuleClient.Departments.locate('DEPT_ID', DataModuleClient.DeptRefDEPT_ID.asVariant, []);
end;

procedure TDIYMainF.SetupCFAssumptions;
begin
  showmessage('Some Cash Flow Assumptions must be set up first.');
  SelectedType := stCashFlow;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
end;

procedure TDIYMainF.ActUltimateWhatIfExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if not Datacollect.DoesUserOptionExist(OARDAYSAVERAGE) then
    SetupCFAssumptions;
  if (DataModuleClient.DepartmentsFirstPlanDate.value < (now - 5*365)) then
  begin
    DataModuleClient.Departments.edit;
    if DataModuleClient.DepartmentsCurrentPlanStart.value < (now - 5*365) then
      begin
      DataModuleClient.DepartmentsCurrentPlanStart.value := GGlobals.PStartDate;
      DataModuleClient.DepartmentsCurrentPlanEnd.Value := GGlobals.PEndDate;
      end
    else
      begin
      GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
      GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataModuleClient.Departments.Post;
  end;

  Application.CreateForm(TUltimatewhatifF, UltimatewhatifF);
  UltimatewhatifF.showmodal;
  UltimatewhatifF.free;
end;

procedure TDIYMainF.ActTBImportExecute(Sender: TObject);
begin
//  if Not DeptCreated then exit;
//  ;
end;

procedure TDIYMainF.ActLicenceFileExecute(Sender: TObject);
Var
  IsFileLicencing : Boolean;
begin
  IsFileLicencing := GGlobals.FileLicence;
  GGlobals.FileLicence := True;
  LicEngine.SaveCurrentLicenceRec;
  LicEngine.UseFBMConnection := False; //   DBName := DataModuleClient.ClientDatabase.DatabaseName;
  LCheckresult := LicEngine.FileLicenced;
//  if ((LcheckResult = LCExpired)) //and (ansisametext(GGlobals.LicDir, GGlobals.BaseDir)))
//    or (LCheckResult = LCNoLic)
//    or (LCheckResult = LCInvalidLic) then
//    begin
    Application.CreateForm(TLicenceFA, LicenceFA);
    LicenceFA.ShowModal;
    GGlobals.DebugOut('Second check');
    LicenceFA.free;
//    end;
  LicEngine.RestoreLicenceRec;
  GGlobals.FileLicence := IsFileLicencing;
  if LCheckresult = LCFileNameIncorrect then
    begin
    MessageDlg('The Name of the File does not match the Licenced File Name:' +
            #13#10 + LicEngine.LicenceRec.BusinessFileName +
            #13#10 + 'Renaming the file to this name may help.', mtInformation, [mbOk], 0);
    end;
      // End of licencing - Site Licence Only
end;

procedure TDIYMainF.ActTARIParablesExecute(Sender: TObject);
var
  ConcatfileS, directory, params  : array[0..200] of char;
begin
 strPcopy(directory, GGlobals.BaseDir);
 strPcopy(params, '');
 strPcopy(ConcatfileS, 'Help\TARI Parables.pdf');
 ShellExecute(0, nil, concatfileS, nil, directory, SW_SHOWNORMAL );
end;

function TDIYMainF.SetupComplete: Boolean;
begin
  result := True;
  // check that we have units description
  DataModuleClient.Dept_AccountsLU.Active := False;
  DataModuleClient.Dept_AccountsLU.active := True;

  if (Length(DataModuleClient.DepartmentsSINGULAR_UNITDESC.Value) < 1) or
    (Trunc(DataModuleClient.DepartmentsCURRENTPLANSTART.Value) < 36000) then
    begin
    Showmessage('Setup has not been completed for this department.'
    + #13#10 + 'Please ensure the following are completed:'
    + #13#10 + '- Target Period dates'
    + #13#10 + '- Activity Names'
    + #13#10 + 'and proceed to the Finish button.');
    Result := False;
    end;
  DataModuleClient.Dept_AccountsLU.Active := False;
  // check that we have target dates
  // check that we have Department Accounts
  // if any are true, we show a message and return false
end;

procedure TDIYMainF.ActQuickCashFlowExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if not Datacollect.DoesUserOptionExist(OARDAYSAVERAGE) then
    SetupCFAssumptions;
  if Not SetupComplete then
     ActSetup_DepartmentsExecute(Sender);
  if (DataModuleClient.DepartmentsFirstPlanDate.value < (now - 5*365)) then
  begin
    DataModuleClient.Departments.edit;
    if DataModuleClient.DepartmentsCurrentPlanStart.value < (now - 5*365) then
      begin
      DataModuleClient.DepartmentsCurrentPlanStart.value := GGlobals.PStartDate;
      DataModuleClient.DepartmentsCurrentPlanEnd.Value := GGlobals.PEndDate;
      end
    else
      begin
      GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
      GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataModuleClient.Departments.Post;
  end;

  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := '';
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := '';
  Application.CreateForm(TBSWhatifF, BSWhatifF);
  BSWhatifF.showmodal;
  BSWhatifF.free;
end;

procedure TDIYMainF.Business_DeleteBtnClick(Sender: TObject);
begin
	if messagedlg('All information for this Business / Branch (' + DataModuleClient.BusinessesBRANCH_NAME.AsString  + ') will be deleted. Are you sure?', mtWarning, [mbOK,mbCancel], 0)= mrOK then
    DataModuleClient.Businesses.Delete;
  DataModuleClient.Businesses.Active := False;
  DataModuleClient.Businesses.Active := True;
end;

procedure TDIYMainF.ActSetup_BusinessExecute(Sender: TObject);
begin
  SetupBusiness;
end;

procedure TDIYMainF.SetupBusiness;
begin
  if Not DeptCreated then exit;
  SelectedType := stAll;
  DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := '';
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := '';
  DataModuleClient.Departments.Post;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
end;

procedure TDIYMainF.AddBusinessBtnClick(Sender: TObject);
begin
// add
  TBFile.CreateNewBusiness('New Business / Branch', False);
  DBBusinessTable.DataController.RefreshExternalData;
end;

procedure TDIYMainF.MainGridExit(Sender: TObject);
begin
  DataModuleClient.Departments.locate('DEPT_ID', DataModuleClient.DeptRefDEPT_ID.asVariant, []);
end;

procedure TDIYMainF.DBDepartmentsTableDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
{
Var
  HT : TcxCustomGridHitTest;
}
begin
  if GGlobals.NewBusinesssettingUp = False then
    begin
    Accept := False;
    if Source is TcxDragControlObject then
      with TcxDragControlObject(Source) do
        if Control is TcxGridSite then
          with TcxGridSite(Control) do
            Accept := (GridView.PatternGridView = DBDepartmentsTable);
    end;
{
  with TcxGridSite(sender) do
    begin
    HT := ViewInfo.GetHitTest(X, Y);
    Accept := (HT is TcxCustomGridHitTest) and (TcxGridRecordCellHitTest(HT).GridRecord.RecordIndex <> GridView.DataController.FocusedRecordIndex);
    end;    // with
}
end;

function TDIYMainF.GetMasterBranchID(AView: TcxCustomGridView): Integer;
begin
  result := TcxDBDataRelation(Aview.DataController.GetMasterRelation).GetMasterRecordID(AView.MasterGridRecordIndex);
end;

procedure TDIYMainF.DBDepartmentsTableDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
  I : integer;
//  ABranchIndex : Integer;
  ADataSet : TDataset;
  BField : TField;
  DField : TField;
  ADataController :  TcxDBDataController;
  BranchID : Integer;
begin
  if ((DeptDragID < 0) or (GGlobals.NewBusinesssettingUp)) then exit;
  LvDepartments.Active := False;
  BranchID := GetMasterBranchID(TcxGridSite(Sender).GridView);
  with TcxGridSite(Sender) do
    begin
    ADataController :=  TcxDBDataController(GridView.DataController);
    ADataSet :=  ADataController.DataSet;
    BField := ADataSet.FieldByName('BRANCH_ID');
    DField := ADataSet.FieldByName('DEPT_ID');
    ADataSet.First;
    for I := 0 to ADataSet.RecordCount - 1 do
      begin
      ADataSet.Edit;
      If (DField.AsInteger = DeptDragID) then
        begin
        BField.AsInteger := BranchID;
        end;
      ADataSet.Post;
      ADataSet.Next;
      end;
    ADataController.UpdateItems(True);
    end;
  DbDepartmentsTable.DataController.UpdateItems(true);

  DeptDragID := -1;
end;

procedure TDIYMainF.DBDepartmentsTableGetDragDropText(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AText: String);
begin
  if GGlobals.NewBusinesssettingUp then exit;

  Atext := Arecord.Values[DBDepartmentsGroupName.index];
  
//  BranchDragID :=
end;

procedure TDIYMainF.DBBusinessTableTargetEndPropertiesEditValueChanged(
  Sender: TObject);
var
  BranchID : Integer;
  NewEndDate : TDateTime;
begin
  NewEndDate := TcxCustomEdit(Sender).EditValue;
  BranchID := DataModuleClient.BusinessesBranch_ID.Value;
  DataModuleClient.SetBusinessTargetStart(BranchID, NewEndDate);
end;

procedure TDIYMainF.DBBusinessTableTrackingEndPropertiesEditValueChanged(
  Sender: TObject);
var
  BranchID : Integer;
  NewEndDate : TDateTime;
begin
  NewEndDate := TcxCustomEdit(Sender).EditValue;
  BranchID := DataModuleClient.BusinessesBranch_ID.Value;
  DataModuleClient.SetBusinessTrackStart(BranchID, NewEndDate);
end;

procedure TDIYMainF.DBDepartmentsTableStartDrag(Sender: TObject;
  var DragObject: TDragObject);
{var
  I : Integer;
}
begin
  with TcxGridDBTableView(TcxGridSite(Sender).GridView) do
    begin
    DeptDragID := Controller.SelectedRecords[0].Values[DBDepartmentsTableDeptID.Index];
    end;    // with
end;

Initialization
  GGlobals := TLGlobals.Create;
if Not GGlobals.SecondInstance then
  begin
  GGlobals.initFailed := False;
	GGlobals.LoadData;  // this finds/creates servers
	Application.CreateForm(TDMRep1, DMRep1); // Styles and Repository
  DMRep1.dxSkinController1.SkinName := GGlobals.MRUSkin;
	Splashform := Tsplashform.create(Nil);
	SplashForm.show;
	Splashform.ProgressBar.Properties.BeginColor := GGlobals.DominantMainColor;
	Splashform.Update;
	Splashform.ProgressBar.Position := 10;
	Splashform.startlabel.caption := 'Connecting to databases and checking licence details.';
	// Set defaults for Planning period just in case nothing has been stored
  LicEngine := TLicenceEngine.Create;
  // initfailed  is set if there are not available servers
  if GGlobals.Initfailed = False then
    begin
    GGlobals.PstartDate := now;
    GGlobals.PEndDate := now + 365;
    //  Find out who was the last user and what database was opened
    GGlobals.TrialLic := False;

    Splashform.ProgressBar.Position := 12;
    SetCurrentDir(GGlobals.Basedir);
    FullVersionInfo := GetEXEVersionData(''); //this will retrieve this file's details
//    getversioninfo;

    Splashform.ProgressBar.Position := 14;
    Application.CreateForm(TDMUserM, DMUserM);
    // FIND OUT WHERE WE SHOULD TRY FOR LICENCING. If the server is not available
    // try locally
    Splashform.ProgressBar.Position := 20;
    GGlobals.DebugOut('Licdir = ' + GGlobals.licdir);
    GGlobals.LicTemp := False;
    GGlobals.FileLicence := false;
    if GGlobals.Servers.CurrentServer.isEmbedded then
      GGlobals.FileLicence := True; // assume as have a File Licence
    {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}

    if CommandlineArgument('/LICENCE', LicenceFile) then
      begin
      GGlobals.DebugOut(GGlobals.licdir);
      GGlobals.DebugOut('Licencing - File Name Next Line');
      GGlobals.DebugOut(LicenceFile);
      // Save as temp licence file as we need to determine if it is Site or File Licencing
      lInifile := GGlobals.LicDir + 'TempLic.ini'; // APPINI;
      if not FileExists(LicenceFile) then
        showmessage('Source file does not exist');
      if fileexists(Linifile) then
        deletefile(Linifile);
      if not CopyFileTo(LicenceFile, lIniFile) then
        ShowMessage('Error copying file: ' + LicenceFile)
      else
        GGlobals.LicTemp := True;
      end;
   {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
      // check Licence if incorrect terminate
    GGlobals.DebugOut('Just Before Licence Check');
    GGlobals.TrialLic := False;
  // This could have been set to true - don't merge!!
  if GGlobals.initfailed = False then
    begin
    GGlobals.DebugOut('Licence Checking');
    if FileExists('Help\TariHlp.chm') then
      Application.HelpFile := 'Help\TariHlp.chm'
    else
     if FileExists('Help\TariHlp.hlp') then
      Application.HelpFile := 'Help\TariHlp.hlp';
    GGlobals.SetAdminFailed := True;
    LCheckResult := LCNotChecked;
    MenuSelectserver := False;
    if SetAdmin then
      begin
      // Here's is where we check for a site licence
      // Start of Site Licencing
      GGlobals.SetAdminFailed := False;
      GGlobals.FileLicence := True;
      GGlobals.DebugOut('Licence Dir = ' + GGlobals.LicDir);
      if FileExists(GGlobals.LicDir + APPINI) then
        begin
        GGlobals.FileLicence := False;
        Splashform.ProgressBar.Position := 28;
        GGlobals.DebugOut('Setting up new licenceform');
        LCheckResult := LicEngine.SiteLicenced;
        if LCheckResult = LCGrace then
          begin
          Application.CreateForm(TLicExpiryDlg, LicExpiryDlg);
          LicExpiryDlg.Daystorun := GGlobals.daystorun;
          if LicexpiryDlg.showModal = mrNo then
            LCheckResult := LCNoLic;
          LicExpiryDlg.Free;
          end;
        GGlobals.DebugOut('Licence Result (Site) - ' + Inttostr(Integer(LCheckResult)));
        Splashform.ProgressBar.Position := 30;
        Splashform.update;
        if ((LcheckResult = LCExpired)) //and (ansisametext(GGlobals.LicDir, GGlobals.BaseDir)))
          or (LCheckResult = LCNoLic)
          or (LCheckResult = LCInvalidLic) then
          begin
          Application.CreateForm(TLicenceFA, LicenceFA);
          LicenceFA.ShowModal;
          GGlobals.DebugOut('Second check');
          LicenceFA.free;
          LcheckResult := LicEngine.CheckLicenceDetails;
          Splashform.ProgressBar.Position := 32;
          Splashform.update;
          end;
        end;
      // End of licencing - Site Licence Only
      if ((not GGlobals.TrialLic) and ((LCheckResult = LCInvalidLic)
        or (LCheckResult = LCNoLic)
        or (LCheckResult = LCNotConnected)
        or (LCheckResult = LCExpired))) then
        begin
        if Messagedlg('TARI beleives this installation is licenced as a ''''Site''''.' +
              #13#10 + 'Site Licencing has failed.' +
              #13#10 + 'If you have licenced files to access, Click the ''''Yes'''' Button.', MtInformation, [mbYes, mbNo], 0) = mrYes then
          GGlobals.FileLicence := True
        else
          GGlobals.initFailed := True;
        end;
      if LCheckResult = LCLicOK then
        GGlobals.FileLicence := False;
      end;
    end;
  if (GGlobals.initfailed = False) and (Not GGlobals.SetAdminFailed) then
    begin
    GGlobals.SetAdminFailed := False;
    Splashform.ProgressBar.Position := 35;
    Splashform.update;
    if (GGlobals.servers.CurrentServer.CurrentDBAlias = '') then
      GGlobals.servers.CurrentServer.CurrentDBAlias := DEMONAME;
    GGlobals.DebugOut('Got DBVersion');
    // Initialise NewBusiness Record
    GGlobals.NewBusiness.Departments := nil;
		Splashform.ProgressBar.Position := 50;
		LoginDlg := TTARILoginDlg.create(nil); // Original Splash Size is
		LoginDlg.PostStartup := False;
		StrpCopy(GGlobals.PUserName, GGlobals.servers.CurrentServer.CurrentUsername);
		StrpCopy(GGlobals.PUserPwd, GGlobals.servers.CurrentServer.CurrentUserPwd);
		if (LoginDlg.execute(GGlobals.PUserName, GGlobals.PUserPwd, GGlobals.PUserRole) = mrOK) then
//      begin

		{
		LoginDlg := TDoItLoginDlg.create(nil);
		LoginDlg.PostStartup := False;
		StrpCopy(GGlobals.PUserName, GGlobals.servers.CurrentServer.CurrentUsername);
		StrpCopy(GGlobals.PUserPwd, GGlobals.servers.CurrentServer.CurrentUserPwd);
		if (LoginDlg.execute(GGlobals.PUserName, GGlobals.PUserPwd, GGlobals.PUserRole) = mrOK) then
}
			begin
			Splashform.update;
			Splashform.ProgressBar.Position := 55;
			GGlobals.servers.CurrentServer.CurrentUserName := StrPas(GGlobals.PUserName);
			GGlobals.Servers.CurrentServer.CurrentUserPwd := StrPas(GGlobals.PUserPwd);
			GGlobals.servers.CurrentServer.CurrentUserRole := StrPas(GGlobals.PUserRole);
			GGlobals.DebugOut('Log on OK');
			Adminvarg := 'Admins';
			GGlobals.AdminPwd := DMUserM.Users.Lookup('User_Name', Adminvarg,'DBPassword');
			Splashform.ProgressBar.Position := 60;
			GGlobals.DebugOut('Have admin pwd = length = ' + inttostr(length(GGlobals.Adminpwd)));
			if length(GGlobals.adminpwd) = 0 then
				begin
				Splashform.ProgressBar.Position := 65;
				GGlobals.adminpwd := DMUserM.getadminpwd;
				GGlobals.DebugOut('#2 Have admin pwd = length = ' + inttostr(length(GGlobals.Adminpwd)));
				end;
			CurrentDBVersion := TBFile.GetDBVersion('Master.fdb');
      splashform.StartLabel.Caption := 'Opening last database and collecting information';
			Splashform.ProgressBar.Position := 70;
			GGlobals.DebugOut('Have DB Version = ' + currentDBVersion);
			Application.CreateForm(TDataModuleClient, DataModuleClient);
			Splashform.ProgressBar.Position := 80;
      GGlobals.DebugOut('DM Client is created');
      DataCollect := TDataCollector.Create;
      Splashform.ProgressBar.Position := 85;
      GGlobals.DebugOut('Data Colector is created');
      Splashform.ProgressBar.Position := 90;
      Application.CreateForm(TDIYMainF, DIYMainF);
      Splashform.ProgressBar.Position := 95;
      GGlobals.getDatePreferences;
      GGlobals.DebugOut('Main Form Created');
      Splashform.ProgressBar.Position := 100;
{      with SplashForm do
        begin
        Fader1 := 30;
        AlphaSteps := 8;
        Timer.Interval := 1;
        AlphaBlend := True;
        AlphaBlendValue := Fader1 * AlphaSteps;
        Timer.Enabled := true;
        end;    // with
}
      SplashForm.Close;
//      Splashform.timer.enabled := True;
      GGlobals.DebugOut('Splashform Timer set');
      if CompareDateTime(GGlobals.Servers.TARISplashDate, (now - 1460)) < 0 then
        GGlobals.Servers.TARISplashDate := Now;
      if (DaysBetween( Now, GGlobals.Servers.TARISplashDate) < 30) and (GGlobals.Servers.TARISplashCount < 2) then
        begin
        Application.CreateForm(TTariParablesSplashF, TariParablesSplashF);
        TariParablesSplashF.ShowModal;
        TariParablesSplashF.Free;
        end;

      GGlobals.DebugOut('After TARI Splash');
      end
    else
      begin
      GGlobals.initfailed := True;
      if DMUserM.FBMADMINDB.connected then
        DMuserM.FBMADMINDB.Connected := False;
      end;
    end;
  if Not GGlobals.setAdminFailed then
    LoginDlg.Free;
  if GGlobals.initfailed then
    begin
    Splashform.Close;
    Splashform.release;
    end;
  end;
end;

Finalization
if Not GGlobals.Secondinstance then
begin
  if not GGlobals.initfailed then
    begin
    if assigned (PlanExpDataList) then
      PlanExpDataList.Free;
    if assigned (ConsolidList) then
      ConsolidList.free;
    if assigned (PlanDataList) then
      PlanDataList.free;
    if assigned (ReportDataList) then
      ReportDataList.free;
    DataCollect.Free;
		DMRep1.Free;
		Splashform.release;
		end;
//  if DMTariMwClient.kbmMWClientConnectionPool1.CurConnections > 0 then
//    DMTariMwClient.BreakConnections;
//  if Assigned(DMTariMWClient) then
//    DMTariMWClient.Free;
	LicEngine.Destroy;
  GGlobals.DebugOut('On Finalization');
  GGlobals.Destroy;
	Splashform.Release;
end;

end.
