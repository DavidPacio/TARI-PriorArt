unit MYOBMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMMYOB, StdCtrls, dateutils, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Grids,
  DBGrids, DBTables;

type
  TMyobMainF = class(TForm)
    ChartofAccountLoadsBtn: TButton;
    LoadTrialBalanceBtn: TButton;
    CreateTBBtn: TButton;
    ComboBox1: TComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure ChartofAccountLoadsBtnClick(Sender: TObject);
    procedure LoadTrialBalanceBtnClick(Sender: TObject);
    procedure CreateTBBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetMYOBAccountClasses;
    procedure GetMYOBAccountSubClasses;
    function PeriodIDToDate(P_ID: Integer): TDateTime;
    function DateToPeriodID(P_Date: TDateTime): Integer;
  public
    { Public declarations }
  end;

var
  MyobMainF: TMyobMainF;

implementation

{$R *.dfm}

procedure TMyobMainF.ChartofAccountLoadsBtnClick(Sender: TObject);
begin
// Start MYOB Query
// transverse the dataset, adding if not found and changing the title - always
  GetMYOBAccountClasses;
  GetMYOBAccountSubClasses;
  DMMYOBData.QryMyobAccounts.Active := True;
  DMMYOBData.QryMyobAccounts.First;
  while DMMYOBData.QryMyobAccounts.Eof = false do
    begin
    if DMMYOBData.FB_Myob_Accounts.Locate('ACCOUNT_ID', DMMYOBData.qrymyobaccountsAccountid.asvariant, [] ) then
      DMMYOBData.FB_Myob_Accounts.edit
    else
      begin
      DMMYOBData.FB_Myob_Accounts.Insert;
      DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value := DMMYOBData.qrymyobaccountsAccountid.Value;
      end;
    DMMYOBData.FB_Myob_AccountsACCOUNT_NUMBER.Value := DMMYOBData.QryMyobAccountsAccountNumber.Value;
    if DMMYOBData.FB_AccountClass.Locate('MYOB_CLASS', DMMYOBData.QryMyobAccountsAccountClassificationID.AsVariant, []) then
      DMMYOBData.FB_Myob_AccountsACCOUNT_CLASS.value := DMMYOBData.FB_AccountClassCLASS_ID.Value;
    if DMMYOBData.FB_AccSubClass.Locate('MYOB_SUBCLASS', DMMYOBData.QryMyobAccountsSubAccountClassificationID.AsVariant, []) then
      DMMYOBData.FB_Myob_AccountsACCOUNT_SUBCLASS.Value := DMMYOBData.FB_AccSubClassSUBCLASS_ID.Value;
    DMMYOBData.FB_Myob_AccountsACCOUNT_TITLE.Value := DMMYOBData.QryMyobAccountsAccountName.Value;
    DMMYOBData.FB_Myob_Accounts.Post;
    DMMYOBData.QryMyobAccounts.Next;
    end;    // while
end;

procedure TMyobMainF.GetMYOBAccountClasses;
begin
//
  if not DMMYOBData.MYOB_AccClass.Active then
    DMMYOBData.MYOB_AccClass.Active := True;
  DMMYOBData.MYOB_AccClass.First;
  while DMMYOBData.MYOB_AccClass.Eof = False do
    begin
    if DMMYOBData.FB_AccountClass.Locate('MYOB_CLASS', DMMYOBData.MYOB_AccClassAccountClassificationID.AsVariant, []) then
      DMMYOBData.FB_AccountClass.Edit
    else
      begin
      DMMYOBData.FB_AccountClass.Insert;
      DMMYOBData.FB_AccountClassMYOB_CLASS.Value := DMMYOBData.MYOB_AccClassAccountClassificationID.Value;
      end;
    DMMYOBData.FB_AccountClassCLASS_NAME.Value := DMMYOBData.MYOB_AccClassDescription.Value;
    DMMYOBData.FB_AccountClass.Post;
    DMMYOBData.MYOB_AccClass.Next;
    end;    // while
end;

