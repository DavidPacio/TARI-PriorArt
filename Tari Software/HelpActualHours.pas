unit HelpActualHours;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, EPStdCmp, Buttons, ExtCtrls, fcButton,
  fcImgBtn, fcShapeBtn, Invoices, auchtypes;

type
  THelpActualHoursF = class(TForm)
    EPRichEdit1: TEPRichEdit;
    GetInvoicesBtn: TfcShapeBtn;
    GetWorkBackBtn: TfcShapeBtn;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure GetInvoicesBtnClick(Sender: TObject);
    procedure GetWorkBackBtnClick(Sender: TObject);
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
  HelpActualHoursF: THelpActualHoursF;
  HelpInvoiceRate : Currency;
  HelpWBRate : Currency;
  HelpActualReturn : THelpHoursType;
  UnitDescSing, UnitDescPlur : string;

implementation

uses DMClient, Workback;

{$R *.DFM}

procedure THelpActualHoursF.FormCreate(Sender: TObject);
begin
HelpInvoiceRate := 0;
HelpWBRate := 0;
end;

procedure THelpActualHoursF.GetInvoicesBtnClick(Sender: TObject);
begin
  LocalInvType := AnalysisInv;
  HelpActualReturn := HTInvoices;
  LocalStartDate := DataModuleClient.DateRangersStartDate.Value;
  LocalEndDate := DataModuleClient.DateRangersEndDate.Value;
  Application.CreateForm(TInvoicesF, InvoicesF);
  InvoicesF.setUnitsDesc(UnitDescSing, UnitDescPlur);
  InvoicesF.ShowModal;
  if InvoiceRate > 0 then
    HelpInvoiceRate := InvoiceRate;
  InvoicesF.Release;
  close;
end;

procedure THelpActualHoursF.GetWorkBackBtnClick(Sender: TObject);
begin
  HelpActualReturn := HTWorkback;
  Application.CreateForm(TWorkBackF, WorkBackF);
  WorkBackF.ShowModal;
  WorkBackF.release;
  close;
end;

end.
