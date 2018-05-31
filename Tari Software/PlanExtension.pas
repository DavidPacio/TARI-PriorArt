unit PlanExtension;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, AuchTypes, DateUtils,
  cxControls, cxContainer, cxEdit, cxRadioGroup,
  cxCheckListBox, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DMrep1U, cxGroupBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, Menus, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxCore;

type
  TPlanExtensionF = class(TForm)
    SelectionGroup: TcxRadioGroup;
    CopySection: TcxCheckListBox;
    cxButton1: TcxButton;
    FromDate: TcxDateEdit;
    ToDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    CancelBtn: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel8: TcxLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FromDateExit(Sender: TObject);
    procedure ToDateExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    DefStartDate: TDateTime;
    DefEndDate: TDateTime;
    PlanIsSource : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlanExtensionF: TPlanExtensionF;
  InitialPlanStart: TDateTime;
  InitialPlanEnd: TDateTime;
  DaysinPlanPeriod : Integer;

implementation

{$R *.DFM}

Uses DataCollector, DMClient;

procedure TPlanExtensionF.RadioGroup1Click(Sender: TObject);
var
  Iindex: Integer;
  TmpStart, TmpEnd : TDateTime;
begin
  if ((DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value = 0) or
    (DataModuleClient.DepartmentsLAST_MONITORED.value = 0)) and (SelectionGroup.ItemIndex = 1) then
    begin
    messagedlg('There is not Tracking Data to copy!', mtInformation, [mbOK], 0);
    SelectionGroup.ItemIndex := 0;
    exit;
    end;
  Iindex := SelectionGroup.ItemIndex + 1;
  PlanIsSource := False;
  if Iindex = 1 then
    PlanIsSource := True;
  TmpStart := IncMonth(DefStartDate, -12);
  TmpEnd := incMonth(DefEndDate, -12);
  FromDate.Visible := True;
  ToDate.Visible := True;
  case IIndex of    //
    1:  begin
          FromDate.Properties.MinDate := DataModuleClient.DepartmentsFirstPlanDate.Value;
          FromDate.Properties.MaxDate := DataModuleClient.DepartmentsLatestPlanDate.value;
          ToDate.Properties.MinDate := FromDate.Properties.MinDate;
          ToDate.Properties.MaxDate := FromDate.Properties.maxDate;
          if TmpStart >= fromDate.Properties.MinDate then
            FromDate.Date := TmpStart
          else
            FromDate.Date := fromDate.Properties.MinDate;
          if tmpEnd <= ToDate.Properties.MaxDate then
            ToDate.Date := TmpEnd
          else
            ToDate.Date := ToDate.Properties.MaxDate;
        end;
    2:  begin
        FromDate.Properties.MinDate := DataModuleClient.DepartmentsFirstMonitoringDate.Value;
        FromDate.Properties.MaxDate := DataModuleClient.DepartmentsLast_Monitored.value;
        ToDate.Properties.MinDate := FromDate.Properties.MinDate;
        ToDate.Properties.MaxDate := FromDate.Properties.maxDate;
        if TmpStart >= fromDate.Properties.MinDate then
          FromDate.Date := TmpStart
        else
          FromDate.Date := fromDate.Properties.MinDate;
        if tmpEnd <= ToDate.Properties.MaxDate then
          ToDate.Date := TmpEnd
        else
          ToDate.Date := ToDate.Properties.MaxDate;
        end;
    3:  Begin
          FromDate.Properties.MinDate := DataModuleClient.DepartmentsFirstPlanDate.Value;
          FromDate.Properties.MaxDate := DataModuleClient.DepartmentsLatestPlanDate.value;
          ToDate.Properties.MinDate := FromDate.Properties.MinDate;
          ToDate.Properties.MaxDate := FromDate.Properties.maxDate;
          FromDate.Date := DataModuleClient.DepartmentsCurrentPlanStart.Value;
          ToDate.Date := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
        end;
  end;    // case
end;

procedure TPlanExtensionF.FormCreate(Sender: TObject);
begin
	Caption := 'Target Extension - ' + DataModuleClient.BusinessDetailsBusiness_Name.asstring;
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
	cxLabel8.Caption := DataModuleClient.BusinessesBRANCH_NAME.AsString;
  cxLabel2.Caption := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
//  cxLabel2.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
  DefStartDate := DataModuleClient.DepartmentsCurrentPlanStart.Value;
  DefEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
  Fromdate.Date := DefStartDate;
  ToDate.Date := DefEndDate;
  DaysinPlanPeriod := Daysbetween(DefStartDate, DefEndDate);
  // Disable Tracking button is there is no data on Monitoring
end;

procedure TPlanExtensionF.FromDateExit(Sender: TObject);
begin
  ToDate.Date := FromDate.Date + DaysinPlanPeriod;
  if SelectionGroup.ItemIndex = 1 then
  begin
    if ToDate.Date > DataModuleClient.DepartmentsCurrentPlanEnd.Value then
      ToDate.Date := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
  end;
end;


procedure TPlanExtensionF.ToDateExit(Sender: TObject);
begin
  if daysbetween(FromDate.Date, toDate.Date) > daysinPlanperiod then
    Todate.Date := FromDate.date + DaysinPlanPeriod;
  if (SelectionGroup.ItemIndex = 1) and (ToDate.Date > DataModuleClient.DepartmentsCurrentPlanEnd.Value) then
    ToDate.Date := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
end;

procedure TPlanExtensionF.cxButton1Click(Sender: TObject);
var
  I: Integer;
  ClearData : Boolean;
begin
  I := Application.MessageBox ('Proceed with Copy?', 'Copy Data', MB_YESNO + MB_ICONQUESTION);
  if I = IDYES then
  begin
    screen.Cursor := crHourGlass;
    ClearData := False;
    if (SelectionGroup.ItemIndex <> -1) then
    begin
      if SelectionGroup.ItemIndex = 2 then
        ClearData := True;
      DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
      if CopySection.items.Items[0].Checked = True then
         DataCollect.CopyNewPlanData(FromDate.Date, ToDate.Date, DefStartDate, PlanIsSource, ClearData, rtSales);
      if CopySection.items.Items[1].Checked = True then
         DataCollect.CopyNewPlanData(FromDate.Date, ToDate.Date, DefStartDate, PlanIsSource, ClearData, rtOtherIncome);
      if CopySection.items.Items[2].Checked = True then
         DataCollect.CopyNewPlanData(FromDate.Date, ToDate.Date, DefStartDate, PlanIsSource, ClearData, rtExpenses);
      DataCollect.ClearConsolidatedList;
    end;
    ModalResult := mrOK;
  end;
end;

procedure TPlanExtensionF.CancelBtnClick(Sender: TObject);
begin
  modalResult := mrOK;
end;

end.
