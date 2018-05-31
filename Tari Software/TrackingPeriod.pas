unit TrackingPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, DMClient, StdCtrls, Mask, DBCtrls, LGlobals, DateUtils,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLabel, DMrep1U, DataCollector,
  cxDBLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, Menus;

type
  TTrackingPeriodF = class(TForm)
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    MonitoringStartDate: TcxDBDateEdit;
    MonitoringEndDate: TcxDBDateEdit;
    CloseBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    GroupingCB: TcxComboBox;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    ApplyTargetDatetoAllBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure MonitoringStartDateExit(Sender: TObject);
    procedure MonitoringEndDateExit(Sender: TObject);
    procedure GroupingCBExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyTargetDatetoAllBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateGrouping;
    procedure SaveGroupName;
	end;

var
  TrackingPeriodF: TTrackingPeriodF;

implementation

{$R *.dfm}

procedure TTrackingPeriodF.FormCreate(Sender: TObject);
begin
  Color := Gglobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DataModuleClient.DepartmentsFIRSTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsLATESTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
 // create Monitoring dates if there aren't any
  DataModuleClient.Departments.edit;
  if (DataModuleClient.DepartmentsCurrentMonitoringStart.value = 0) or
     (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) then
    begin
    if DataModuleClient.DepartmentsCurrentPlanStart.value > 0 then
      begin
      DataModuleClient.DepartmentsCurrentMonitoringStart.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
      DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    end
  else
    begin
    if DataModuleClient.DepartmentsCurrentPlanStart.value < DataModuleClient.DepartmentsFirstPlanDate.value then
      DataModuleClient.DepartmentsFirstPlanDate.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
    if DataModuleClient.DepartmentsCurrentPlanEnd.value > DataModuleClient.DepartmentsLatestPlanDate.value then
      DataModuleClient.DepartmentsLatestPlanDate.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    end;
  DataModuleClient.Departments.Post;
  UpdateGrouping;
  // set minimum and maximum dates for period selection
  MonitoringStartDate.Properties.MinDate := DataModuleClient.DepartmentsFIRSTPLANDATE.Value;
  MonitoringStartDate.Properties.MaxDate := DataModuleClient.DepartmentsLATESTPLANDATE.Value;
  MonitoringEndDate.Properties.MinDate := DataModuleClient.DepartmentsFIRSTPLANDATE.Value;
  MonitoringEndDate.Properties.MaxDate := DataModuleClient.DepartmentsLATESTPLANDATE.Value;
end;

procedure TTrackingPeriodF.MonitoringStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.DepartmentsFirstPlanDate.value > 0)
    and (DataModuleClient.DepartmentsCurrentMonitoringStart.value < DataModuleClient.DepartmentsFirstPlanDate.value)
    then begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentMonitoringStart.value := DataModuleClient.DepartmentsFirstPlanDate.value;
    DataModuleClient.Departments.Post;
    MessageDlg('Monitoring Start date can not be before ' + DataModuleClient.DepartmentsFirstPlanDate.asstring + #13#10 + 'To plan before this date, you must clear this plan and reenter data', mtInformation, [mbOK], 0);
  end;
  if (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) or
    (trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value) > 366)
    then begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentMonitoringEnd.value :=
			IncDay(IncYear(DataModuleClient.DepartmentsCurrentMonitoringStart.value, 1), -1);
    DataModuleClient.Departments.Post;
  end;
end;

procedure TTrackingPeriodF.MonitoringEndDateExit(Sender: TObject);
begin
  DataModuleClient.Departments.edit;
  if DataModuleClient.DepartmentsLatestPlanDate.Value <  DataModuleClient.DepartmentsCurrentMonitoringEnd.Value then
    DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DataModuleClient.DepartmentsLatestPlanDate.Value;
  if (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) or
    (trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value) > 366) then
		DataModuleClient.DepartmentsCurrentMonitoringEnd.value := IncDay(IncYear(DataModuleClient.DepartmentsCurrentMonitoringStart.value, 1), -1);
  DataModuleClient.Departments.Post;
end;

procedure TTrackingPeriodF.UpdateGrouping;
begin
  if length(DataModuleClient.DepartmentsInvGroupName.value) > 0 then
    begin
		GroupingCB.itemindex := GroupingCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsInvGroupName.AsString);
    if GroupingCB.ItemIndex < 0 then
			GroupingCB.itemindex := GroupingCB.Properties.items.Add(DataModuleClient.DepartmentsInvGroupName.AsString);
    end
  else
    GroupingCB.ItemIndex := 0;
end;

procedure TTrackingPeriodF.GroupingCBExit(Sender: TObject);
begin
  if GroupingCB.Properties.Items.IndexOf(GroupingCB.text) < 0 then
    GroupingCB.itemindex := GroupingCB.Properties.items.Add(GroupingCB.text);
end;

procedure TTrackingPeriodF.SaveGroupName;
begin
  DataModuleClient.departments.edit;
  DataModuleClient.DepartmentsInvGroupName.AsString := GroupingCB.Text; //Items[GroupingCB.ItemIndex];
  DataModuleClient.Departments.post;
  GroupingCBExit(Self);
end;

procedure TTrackingPeriodF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveGroupName;
end;

procedure TTrackingPeriodF.ApplyTargetDatetoAllBtnClick(Sender: TObject);
begin
// using DeptRef to set the date on all departments the same.
  DataModuleClient.DeptRef.First;
  while DataModuleClient.DeptRef.Eof = False do
    begin
    if DataModuleClient.DeptRefDEPT_ID.Value <> DataModuleClient.DepartmentsDEPT_ID.value then
      begin
      DataModuleClient.DeptRef.Edit;
      DataModuleClient.deptrefcurrentMonitoringstart.value := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
      DataModuleClient.DeptrefCurrentMonitoringEnd.value := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
      if DataModuleClient.DeptrefLatestPlanDate.Value <  DataModuleClient.DeptrefCurrentMonitoringEnd.Value then
        DataModuleClient.DeptrefCurrentMonitoringEnd.value := DataModuleClient.DeptrefLatestPlanDate.Value;
      if (DataModuleClient.DeptrefCurrentMonitoringEnd.value = 0) or
          (trunc(DataModuleClient.DeptrefCurrentMonitoringEnd.value) - trunc(DataModuleClient.DeptrefCurrentMonitoringStart.value) > 366) then
        DataModuleClient.DeptrefCurrentMonitoringEnd.value := IncDay(IncYear(DataModuleClient.DeptrefCurrentMonitoringStart.value, 1), -1);
      DataModuleClient.Deptref.Post;
      end;
    DataModuleClient.DeptRef.next;
    end;    // while
end;

end.
