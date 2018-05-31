program TariSaaS;

uses
  Vcl.Forms,
  TariSaaSMain in 'TariSaaSMain.pas' {TariSaaSMainF},
  DMTariSaaS in 'DMTariSaaS.pas' {DMTSaas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTariSaaSMainF, TariSaaSMainF);
  Application.CreateForm(TDMTSaas, DMTSaas);
  Application.Run;
end.
