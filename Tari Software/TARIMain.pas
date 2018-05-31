unit TARIMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ImgList, ComCtrls, ToolWin, Buttons, Grids, DBCtrls, Mask,
  dbtables, registry, ExtCtrls, MaintainUsers, DMUsers, consts, auchtypes, ShellAPI, inifiles,
  Balnhint, TARILoginDlg, DateUtils,
  syncobjs, jpeg, AppEvnts, idGlobal, IB_Components, IB_Script, db,
  IB_SESSION, stsystem, serverSel, DatePrefers, STstrL, CashFlowDE,
  XPMan, cxControls, cxGroupBox, cxStyles, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGrid, cxContainer, cxEdit,
  cxLabel, cxHint, cxLookAndFeels, cxGridDBTableView, cxTextEdit, cxDBEdit,
  ActnList, {dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxBarExtItems, dxBar,} cxButtons, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxImageComboBox, cxCalendar, cxCheckBox,
  cxCurrencyEdit, cxLookAndFeelPainters, {dxNavBarViewsFact,} mxOutlookBarPro,
  dxBar, dxBarExtItems, Variants, XPStyleActnCtrls,
  ActnMan, cxImage, StdStyleActnCtrls, ProgramRelease, Exceptionlog, Ecore, Etypes,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  dxSkinsdxBarPainter;
//  AppEvnts;


