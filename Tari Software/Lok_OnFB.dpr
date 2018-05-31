program Lok_OnFB;

uses
  Forms,
  DIYMain in 'DIYMain.pas' {DIYMainF},
  DMClient in 'DMClient.pas' {DataModuleClient: TDataModule},
  Planning in 'Planning.pas' {PlanningF},
  DIYPlanExpenses in 'DIYPlanExpenses.pas' {DIYPlanExpensesF},
  MonitoringInvoices in 'MonitoringInvoices.pas' {MonitoringInvoicesF},
  Workback in 'Workback.pas' {WorkBackF},
  DMUsers in 'DMUsers.pas' {DMUserM: TDataModule},
  MaintainUsers in 'MaintainUsers.pas' {MaintainUserF},
  NewBusinessWizard in 'NewBusinessWizard.pas' {NewBusinessWizardF},
  HelpProdFTE in 'HelpProdFTE.pas' {HelpProdFTEF},
  HelpTotalFte in 'HelpTotalFte.pas' {HelpTotalFteF},
  HelpActualHours in 'HelpActualHours.pas' {HelpActualHoursF},
  HelpPotentialUnits in 'HelpPotentialUnits.pas' {HelpPotentialUnitsF},
  Monitoring in 'Monitoring.pas' {MonitoringF},
  ReportingTargets in 'ReportingTargets.pas' {ReportingTargetsF},
  ReportingTracking in 'ReportingTracking.pas' {ReportingTrackingF},
  About in 'About.pas' {AboutDialogFm},
  TargetPLReport in 'TargetPLReport.pas' {TargetPLRptF},
  PdfPreview in 'PdfPreview.pas' {ReportPreviewF},
  TrackingPDFReports in 'TrackingPDFReports.pas',
  TargetKeyGrep in 'TargetKeyGrep.pas' {TargetKeyGRepF},
  TrackPNLGrep in 'TrackPNLGrep.pas' {TrackPNLGRepF},
  TargetPLGrep in 'TargetPLGrep.pas' {TargetPLGRepF},
  TargetDPLGrep in 'TargetDPLGrep.pas' {TargetDPLGRepF},
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
  TrackKeyGrep in 'TrackKeyGrep.pas' {TrackKeyGRepF},
  DataCollector in 'DataCollector.pas',
  Quotes in 'Quotes.pas' {QuotesF},
  showcaption in 'showcaption.pas' {ShowLabelF},
  ServerSel in 'ServerSel.pas' {ServerSelF},
  ServerMaint in 'ServerMaint.pas' {ServerMaintF},
  BackupRestore in 'BackupRestore.pas' {BackupFrm},
  {$IFNDEF Advisor}
  LicenceB in 'LicenceB.pas' {LicenceFB},
  {$ELSE}
  LicenceA in 'LicenceA.pas' {LicenceFA},
  {$ENDIF}
  DBemail in 'DBemail.pas' {DBEmailF};

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
  if initfailed = False then begin
    Application.Title := 'Lok-On';
  Application.Run;
  end
  else
    Application.Terminate;
end.
