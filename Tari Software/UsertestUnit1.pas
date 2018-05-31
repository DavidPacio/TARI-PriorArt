unit UsertestUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, DB, IBODataset,
  IB_Components, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  initFailed : Boolean;

implementation

uses Licence;

{$R *.dfm}

initialization
 Application.CreateForm(TLicenceF, LicenceF);
 LicenceF.showmodal;
 LicenceF.Free;
 initfailed := False;

finalization
end.
