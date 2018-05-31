program Shortcuts2TARI;

uses
  Forms,
  MainInterface in 'MainInterface.pas' {MainInterfaceF},
  SCDM in 'SCDM.pas' {DMInterface: TDataModule},
  SCInterGlobals in 'SCInterGlobals.pas',
  SCSetup in 'SCSetup.pas' {SCSetupF},
  TARIStaff in 'TARIStaff.pas' {TARIStaffF},
  ScReports in 'ScReports.pas' {SCReportsF},
  TARIDataModule in 'TARIDataModule.pas' {TARIDM: TDataModule},
  TARIInterfaceHelp in 'TARIInterfaceHelp.pas' {TARIInterfaceHelpF},
  TARITIMES in 'TARITIMES.pas' {TARITimesF},
  ImpTemplates in 'ImpTemplates.pas' {ImpTemplatesF};

{$R *.res}
// Command Line Arguments
// Flag   Argument Description
// /TARISERVER      FB Database Server
// /TARIPATH        Full Path to the TARI Database
// /TARISTARTDATE   Monitoring Start Date
// /TARISTARTEND    Monitoring End Date
// /TARISCFDB       Full Path of SCInterface Database
begin
  Application.Initialize;
  if GGlobals.initfailed = False then
    begin
    Application.CreateForm(TMainInterfaceF, MainInterfaceF);
  Application.CreateForm(TTARIInterfaceHelpF, TARIInterfaceHelpF);
  Application.CreateForm(TTARITimesF, TARITimesF);
  Application.Run;
    end
  else
    Application.Terminate;
end.