type
  TTARIMainF = class(TForm)
    FileOpenDlg: TOpenDialog;
    CamTimer: TTimer;
    cxGroupBox3: TcxGroupBox;
    DBDepartmentsTable: TcxGridDBTableView;
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
    Label2: TLabel;
    ActTargetReports: TAction;
    StatusBar1: TStatusBar;
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
    ActHelpIntroduction: TAction;
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
    dxBarGroup1: TdxBarGroup;
    ActLicenceFile: TAction;
    LicenceFileM: TdxBarButton;
    ActTARIParables: TAction;
    dxBarButton5: TdxBarButton;
    mxOutlookBarPro1: TmxOutlookBarPro;
    DBBusinessTable: TcxGridDBTableView;
    DBBusinessTableBRANCH_NAME: TcxGridDBColumn;
    DBBusinessTableCURRENCY: TcxGridDBColumn;
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
    MainGridLevel1: TcxGridLevel;
    VisitURL: TAction;
    ActionManager1: TActionManager;
    cxImage1: TcxImage;
    dxBarSubItem1: TdxBarSubItem;
    ActionHelpNewFile: TAction;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    ActionPastInfo: TAction;
    dxBarButton22: TdxBarButton;
    ActionHelpWhatIf: TAction;
    dxBarButton23: TdxBarButton;
    ActionHelpTargetDetail: TAction;
    dxBarButton24: TdxBarButton;
    ActionHelpTracking: TAction;
    dxBarButton25: TdxBarButton;
    ActQuickStartHelp: TAction;
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
    procedure ActHelpIntroductionExecute(Sender: TObject);
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
//    procedure DBDepartmentsTableDragOver(Sender, Source: TObject; X,
//      Y: Integer; State: TDragState; var Accept: Boolean);
//    procedure DBDepartmentsTableDragDrop(Sender, Source: TObject; X,
//      Y: Integer);
//    procedure DBDepartmentsTableGetDragDropText(
//      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
//      AItem: TcxCustomGridTableItem; var AText: String);
    procedure DBBusinessTableTargetEndPropertiesEditValueChanged(
      Sender: TObject);
    procedure DBBusinessTableTrackingEndPropertiesEditValueChanged(
      Sender: TObject);
    procedure DBDepartmentsTableNavigatorButtonsButtonClick(
      Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure ActionHelpNewFileExecute(Sender: TObject);
    procedure ActionPastInfoExecute(Sender: TObject);
    procedure ActionHelpWhatIfExecute(Sender: TObject);
    procedure ActionHelpTargetDetailExecute(Sender: TObject);
    procedure ActionHelpTrackingExecute(Sender: TObject);
    procedure ActQuickStartHelpExecute(Sender: TObject);
//    procedure DBDepartmentsTableStartDrag(Sender: TObject;
//      var DragObject: TDragObject);
  private
    { Private declarations }
    MenuItemArray : array[0..20] of TMenuItem;
    function CheckUpdate(FileAlias : string): Boolean;
    procedure LaunchTargetWizard;
    procedure UpdateAliasinfo(Filename, AliasName : string);
    procedure UpdateBusinessName;
    procedure SetupNew;
    procedure SetupCFAssumptions;
    function DeptCreated: Boolean;
    function SetupComplete: Boolean;
    //    procedure ResetSampleDB;
    procedure CreateNewBusiness(NewName : string; NewFile: Boolean);
//    function GetMasterBranchID(AView: TcxCustomGridView): Integer;
    procedure setcolours;
  public
    { Public declarations }
    Function OpenClientDB(FileAlias: string): Boolean;
  end;

Const
  SOFTWAREDBVERSION = '1.3.9';
var
  TARIMainF: TTARIMainF;

  LicenceFile : string;
  Adminvarg : Variant;
  LFileName : string;
  LiniFile : string;
  CurrentDBVersion : string;
  FileVersion : string;
  LoginDlg: TTARILoginDlg;
  ClosingApp : Boolean;
//  ODAHandle : THandle;
  LcheckResult : TLicCheck;
  ReplaceFile : LongBool;
  ExpiryText : string;
  MenuSelectserver : Boolean;
  DeptDragID : integer;
  function GetDBVersion(FileAlias: string): string;
  function setDBVersion(FileAlias, newversion: string): boolean;
  procedure MyCustomButtonClickNotify(EurekaExceptionRecord: TEurekaExceptionRecord; var CloseDialog: Boolean);

implementation

{$R *.DFM}
uses LGlobals, DMrep1U, DMClient, DataCollector, AMiscFunctions,
  ReportingTargets,
  ReportingTracking, About, Splash1,
  DBUpdate, DBMaint,
  LicenceA,
  ServerMaint, BackupRestore, LicenceExpiry, MonitoringSales,
  TrackingPeriod, MonitoringOtherIncome, MonitoringExpenses, quotes,
  DepartmentSetup, NewBusiness, PastInformation, PNLWhatIf, TargetingProfit,
  UltimateWhatif, LicenceEngine, LicenceCalc, TariParablesSplash,
  BSWhatif, BusinessSetup;

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
          GGlobals.Servers.currentServer := TFBServer(GGlobals.Servers.fbservers[i]);
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
            GGlobals.Servers.SetCurrentServer(TFBServer(GGlobals.Servers.fbservers[J]).servername);
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
          GGlobals.Servers.SetCurrentServer(TFBServer(GGlobals.Servers.fbservers[I]).ServerName);
      end;
    Splashform.ProgressBar.Position := 28;
    end
  else
    Result := False;
  Splashform.update;
  if Result then
    DMuserM.ELANELANADMINDB.Connected := True;
end;

procedure MyCustomButtonClickNotify(EurekaExceptionRecord: TEurekaExceptionRecord; var CloseDialog: Boolean);
begin
  Application.HelpCommand(HELP_CONTEXT, 517);
end;

function TTARIMainF.CheckUpdate(FileAlias : string): Boolean;
var
  CurrentVersion : string;
begin
  // This needs to be simply a call to update metadata
  Result := False;
  CurrentVersion := GetDBVersion(FileAlias);
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
            setDBVersion(FileAlias, currentDBversion);
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

procedure TTARIMainF.UpdateBusinessName;
begin
  DataModuleClient.BusinessDetails.Edit;
  DataModuleClient.BusinessDetailsBUSINESS_NAME.Value := LicEngine.LicenceRec.BusinessName;
  DataModuleClient.BusinessDetails.Post;
end;

Function TTARIMainF.OpenClientDB(FileAlias: string): Boolean;
var
  i: Integer;
  dbpass, tempalias, Fname : string;
  ExeDate : TDateTime;
  IsFileLicencing : Boolean;
  DoRestoreLicence : Boolean;
//  UpdateB : Boolean;
begin
  Result := False;  // Assume the worst
  DoRestoreLicence := False;
  GGlobals.DebugOut('Open File - Start');

  If Not CheckUpdate(FileAlias) then
    exit;
  GGlobals.DebugOut('Open File - Update Checked');
  if (FileAlias = DEMONAME) and (GGlobals.FileLicence) then
    begin
    Exedate := GetFileModDate(GGlobals.BaseDir + 'Tari.exe');
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
    If (InputPwdQuery('Database Password', 'Enter the Password', dbpass, False, GGlobals.FormColour, 1703)) then
      begin
      if not ansisametext(GGlobals.CurrentDBPWD, dbPass) then
        Result := False;
      end
    else
      Result := False;
  if Result = True then
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
    end;
  GGlobals.DebugOut('Connected to - ' + FileAlias);
  gglobals.LicencingFailed := False;   // Assume it always succeeds
  if Result and DataModuleClient.ClientDatabase.Connected then
    begin
    GGlobals.Servers.CurrentServer.CurrentDBAlias := FileAlias;
    UpdateAliasinfo('', GGlobals.Servers.CurrentServer.CurrentDBAlias);
    BusinessNameEdit.Refresh;
    // do we have to licence this file
    if (GGlobals.FileLicence) or (GGlobals.LicenceThisFile) then
      begin
      IsFileLicencing := GGlobals.FileLicence;
      GGlobals.FileLicence := True;
      if GGlobals.LicenceThisFile then
        begin
        LicEngine.SaveCurrentLicenceRec;
        DoRestoreLicence := True;
        end;
      if Not GGlobals.NewDBSetup then
        SetupNew;
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
        LicEngine.LicenceRec.businessname := DataModuleClient.BusinessDetailsBUSINESS_NAME.Value;
        LicenceFA.ShowModal;
        GGlobals.DebugOut('Second check');
        LicenceFA.free;
        LcheckResult := LicEngine.CheckLicenceDetails;
        DoRestoreLicence := False;
        end;
      if (GGlobals.LicenceThisFile) and (DoRestoreLicence) then
        LicEngine.RestoreLicenceRec;
      GGlobals.FileLicence := IsFileLicencing;
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
      begin
      if DataModuleClient.ClientDatabase.connected = True then
        DataModuleClient.ClientDatabase.Disconnect;
      end
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
        ActFineTuneTargets.Enabled := True;
//        ActFullCashFlow.Enabled := False;
        ActTrackingDataEntry.Enabled := True;
        ActTrackingExpenses.Enabled := True;
        ActTrackingOtherIncome.Enabled := True;
        ActRevenueGrouping.Enabled := True;
        ActTrackingReports.Enabled := True;
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
end;

procedure TTARIMainF.UpdateAliasinfo(Filename, AliasName : string);
begin
  if DmUserM.TariDatabases.Locate('DATABASE_ALIAS', variant(AliasName), []) then
    DMUserM.TariDatabases.edit
  else
    DMUserM.TariDatabases.Insert;
  DMUserM.TariDatabasesDATABASE_ALIAS.Value := AliasName;
  DMUserM.TariDatabasesBUSINESS_NAME.Value := ' ';
  if length(FileName) > 0 then
    DMuserM.TariDatabasesFILE_NAME.Value := FileName;
  DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 0;
  DMUserM.TariDatabasesIS_MASTER.value := 0;
  if DataModuleClient.ClientDatabase.Connected then
    DMUserM.TariDatabasesBUSINESS_NAME.Value := DataModuleClient.BusinessDetailsBUSINESS_NAME.Value;
  DMUserM.TariDatabases.Post;
end;

procedure TTARIMainF.FormCreate(Sender: TObject);
begin
  DMrep1.ButtonGlyphList.GetBitmap( 0, ExitBtn.Glyph);
  setcolours;
  GGlobals.DebugOut('DIYMain Created');
  StatusBar1.Panels.Items[0].Text := 'Version: ' + Versioninfo;
  if GGlobals.Servers.CurrentServer.CurrentUserAccess > 1 then
    UtilUsers.Enabled := False
  else
    UtilUsers.Enabled := True;
end;

procedure TTARIMainF.setcolours;
var
  h_cnt, b_cnt : Integer;
begin
  Color := GGlobals.FormColour;
  mxOutlookBarPro1.Background.Color := GGlobals.FormColour;
  for h_cnt := 0 to mxOutlookBarPro1.Headers.Count - 1 do    // Iterate
    begin
    mxOutlookBarPro1.headers[h_cnt].Background.color := GGlobals.FormColour;
    for b_cnt := 0 to mxOutlookBarPro1.headers[h_cnt].Buttons.Count - 1 do    // Iterate
      mxOutlookBarPro1.Headers[h_cnt].Buttons[b_cnt].Color := GGlobals.FormColour;
    end;    // for
  dxBarManager1.DockColor := GGlobals.FormColour;
  dxBarManager1.Bars[0].Color := GGlobals.FormColour;
  dxBarManager1.Bars[1].Color := GGlobals.FormColour;
  StatusBar1.Color := GGlobals.FormColour;
  cxGroupBox3.Style.Color := GGlobals.FormColour;
end;

(*procedure TDIYMainF.C1Click(Sender: TObject);
var
  userpwd : string;
begin
// Change User Password
//  DMuserM.ELANELANADMINDB.Connected := True;
  if (InputPwdQuery('Set Login Password', 'Enter New Password (Twice)', userpwd, True))
    then begin
    DMUserM.SetLoginPassword(CurrentUserName, userpwd);
  end;
//  DMuserM.free;
end;

*)
(*procedure TDIYMainF.R1Click(Sender: TObject);
var
  dn, sn : string;
  OldPwd, newpwd : Widestring;
//  varg : variant;
begin
// Disconnect current Database
//  DataModuleClient.ClientDatabase.Connected := False;
//  FileOpenDlg.InitialDir := DataDir + 'Data';
//  if FileOpenDlg.Execute()
///    then begin
//    dn := FileOpenDlg.FileName;
//    sn:= ChangeFileExt( dn, '.~jt' );
//    DeleteFile( sn );
//    OldPwd := 'GEarSyStem';
//    newpwd := ' ';
//    if not RenameFile( dn, sn ) then Exit;
//    try {try }
//      dbengine := CreateEngine();  //FileOpenDlg.FileName
//      Database := dbengine.OpenDatabase(sn, True, False, ';PWD=GEarSyStem' );
//      Database.NewPassword(OldPwd, newpwd);
//      DataBase.Close;
//      Database.Free;
//      dbEngine.CompacTIBODatabase(sn, dn,';PWD=GEarSyStem', _, ';PWD=GEarSyStem' );
//    finally
//      Database := dbengine.OpenDatabase(sn, True, False, ';PWD= ' );
//      Database.NewPassword(newpwd, OldPwd);
//      DataBase.Close;
//      Database.free;
//      dbengine.free;
//    end;
//    except
//      RenameFile( sn, dn );
//      Raise;
//    end;
//  DeleteFile( sn );
//  end;
//  OpenClientDB(CurrentDBPath);
end;
*)

function GetDBVersion(FileAlias: string): string;
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
//      dbcheckConnect.SQLRole := 'FBMADMIN';
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

function setDBVersion(FileAlias, newversion: string): Boolean;
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


procedure TTARIMainF.NewDeptBtnClick(Sender: TObject);
begin
//MainGrid.setfocus;
//DBBusinessTable.DataController.BeginFullUpdate;
//DBDepartmentsTable.DataController.BeginFullUpdate;
  DBDepartmentsTable.DataController.Insert;
//DataModuleClient.DeptRef.Insert;

//DBDepartmentsTable.DataController.EndFullUpdate;
//DBBusinessTable.DataController.EndFullUpdate;
end;

procedure TTARIMainF.DelDeptBtnClick(Sender: TObject);
begin
//DBBusinessTable.DataController.BeginFullUpdate;
//DBDepartmentsTable.DataController.BeginFullUpdate;
  if messagedlg('All information for this Department / Revenue Group (' + DataModuleClient.DeptrefREVENUE_GROUP_NAME.Value  +') will be deleted. Are you sure?', mtWarning, [mbOK,mbCancel], 0)= mrOK then
    DBDepartmentsTable.DataController.DeleteRecord(DBDepartmentsTable.DataController.RecNo);
//    DataModuleClient.DeptREF.Delete;
//  DataModuleClient.DeptRef.Refresh;
//  DBDepartmentsTable.DataController.Refresh;
//  DBBusinessTable.DataController.refresh;
end;

procedure TTARIMainF.LaunchTargetWizard;
begin
  if PastInformationF = nil then
    Application.CreateForm(TPastInformationF, PastInformationF);
//  PlanningF.PlanningWizard.ActivePage := PlanningF.PlanWizardPage1;
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

procedure TTARIMainF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFDEF ElanElan}
  DataCollect.SendLog;
  {$ENDIF}
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
  ClosingApp := True;
