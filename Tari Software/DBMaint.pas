unit DBMaint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, ComCtrls, auchtypes, strutils,
  cxLabel, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtons, LGLobals, DMrep1U,
  cxLookAndFeelPainters, cxGraphics, cxLookAndFeels, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxCore;

type
  TDBMaintF = class(TForm)
    PlanDeleteBtn: TcxButton;
    MonitorDeleteBtn: TcxButton;
    QuotesDeleteBtn: TcxButton;
    CloseBtn: TcxButton;
    PlanDataDelCB: TcxComboBox;
    MonitorDataDelCB: TcxComboBox;
    QuoteDelDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    DeptNameLabel: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure PlanDeleteBtnClick(Sender: TObject);
    procedure MonitorDeleteBtnClick(Sender: TObject);
    procedure QuotesDeleteBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBMaintF: TDBMaintF;

implementation

uses DMClient;

{$R *.DFM}

procedure TDBMaintF.FormCreate(Sender: TObject);
var
  d, m, y : word;
  LDate : TdateTime;
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
	Caption := 'Database Maintenance - ' + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
  DeptNameLabel.Caption := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
//  DeptNameLabel.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
  if (DataModuleClient.DepartmentsCurrentMonitoringStart.value > 0)
    and (DataModuleClient.DepartmentsCurrentPlanStart.value <= DataModuleClient.DepartmentsCurrentMonitoringStart.value)
    then decodedate(DataModuleClient.DepartmentsCurrentPlanStart.value, y, m, d);
  if (DataModuleClient.DepartmentsCurrentMonitoringStart.value > 0)
    and (DataModuleClient.DepartmentsCurrentPlanStart.value > DataModuleClient.DepartmentsCurrentMonitoringStart.value)
    then decodedate(DataModuleClient.DepartmentsCurrentMonitoringStart.value, y, m, d);
  Ldate := encodedate(Y - 1, 12, 31);
  if Ldate <= DataModuleClient.DepartmentsFirstPlandate.value
    then begin
    PlanDataDelCB.enabled := False;
    PlanDeleteBtn.enabled := False;
  end
  else begin
    while LDate >= DataModuleClient.DepartmentsFirstPlandate.value do
      begin
      PlanDataDelCB.Properties.items.add(FormatDateTime('dd-mmm-yyyy', Ldate));
      Dec(y);
      Ldate := encodedate(Y - 1, 12, 31);
      end;    // while
    PlanDataDelCB.ItemIndex := 0;
    DataModuleClient.PlanDel.Active := True;
  end;

  decodedate(DataModuleClient.DepartmentsCurrentMonitoringStart.value, y, m, d);
  Ldate := encodedate(Y - 1, 12, 31);
  if Ldate <= DataModuleClient.DepartmentsFirstMonitoringdate.value then
    begin
    MonitorDataDelCB.enabled := False;
    MonitorDeleteBtn.enabled := False;
    end
  else
    begin
    while LDate >= DataModuleClient.DepartmentsFirstPlandate.value do
      begin
      PlanDataDelCB.Properties.items.add(FormatDateTime('dd-mmm-yyyy', Ldate));
      Dec(y);
      Ldate := encodedate(Y - 1, 12, 31);
      end;    // while
    MonitorDataDelCB.ItemIndex := 0;
    DataModuleClient.MonitorDel.Active := True;
    end;
  DataModuleClient.InvQuoteLU.Active := True;
end;

procedure TDBMaintF.PlanDeleteBtnClick(Sender: TObject);
var
  I : integer;
  y : word;
  pstr : array[0..200] of char;
  tmpstr : string;
  ldate, l1date : TdateTime;
begin
  tmpstr := PlanDataDelCb.text;
	Y := strtoint(AnsiReplaceText(tmpstr, '31-Dec-', ''));
  I := Application.MessageBox(strPcopy(pstr, 'Do you wish to delete all Plan Data before ' + PlanDataDelCB.text), 'Confirmation', MB_YESNOCANCEL + MB_ICONQUESTION);
	if I = IDOK then
    begin
    DataModuleClient.PlanDel.First;
    while DataModuleClient.PlanDel.eof = False do
      begin
      if DataModuleClient.PlandelD_Year.value = Y then
        DataModuleClient.PlanDel.Delete
      else
        DataModuleClient.Plandel.next;
      end;
    // now delete any planning invoices before 31/12/Y
    l1date := encodedate(Y, 12, 31);
    ldate := encodedate(1990, 1, 1); // a start date for deletion
    DataModuleClient.setinvoiceFilter(Integer(PlanInv), ldate, l1date);
    DatamoduleClient.ActualInvoiceDetails.First;
    while DatamoduleClient.ActualInvoiceDetails.eof = False do
      DatamoduleClient.ActualInvoiceDetails.delete;
    // Update firstplandate to 1/1/Y + 1
    DatamoduleClient.departments.Edit;
    DataModuleClient.DepartmentsFirstPlanDate.value := encodedate(y + 1, 1, 1);
    DataModuleClient.Departments.post;
    end;
