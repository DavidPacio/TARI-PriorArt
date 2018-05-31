unit HelpTotalFte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, cxControls, DMrep1U, LGlobals,
  cxContainer, cxEdit, cxTextEdit, cxButtons, cxLabel, cxGroupBox, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  THelpTotalFteF = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpTotalFteF: THelpTotalFteF;

implementation

{$R *.DFM}

procedure THelpTotalFteF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
end;

procedure THelpTotalFteF.cxButton1Click(Sender: TObject);
begin
  Modalresult := mrOK;
end;

end.
