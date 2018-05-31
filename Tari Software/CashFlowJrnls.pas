unit CashFlowJrnls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMClient, DMrep1U, LGlobals, StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, CxCustomData, cxDataStorage,
  cxCalendar, EasyJournal, cxDBLabel, cxDBEdit, ExtCtrls, DB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxFilter, cxData, cxDBData,
  cxMemo, cxCheckBox, cxDBLookupComboBox, cxCurrencyEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

Const
    NUM_EASY_JOURNALS = 22;

type

  TCashFlowJrnlsF = class(TForm)
    CloseBtn: TcxButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    EasyJournalCB: TcxComboBox;
    GLJournals: TcxGridLevel;
    JrnlEntriesGrid: TcxGrid;
    cxLabel1: TcxLabel;
    cxTVJournals: TcxGridDBTableView;
    cxTVJournalsDEPT_ID: TcxGridDBColumn;
    cxTVJournalsJNL_NO: TcxGridDBColumn;
    cxTVJournalsJNL_DATE: TcxGridDBColumn;
    cxTVJournalsJNL_NOTE: TcxGridDBColumn;
    cxTVJournalsNON_CASH: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntries: TcxGridDBTableView;
    JrnlEntriesGridDBTVJrnlEntriesJNL_NO: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntriesJNL_INDEX: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntriesACCOUNT_NO: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntriesLINE_NOTE: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntriesDR_AMOUNT: TcxGridDBColumn;
    JrnlEntriesGridDBTVJrnlEntriesCR_AMOUNT: TcxGridDBColumn;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxButton2: TcxButton;
    cxLabel6: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EasyJournalCBPropertiesCloseUp(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure JrnlEntriesGridEnter(Sender: TObject);
  private
    { Private declarations }
//    NextJEID : Integer;
//    LastCreated : integer;
    SavingEntries : Boolean;
  public
    { Public declarations }
  end;


var
  CashFlowJrnlsF: TCashFlowJrnlsF;
  EasyJrnl: array [0..(NUM_EASY_JOURNALS - 1), 0..2] of string =
        (('Injection of Capital','1200','1490'),
        ('Withdrawal of Capital','1490','1200'),
        ('Purchase of Intangible Asset','1320','1200'),
        ('Purchase of Non Depreciating Asset','1300','1200'),
        ('Purchase of Depreciating Asset','1310','1200'),
        ('Purchase of Stock On Hand','1230','1200'),
        ('Transfer to Cash Management Fund','1240','1200'),
        ('Investment in Marketable Securities','1250','1200'),
        ('Payment of Income Tax','1440','1200'),
        ('Payment of Dividend or Drawings','1450','1200'),
        ('Payment of Other Liabilitles','1460','1200'),
        ('Purchase of Other Current Assets','1260','1200'),
        ('Repayment of Loan','1480','1200'),
        ('Receipt of Loan Repayment - Other Assets','1200','1260'),
        ('Withdrawal from Cash Management Fund','1200','1240'),
        ('Sale of Marketable Securities','1200','1250'),
        ('Sale of Non Depreciating Asset','1200','1300'),
        ('Sale of Depreciating Asset','1200','1310'),
        ('Sale of Intangible Asset','1200','1320'),
        ('Raising of Income Tax Liability','1490','1440'),
        ('Loan Receipt', '1200','1480'),
        ('Declaring of Dividend','1490','1450'));

implementation

{$R *.dfm}


procedure TCashFlowJrnlsF.FormCreate(Sender: TObject);
var
  I: Integer;
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  SavingEntries := True;
// Set up the Journals for the current period by filtering
  DatamoduleClient.SetJournalFilter(DataModuleClient.CashFlowDeptDEPT_ID.Value, DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value, DatamoduleClient.CashFlowDeptCURRENTPLANEND.Value);
//  cxTvJournals.DataController.Refresh;
  DataModuleClient.JournalTbl.Last;
  DataModuleClient.lastJrnlDate := DataModuleClient.JournalTblJNL_DATE.Value;
  DataModuleClient.JournalTbl.First;
  TcxDateEditProperties(cxTVJournalsJNL_DATE.Properties).MinDate := DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value;
  TcxDateEditProperties(cxTVJournalsJNL_DATE.Properties).MaxDate := DataModuleClient.CashFlowDeptCURRENTPLANEND.Value;
  DataModuleClient.JournalInit := True;
  if DataModuleClient.JournalTbl.RecordCount = 0 then
    DataModuleClient.JournalTbl.Insert;
  for I := 0 to NUM_EASY_JOURNALS - 1 do    // Iterate
    EasyJournalCB.Properties.Items.Add(easyJrnl[I, 0]);
end;

procedure TCashFlowJrnlsF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCashFlowJrnlsF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  BalanceOK : Boolean;
  DRTotal, CRTotal : Currency;
begin
  BalanceOK := True; // be positive to start with!
  DataModuleClient.JournalTbl.CommitUpdates;
  DataModuleClient.JournalInit := False;
  if DataModuleClient.DSJournals.State in [dsinsert] then
    DataModuleClient.JournalTbl.Cancel;
  if DataModuleClient.JournalTbl.RecordCount > 0 then
    begin
    DataModuleClient.JournalTbl.First;
    while BalanceOK and (DataModuleClient.JournalTbl.Eof = False) do
      begin
      DRTotal := 0;
      CrTotal := 0;
      if DataModuleClient.JrnlEntries.RecordCount > 0 then
        begin
        DataModuleClient.JrnlEntries.First;
        while (DataModuleClient.JrnlEntries.eof = False) do
          begin
          DrTotal := DrTotal + DataModuleClient.JrnlEntriesDR_AMOUNT.Value;
          CrTotal := CrTotal + DataModuleClient.JrnlEntriesCR_AMOUNT.Value;
          DataModuleClient.JrnlEntries.Next;
          end;    // while
        end;
      if DrTotal <> CrTotal then
        begin
        BalanceOK := False;
        messagedlg('This journal does not balance.' + #13#10 + 'Please make the DR and CR totals the same.', MtWarning, [mbOk], 0);
        end
      else
        DataModuleClient.JournalTbl.Next;
      end;    // while
    end;
  CanClose := BalanceOK;
end;

procedure TCashFlowJrnlsF.EasyJournalCBPropertiesCloseUp(Sender: TObject);
var
  DoRepeat : Boolean;
  MonthCount : Integer;
  Jnumber : integer;
  JDate : TDateTime;
begin
// here is ask for the date amount and if the journal is repeating each month based on the date
// need a form with public property for these
  if EasyJournalCB.ItemIndex < 0 then Exit;
  if DataModuleClient.LastJrnlDate < DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value then
    DataModuleClient.LastJrnlDate := DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value;
  Application.CreateForm(TEasyJournalF, EasyJournalF);
  EasyJournalF.JrnlDateEdit.Date := DataModuleClient.LastJrnlDate;
  EasyJournalF.JrnlAmountEdit.Value := 0;
  EasyJournalF.JrnlName.text := easyJrnl[EasyJournalCB.ItemIndex, 0];
  If EasyJournalF.ShowModal = mrOK then
    DoRepeat := True // set for the first journal at least
  else
    DoRepeat := False;
  MonthCount := 1;
	JDate := EasyJournalF.JrnlDateEdit.Date;
  while DoRepeat and (Jdate <= DataModuleClient.CashFlowDeptCURRENTPLANEnd.Value) do
    begin
    if not (DATAMODULECLIENT.DSJournals.State in [dsInsert]) then
      DataModuleClient.JournalTbl.Insert;
    DataModuleClient.JournalTblDEPT_ID.Value := DataModuleClient.CashFlowDeptDEPT_ID.Value;
    DataModuleClient.JournalTblJNL_NO.Value := DataModuleClient.JournalTbl.GeneratorValue('GEN_JOURNAL_ID', 1);
    Jnumber := DataModuleClient.JournalTblJNL_NO.Value;
    DataModuleClient.JournalTblNON_CASH.Value := 0;
    DataModuleClient.JournalTblJNL_DATE.Value := JDate;
    DataModuleClient.JournalTblJNL_NOTE.AsString := EasyJournalF.JrnlName.text;
    DataModuleClient.JournalTbl.Post;
    DataModuleClient.JrnlEntries.Insert;
    DataModuleClient.JrnlEntriesJNL_NO.Value := jnumber;
    DataModuleClient.JrnlEntriesACCOUNT_NO.Value := strtoint(easyJrnl[EasyJournalCB.ItemIndex, 1]);
    DataModuleClient.JrnlEntriesDR_AMOUNT.Value := EasyJournalF.JrnlAmountEdit.value;
    DataModuleClient.JrnlEntriesCR_AMOUNT.Value := 0;
    DataModuleClient.JrnlEntries.Post;
    DataModuleClient.JrnlEntries.Insert;
    DataModuleClient.JrnlEntriesJNL_NO.Value := jnumber;
    DataModuleClient.JrnlEntriesACCOUNT_NO.Value := strtoint(easyJrnl[EasyJournalCB.ItemIndex, 2]);
    DataModuleClient.JrnlEntriesDR_AMOUNT.Value := 0;
    DataModuleClient.JrnlEntriesCR_AMOUNT.Value := EasyJournalF.JrnlAmountEdit.Value;
    DataModuleClient.JrnlEntries.Post;
    Dorepeat := EasyJournalF.JrnlRepeatCB.Checked;
    if DoRepeat then
      JDate := IncMonth(EasyJournalF.JrnlDateEdit.Date, MonthCount);
    inc(MonthCount);
    end;    // while
  EasyJournalF.Free;
end;

procedure TCashFlowJrnlsF.cxButton2Click(Sender: TObject);
begin
  cxGrid1.BeginUpdate;
  DATAMODULECLIENT.JournalInit := False;
  DataModuleClient.JournalTbl.Delete;
  DATAMODULECLIENT.JournalInit := True;
  cxGrid1.EndUpdate;
end;

procedure TCashFlowJrnlsF.cxGrid1Exit(Sender: TObject);
begin
  if DataMODULECLIENT.DSJournals.State in [dsInsert, dsEdit] then
    begin
    if DataModuleClient.JournalTblJNL_NO.IsNull then
      DataModuleClient.JournalTblJNL_NO.Value := DataModuleClient.JournalTbl.GeneratorValue('GEN_JOURNAL_ID', 1);
    if DataModuleClient.JournalTblJNL_DATE.Value < DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value then
      DataModuleClient.JournalTblJNL_DATE.Value := DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value;
    if DataModuleClient.JournalTblJNL_DATE.Value > DataModuleClient.CashFlowDeptCURRENTPLANEND.Value then
      DataModuleClient.JournalTblJNL_DATE.Value := DataModuleClient.CashFlowDeptCURRENTPLANEND.Value;
    DATAMODULECLIENT.JournalTbl.Post;
    end;
end;

procedure TCashFlowJrnlsF.JrnlEntriesGridEnter(Sender: TObject);
begin
  if not (DATAMODULECLIENT.DSJournalEntries.state in [dsInsert, dsEdit]) then
    DATAMODULECLIENT.JrnlEntries.Insert;    
end;

end.