procedure TMyobMainF.GetMYOBAccountSubClasses;
begin
//
  if not DMMYOBData.MYOB_AccSubClass.Active then
    DMMYOBData.MYOB_AccSubClass.Active := True;
  DMMYOBData.MYOB_AccSubClass.First;
  while DMMYOBData.MYOB_AccSubClass.Eof = False do
    begin
    if DMMYOBData.FB_AccSubClass.Locate('MYOB_SUBCLASS', DMMYOBData.MYOB_AccSubClassSubAccountTypeID.AsVariant, []) then
      DMMYOBData.FB_AccSubClass.Edit
    else
      begin
      DMMYOBData.FB_AccSubClass.Insert;
      DMMYOBData.FB_AccSubClassMYOB_SUBCLASS.Value := DMMYOBData.MYOB_AccSubClassSubAccountTypeID.Value;
      end;
    DMMYOBData.FB_AccSubClassSUBCLASS_NAME.Value := DMMYOBData.MYOB_AccSubClassDescription.Value;
    DMMYOBData.FB_AccSubClass.Post;
    DMMYOBData.MYOB_AccSubClass.Next;
    end;    // while
end;

procedure TMyobMainF.LoadTrialBalanceBtnClick(Sender: TObject);
var
  CurrentPE : TDateTime;
  d, m, y : word;
  AccBalances : TDetailedBalArray;
  Period_ID : Integer;
  First_Period, Last_Period : integer;
  First_date, Last_Date : TDateTime;
  Acc_Sign : Currency;
