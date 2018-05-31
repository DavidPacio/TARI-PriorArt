unit NewBusinessWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, EPStdCmp, CWTools, DateUtils,
  wwdbdatetimepicker, bmpPanel, LGlobals;

type
  TNewBusinessWizardF = class(TForm)
    bmpPanel1 : TbmpPanel;
    bmpPanel2 : TbmpPanel;
    bmpPanel3 : TbmpPanel;
    EPWizard1: TEPWizard;
    EPWizardPage1: TEPWizardPage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BusinessName: TEdit;
    EPWizardPage2: TEPWizardPage;
    Label7: TLabel;
    Label6: TLabel;
    DeptList: TMemo;
    EPWizardPage3: TEPWizardPage;
    Label9: TLabel;
    LastDayofWeekCB: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    FileName: TEdit;
    PastStartDate: TwwDBDateTimePicker;
    PastEndDate: TwwDBDateTimePicker;
    TargetStartDate: TwwDBDateTimePicker;
    EPWizardPage4: TEPWizardPage;
    procedure EPWizard1Enter(Sender: TObject);
    procedure EPWizardPage1Exit(Sender: TObject);
    procedure EPWizard1FinishClick(Sender: TObject);
    procedure DeptListEnter(Sender: TObject);
    procedure BusinessNameExit(Sender: TObject);
    procedure EPWizard1Change(Sender: TObject);
    procedure BusinessNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure PastStartDateExit(Sender: TObject);
  private
    { Private declarations }
  public
    BaseFolder : String;
    NewFileName : string;
    NewBusinessName : String;
    LicenceTypeNew : string[5];
    { Public declarations }
  end;

var
  NewBusinessWizardF: TNewBusinessWizardF;

implementation

{$R *.DFM}

uses DMClient, DataCollector;

procedure TNewBusinessWizardF.EPWizard1Enter(Sender: TObject);
begin
  BusinessName.text := 'Enter business name here';
  DeptList.Clear;
//  DeptList.Lines.Add('Describe one or more departments. One per line');
  LastDayofWeekCB.ItemIndex := 0;
  PastStartDate.Date := GGlobals.PPastStartDate;
  PastEndDate.Date := GGlobals.PPastEndDate;
  TargetStartDate.Date := GGlobals.PStartDate;
end;

procedure TNewBusinessWizardF.EPWizardPage1Exit(Sender: TObject);
begin
  NewBusinessWizardF.Caption := NewBusinessWizardF.Caption + ' - ' + BusinessName.Text;
end;

procedure TNewBusinessWizardF.EPWizard1FinishClick(Sender: TObject);
begin
  GGlobals.NewBusiness.BusinessName := BusinessName.text;
  if assigned(GGlobals.NewBusiness.Departments) then
     GGlobals.NewBusiness.Departments.Destroy;
  GGlobals.NewBusiness.Departments := TStringList.create;
  GGlobals.NewBusiness.Departments.Assign(DeptList.lines);
  GGlobals.NewBusiness.LastDayofWeek := LastDayofWeekCB.ItemIndex;
  GGlobals.NewBusiness.PastStartDate := PastStartDate.Date;
  GGlobals.NewBusiness.PastEndDate := PastEndDate.Date;
  // check here for period being greater than 366 or startdate later than end date
  if GGlobals.NewBusiness.PastStartDate >= GGlobals.NewBusiness.PastEndDate then
    begin
    if (incYear(GGlobals.NewBusiness.PastStartDate, 1) - 1) > now then
      GGlobals.NewBusiness.PastStartDate := (incYear(GGlobals.NewBusiness.PastEndDate, -1) - 1)
    else
      GGlobals.NewBusiness.PastEndDate := (incYear(GGlobals.NewBusiness.PastStartDate, 1) - 1);
    end;
  if daysbetween(GGlobals.NewBusiness.PastStartDate, GGlobals.NewBusiness.PastEndDate) > 365 then
    GGlobals.NewBusiness.PastEndDate := (incYear(GGlobals.NewBusiness.PastStartDate, 1) - 1);
  GGlobals.NewBusiness.StartTargetDate := TargetStartDate.Date;
  NewFileName := AnsiUpperCase(FileName.text);
  ModalResult := mrOK;
end;

procedure TNewBusinessWizardF.DeptListEnter(Sender: TObject);
begin
  DeptList.SelectAll;
end;

procedure TNewBusinessWizardF.BusinessNameExit(Sender: TObject);
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

procedure TNewBusinessWizardF.EPWizard1Change(Sender: TObject);
begin
  if (EPWizard1.ActivePage = EPWizardPage2)
    and ((BusinessName.text = '')
         or (FileName.text = '')
         or (FileExists(BaseFolder + {'\' +} FileName.text)))
    then begin
    if (BusinessName.text = '') then
      messageDlg('A Business Name is Required. Press Cancel to discontinue the creation of a new file', mtInformation, [mbOK], 0);
    if (FileName.text = '') or (FileExists(BaseFolder + {'\' +} FileName.text)) then
      if (messageDlg('Please change the suggested file name. Press Cancel to discontinue the creation of a new file', mtWarning, [mbOK, mbCancel], 0) = mrCancel) Then
        ModalResult := mrCancel; // we are Done!!
    EPWizard1.activePage := EPWizardPage1;
  end;

end;

procedure TNewBusinessWizardF.BusinessNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_RETURN then
   Filename.setfocus;
end;

procedure TNewBusinessWizardF.FormActivate(Sender: TObject);
begin
  if LicenceTypeNew = 'S' then
  begin
    BusinessName.Text := NewBusinessName;
    BusinessName.Enabled := False;
    FileName.text := NewFileName;
    FileName.enabled := False;
    EPWizardPage1.Include := False;
    EPWizard1.ActivePage := EPWizardPage2;
  end
  else begin
    EPWizardPage1.Include := True;
  end;
end;

procedure TNewBusinessWizardF.PastStartDateExit(Sender: TObject);
begin
  // Advance things by a Year
  if PastStartDate.Date > 0 then
    PastEndDate.Date := incYear(PastStartDate.Date, 1) - 1;
end;

end.