end;

procedure TDBMaintF.MonitorDeleteBtnClick(Sender: TObject);
var
  I : integer;
  y : word;
  pstr : array[0..200] of char;
  tmpstr : string;
  ldate, l1date : TdateTime;
begin
  tmpstr := MonitorDataDelCb.text;
  Y := strtoint(AnsiReplaceText(tmpstr, '31-Dec-', ''));
  I := Application.MessageBox(strPcopy(pstr, 'Do you wish to delete all Monitor Data before ' + MonitorDataDelCB.text), 'Confirmation', MB_YESNOCANCEL + MB_ICONQUESTION);
  if I = IDOK then
    begin
    DataModuleClient.MonitorDel.First;
    while DataModuleClient.MonitorDel.eof = False do
      begin
      if DataModuleClient.MonitordelD_Year.value = Y then
        DataModuleClient.MonitorDel.Delete
      else
        DataModuleClient.Monitordel.next;
      end;
    // now delete any planning invoices before 31/12/Y
    l1date := encodedate(Y, 12, 31);
    ldate := encodedate(1990, 1, 1); // a start date for deletion
    DataModuleClient.setinvoiceFilter(Integer(MonitorInv), ldate, l1date);
    DatamoduleClient.ActualInvoiceDetails.First;
    while DatamoduleClient.ActualInvoiceDetails.eof = False do
      DatamoduleClient.ActualInvoiceDetails.delete;
    // Update firstMonitoringDate to 1/1/Y + 1
    DatamoduleClient.departments.Edit;
    DataModuleClient.DepartmentsFirstMonitoringDate.value := encodedate(y + 1, 1, 1);
    DataModuleClient.Departments.post;
    end;
end;

procedure TDBMaintF.QuotesDeleteBtnClick(Sender: TObject);
var
  I : integer;
  lDateStr : string;
  pstr : array[0..200] of char;
  QuoteComplete, AllinvOK, QuoteDelete : Boolean;
begin
  if QuoteDelDate.Date >= DataModuleClient.DepartmentsCurrentMonitoringStart.value then
    begin
    messagedlg('Can not delete Quotes within Current Monitoring period.', mtConfirmation, [mbOK], 0);
    exit;
    end;
  lDateStr := FormatDateTime('dd-mmm-yyyy', QuoteDelDate.Date);
  I := Application.MessageBox(strPcopy(pstr, 'Do you wish to delete all Completed Quotes before ' + LDateStr), 'Confirmation', MB_YESNOCANCEL + MB_ICONQUESTION);
  if I = idOK then
    begin
    DataModuleClient.QuotesLU.Active := False;
    // Apply a filter to
    DataModuleClient.QuotesLU.Filter := 'Dept_ID = '+ inttostr(DataModuleClient.DepartmentsDept_id.value);
    DataModuleClient.QuotesLU.Filtered := True;
    DataModuleClient.QuotesLU.Active := True;
    DataModuleClient.quotesLU.First;
    while DataModuleClient.quotesLU.eof = False do
      begin
      QuoteDelete := False;
      if (DataModuleClient.QuotesLUQ_Date.value <= QuoteDelDate.Date) then
        begin
        DataModuleClient.InvQuoteLU.First;
        QuoteComplete := False;
        AllInvOK := True;
        while DataModuleClient.InvQuoteLU.eof = False do
          begin
          if DataModuleClient.invquoteLUOrderComplete.value <> 0 then
            QuoteComplete := True;
          if DataModuleClient.InvQuoteLUInv_Date.Value > QuoteDelDate.Date then
            AllInvOK := False;
          DataModuleClient.InvQuoteLU.Next;
          end;    // while
        if (QuoteComplete) and (AllInvOK) then
          begin
          DataModuleClient.InvQuoteLU.First;
          while DataModuleClient.InvQuoteLU.eof = False do
            DataModuleClient.InvQuoteLU.delete;
          QuoteDelete := True;
          end;
        end;
      if QuoteDelete then
         DataModuleClient.QuotesLU.Delete
      else
        DataModuleClient.QuotesLU.next;
      end;    // while
    end;
end;

procedure TDBMaintF.CloseBtnClick(Sender: TObject);
begin
  with DataModuleClient do
    begin
    PlanDel.Active := False;
    MonitorDel.Active := False;
    InvQuoteLU.Active := False;
    // Close and then open the following tables to refresh
    ActualData.Active := False;
    ActualData.Active := True;
    PlanData.active := False;
    PlanData.active := True;
    Quotes.Active := False;
    Quotes.Active := True;
    QuotesLU.Active := False;
    // Apply a filter to
    QuotesLU.Filter := '';
    QuotesLU.Filtered := False;
    QuotesLU.Active := True;
    InvoiceLU.Active := False;
    InvoiceLU.Active := True;
    InvoiceLU2.Active := False;
    InvoiceLU2.Active := True;
    end;    // with
  Modalresult := mrOK;
end;



end.