end;

procedure TTARIMainF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TTARIMainF.CamTimerTimer(Sender: TObject);
begin
  CamTimer.Enabled := False;
  Close;
end;

procedure TTARIMainF.FormShow(Sender: TObject);
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

procedure TTARIMainF.ActFullCashFlowExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if not Datacollect.DoesUserOptionExist(OARDAYSAVERAGE) then
    SetupCFAssumptions;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
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

procedure TTARIMainF.ActAnalysePastExecute(Sender: TObject);
var
  currentdept : integer;
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
  if DataModuleClient.DSDepartments.State in [dsInsert,dsedit] then
    begin
    currentdept := DataModuleClient.DepartmentsDEPT_ID.Value;
    DataModuleClient.Departments.post;
    DataModuleClient.DeptRef.Refresh;
    DataModuleClient.Departments.Refresh;
    DataModuleClient.Departments.first;
    while (DataModuleClient.Departments.eof = False) and (DataModuleClient.DepartmentsDEPT_ID.Value <> CurrentDept) do
      begin
      DataModuleClient.Departments.next;
      end;    // while
    DataModuleClient.Departments.edit;
    end;
  DataModuleClient.DeptRef.Refresh;
  DATAMODULECLIENT.DateRangers.Refresh;
  LaunchTargetWizard;
