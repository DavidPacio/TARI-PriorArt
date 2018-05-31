unit HelpPotentialHours;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, dmrep1U, LGlobals, cxButtons, cxGroupBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
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
  THelpPotentialHoursF = class(TForm)
    cxComboBox1: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserSelected: Currency;
  end;

Const
  // This array must be maintained is the Combobox1 itemlist changes
  PotHours : array[0..7] of Currency = (0, 1350, 1465, 1575, 1688, 1710, 1800, 1920);

var
  HelpPotentialHoursF: THelpPotentialHoursF;

implementation

{$R *.DFM}

procedure THelpPotentialHoursF.FormCreate(Sender: TObject);
begin
  cxComboBox1.ItemIndex := 0;
  Color := GGlobals.FormColour;
end;

procedure THelpPotentialHoursF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 UserSelected := PotHours[cxComboBox1.itemindex];
 Action := cafree;
end;

procedure THelpPotentialHoursF.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
