unit DatePrefers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  DataCollector, LGlobals, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DMrep1U, cxButtons,
  cxLabel, ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, Data.DB, cxDBData, cxSpinEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxGroupBox,dxSkinsLookAndFeelPainter, Vcl.ComCtrls, dxCore;

type
  TDatePrefersF = class(TForm)
    SampleDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    StaticText1: TcxTextEdit;
    StaticText2: TcxTextEdit;
    StaticText3: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxComboBox2: TcxComboBox;
    DEFormatsCB: TcxComboBox;
    STDFormatsCB: TcxComboBox;
    EnhFormatsCB: TcxComboBox;
    CloseBtn: TcxButton;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxComboBox3: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure SampleDateChange(Sender: TObject);
    procedure DEFormatsCBChange(Sender: TObject);
    procedure STDFormatsCBChange(Sender: TObject);
    procedure EnhFormatsCBChange(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatePrefersF: TDatePrefersF;

implementation

{$R *.dfm}

procedure TDatePrefersF.FormCreate(Sender: TObject);
//var
//  I, currIdx, idx : integer;
begin
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  SampleDate.Date := now;
end;

procedure TDatePrefersF.FormShow(Sender: TObject);
var
  I : integer;
begin
	cxComboBox2.Properties.BeginUpdate;
	cxComboBox2.Properties.Items.Clear;
	for I := 0 to cxLookAndFeelPaintersManager.Count - 1 do
		begin
    if cxLookAndFeelPaintersManager.Items[I] is TdxSkinLookAndFeelPainter then
			begin
			cxComboBox2.Properties.Items.Add(cxLookAndFeelPaintersManager.Items[I].LookAndFeelName);
			end;
    end;
	cxComboBox2.Properties.EndUpdate(True);
  cxComboBox2.ItemIndex := cxComboBox2.Properties.Items.IndexOf(GGlobals.MRUSkin);
  if length(GGlobals.DateFDE) < 1 then GGlobals.DateFDE := GGlobals.getDateFDE;
  DEFormatsCB.Properties.BeginUpdate;
  I := DEFormatsCB.Properties.Items.IndexOf(GGlobals.DateFDE);
  if I < 0 then
    I := DEFormatsCB.Properties.Items.Add(GGlobals.DateFDE);
  DEFormatsCB.ItemIndex := I;
  DEformatsCB.Properties.EndUpdate(True);
  STDFormatsCB.Properties.BeginUpdate;
  STDFormatsCB.Properties.Items.Assign(DEFormatsCB.Properties.items);
  if length(GGlobals.DateFSTD) < 1 then GGlobals.DateFSTD := GGlobals.getDateFSTD;
  I := STDFormatsCB.Properties.Items.IndexOf(GGlobals.DateFSTD);
  if I < 0 then
    I := STDFormatsCB.Properties.Items.Add(GGlobals.DateFSTD);
  STDFormatsCB.itemindex := I;
  STDFormatsCB.Properties.EndUpdate(True);
  EnhFormatsCB.Properties.BeginUpdate;
  EnhFormatsCB.Properties.Items.Assign(DEFormatsCB.Properties.items);
  if length(GGlobals.DateFENH) < 1 then GGlobals.DateFENH := GGlobals.getDateFENH;
  I := ENHFormatsCB.Properties.Items.IndexOf(GGlobals.DateFENH);
  if I < 0 then
    I := ENHFormatsCB.Properties.Items.Add(GGlobals.DateFENH);
  EnhFormatsCB.itemindex := I;
  EnhFormatsCB.Properties.EndUpdate(True);
end;

procedure TDatePrefersF.CloseBtnClick(Sender: TObject);
begin
//  if Edit1.Color <> GGlobals.FormColour then
//    GGlobals.FormColour := edit1.Color;
  GGlobals.DateFDE := DEFormatsCB.Text;
  GGlobals.DateFSTD := STDFormatsCB.Text;
  GGlobals.DateFEnh := EnhFormatsCB.Text;
  GGlobals.SetDatePreferences;
  Close;
end;

procedure TDatePrefersF.SampleDateChange(Sender: TObject);
begin
  DEFormatsCBChange(Sender);
  STDFormatsCBChange(Sender);
  EnhFormatsCBChange(Sender);
end;

procedure TDatePrefersF.DEFormatsCBChange(Sender: TObject);
begin
  StaticText1.Text := FormatDateTime(DEFormatsCB.text, SampleDate.Date);
end;

procedure TDatePrefersF.STDFormatsCBChange(Sender: TObject);
begin
  StaticText2.Text := FormatDateTime(STDFormatsCB.text, SampleDate.Date);
end;

procedure TDatePrefersF.EnhFormatsCBChange(Sender: TObject);
begin
  StaticText3.Text := FormatDateTime(ENHFormatsCB.text, SampleDate.Date);
end;

procedure TDatePrefersF.cxComboBox2PropertiesChange(Sender: TObject);
begin
	DMRep1.dxSkinController1.SkinName := cxComboBox2.Properties.Items[cxComboBox2.SelectedItem];
	DMRep1.dxSkinController1.Refresh();
  GGlobals.MRUSkin := DMRep1.dxSkinController1.SkinName;    // saved on application close;
end;

end.