begin
// First set MYOB Info From MYOB DataFile
  y := DMMYOBData.TblMYOB_DataCurrentFinancialYear.Value;
  m := DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value;
  D := DaysInAMonth(Y, m);
  CurrentPE := encodeDate(y, m, d);
  First_Period := 400;
  Last_Period := 0;
  DMMYOBData.FB_MYOB_Info.Edit;
  DMMYOBData.FB_MYOB_InfoTB_DATE.Value := CurrentPE;
  DMMYOBData.FB_MYOB_InfoYEAR_PERIODS.Value := DMMYOBData.TblMYOB_DataPeriodsPerYear.Value;
  DMMYOBData.FB_MYOB_Info.Post;
  DMMYOBData.MYOB_Acc_Activities.Active := False;
  DMMYOBData.MYOB_Acc_Activities.Filtered := True;
  DMMYOBData.QryMyobAccounts.Active := True;
  DMMYOBData.FB_Myob_Accounts.First;
  while DMMYOBData.FB_Myob_Accounts.Eof = false do
    begin
    // Transverse MYOB Account and set filter on AccountActivities
    if DMMYOBData.QryMyobAccounts.Locate('AccountID', DMMYOBData.FB_Myob_AccountsACCOUNT_ID.AsVariant, []) then
      begin
      Acc_Sign := 1;
      if DMMYOBData.QryMyobAccountsIsCreditBalance.Value = 'Y' then
        Acc_Sign := -1;
      DMMYOBData.MYOB_Acc_Activities.Active := False;
      DMMYOBData.MYOB_Acc_Activities.Filter := 'AccountID=' + DMMYOBData.FB_Myob_AccountsACCOUNT_ID.AsString;
      DMMYOBData.MYOB_Acc_Activities.Active := True;
      FillChar(AccBalances, sizeof(TDetailedBalArray), #0);
      // Transverse Account Activities and set 25 year array up
      DMMYOBData.MYOB_Acc_Activities.First;
      while DMMYOBData.MYOB_Acc_Activities.Eof = False do
        begin
        // Base year is 2000

        if (DMMYOBData.MYOB_Acc_ActivitiesFinancialYear.Value >= 2000) and (DMMYOBData.MYOB_Acc_ActivitiesFinancialYear.Value <= 2024) then
          begin
          Period_ID := (DMMYOBData.MYOB_Acc_ActivitiesFinancialYear.Value - 2000) * 13 + DMMYOBData.MYOB_Acc_ActivitiesPeriod.Value - 1;
          if DMMYOBData.MYOB_Acc_ActivitiesAmount.Value <> 0 then
            begin
            AccBalances[Period_ID] := DMMYOBData.MYOB_Acc_ActivitiesAmount.Value * Acc_Sign;
            if Period_ID < First_Period then
              First_Period := Period_ID;
            if Period_ID > Last_Period then
              Last_Period := Period_ID;
            end;
          end;
        DMMYOBData.MYOB_Acc_Activities.Next;
        end;    // while
      // Get Trial Balance Amount and save
      // Decide if we are inserting or editing
      if DMMYOBData.FB_Account_Bals.Locate('Account_ID', DMMYOBData.FB_Myob_AccountsACCOUNT_ID.AsVariant, []) then
        DMMYOBData.FB_Account_Bals.Edit
      else
        Begin
        DMMYOBData.FB_Account_Bals.Insert;
        DMMYOBData.FB_Account_BalsAccount_ID.Value := DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value;
        end;
      DMMYOBData.FB_Account_BalsBASE_BALANCE.Value := DMMYOBData.QryMyobAccountsThisYearOpeningBalance.Value * Acc_Sign;
      DMMYOBData.FB_Account_Bals.Post;
      DMMYOBData.setBalances(AccBalances, DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value);
      end;
    DMMYOBData.FB_Myob_Accounts.Next;
    end;    // whilei
  // update first and last period info
  First_date := PeriodIDToDate(First_Period);
  Last_date := PeriodIDToDate(Last_Period);
  DMMYOBData.FB_MYOB_Info.Edit;
  DMMYOBData.FB_MYOB_InfoFIRST_PERIOD.Value := First_Date;
  DMMYOBData.FB_MYOB_InfoLAST_PERIOD.Value := LAST_date;
  DMMYOBData.FB_MYOB_Info.Post;
end;

function TMyobMainF.PeriodIDToDate(P_ID: Integer): TDateTime;
var
  d, m, y : word;
begin
  y := trunc(P_ID/13) + 2000;
  m := P_ID mod 13 + 1;
  if m > 12 then
    M := 12;
  If  M <= DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value then
    begin
    M := M + DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value;
    Y := Y - 1;
    end
  else
    M := M - DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value;
  D := DaysInAMonth(Y, m);
  Result := encodeDate(y, m, d);
end;

function TMyobMainF.DateTOPeriodID(P_Date: TDateTime): Integer;
var
  d, m, y : word;
begin
  DecodeDate(P_Date, y, m, d);
  If  M <= DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value then
    M := M + DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value
  else
    begin
    M := M - DMMYOBData.TblMYOB_DataLastMonthInFinancialYear.Value;
    Y := Y + 1;
    end;
  // If we are selecting the last period date, we must include the 13th period.
  if M = 12 then
    M := 13;
  Result := (Y - 2000) * 13 + M - 1;
end;

procedure TMyobMainF.CreateTBBtnClick(Sender: TObject);
var
  I: Integer;
  First_Period, Last_Period, Current_Period : Integer;
  Acc_Balance, TB_Balance : Currency;
  Acc_Sign : Currency;
  AccBalances : TDetailedBalArray;
begin
  // check for periods in the year and selected date, if mismatch complain and exit
  First_Period := 52;
  Last_Period := 64;
  Current_Period := (DMMYOBData.TblMYOB_DataCurrentFinancialYear.Value - 2000) * 13 - 1;
  // Clear current TB from table.

  DMMYOBData.SP_Delete_TB.ExecProc;

  // transverse MYOB accounts
  DMMYOBData.QryMyobAccounts.Active := True;
  TB_Balance := 0;
  DMMYOBData.FB_Myob_Accounts.First;
  while DMMYOBData.FB_Myob_Accounts.Eof = false do
    begin
    Acc_Balance := 0;
    // for Balance sheet accounts, Calculate balance at selected date
    // for PNL, accumulate for the 13 period before balance date.
    if (DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value <> DMMYOBData.FB_MYOB_InfoRE_ACCOUNT.Value) AND(DMMYOBData.QryMyobAccounts.Locate('AccountID', DMMYOBData.FB_Myob_AccountsACCOUNT_ID.AsVariant, [])) then
      begin
      Acc_Sign := 1;
      Acc_Balance := 0;
      if DMMYOBData.QryMyobAccountsIsCreditBalance.Value = 'Y' then
        Acc_Sign := -1;
      // if BS account
      DMMYOBData.getBalances(AccBalances, DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value);
      if (DMMYOBData.FB_AccountClassMYOB_CLASS.Value = 'A') or (DMMYOBData.FB_AccountClassMYOB_CLASS.Value = 'L') or (DMMYOBData.FB_AccountClassMYOB_CLASS.Value = 'EQ')then
        begin
        // Find Accumulation of activities from Last_period to Current Period and subtract from current balance
        if Last_Period <= Current_Period then
          for I := Last_Period to Current_Period do    // Iterate
            Acc_Balance := Acc_Balance + AccBalances[I]
        else
          for I := Current_Period to Last_Period do    // Iterate
            Acc_Balance := Acc_Balance + AccBalances[I];
        Acc_Balance := Acc_Balance + DMMYOBData.FB_Account_BalsBASE_BALANCE.Value;
        end
      else
        begin
        for I := First_Period to Last_Period do    // Iterate
          Acc_Balance := Acc_Balance + AccBalances[I];
        end;
     // Get Trial Balance Amount and save
      if Acc_Balance <> 0 then
        begin
        DMMYOBData.FB_MYOB_TB.Insert;
        DMMYOBData.FB_MYOB_TBPERIOD_END.Value := PeriodIDtoDate(Last_Period);
        DMMYOBData.FB_MYOB_TBMYOB_ACCOUNT.Value := DMMYOBData.FB_Myob_AccountsACCOUNT_ID.Value;
        DMMYOBData.FB_MYOB_TBAMOUNT.Value := Acc_Balance;
        TB_Balance := TB_Balance + Acc_Balance;
        DMMYOBData.FB_MYOB_TB.Post;
        end;
      end;
    DMMYOBData.FB_Myob_Accounts.Next;
    end;    // while
  if TB_Balance <> 0 then
    begin
    DMMYOBData.FB_MYOB_TB.Insert;
    DMMYOBData.FB_MYOB_TBPERIOD_END.Value := PeriodIDtoDate(Last_Period);
    DMMYOBData.FB_MYOB_TBMYOB_ACCOUNT.Value := DMMYOBData.FB_MYOB_InfoRE_ACCOUNT.Value;
    DMMYOBData.FB_MYOB_TBAMOUNT.Value := TB_Balance * -1;
    DMMYOBData.FB_MYOB_TB.Post;
    end;
end;

procedure TMyobMainF.FormShow(Sender: TObject);
//var
//  MyStringList : TStringList;
begin
//  MyStringList := TStringList.Create;
//  try
//    Session.GetDriverParams('MYOB_ODBC', MyStringList);
//  { fill a list box with parameter names for the user to select from }
//  ListBox1.Items := MyStringList;
//  finally
//    MyStringList.Free;
//  end;

//  DMMYOBData.FB_MYOBTARIDB.Connect;
  // create PERIOD END Date List.
  if DMMYOBData.FB_MYOB_InfoRE_ACCOUNT.isnull then
    begin
    DMMYOBData.FB_MYOB_Info.Insert;
    DMMYOBData.FB_MYOB_InfoRE_ACCOUNT.value := 24;
    DMMYOBData.FB_MYOB_Info.Post;
    end;
end;

procedure TMyobMainF.Button1Click(Sender: TObject);
begin
// Set the Params and Open the Query
  DMMYOBData.qrymyobSaleslines.Active := False;
  DMMYOBData.qrymyobSaleslines.ParamByName('STARTDATE').AsString := '06/01/2006';
  DMMYOBData.qrymyobSaleslines.ParamByName('ENDDATE').AsString := '06/30/2006';
  DMMYOBData.qrymyobSaleslines.Active := True;

end;

initialization
  Application.CreateForm(TDMMYOBData, DMMYOBData);
  if NOT DMMYOBData.MYOB_ODCB_DB.Connected then
    DMMYOBData.MYOB_ODCB_DB.Connected := True;
  DMMYOBData.FB_MYOBTARIDB.Connect;
end.
