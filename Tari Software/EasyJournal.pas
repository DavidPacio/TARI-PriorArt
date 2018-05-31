unit EasyJournal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMrep1U, LGlobals, DMClient, StdCtrls, cxButtons, cxRadioGroup,
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxLabel, cxCheckBox, cxGraphics,
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
  TEasyJournalF = class(TForm)
    JrnlDateEdit: TcxDateEdit;
    JrnlAmountEdit: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton1: TcxButton;
    CancelBtn: TcxButton;
    JrnlName: TcxTextEdit;
    cxLabel1: TcxLabel;
    JrnlRepeatCB: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EasyJournalF: TEasyJournalF;

implementation

{$R *.dfm}

procedure TEasyJournalF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
  JrnlDateEdit.Properties.MinDate := DataModuleClient.DepartmentsCURRENTPLANSTART.Value;
  JrnlDateEdit.Properties.MaxDate := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
end;

procedure TEasyJournalF.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TEasyJournalF.cxButton1Click(Sender: TObject);
begin
  Modalresult := mrOK;
//  Close;
end;

end.
