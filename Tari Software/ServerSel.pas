unit ServerSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, DMrep1U,
  cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons, LGlobals,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus;

type
  TServerSelF = class(TForm)
    cxLabel2: TcxLabel;
    ServerCB: TcxComboBox;
    OKButton: TcxButton;
    CancelBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerSelF: TServerSelF;

implementation

{$R *.dfm}

procedure TServerSelF.FormCreate(Sender: TObject);
begin
  Color := ggLobals.FormColour;
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
  Left := trunc((screen.width - width) / 2);
  Top := trunc(Screen.Height / 2) + 5;
end;

end.
