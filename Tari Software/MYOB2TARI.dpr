program MYOB2TARI;

uses
  Forms,
  MainMYOBInterface in 'MainMYOBInterface.pas' {MainMYOBInterfaceF},
  MYOBDM in 'MYOBDM.pas' {DMMYOBInterface: TDataModule},
  MYOBInterGlobals in 'MYOBInterGlobals.pas',
  TARIMYOBDataModule in 'TARIMYOBDataModule.pas' {TARIMYOBDM: TDataModule},
  TARIMYOBInterfaceHelp in 'TARIMYOBInterfaceHelp.pas' {TARIMYOBInterfaceHelpF};

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
    Application.CreateForm(TMainMYOBInterfaceF, MainMYOBInterfaceF);
  Application.CreateForm(TTARIMYOBInterfaceHelpF, TARIMYOBInterfaceHelpF);
  Application.Run;
    end
  else
    Application.Terminate;
end.