end;

procedure TTARIMainF.ActTargetReportsExecute(Sender: TObject);
begin
  if (Not DeptCreated) OR GGlobals.TrainingLicence then exit;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
  DataModuleClient.DeptRef.Refresh;
  Application.CreateForm(TReportingTargetsF, ReportingTargetsF);
  ReportingTargetsF.showModal;
  ReportingTargetsF.free;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.DateFSTD;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.DateFSTD;
end;

procedure TTARIMainF.ActTrackingDataEntryExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if (Not SetupComplete) or (DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value < (Now - 1500)) then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
  screen.Cursor := crHourGlass;
  Application.CreateForm(TMonitoringSalesF, MonitoringSalesF);
  MonitoringSalesF.showModal;
  MonitoringSalesF.free;
  screen.Cursor := crDefault;
end;

procedure TTARIMainF.SetupNew;
var
  I : integer;
begin
  GGlobals.DebugOut('File Opened for ' + GGlobals.NewBusiness.DatabaseAlias);
  DataModuleClient.BusinessDetails.Insert;
  DataModuleClient.BusinessDetailsBusiness_Name.value := GGlobals.NewBusiness.BusinessName;
  DataModuleClient.BusinessDetailsDATE_LAST_ACCESSED.Value := now;
  DataModuleClient.BusinessDetails.Post;
  BusinessNameEdit.Refresh;
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
    DataModuleClient.DepartmentsCurrency.Value := GetLocaleCurrency;
    DataModuleClient.DepartmentsRevenue_Group_Name.value := GGlobals.NewBusiness.Departments.strings[I];
    DataModuleClient.DepartmentsLastDayofWeek.value := GGlobals.NewBusiness.lastDayofWeek;
    DataModuleClient.DepartmentsEXCLUDE_FROM_REPORTING.Value := 0;
    DataModuleClient.DepartmentsBRANCH_ID.Value := DataModuleClient.BusinessesBRANCH_ID.Value;
    DataModuleClient.DepartmentsSYNC_TARGETDATE.Value := 1;
    DataModuleClient.DepartmentsSYNC_TRACKDATE.Value := 1;
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

procedure TTARIMainF.ActNewFileExecute(Sender: TObject);
var
  MasterC, FileC : string;
  Newcopied : Boolean;
  Copysuccess : longbool;
begin
// Start New Wizard
  Application.CreateForm(TNewBusinessF, NewBusinessF);
  NewBusinessF.NewBusinessName := '';
  NewBusinessF.NewFileName := '';
  GGLobals.NewDBSetup := False;
  NewBusinessF.BaseFolder := GGlobals.Servers.CurrentServer.NetworkFolder + 'Data' + slashchar;
  GGlobals.DebugOut('Starting New Business Wizard');
  if NewBusinessF.ShowModal = mrOK then
    begin
    screen.Cursor := crHourGlass;
    if DataCollect.Planloaded = True then
      DataCollect.setPlanningData;
    DataCollect.ClearPlanDataList;
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
    NewBusinessF.NewfileName := ForceExtensionL(NewBusinessF.NewfileName, 'FDB');  // Must be upper case for Linux and must have the extension
    Filec := AnsiUpperCaseFileName(NewBusinessF.BaseFolder + NewBusinessF.NewfileName);  // Must be upper case for Linux and must have the extension
    GGlobals.NewBusiness.DatabaseAlias := DMuserM.CreateAlias(NewBusinessF.NewFileName);
    GGlobals.DebugOut('Created a New Alias for the new File' + GGlobals.NewBusiness.DatabaseAlias);
    DMUserM.TariDatabases.Insert;
    DMUserM.TariDatabasesDATABASE_ALIAS.Value := GGlobals.NewBusiness.DatabaseAlias;
    DMUserM.TariDatabasesBUSINESS_NAME.Value := GGlobals.NewBusiness.BusinessName;
    DMuserM.TariDatabasesFILE_NAME.Value := NewBusinessF.NewFilename;
    if AnsiSameText(LicEngine.licenceRec.BusinessFileName, NewBusinessF.NewFileName) then
      DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 1
    else
      DMUserM.TariDatabasesLICENCED_TO_ACCESS.Value := 0;
    DMUserM.TariDatabasesIS_MASTER.value := 0;
    DMUserM.TariDatabases.Post;
    GGlobals.DebugOut('Posted Entry into Mast DB for ' + GGlobals.NewBusiness.DatabaseAlias);
//    newcopied := CopyFileto(MasterC, FileC);
    Newcopied := True;
    Copysuccess := GGlobals.CopyMastFile(MasterC, FileC);
    if not Copysuccess then
      newcopied := False;
    GGlobals.DebugOut('Copies File for ' + GGlobals.NewBusiness.DatabaseAlias);
    if GGlobals.newDemoFile then
      GGlobals.LicenceThisFile := False;
    if (not Newcopied) or (not OpenClientDB(GGlobals.NewBusiness.Databasealias)) then
      begin
      DataModuleClient.ClientDatabase.Connected := False; // Make Sure its not open
      if not OpenClientDB(GGlobals.servers.CurrentServer.CurrentDBAlias) then  // Open Previous One
        // always attempt to open "DEMONAME"
         OpenClientDB(DEMONAME);
      screen.Cursor := crDefault;
      end
    else
      begin
      if (Not GGlobals.NewDBSetup) and (Not GGlobals.NewDemoFile) then
        begin
        SetupNew;
        end;
      Screen.Cursor := crDefault;
      NewBusinessF.free;
      if (not GGlobals.multidept) then
        ActSetup_DepartmentsExecute(Sender);
      end;
    end
  else
    begin
    NewBusinessF.free;
    end;
