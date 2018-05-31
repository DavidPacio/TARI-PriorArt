unit Workback;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, auchTypes, StdCtrls,
  DMrep1U, LGlobals, cxTextEdit, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxButtons, cxGraphics, cxLookAndFeels,
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

Const
  WB_SALES       = 0;
  WB_GROSS       = 1;
  WB_MATERIALS   = 2;
  WB_SUBCON      = 3;
  WB_MATERIALMU  = 4;
  WB_SUBCONMU    = 5;
  WB_LABOURMU    = 6;
  WB_LABOURRATE  = 7;
  MARKUPTOTAL    = WORKBACKLIST;
  MATERIALMAR    = WORKBACKLIST + 1;
  SUBCONMAR      = WORKBACKLIST + 2;
  LABOURMAR      = WORKBACKLIST + 3;
  LABOURCHARGED  = WORKBACKLIST + 4;
  LABOURHOURS       = WORKBACKLIST + 5;

Type
  TWBData = array[0..LABOURHOURS] of currency;

  TWorkBackF = class(TForm)
    Shape1: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Shape2: TShape;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    WBSales: TcxCurrencyEdit;
    CancelBtn: TcxButton;
    CloseBtn: TcxButton;
    WBMaterials: TcxCurrencyEdit;
    WBSubCon: TcxCurrencyEdit;
    WBMatMU: TcxCurrencyEdit;
    WBSubMU: TcxCurrencyEdit;
    WBLabMU: TcxCurrencyEdit;
    WBLabourRate: TcxCurrencyEdit;
    WBMatSub: TcxCurrencyEdit;
    WBGross: TcxCurrencyEdit;
    WBMatMar: TcxCurrencyEdit;
    WBSubMar: TcxCurrencyEdit;
    WBLabMar: TcxCurrencyEdit;
    WBTotalMargin: TcxCurrencyEdit;
    WBLabourCharged: TcxCurrencyEdit;
    WBLabourHours: TcxCurrencyEdit;    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WBMaterialsExit(Sender: TObject);
    procedure WBSubConExit(Sender: TObject);
    procedure WBMatMUExit(Sender: TObject);
    procedure WBLabourRateExit(Sender: TObject);
  private
    { Private declarations }
    DoingCalc : Boolean;
    procedure CalculateAll;
  public
    { Public declarations }
  end;

var
  WorkBackF: TWorkBackF;
  WBData : TWBData;

implementation

{$R *.DFM}

procedure TWorkBackF.CloseBtnClick(Sender: TObject);
begin
  ModalResult := TcxButton(Sender).ModalResult;
end;

procedure TWorkBackF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
  WBSales.Value := WBData[WB_SALES];
  WBGross.Value := WBData[WB_GROSS];
  CalculateAll;
end;

procedure TWorkBackF.CalculateAll;
var
  temp : currency;
begin
  DoingCalc := True;
  WBData[WB_MATERIALS] := WBData[WB_SALES] - WBData[WB_GROSS] - WBData[WB_SUBCON];
  WBData[MATERIALMAR] := WBData[WB_MATERIALS] * WBData[WB_MATERIALMU] / 100;
  WBData[SUBCONMAR] := WBData[WB_SUBCON] * WBData[WB_SUBCONMU] / 100;
  temp := WBData[WB_GROSS] - WBData[MATERIALMAR] - WBData[SUBCONMAR];
  if WBData[WB_LABOURMU] = 0 then
    WBData[LABOURMAR] := 0
  else
  begin
    WBData[LABOURMAR] := temp;
    WBData[LABOURMAR] := WBData[LABOURMAR] - (temp * 100)/(WBData[WB_LABOURMU] + 100);
  end;

  WBData[MARKUPTOTAL] := WBData[MATERIALMAR] + WBData[SUBCONMAR] + WBData[LABOURMAR];
  WBData[LABOURCHARGED] := WBData[WB_GROSS] - WBData[MARKUPTOTAL];
  if WBData[WB_LABOURRATE] = 0 then
    WBData[LABOURHOURS] := 0
  else
    WBData[LABOURHOURS] := WBData[LABOURCHARGED] / WBData[WB_LABOURRATE];

  // Show Values
  WBMaterials.Value := WBData[WB_MATERIALS];
  WBSubCon.value := WBData[WB_SUBCON];
  WBMatSub.Value := WBMaterials.Value + WBSubCon.value;
  WBMatMu.Value := round(WBData[WB_MATERIALMU] * 100) / 100;
  WBMatMar.value := Round(WBData[MATERIALMAR] * 100) / 100;
  WBSubMu.Value := Round(WBData[WB_SUBCONMU] * 100) /100;
  WBSubMar.Value := Round(WBData[SUBCONMAR]);
  WBLabMu.Value := Round(WBData[WB_LABOURMU]);
  WBLabMar.Value := Round(WBData[LABOURMAR]);
  WBTotalMargin.Value := Round(WBData[MARKUPTOTAL]);
  WBLabourCharged.value := Round(WBData[LABOURCHARGED]);
  WBLabourRate.Value := Round(WBData[WB_LABOURRATE] * 100) / 100;
  WBLabourHours.Value := Round(WBData[LABOURHOURS]);
  DoingCalc := False;
end;

procedure TWorkBackF.WBMaterialsExit(Sender: TObject);
begin
  if not DoingCalc then
    begin
    WBData[WB_SUBCON] := WBData[WB_SALES] - WBData[WB_GROSS] - WBMaterials.value;
    CalculateAll;
    end;
end;

procedure TWorkBackF.WBSubConExit(Sender: TObject);
begin
  if not DoingCalc then
    begin
    WBData[WB_SUBCON] := WBSubCon.value;
    CalculateAll;
    end;
end;

procedure TWorkBackF.WBMatMUExit(Sender: TObject);
begin
  if not DoingCalc then
    begin
    WBData[WB_MATERIALMU] := WBMatMu.Value;
    WBData[WB_SUBCONMU] := WBSubMU.Value;
    WBData[WB_LABOURMU] := WBLabMU.value;
    CalculateAll;
    end;
end;

procedure TWorkBackF.WBLabourRateExit(Sender: TObject);
begin
  if not DoingCalc then
    begin
    WBData[WB_LABOURRATE] := WBLabourRate.value;
    CalculateAll;
    end;
end;

end.
