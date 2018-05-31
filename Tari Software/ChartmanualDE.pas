unit ChartmanualDE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DMrep1U, LGlobals, cxControls, cxContainer, cxEdit, cxLabel,
  cxButtons, cxTextEdit, cxCurrencyEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus;

type
  TChartManualDEF = class(TForm)
    Label1: TcxLabel;
    NewValue: TcxCurrencyEdit;
    CloseBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartManualDEF: TChartManualDEF;

implementation

{$R *.dfm}

procedure TChartManualDEF.FormCreate(Sender: TObject);
begin
  Color := GGLObals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
end;

procedure TChartManualDEF.CloseBtnClick(Sender: TObject);
begin
  close;
end;

end.
