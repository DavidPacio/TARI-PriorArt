unit NewBusiness;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxPC,
  cxControls, DMrep1U, cxTextEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxMemo, LGlobals, DateUtils, cxCheckBox, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus;

type
  TNewBusinessF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    BusinessName: TcxTextEdit;
    FileName: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    DeptList: TcxMemo;
    cxButton3: TcxButton;
    cxLabel16: TcxLabel;
    LastDayofWeekCB: TcxComboBox;
    LicenceFile: TcxCheckBox;
    cxLabel10: TcxLabel;
    LicenceNote: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxTabSheet1Exit(Sender: TObject);
    procedure cxTabSheet2Enter(Sender: TObject);
    procedure BusinessNameExit(Sender: TObject);
    procedure BusinessNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BusinessNameEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BaseFolder : String;
    NewFileName : string;
    NewBusinessName : String;
  end;

var
  NewBusinessF: TNewBusinessF;

implementation

{$R *.dfm}

procedure TNewBusinessF.cxButton1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex < (cxPageControl1.PageCount - 1) then
    begin
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
    end
  else
    begin
    GGlobals.NewBusiness.BusinessName := BusinessName.text;
    if assigned(GGlobals.NewBusiness.Departments) then
      GGlobals.NewBusiness.Departments.Destroy;
    GGLobals.Newbusiness.NewFileName := FileName.Text;
    GGlobals.NewBusiness.Departments := TStringList.create;
    GGlobals.NewBusiness.Departments.Assign(DeptList.lines);
    GGlobals.NewBusiness.LastDayofWeek := LastDayofWeekCB.ItemIndex;
    // check here for period being greater than 366 or startdate later than end date
    NewFileName := AnsiUpperCase(FileName.text);
    ModalResult := mrOK;
    end;
end;

procedure TNewBusinessF.cxButton2Click(Sender: TObject);
begin
 if cxPageControl1.ActivePageIndex > 0 then
  cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex - 1;
end;

procedure TNewBusinessF.cxPageControl1Change(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
    cxButton2.Enabled := False
  else
    cxButton2.Enabled := True;
  if (cxPageControl1.ActivePage = cxTabSheet2)
    and ((BusinessName.text = '')
         or (FileName.text = '')
         or (FileExists(BaseFolder + {'\' +} FileName.text)))
    then begin
    if (BusinessName.text = '') then
      messageDlg('A Business Name is Required. Press Cancel to discontinue the creation of a new file', mtInformation, [mbOK], 0);
    if (FileName.text = '') or (FileExists(BaseFolder + {'\' +} FileName.text)) then
      if (messageDlg('Please change the suggested file name. Press Cancel to discontinue the creation of a new file', mtWarning, [mbOK, mbCancel], 0) = mrCancel) Then
        ModalResult := mrCancel; // we are Done!!
    cxPageControl1.ActivePage := cxTabSheet1;
  end;
end;

procedure TNewBusinessF.FormCreate(Sender: TObject);
var
  I : Integer;
begin
//  Color := GGlobals.FormColour;
  for I := 0 to cxPageControl1.PageCount - 1 do    // Iterate
    cxPageControl1.Pages[I].Color := GGlobals.FormColour;
  cxPageControl1.ActivePage := cxTabSheet1;
  BusinessName.text := 'Enter business name here';
  BusinessName.SelectAll;
  DeptList.Clear;
//  DeptList.Lines.Add('Describe one or more departments. One per line');
  LastDayofWeekCB.ItemIndex := 0;
  GGlobals.LicenceThisFile := True; //
  LicenceNote.Visible := False;
  if GGlobals.FileLicence then
    begin
    LicenceFile.Visible := False;
    LicenceFile.Properties.Caption := 'Tick to create a ''Demo'' file?';
    LicenceFile.Checked := False;
    end
  else
    begin
    LicenceFile.Visible := True;
    LicenceNote.Visible := True;
    LicenceFile.Checked := False;
    GGlobals.licenceThisFile := False;
    end;
end;

procedure TNewBusinessF.FormShow(Sender: TObject);
begin
  BusinessName.SetFocus;
end;

procedure TNewBusinessF.cxTabSheet1Exit(Sender: TObject);
begin
  NewBusinessF.Caption := NewBusinessF.Caption + ' - ' + BusinessName.Text;
end;

procedure TNewBusinessF.cxTabSheet2Enter(Sender: TObject);
begin
  DeptList.SelectAll;
end;

procedure TNewBusinessF.BusinessNameEnter(Sender: TObject);
begin
  BusinessName.SelectAll;
end;

procedure TNewBusinessF.BusinessNameExit(Sender: TObject);
var
  k: Integer;
begin
  NewFileName := BusinessName.text;
  k := 1;
  while FileExists(BaseFolder + {'\' +} NewFileName) do
    begin
    NewFileName := BusinessName.text + inttostr(k);
    inc(k);
  end;    // while
  FileName.Text := NewFileName;
end;

procedure TNewBusinessF.BusinessNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then
   Filename.setfocus;
end;

procedure TNewBusinessF.cxButton3Click(Sender: TObject);
begin
  MOdalResult := mrCancel;
end;

procedure TNewBusinessF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  GGlobals.LicenceThisFile := False;
  GGlobals.NewDemoFile := False;
  if (LicenceFile.Checked) then
    begin
    if (not GGlobals.FileLicence) then
      GGlobals.LicenceThisFile := True
    else
      GGlobals.NewDemoFile := True;
    end;
  Canclose := True;
end;

end.
