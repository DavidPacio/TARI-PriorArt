unit PastPeriodSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxRadioGroup, cxEdit, cxControls, cxContainer, DMClient, LGlobals,
  ExtCtrls, cxGroupBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TPastPeriodSelectionF = class(TForm)
    PastDatesRG: TcxRadioGroup;
    Timer1: TTimer;
    procedure PastDatesRGClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PastPeriodSelectionF: TPastPeriodSelectionF;
  Fader1, AlphaSteps : integer;

implementation

{$R *.dfm}

procedure TPastPeriodSelectionF.PastDatesRGClick(Sender: TObject);
begin
  DataModuleClient.DateRangers.IndexName := 'PK_DATERANGERS';
  DataModuleClient.DateRangers.Refresh;
  DataModuleClient.DateRangers.First;
  while DataModuleClient.DateRangers.eof = False do    // Iterate
    begin
    DataModuleClient.DateRangers.Edit;
    DataModuleClient.DateRangersCURRENTPERIOD.Value := 0;
    DataModuleClient.DateRangers.post;
    DataModuleClient.DateRangers.Next;
    end;    // for
  DataModuleClient.DateRangers.First;
  if (DataModuleClient.DateRangersD_Index.Value > 0) then
    begin
    while DataModuleClient.DateRangers.eof = False do    // Iterate
      begin
      if (DataModuleClient.DateRangersD_Index.Value - 1) = PastDatesRG.ItemIndex then
        break;
      DataModuleClient.DateRangers.Next;
      end;    // for
    end;
  DataModuleClient.DateRangers.Edit;
  DataModuleClient.DateRangersCURRENTPERIOD.Value := 1;
  DataModuleClient.DateRangers.post;
  Fader1 := 30;
  AlphaSteps := 8;
  Timer1.Interval := 1;
  AlphaBlend := True;
  AlphaBlendValue := Fader1 * AlphaSteps;
  Timer1.Enabled := true;
end;

procedure TPastPeriodSelectionF.FormCreate(Sender: TObject);
var
  OldFormat : string;
begin
//  color := GGlobals.FormColour;
  DATAMODULECLIENT.dateRangersLU.ACtive := True;
  OldFormat := DataModuleClient.DateRangersLUSTARTDATE.DisplayFormat;
  DataModuleClient.DateRangersLUSTARTDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DateRangersLUENDDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DateRangersLU.Refresh;
  PastDatesRG.Properties.Items.BeginUpdate;
  PastDatesRG.Properties.Items.Clear;
//  PastDatesRG.Properties.Items.BeginUpdate;
  DATAMODULECLIENT.DateRangersLU.IndexName := 'PK_DATERANGERS';
  DataModuleClient.DateRangersLU.First;
  while DataModuleClient.DateRangersLU.Eof = False do
    begin
    TcxRadioGroupItem(PastDatesRG.Properties.Items.Add).Caption := DataModuleClient.DateRangersLUSTARTDATE.DisplayText + ' to ' + DataModuleClient.DateRangersLUENDDATE.DisplayText;
    DataModuleClient.DateRangersLU.Next;
    end;
  Height :=108 + (DataModuleClient.DateRangersLU.RecordCount - 2) * 36;
  DataModuleClient.DateRangersLUSTARTDATE.DisplayFormat := OldFormat;
  DataModuleClient.DateRangersLUENDDATE.DisplayFormat := OldFormat;
  PastDatesRG.ItemIndex := -1;
  DATAMODULECLIENT.dateRangersLU.ACtive := False;
end;

procedure TPastPeriodSelectionF.Timer1Timer(Sender: TObject);
begin
  if Fader1 = 0 then
    Close
  else
    begin
    AlphaBlendValue := AlphaBlendValue - AlphaSteps;
    dec(Fader1);
    Timer1.Enabled := True;
    end;
end;

end.