end;

procedure TTARIMainF.ActOpenFileExecute(Sender: TObject);
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
      UpdateAliasinfo(ExtractFileName(FileOpenDlg.FileName), tmp);
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
    if not OpenClientDB(DEMONAME) then
      begin
      MessageDlg('The sample business file can not be opened and therefore the software'
        + #13#10 + 'will now terminate.'
        + #13#10 + 'Please uninstall and re-install the software.', mtWarning, [mbOk], 0);
        Application.Terminate;
      end;
    end;
//  FileOpen.free;
end;

procedure TTARIMainF.ActTrackingReportsExecute(Sender: TObject);
begin
  if (Not DeptCreated) OR GGlobals.TrainingLicence then exit;
  Application.CreateForm(TReportingTrackingF, ReportingTrackingF);
  ReportingTrackingF.showModal;
  ReportingTrackingF.free;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.DateFSTD;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.DateFSTD;
end;

procedure TTARIMainF.actBackupSendDatabaseExecute(Sender: TObject);
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

procedure TTARIMainF.ActPreferencesExecute(Sender: TObject);
begin
  Application.CreateForm(TDatePrefersF, DatePrefersF);
  DatePrefersF.showmodal;
  DatePrefersF.free;
  setcolours;
end;

procedure TTARIMainF.ActMaintainServersExecute(Sender: TObject);
var
  CurrentServerName : String;
begin
  if GGlobals.Servers.CurrentServer.CurrentUserName = 'Admins' then
  begin
    CurrentServerName := GGlobals.servers.currentserver.servername;
    if DataModuleClient.ClientDatabase.Connected then
      DataModuleClient.ClientDatabase.Connected := False;
    if DMUserM.ELANELANADMINDB.Connected then
      DMUserM.ELANELANADMINDB.Connected := false;
    GGlobals.servers.currentServer := nil;
    Application.CreateForm(TServerMaintF, ServerMaintF);
    ServerMaintf.showmodal;
    ServerMaintf.free;
    if GGlobals.Servers.indexof(CurrentServerName) > -1 then
      begin
      GGlobals.Servers.SetCurrentServer(CurrentServerName);
//      Reopen the file
      DMUserM.ELANELANADMINDB.Connected := True;
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

procedure TTARIMainF.ActMaintainUsersExecute(Sender: TObject);
begin
  Application.CreateForm(TMaintainUserF, MaintainUserF);
  MaintainUserF.showmodal;
  MaintainUserF.free;
end;

procedure TTARIMainF.ActChangeServersExecute(Sender: TObject);
var
  Currentserver : integer;
  changefailed : boolean;
begin
  changefailed := True;
  MenuSelectServer := True;
  if DataModuleClient.ClientDatabase.Connected then
    DataModuleClient.ClientDatabase.Connected := False;
  Currentserver := GGlobals.Servers.Indexof(GGlobals.Servers.CurrentServer.ServerName);
  if DMUserM.ELANELANADMINDB.Connected then
    DMUserM.ELANELANADMINDB.Connected := false;
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
      CurrentDBVersion := GetDBVersion('Master.fdb');
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
    DMUserM.ELANELANADMINDB.Connected := true;
    if Not OpenClientDB(GGlobals.Servers.CurrentServer.CurrentDBAlias) then
      OpenClientDB(DEMONAME);
  end;
  StatusBar1.Panels.Items[1].Text := 'Current Server: ' + GGlobals.Servers.CurrentServer.Servername;
end;

procedure TTARIMainF.ActChangeDatabasePasswordExecute(Sender: TObject);
var
  Encryptedpwd : string;
  NewPwd : String;
begin
  if (InputPwdQuery('Set Database Password', 'Enter New Password (Twice)', NewPwd, True, GGlobals.FormColour, 1703)) then
    begin
    if length(NewPwd) > 0 then
      EncryptedPwd := Newpwd
    else
      EncryptedPwd := '';
    DataModuleClient.SetDbPassword(EncryptedPwd);
    end;
end;

procedure TTARIMainF.ActDeleteOldDataExecute(Sender: TObject);
begin
  Application.CreateForm(TDBMaintF, DBMaintF);
  dbMaintf.showmodal;
  dbMaintf.free;
end;

procedure TTARIMainF.ActHelpIntroductionExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1001);
end;

procedure TTARIMainF.ActIntroductoryNotesExecute(Sender: TObject);
var
  ConcatfileS, directory, params  : array[0..200] of char;
begin
  strPcopy(directory, GGlobals.BaseDir);
  strPcopy(params, '');
  strPcopy(ConcatfileS, 'Help\TARI for Business Introductory Notes.pdf');
  ShellExecute(0, nil, concatfileS, nil, directory, SW_SHOWNORMAL );
end;

procedure TTARIMainF.ActAboutExecute(Sender: TObject);
begin
  dbversion := CurrentDBVersion;
  with TAboutDialog.Create(self)
  do try
    Execute;
  except
    close;
  end;
end;

procedure TTARIMainF.ActExitExecute(Sender: TObject);
begin
  ModalResult := MrOk;
  close;
end;

procedure TTARIMainF.ActTrackingOtherIncomeExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value < (Now - 1500) then
    ActSetup_DepartmentsExecute(Sender);
  Application.CreateForm(TMonitoringOtherIncomeF, MonitoringOtherIncomeF);
  MonitoringOtherIncomeF.ShowModal;
  MonitoringOtherIncomeF.free;
end;

procedure TTARIMainF.ActTrackingExpensesExecute(Sender: TObject);
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

