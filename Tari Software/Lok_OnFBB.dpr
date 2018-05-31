program Lok_OnFBB;

uses
  Forms,
  DIYMain in 'DIYMain.pas' {DIYMainF},
  DMClient in 'DMClient.pas' {DataModuleClient: TDataModule},
  rbPrvDlg in 'rbPrvDlg.pas' {rbPrintPreview},
  DIYPlanExpenses in 'DIYPlanExpenses.pas' {DIYPlanExpensesF},
  MonitoringInvoices in 'MonitoringInvoices.pas' {MonitoringInvoicesF},
  Workback in 'Workback.pas' {WorkBackF},
  DMUsers in 'DMUsers.pas' {DMUserM: TDataModule},
  MaintainUsers in 'MaintainUsers.pas' {MaintainUserF},
  HelpProdFTE in 'HelpProdFTE.pas' {HelpProdFTEF},
  HelpTotalFte in 'HelpTotalFte.pas' {HelpTotalFteF},
  HelpActualHours in 'HelpActualHours.pas' {HelpActualHoursF},
  HelpPotentialUnits in 'HelpPotentialUnits.pas' {HelpPotentialUnitsF},
  Monitoring in 'Monitoring.pas' {MonitoringF},
  ReportingTargets in 'ReportingTargets.pas' {ReportingTargetsF},
  ReportingTracking in 'ReportingTracking.pas' {ReportingTrackingF},
  About in 'About.pas' {AboutDialogFm},
  TrackingPDFReports in 'TrackingPDFReports.pas',
  TargetGrep in 'TargetGrep.pas' {TargetGRepF},
  TargetDetailGrep in 'TargetDetailGrep.pas' {TargetDetailGRepF},
  Splash1 in 'Splash1.pas' {SplashForm},
  MonitoringExpenses in 'MonitoringExpenses.pas' {MonitoringExpensesF},
  Invoices in 'Invoices.pas' {InvoicesF},
  MonitoringOtherIncome in 'MonitoringOtherIncome.pas' {MonitoringOtherIncomeF},
  MonitoringSales in 'MonitoringSales.pas' {MonitoringSalesF},
  PlanExtension in 'PlanExtension.pas' {PlanExtensionF},
  DBMaint in 'DBMaint.pas' {DBMaintF},
  CustomPDFReport in 'CustomPDFReport.pas',
  HelpPotentialHours in 'HelpPotentialHours.pas' {HelpPotentialHoursF},
  TargetPDFReports in 'TargetPDFReports.pas',
  LicenceCalc in 'LicenceCalc.pas',
  TargetDKeyGrep in 'TargetDKeyGrep.pas' {TargetDKeyGRepF},
  TrackGrep in 'TrackGrep.pas' {TrackGRepF},
  CashFlowEngine in 'CashFlowEngine.pas',
  Quotes in 'Quotes.pas' {QuotesF},
  showcaption in 'showcaption.pas' {ShowLabelF},
  ServerSel in 'ServerSel.pas' {ServerSelF},
  ServerMaint in 'ServerMaint.pas' {ServerMaintF},
  BackupRestore in 'BackupRestore.pas' {BackupFrm},
  LicenceB in 'LicenceB.pas' {LicenceFB},
  DBemail in 'DBemail.pas' {DBEmailF},
  NewBusinessWizard in 'NewBusinessWizard.pas' {NewBusinessWizardF},
  Lok_OnFBB_TLB in 'Lok_OnFBB_TLB.pas',
  Planning in 'Planning.pas' {PlanningF},
  LGlobals in 'LGlobals.pas',
  detailExpenses in 'detailExpenses.pas' {DetailExpensesF};

//  Unit1 in 'C:\Program Files\Borland\Delphi5\Projects\Unit1.pas' {Form1};

{$R *.TLB}

{$R *.RES}
{$R LokonBitmaps.res}
// Command Line Arguments
// Flag   Argument Description
// /B     Database File Name of business (If exists, access to other Businesses is denied)
// /L     Full Path to Ini File for the Session (If non-existent or invalid, Registry Default is used)
// /U     UserName for Session
// /P     UserPassword for Session (If Username and not given User is prompted)
begin
  Application.Initialize;
  if (GGlobals.initfailed = False) and (Not GGlobals.SecondInstance)then
    begin
    Application.Title := 'Lok-On Business';
    Application.Run;
    end
  else
    Application.Terminate;
end.
