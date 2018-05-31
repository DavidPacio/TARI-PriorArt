//program Lok_OnFBATS;
program BenchmarkOneA;

uses
  uROComInit,
  Forms,
  LGlobals in 'LGlobals.pas',
  Splash1 in 'Splash1.pas' {SplashForm},
  DMrep1U in 'DMrep1U.pas' {DMRep1: TDataModule},
  LicenceA in 'LicenceA.pas' {LicenceFA},
  LicenceCalc in 'LicenceCalc.pas',
  FBMLicenceSL_Intf in '..\SmartLicence\FBMLicenceSL_Intf.pas',
  LicenceExpiry in 'LicenceExpiry.pas' {LicExpiryDlg},
  DOITLoginU in 'DOITLoginU.pas' {DOITLogin},
  DMUsers in 'DMUsers.pas' {DMUserM: TDataModule},
  DMTestCon in 'DMTestCon.pas' {DMTestConM: TDataModule},
  ServerSel in 'ServerSel.pas' {ServerSelF},
  DIYMain in 'DIYMain.pas' {DIYMainF},
  DMClient in 'DMClient.pas' {DataModuleClient: TDataModule},
  NewBusiness in 'NewBusiness.pas' {NewBusinessF},
  TargetSetup in 'TargetSetup.pas' {TargetSetupF},
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
  detailExpenses in 'detailExpenses.pas' {DetailExpensesF},
  ChartHistory in 'ChartHistory.pas',
  CashFlowEngine in 'CashFlowEngine.pas',
  CashFlowEdit in 'CashFlowEdit.pas' {CashFlowEditF},
  CashFlowDE in 'CashFlowDE.pas' {CashFlowDEF},
  CashFlowJrnls in 'CashFlowJrnls.pas' {CashFlowJrnlsF},
  EasyJournal in 'EasyJournal.pas' {EasyJournalF},
  UltimateWhatif in 'UltimateWhatif.pas' {UltimatewhatifF},
  ReportingTargets in 'ReportingTargets.pas' {ReportingTargetsF},
  rbPrvDlg in 'rbPrvDlg.pas' {rbPrintPreview},
  CustomPDFReport in 'CustomPDFReport.pas',
  TargetPDFReports in 'TargetPDFReports.pas',
  TargetGrep in 'TargetGrep.pas' {TargetGRepF},
  TargetDetailGrep in 'TargetDetailGrep.pas' {TargetDetailGRepF},
  TrackingPeriod in 'TrackingPeriod.pas' {TrackingPeriodF},
  Quotes in 'Quotes.pas' {QuotesF},
  MonitoringSales in 'MonitoringSales.pas' {MonitoringSalesF},
  MonitoringInvoices in 'MonitoringInvoices.pas' {MonitoringInvoicesF},
  MonitoringExpenses in 'MonitoringExpenses.pas' {MonitoringExpensesF},
  MonitoringOtherIncome in 'MonitoringOtherIncome.pas' {MonitoringOtherIncomeF},
  DBMaint in 'DBMaint.pas' {DBMaintF},
  ReportingTracking in 'ReportingTracking.pas' {ReportingTrackingF},
  TrackingPDFReports in 'TrackingPDFReports.pas',
  TrackGrep in 'TrackGrep.pas' {TrackGRepF},
  ServerMaint in 'ServerMaint.pas' {ServerMaintF},
  BackupRestore in 'BackupRestore.pas' {BackupFrm},
  DBemail in 'DBemail.pas' {DBEmailF},
  DatePrefers in 'DatePrefers.pas' {DatePrefersF},
  MaintainUsers in 'MaintainUsers.pas' {MaintainUserF},
  DBUpdate in 'DBUpdate.pas' {DBUpdateF},
  About in 'About.pas' {AboutDialogFm},
  showcaption in 'showcaption.pas' {ShowLabelF},
  TBImport in 'TBImport.pas' {TBImportF},
  ImpTemplates in 'ImpTemplates.pas' {ImpTemplatesF},
  DataCollector in 'DataCollector.pas';

//  TestGrid in 'TestGrid.pas';

//  Unit1 in 'C:\Program Files\Borland\Delphi5\Projects\Unit1.pas' {Form1};

//{$R *.TLB}

{$R *.RES}
//{$R LokonBitmaps.res}
// Command Line Arguments
// Flag   Argument Description
// /B     Database File Name of business (If exists, access to other Businesses is denied)
// /L     Full Path to Ini File for the Session (If non-existent or invalid, Registry Default is used)
// /U     UserName for Session
// /P     UserPassword for Session (If Username and not given User is prompted)
begin
  Application.Initialize;
  if GGlobals.initfailed = False then
    begin
    Application.Title := 'Benchmark One';
    Application.Run;
    end
  else
    Application.Terminate;
end.