procedure TTARIMainF.ActRevenueGroupingExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  DataModuleClient.InvoiceLU.Active := False;
  DataModuleClient.InvoiceLU.Active := True;
  Application.CreateForm(TQuotesF, QuotesF);
  QuotesF.setUnitsDesc(DataModuleClient.DepartmentsSingular_UnitDesc.value, DataModuleClient.DepartmentsPlural_UnitDesc.value);
  QuotesF.showModal;
  QuotesF.free;
end;

procedure TTARIMainF.ActSetup_DepartmentsExecute(Sender: TObject);
var
  CurrentID : integer;
begin
  if Not DeptCreated then exit;
  SelectedType := stAll;
  CurrentID := DataModuleClient.DepartmentsDEPT_ID.Value;
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
  DataModuleClient.Departments.Locate('DEPT_ID', variant(CurrentID), []);
  DataModuleClient.Deptref.Locate('DEPT_ID', variant(CurrentID), []);
  DBDepartmentsTable.Invalidate(True);
end;

procedure TTARIMainF.actPLWhatifExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
  Application.CreateForm(TPNLWhatIfF, PNLWhatIfF);
  PNLWhatIfF.showmodal;
  PNLWhatIfF.free;
end;

procedure TTARIMainF.ActFineTuneTargetsExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
  if TargetingProfitF = nil then
    Application.CreateForm(TTargetingProfitF, TargetingProfitF);
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

  TargetingProfitF.showmodal;
  TargetingProfitF.free;
  Screen.Cursor := crDefault;
  TargetingProfitF := nil;
  GGlobals.PStartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  GGlobals.PEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
end;

function TTARIMainF.DeptCreated: Boolean;
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

procedure TTARIMainF.SetupCFAssumptions;
begin
  showmessage('Some Cash Flow Assumptions must be set up first.');
  SelectedType := stCashFlow;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
end;

procedure TTARIMainF.ActUltimateWhatIfExecute(Sender: TObject);
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

procedure TTARIMainF.ActTBImportExecute(Sender: TObject);
begin
//  if Not DeptCreated then exit;
//  ;
end;

procedure TTARIMainF.ActLicenceFileExecute(Sender: TObject);
Var
  IsFileLicencing : Boolean;
begin
  IsFileLicencing := GGlobals.FileLicence;
  GGlobals.FileLicence := True;
  LicEngine.SaveCurrentLicenceRec;
  LicEngine.DBName := DataModuleClient.ClientDatabase.DatabaseName;
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

procedure TTARIMainF.ActTARIParablesExecute(Sender: TObject);
var
  ConcatfileS, directory, params  : array[0..200] of char;
begin
 strPcopy(directory, GGlobals.BaseDir);
 strPcopy(params, '');
 strPcopy(ConcatfileS, 'Help\TARI Parables.pdf');
 ShellExecute(0, nil, concatfileS, nil, directory, SW_SHOWNORMAL );
end;

function TTARIMainF.SetupComplete: Boolean;
begin
  result := True;
  // check that we have units description
  DataModuleClient.Dept_AccountsLU.Active := False;
  DataModuleClient.Dept_AccountsLU.active := True;
  
  if (DataModuleClient.DateRangers.RecordCount < 1) then
    begin
    Showmessage('No Date Rangers have been created to accept Past Information' + #13#10
    + 'Please add these to the Past Period Step'
    + #13#10 + 'and proceed to the Finish button.');
    Result := False;
    end;
  if (not Result) and ((Length(DataModuleClient.DepartmentsSINGULAR_UNITDESC.Value) < 1) or
    (Trunc(DataModuleClient.DepartmentsCURRENTPLANSTART.Value) < 36000)) then
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

procedure TTARIMainF.ActQuickCashFlowExecute(Sender: TObject);
begin
  if Not DeptCreated then exit;
  if not Datacollect.DoesUserOptionExist(OARDAYSAVERAGE) then
    SetupCFAssumptions;
  if Not SetupComplete then
    begin
    ActSetup_DepartmentsExecute(Sender);
    exit;
    end;
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

procedure TTARIMainF.Business_DeleteBtnClick(Sender: TObject);
begin
  if messagedlg('All information for this Business / Branch (' + DataModuleClient.BusinessesBRANCH_NAME.Value  + ') will be deleted. Are you sure?', mtWarning, [mbOK,mbCancel], 0)= mrOK then
    DataModuleClient.Businesses.Delete;
  DataModuleClient.Businesses.Active := False;
  DataModuleClient.Businesses.Active := True;
end;

procedure TTARIMainF.ActSetup_BusinessExecute(Sender: TObject);
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

procedure TTARIMainF.AddBusinessBtnClick(Sender: TObject);
begin
// add
  CreateNewBusiness('New Business / Branch', False);
end;

procedure TTARIMainF.CreateNewBusiness(NewName : string; NewFile: Boolean);
var
  Fsettings : TFormatSettings;

begin
// add
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, Fsettings);
  DataModuleClient.spCreateBusiness.ParamByName('BUS_NAME').Value := NewName;
  DataModuleClient.spCreateBusiness.ParamByName('CURR_SYMBOL').Value := Fsettings.CurrencyString;
  DataModuleClient.spCreateBusiness.ParamByName('CONVERSION').Value := 1.00;
  if DataModuleClient.Businesses.RecordCount > 0 then
    begin
    DataModuleClient.spCreateBusiness.ParamByName('CURR_NAME').Value := '';
    DataModuleClient.spCreateBusiness.ParamByName('P_START').Value := EncodeDateTime(Currentyear, 1, 1, 0, 0, 0, 0);
    DataModuleClient.spCreateBusiness.ParamByName('P_END').Value := EncodeDateTime(CurrentYear, 12, 31, 0, 0, 0, 0);
    end
  else
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
  DBBusinessTable.DataController.RefreshExternalData;
//  MainGrid.Invalidate(False);
end;

procedure TTARIMainF.MainGridExit(Sender: TObject);
begin
  DataModuleClient.Departments.locate('DEPT_ID', DataModuleClient.DeptRefDEPT_ID.asVariant, []);
