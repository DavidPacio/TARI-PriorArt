program Tari;

uses
  HTMLHelpViewer,
  Forms,
  IB_Session,
  LGlobals in 'LGlobals.pas',
  Splash1 in 'Splash1.pas' {SplashForm},
  DMrep1U in 'DMrep1U.pas' {DMRep1: TDataModule},
  LicenceA in 'LicenceA.pas' {LicenceFA},
  LicenceCalc in 'LicenceCalc.pas',
  LicenceExpiry in 'LicenceExpiry.pas' {LicExpiryDlg},
  DMUsers in 'DMUsers.pas' {DMUserM: TDataModule},
  ServerSel in 'ServerSel.pas' {ServerSelF},
  DIYMain in 'DIYMain.pas' {DIYMainF},
  DMClient in 'DMClient.pas' {DataModuleClient: TDataModule},
  DataCollector in 'DataCollector.pas',
  NewBusiness in 'NewBusiness.pas' {NewBusinessF},
  DepartmentSetup in 'DepartmentSetup.pas' {DepartmentSetupF},
  PlanExtension in 'PlanExtension.pas' {PlanExtensionF},
  PastInformation in 'PastInformation.pas' {PastInformationF},
  PastPeriodSelection in 'PastPeriodSelection.pas' {PastPeriodSelectionF},
  DIYPlanExpenses in 'DIYPlanExpenses.pas' {DIYPlanExpensesF},
  Invoices in 'Invoices.pas' {InvoicesF},
  PrintInvoices in 'PrintInvoices.pas' {PrintInvoicesF},
  Workback in 'Workback.pas' {WorkBackF},
  HelpProdFTE in 'HelpProdFTE.pas' {HelpProdFTEF},
  HelpTotalFte in 'HelpTotalFte.pas' {HelpTotalFteF},
  HelpPotentialUnits in 'HelpPotentialUnits.pas' {HelpPotentialUnitsF},
  HelpPotentialHours in 'HelpPotentialHours.pas' {HelpPotentialHoursF},
  PNLWhatIf in 'PNLWhatIf.pas' {PNLWhatIfF},
  TargetingProfit in 'TargetingProfit.pas' {TargetingProfitF},
  detailTargets in 'detailTargets.pas' {DetailTargetsF},
  ChartHistory in 'ChartHistory.pas',
  CashFlowEngine in 'CashFlowEngine.pas',
  CashFlowEdit in 'CashFlowEdit.pas' {CashFlowEditF},
  BSWhatif in 'BSWhatif.pas' {BSWhatifF},
  CashFlowJrnls in 'CashFlowJrnls.pas' {CashFlowJrnlsF},
  EasyJournal in 'EasyJournal.pas' {EasyJournalF},
  UltimateWhatif in 'UltimateWhatif.pas' {UltimatewhatifF},
  ReportingTargets in 'ReportingTargets.pas' {ReportingTargetsF},
  CustomPDFReport in 'CustomPDFReport.pas',
  TargetPDFReports in 'TargetPDFReports.pas',
  TargetGrep in 'TargetGrep.pas' {TargetGRepF},
  TargetDetailGrep in 'TargetDetailGrep.pas' {TargetDetailGRepF},
  Quotes in 'Quotes.pas' {QuotesF},
  MonitoringSales in 'MonitoringSales.pas' {MonitoringSalesF},
  MonitoringInvoices in 'MonitoringInvoices.pas' {MonitoringInvoicesF},
  MonitoringExpenses in 'MonitoringExpenses.pas' {MonitoringExpensesF},
  MonitoringOtherIncome in 'MonitoringOtherIncome.pas' {MonitoringOtherIncomeF},
  DBMaint in 'DBMaint.pas' {DBMaintF},
  ReportingTracking in 'ReportingTracking.pas' {ReportingTrackingF},
  TrackingPDFReports in 'TrackingPDFReports.pas',
  TrackGrep in 'TrackGrep.pas' {TrackGRepF},
  BackupRestore in 'BackupRestore.pas' {BackupFrm},
  DBemail in 'DBemail.pas' {DBEmailF},
  DatePrefers in 'DatePrefers.pas' {DatePrefersF},
  MaintainUsers in 'MaintainUsers.pas' {MaintainUserF},
  DBUpdate in 'DBUpdate.pas' {DBUpdateF},
  About in 'About.pas' {AboutDialogFm},
  showcaption in 'showcaption.pas' {ShowLabelF},
  LicenceEngine in 'LicenceEngine.pas',
  TARIParablesSplash in 'TARIParablesSplash.pas' {TariParablesSplashF},
  detailRawTargets in 'detailRawTargets.pas' {DetailRawTargetsF},
  CashFlowReportingEngine in 'CashFlowReportingEngine.pas',
  CashFlowDE in 'CashFlowDE.pas' {CashFlowDEF},
  BusinessSetup in 'BusinessSetup.pas' {BusinessSetupF},
  ServerMaint in 'ServerMaint.pas' {ServerMaintF},
  ExpGrouping in 'ExpGrouping.pas' {ExpGroupingF},
  TARILoginU in 'TARILoginU.pas' {TARILogin},
  detailExpenses in 'detailExpenses.pas' {DetailExpensesF},
  TBFiles in 'TBFiles.pas',
  DMTariMWCli in 'DMTariMWCli.pas' {DMTariMWClient: TDataModule},
  MWClientIBO in 'MWClientIBO.pas' {MWClientForm};

//  TestGrid in 'TestGrid.pas';

//  Unit1 in 'C:\Program Files\Borland\Delphi5\Projects\Unit1.pas' {Form1};

//{$R *.TLB}
{$HINTS OFF}
{$R *.RES}
{$HINTS ON}
//{$R LokonBitmaps.res}
// Command Line Arguments
// Flag   Argument Description
// /B     Database File Name of business (If exists, access to other Businesses is denied)
// /L     Full Path to Ini File for the Session (If non-existent or invalid, Registry Default is used)
// /U     UserName for Session
// /P     UserPassword for Session (If Username and not given User is prompted)

function GetFBClientLibName: string;
begin
    result := 'fbclient.dll';
    ///usr/local/firebird32/lib/libfbclient.dylib
end;

begin
  IB_GetClientLibNameFunc := GetFBClientLibName; // Make sure we are using the correct Client Library
  Application.Initialize;
  if GGlobals.initfailed = False then
    begin
    Application.Title := 'TARI for Business';
		Application.HelpFile := 'Help\TariHlp.chm';
    Application.Run;
		end
  else
    Application.Terminate;
end.