end;

{
procedure TDIYMainF.DBDepartmentsTableDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
          Accept := (GridView.PatternGridView = DBDepartmentsTable);
end;

function TDIYMainF.GetMasterBranchID(AView: TcxCustomGridView): Integer;
begin
  result := TcxDBDataRelation(Aview.DataController.GetMasterRelation).GetMasterRecordID(AView.MasterGridRecordIndex);
end;

procedure TDIYMainF.DBDepartmentsTableDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
  I : integer;
  ABranchIndex : Integer;
  ADataSet : TDataset;
  BField : TField;
  DField : TField;
  ADataController :  TcxDBDataController;
  BranchID : Integer;
begin
  if DeptDragID < 0 then exit;
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
  Atext := Arecord.Values[DBDepartmentsGroupName.index];

//  BranchDragID :=
end;
}
procedure TTARIMainF.DBBusinessTableTargetEndPropertiesEditValueChanged(
  Sender: TObject);
var
  BranchID : Integer;
  NewEndDate : TDateTime;
begin
  NewEndDate := TcxCustomEdit(Sender).EditValue;
  BranchID := DataModuleClient.BusinessesBranch_ID.Value;
  DataModuleClient.SetBusinessTargetStart(BranchID, NewEndDate);
end;

procedure TTARIMainF.DBBusinessTableTrackingEndPropertiesEditValueChanged(
  Sender: TObject);
var
  BranchID : Integer;
  NewEndDate : TDateTime;
begin
  NewEndDate := TcxCustomEdit(Sender).EditValue;
  BranchID := DataModuleClient.BusinessesBranch_ID.Value;
  DataModuleClient.SetBusinessTrackStart(BranchID, NewEndDate);
end;

{
procedure TDIYMainF.DBDepartmentsTableStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  with TcxGridDBTableView(TcxGridSite(Sender).GridView) do
    begin
    DeptDragID := Controller.SelectedRecords[0].Values[DBDepartmentsTableDeptID.Index];
    end;    // with
end;
}
procedure TTARIMainF.DBDepartmentsTableNavigatorButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
var
  GotBSData : Boolean;
begin
if AButtonIndex = 7 then
  begin
  DataModuleClient.Departments.Insert;
  DataModuleClient.DepartmentsDEPT_ID.Value := DataModuleClient.NewDeptID;
  DataModuleClient.DepartmentsREVENUE_GROUP_NAME.Value := 'Edit this name';
  DataModuleClient.DepartmentsLASTDAYOFWEEK.Value := 6;
  DataModuleClient.DepartmentsSINGULAR_UNITDESC.Value := 'Hour';
  DataModuleClient.DepartmentsPLURAL_UNITDESC.Value := 'Hours';
  DataModuleClient.Departments.Post;
  DataModuleClient.DeptRef.Locate('DEPT_ID', variant(DataModuleClient.NewDeptID), []);
  ActSetup_DepartmentsExecute(Sender);
  if (DataModuleClient.DateRangers.RecordCount > 0) and (DataModuleClient.DepartmentsCURRENTPLANSTART.Value > 0) then
    begin
    if MessageDlg('The Data entered into the Business Simulator on the'
    + #13#10 + 'TARIonline.com web site can be imported into this new'
    + #13#10 + 'Department / Revenue Group. The data will be saved into'
    + #13#10 + 'the most recent Past Period Date Range and into the current'
    + #13#10 + 'targeting period, spread equally by using the days in the period.'
//    + #13#10#13#10 + 'If you would like to change the period information for this'
//    + #13#10 + 'import, Select ''No'', delete the department and re-create it.'
    +#13#10#13#10 + 'Do you wish to import Business Simulator data?', mtInformation, [mbYes,mbNo], 1513) = mrYes then
      begin
      DataModuleClient.DateRangers.Last;
      if MessageDlg('The last Past Period end date is ' + Datetostr(DataModuleClient.DateRangersENDDATE.Value)
        + #13#10 + 'The current Targeting Period end date is ' + Datetostr(DataModuleClient.DepartmentsCURRENTPLANEND.Value)
    +#13#10#13#10 + 'Proceed with these periods? (Click ''No'' to change either of these periods.)', mtInformation, [mbYes,mbNo], 1513) = mrNo then
        ActSetup_DepartmentsExecute(Sender);
      //DataCollect.ImportBSData;  // import BS data here
      GotBSData := True; // assume we succeed the first time
      if not DataCollect.GetBSData then
        begin
        GotBSData := False;
        if MessageDlg('Either contact with TARIonline.com failed' + #13#10 +
                   'or there was no Business Simulator data against your serial number.' + #13#10 + #13#10 +
                   'Check your internet connection and click ''Retry''' + #13#10 + #13#10 +
                   'or click ''Ok'' to continue.', mtInformation, [mbRetry, mbOK], 1513) = mrRetry then
        GotBSData := DataCollect.GetBSData;
        end;
      if GotBSData then
        MessageDlg('Your Business Simulator Data has been transferred and is available for further input', mtInformation, [mbOK], 0);
      end;
    end;
  ADone := true;
  end;
if AButtonIndex = 8 then
  begin
  if Messagedlg('Click the ''Yes'' button to confirm the deletion' + #13#10
  + 'of ' + DataModuleClient.DeptrefREVENUE_GROUP_NAME.Value + ' Department', mtWarning, [mbYes,mbNo], 0) = mrYes then
    begin
    DataModuleClient.Deptref.Delete;
    DBDepartmentsTable.Invalidate(True);
    end;
  Adone := True;
  end;
end;

procedure TTARIMainF.ActionHelpNewFileExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1507);
end;

procedure TTARIMainF.ActionPastInfoExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 3001);

end;

procedure TTARIMainF.ActionHelpWhatIfExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 4001);
end;

procedure TTARIMainF.ActionHelpTargetDetailExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 2501);
end;

procedure TTARIMainF.ActionHelpTrackingExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1501);
end;

procedure TTARIMainF.ActQuickStartHelpExecute(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT, 4501);
end;

Initialization
  CustomButtonClickNotify := MyCustomButtonClickNotify;
  GGlobals := TLGlobals.Create;
if Not GGlobals.SecondInstance then
  begin
  GGlobals.initFailed := False;
  GGlobals.LoadData;
  if fileexists('fbclient.dll') then
    renamefile('fbclient.dll', 'fbembed.dll');
  Splashform := Tsplashform.create(Nil);
  SplashForm.show;
  Splashform.ProgressBar.Properties.BeginColor := GGlobals.DominantMainColor;
  Splashform.Update;
  Splashform.ProgressBar.Position := 10;
  Splashform.startlabel.caption := 'Connecting to databases and checking licence details.';
  Application.CreateForm(TDMRep1, DMRep1); // Styles and Repository
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
    GGlobals.getversioninfo;

    Splashform.ProgressBar.Position := 14;
    Application.CreateForm(TDMUserM, DMUserM);
    // FIND OUT WHERE WE SHOULD TRY FOR LICENCING. If the server is not available
    // try locally
    Splashform.ProgressBar.Position := 20;
    GGlobals.DebugOut('Licdir = ' + GGlobals.licdir);
    GGlobals.LicTemp := False;
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
  if GGlobals.CompareVersions(GGlobals.ReleaseFileURL, GGlobals.LocalFileName) then
    begin
    Application.CreateForm(TProgramReleaseF, ProgramReleaseF);
    GGlobals.newfileReady := false;
    if ProgramReleaseF.Showmodal = mrOK then
      GGlobals.newfileReady := True;
    ProgramReleaseF.Free;
    end
  else
    GGlobals.AddRemoveDesktopIcon(GGlobals.BaseDir + GGlobals.LocalFileName, True);  // this is a removal based on there being uptodate.

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
//    LoginDlg := TTARILoginDlg.create(nil);  Original Splash Size is
//    LoginDlg.PostStartup := False;
//    StrpCopy(GGlobals.PUserName, GGlobals.servers.CurrentServer.CurrentUsername);
//    StrpCopy(GGlobals.PUserPwd, GGlobals.servers.CurrentServer.CurrentUserPwd);
//    if (LoginDlg.execute(GGlobals.PUserName, GGlobals.PUserPwd, GGlobals.PUserRole) = mrOK) then
//      begin
      Splashform.update;
      Splashform.ProgressBar.Position := 55;
//      GGlobals.servers.CurrentServer.CurrentUserName := StrPas(GGlobals.PUserName);
//      GGlobals.Servers.CurrentServer.CurrentUserPwd := StrPas(GGlobals.PUserPwd);
//      GGlobals.servers.CurrentServer.CurrentUserRole := StrPas(GGlobals.PUserRole);
      GGlobals.servers.CurrentServer.CurrentUserName := 'Admins';
      GGlobals.Servers.CurrentServer.CurrentUserPwd := 'admins';
      if (DMUserM.Users.Locate('User_Name', variant('Admins'), [])) then
        GGlobals.servers.CurrentServer.CurrentUserRole := DMUserM.UsersLOK_ON_ROLE.value;

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
      CurrentDBVersion := GetDBVersion('Master.fdb');
      splashform.StartLabel.Caption := 'Opening last database and collecting information';
      splashform.Refresh;
      Splashform.ProgressBar.Position := 70;
      GGlobals.DebugOut('Have DB Version = ' + currentDBVersion);
      Application.CreateForm(TDataModuleClient, DataModuleClient);
      Splashform.ProgressBar.Position := 80;
      GGlobals.DebugOut('DM Client is created');
      DataCollect := TDataCollector.Create;
      Splashform.ProgressBar.Position := 85;
      GGlobals.DebugOut('Data Colector is created');
      Splashform.ProgressBar.Position := 90;
      Application.CreateForm(TTARIMainF, TARIMainF);
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
      SplashForm.free;
//      Splashform.timer.enabled := True;
      GGlobals.DebugOut('Splashform Timer set');
{
      if CompareDateTime(GGlobals.Servers.TARISplashDate, (now - 1460)) < 0 then
        GGlobals.Servers.TARISplashDate := Now;
      if (DaysBetween( Now, GGlobals.Servers.TARISplashDate) < 30) and (GGlobals.Servers.TARISplashCount < 2) then
        begin
        Application.CreateForm(TTariParablesSplashF, TariParablesSplashF);
        TariParablesSplashF.ShowModal;
        TariParablesSplashF.Free;
        end;
}
      GGlobals.DebugOut('After TARI Splash');
{      end
    else
      begin
      GGlobals.initfailed := True;
      if DMUserM.ELANELANADMINDB.connected then
        DMuserM.ELANELANADMINDB.Connected := False;
      end;
}
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
//    GGlobals.SetRegistry;
//  GGlobals.DebugOut('On Close  - 1');
    if assigned (PlanExpDataList) then
      PlanExpDataList.Free;
//  GGlobals.DebugOut('On Close  - 2');
    if assigned (ConsolidList) then
      ConsolidList.free;
//  GGlobals.DebugOut('On Close  - 3');
    if assigned (PlanDataList) then
      PlanDataList.free;
//  GGlobals.DebugOut('On Close  - 4');
    if assigned (ReportDataList) then
      ReportDataList.free;
//  GGlobals.DebugOut('On Close  - 5');
    DataCollect.Free;
//  GGlobals.DebugOut('On Close  - 6');
//    if DataModuleClient.ClientDatabase.Connected then
//      DataModuleClient.ClientDatabase.Disconnect;
    end;
//  GGlobals.DebugOut('On Close  - 7');
  LicEngine.Destroy;
  GGlobals.DebugOut('On Finalization');
  GGlobals.Destroy;
//  Splashform.Release;
end;

end.
