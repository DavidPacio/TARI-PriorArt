unit TARIDataModule;

interface

uses
  SysUtils, Classes, DB, IBODataset, IB_Components, SCInterGlobals, SCDM,
  auchTypes, Variants, AMiscFunctions, IB_Process, IB_Script;

type
  TTARIDM = class(TDataModule)
    ClientDatabase: TIBODatabase;
    Departments: TIBOTable;
    DepartmentsREVENUE_GROUP_NAME: TStringField;
    DepartmentsCURRENCY: TStringField;
    DepartmentsLASTDAYOFWEEK: TSmallintField;
    DepartmentsCURRENTMONITORINGSTART: TDateField;
    DepartmentsCURRENTMONITORINGEND: TDateField;
    DepartmentsFIRSTMONITORINGDATE: TDateField;
    DepartmentsDEPT_ID: TIntegerField;
    DepartmentsREPORT_CODE1: TStringField;
    DepartmentsREPORT_CODE2: TStringField;
    DepartmentsLAST_MONITORED: TDateField;
    DepartmentsEXCLUDE_FROM_REPORTING: TSmallintField;
    DepartmentsSINGULAR_UNITDESC: TStringField;
    DepartmentsPLURAL_UNITDESC: TStringField;
    DepartmentsCURRENTPLANSTART: TDateField;
    DepartmentsCURRENTPLANEND: TDateField;
    DepartmentsCOPIEDFROM: TIntegerField;
    DepartmentsFIRSTPLANDATE: TDateField;
    DepartmentsLATESTPLANDATE: TDateField;
    DepartmentsLASTSUMMARYPERIOD: TIntegerField;
    DepartmentsINVGROUPNAME: TStringField;
    DepartmentsINVOICEPASSWORD: TStringField;
    MonitoringData: TIBOTable;
    MonitoringDataDEPT_ID: TIntegerField;
    MonitoringDataACCOUNT_NUMBER: TIntegerField;
    MonitoringDataD_YEAR: TIntegerField;
    MonitoringDataD_TYPE: TSmallintField;
    MonitoringDataD_BALS: TBlobField;
    DSDepartments: TDataSource;
    DSMonitoringData: TDataSource;
    Business_Details: TIBOTable;
    Business_DetailsBUSINESS_NAME: TStringField;
    MonitoringDataLU: TIBOTable;
    MonitoringDataLUDEPT_ID: TIntegerField;
    MonitoringDataLUACCOUNT_NUMBER: TIntegerField;
    MonitoringDataLUD_YEAR: TIntegerField;
    MonitoringDataLUD_TYPE: TSmallintField;
    MonitoringDataLUD_BALS: TBlobField;
    DepartmentServiceNameListing: TIBOQuery;
    DepartmentServiceNameListingDEPT_ID: TIntegerField;
    DepartmentServiceNameListingREVENUE_GROUP_NAME: TStringField;
    DSDeptServiceNames: TDataSource;
    DepartmentRetailNameListing: TIBOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DSDeptRetailNameS: TDataSource;
    Account_Mapping: TIBOTable;
    Account_MappingACCOUNT_NUMBER: TIntegerField;
    Account_MappingACCOUNT_TITLE: TStringField;
    Account_MappingACCOUNT_GROUP: TIntegerField;
    DSAccountMapping: TDataSource;
    QryFB_Expenses: TIB_Query;
    procedure ClientDatabaseAfterConnect(Sender: TIB_Connection);
    procedure ClientDatabaseBeforeConnect(Sender: TIB_Connection);
    procedure ClientDatabaseBeforeDisconnect(Sender: TIB_Connection);
  private
    { Private declarations }
    psdate, pedate : TDateTime;
    function getBalances(var Balances : array of currency; Accountno : integer): Boolean;
    function setBalances(var Balances : array of currency; Accountno : integer): Boolean;
    function getDeptBalances(var Balances : array of currency; DeptId : Integer; Accountno : integer): Boolean;
    procedure RoundArray(var balances: array of currency; startdate, enddate : double);
  public
    { Public declarations }
    CurrentDept_ID : Integer;
    ImportStartDate, ImportEndDate : TDateTime;
    procedure UpdateTariSaleTracking;
    procedure UPdateExpenses;
    procedure AttemptMapping;
    function MappingComplete: Boolean;
  end;

var
  TARIDM: TTARIDM;

implementation

{$R *.dfm}

procedure TTARIDM.ClientDatabaseAfterConnect(Sender: TIB_Connection);
begin
  Business_Details.Active := True;
  Departments.Active := True;
  MonitoringData.Active := True;
  MonitoringDataLU.Active := True;
  Account_Mapping.Active := TRue;
end;

procedure TTARIDM.AttemptMapping;
var
  varg : Variant;
begin
  DMInterface.FB_Tari_Mapping.First;
  while DMInterface.FB_Tari_Mapping.Eof = false do
    begin
    if DMInterface.FB_Tari_MappingTARI_ACCOUNT.IsNull then
      begin
      DMInterface.FB_Tari_Mapping.Edit;
      varg := DMInterface.FB_Tari_MappingSC_TITLE.Value;
      if Account_Mapping.Locate('ACCOUNT_TITLE', varg, []) then
        DMInterface.FB_Tari_MappingTARI_ACCOUNT.Value := Account_MappingACCOUNT_NUMBER.Value
      else
        DMInterface.FB_Tari_MappingTARI_ACCOUNT.Value := 980;
      DMInterface.FB_Tari_Mapping.Post;
      end;
    DMInterface.FB_Tari_Mapping.Next;
    end;    // while
end;

function TTARIDM.MappingComplete: Boolean;
begin
  result := True;
  // here we check that all SC Accounts are mapped to currently existing TARI Accounts
  DMInterface.MatchTemplate;
  AttemptMapping;
  DMInterface.FB_Tari_Mapping.First;
  while (DMInterface.FB_Tari_Mapping.Eof = false) and (Result = True) do
    begin
    if DMInterface.FB_Tari_MappingTARI_ACCOUNT.IsNull then
      Result := False
    else
      begin
      if Not Account_Mapping.Locate('ACCOUNT_NUMBER', DMInterface.FB_Tari_MappingTARI_ACCOUNT.AsVariant, []) then
        Result := False;
      end;
    DMInterface.FB_Tari_Mapping.Next;
    end;    // while
end;

procedure TTARIDM.ClientDatabaseBeforeConnect(Sender: TIB_Connection);
begin
  ClientDatabase.Server := GGlobals.Servers.CurrentServer.servername;
  ClientDatabase.Username := 'SYSDBA';
  ClientDatabase.Password := 'masterkey';
  ClientDatabase.SQLRole := 'FBMADMIN';
  ClientDatabase.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
end;

procedure TTARIDM.ClientDatabaseBeforeDisconnect(Sender: TIB_Connection);
begin
  Business_Details.Active := False;
  Departments.Active := False;
  MonitoringData.Active := False;
  MonitoringDataLU.Active := False;
end;

procedure TTARIDM.UPdateExpenses;
var
  index, ScAccount_Number, TariAccount_Number: integer;
  MonExpenses : TDetailedBalArray;
  MonTotalExpenses : TDetailedBalArray;
  varg, varg1 : Variant;
  AccountFound, NewAccount : Boolean;
begin
  varg := DMInterface.GetTARIServiceDept;
  CurrentDept_Id := DMInterface.GetTARIServiceDept;
  if Not Departments.locate('DEPT_ID', varg, []) then exit;
  psdate := DepartmentsCurrentMonitoringStart.value;
  pedate := DepartmentsCurrentMonitoringEnd.value;

  QryFB_Expenses.ParamByName('STARTDATE').Value := GGLobals.TARIStartDate;
  QryFB_Expenses.ParamByName('ENDDATE').Value := GGLobals.TARIEndDate;
  QryFB_Expenses.Active := True;
  if QryFB_Expenses.RecordCount < 1 then
    begin
    QryFB_Expenses.Active := false;
    exit;
    end;
    
 {
   The Process
   All MAPPED TARI Balances for the specified period must be zeroed
   Then we migrate through the transactions, ADDING any balances to the found accounts
  }
//

  getBalances(MonTotalExpenses, TOTALEXPENSES);
  DMInterface.qryFBTariMapped.active := True;
  DMInterface.qryFBTARIMapped.First;
  while DMInterface.qryFBTARIMapped.Eof = False do
    begin
    TariAccount_Number := DMInterface.qryFBTARIMapped.fieldbyname('TARI_ACCOUNT').value;
    if getBalances(MonExpenses, TariAccount_number) then
      begin
      for index := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value)
        to Trunc(GGlobals.TARIEndDate) - trunc(DepartmentsCurrentMonitoringStart.value) do
        begin
        MonTotalExpenses[index] := MonTotalExpenses[index] - MonExpenses[index];
        MonExpenses[index] := 0;
        end;
      SetBalances(MonExpenses, TariAccount_Number);
      end;
    DMInterface.qryFBTARIMapped.next;
    end;    // while
  DMInterface.qryFBTARIMapped.Active := False;
{
  Account_Mapping.First;
  while Account_Mapping.Eof = False do
    begin
    if getBalances(MonExpenses, Account_MappingACCOUNT_NUMBER.Value) then
      begin
      for index := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value)
        to Trunc(GGlobals.TARIEndDate) - trunc(DepartmentsCurrentMonitoringStart.value) do
        MonExpenses[index] := 0;
      SetBalances(MonExpenses, Account_MappingACCOUNT_NUMBER.Value);
      end;
    Account_Mapping.Next;
    end;


  // initialise TOTAL Expenses

  getBalances(MonTotalExpenses, TOTALEXPENSES);
  for index := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value)
     to Trunc(GGlobals.TARIEndDate) - trunc(DepartmentsCurrentMonitoringStart.value) do
     MonTotalExpenses[index] := 0;
}

  QryFB_Expenses.First;
  AccountFound := False;
  while AccountFound = False do
    begin
    ScAccount_Number := QryFB_Expenses.fieldByname('ACCOUNT_NO').Value;
    Varg1 := ScAccount_Number;
    if DMInterface.FB_Tari_Mapping.locate('SC_ACCOUNT_NO', varg1, []) then
      TariAccount_Number := DMInterface.FB_Tari_MappingTARI_ACCOUNT.Value
    else
      TariAccount_Number := TOTALOTHEREXPENSES;
    MonitoringDataLU.Refresh;
    getBalances(MonExpenses, TariAccount_Number);
    NewAccount := False;
    while NewAccount = False do
      begin
      Index := Trunc(QryFB_Expenses.fieldByname('TRANS_DATE').Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
      MonExpenses[index] := MonExpenses[Index] + QryFB_Expenses.fieldByname('ACC_AMT').Value;
      MonTotalExpenses[index] := MonTotalExpenses[Index] + QryFB_Expenses.fieldByname('ACC_AMT').Value;
      QryFB_Expenses.next;
      if (ScAccount_Number <> QryFB_Expenses.fieldByname('ACCOUNT_NO').Value) or (QryFB_Expenses.Eof = True) then
        NewAccount := True;
      end;    // while
    setBalances(MonExpenses, TariAccount_Number);
    if (QryFB_Expenses.Eof = True) then
      AccountFound := True;
    end;
  setBalances(MonTotalExpenses, TOTALEXPENSES);
end;

procedure TTARIDM.UpdateTariSaleTracking;
var
  I: Integer;
  index: integer;
  LastDate : TdateTime;
  MonSales : TDetailedBalArray;
  MonCOGS : TDetailedBalArray;
  MonGP : TDetailedBalArray;
  MonBILLED : TDetailedBalArray;
  MonPOTENTIAL : TDetailedBalArray;
  ltemp : array[0..3] of Currency;
  varg, varg1 : Variant;
begin
  varg := DMInterface.GetTARIServiceDept;
  CurrentDept_Id := DMInterface.GetTARIServiceDept;
  if Not Departments.locate('DEPT_ID', varg, []) then exit;
  psdate := DepartmentsCurrentMonitoringStart.value;
  pedate := DepartmentsCurrentMonitoringEnd.value;
  getBalances(MonSales, SALES);
  getBalances(MonCOGS, COGS);
  getBalances(MonGP, GROSSPROFIT);
  getBalances(MonBILLED, BILLED);
  getBalances(MonPOTENTIAL, POTENTIAL);
{  if not getBalances(MonSales, SALES) then exit;
  if not getBalances(MonCOGS, COGS) then exit;
  if not getBalances(MonGP, GROSSPROFIT) then exit;
  if not getBalances(MonBILLED, BILLED) then exit;
}
  // initialise Monitoring data to zero if any of the totals are <> 0
  DMInterface.FB_TARIServiceUPDATE.ParamByName('STARTDATE').Value := GGLobals.TARIStartDate;
  DMInterface.FB_TARIServiceUPDATE.ParamByName('ENDDATE').Value := GGLobals.TARIEndDate;
  DMInterface.FB_TARIServiceUPDATE.Active := True;
  DMInterface.FBStaffHoursbyDate.ParamByName('STARTDATE').Value := GGLobals.TARIStartDate;
  DMInterface.FBStaffHoursbyDate.ParamByName('ENDDATE').Value := GGLobals.TARIEndDate;
  DMInterface.FBStaffHoursbyDate.Active := True;
  // We look at activity for the last month to determine whether Logged hours are impored for a particular
  // staff member. If any service activity has been logged
  DMInterface.FBStaffReport.ParamByName('STARTDATE').Value := GGLobals.TARIStartDate;
  DMInterface.FBStaffReport.ParamByName('ENDDATE').Value := GGLobals.TARIEndDate;
  DMInterface.FBStaffReport.Active := True;
  DMInterface.FB_TARIRetailUPDATE.ParamByName('STARTDATE').Value := GGLobals.TARIStartDate;
  DMInterface.FB_TARIRetailUPDATE.ParamByName('ENDDATE').Value := GGLobals.TARIEndDate;
  DMInterface.FB_TARIRetailUPDATE.Active := True;
  for I := 0 to 3 do    // Iterate
    Ltemp[I] := 0;

  DMInterface.FB_TARIServiceUPDATE.First;
  while (DMInterface.FB_TARIServiceUPDATE.Eof = False) and ((Ltemp[0] = 0) or (Ltemp[1] = 0) OR (Ltemp[3] = 0))  do
    begin
    Ltemp[0] := Ltemp[0] + DMInterface.FB_TARIServiceUPDATESALES.value;
    Ltemp[1] := Ltemp[1] + DMInterface.FB_TARIServiceUPDATECOGS.value;
    Ltemp[3] := Ltemp[3] + DMInterface.FB_TARIServiceUPDATETOTAL_MINS.value;
    DMInterface.FB_TARIServiceUPDATE.Next;
    end;
  Ltemp[2] := Ltemp[0] - Ltemp[1];
  for index := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value)
              to Trunc(GGlobals.TARIEndDate) - trunc(DepartmentsCurrentMonitoringStart.value)
    do
    begin
    if Ltemp[0] <> 0 then
      MonSales[index] := 0;
    if Ltemp[1] <> 0 then
      MonCogs[Index] := 0;
    if Ltemp[2] <> 0 then
      MonGP[Index] := 0;
    if Ltemp[3] <> 0 then
      MonBilled[Index] := 0;
    end;

  for I := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value) to Trunc(GGLobals.TARIEndDate) - Trunc(DepartmentsCurrentMonitoringStart.value) do    // Iterate
    begin
    MonSales[I] := 0;
    Moncogs[I] := 0;
    MonGP[I] := 0;
    MonBilled[I] := 0;
    end;
  DMInterface.FB_TARIServiceUPDATE.First;
  LastDate := 0;
  while DMInterface.FB_TARIServiceUPDATE.Eof = False do
    begin
    I := Trunc(DMInterface.FB_TARIServiceUPDATETRANS_DATE.Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DMInterface.FB_TARIServiceUPDATETRANS_DATE.Value then
      begin
      if Ltemp[0] <> 0 then
        MonSales[I] := DMInterface.FB_TARIServiceUPDATESALES.value;
      if Ltemp[1] <> 0 then
        MonCogs[I] := DMInterface.FB_TARIServiceUPDATECOGS.value;
      if Ltemp[2] <> 0 then
        MonGP[I] := DMInterface.FB_TARIServiceUPDATESALES.value - DMInterface.FB_TARIServiceUPDATECOGS.value;
      if Ltemp[3] <> 0 then
        MonBilled[I] := DMInterface.FB_TARIServiceUPDATETOTAL_MINS.value / 60;
      LastDate := DMInterface.FB_TARIServiceUPDATETRANS_DATE.Value;
      end
    else
      begin
      MonSales[I] := MonSales[I] + DMInterface.FB_TARIServiceUPDATESALES.value;
      MonCogs[I] := MonCogs[I] + DMInterface.FB_TARIServiceUPDATECOGS.value;
      MonGP[I] := MonGP[I] + DMInterface.FB_TARIServiceUPDATESALES.value - DMInterface.FB_TARIServiceUPDATECOGS.value;
      MonBilled[I] := MonBilled[I] + DMInterface.FB_TARIServiceUPDATETOTAL_MINS.value / 60;
      end;
    DMInterface.FB_TARIServiceUPDATE.Next;
    end;
  if DMInterface.GetUpdatePotentialValue = 1 then
    begin
    for I := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value) to Trunc(GGLobals.TARIEndDate) - Trunc(DepartmentsCurrentMonitoringStart.value) do    // Iterate
      MonPOTENTIAL[I] := 0;
    DMInterface.FBStaffHoursbyDate.First;
    LastDate := 0;
    while DMInterface.FBStaffHoursbyDate.Eof = False do
      begin
      varg1 := DMInterface.FBStaffHoursbyDateSTAFF_ID.Value;
      if (DMInterface.FBStaffReport.Locate('STAFF_ID', varg1, [])) and
        (DMInterface.FBStaffReportPRODUCER.Value = 1) then
        begin
        I := Trunc(DMInterface.FBStaffHoursbyDateSTAFF_DATE.Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
        if LastDate <> DMInterface.FBStaffHoursbyDateSTAFF_DATE.Value then
          begin
          MonPOTENTIAL[I] := DMInterface.FBStaffHoursbyDateMINUTES_LOGGED.value / 60;
          LastDate := DMInterface.FBStaffHoursbyDateSTAFF_DATE.Value;
          end
        else
          begin
          MonPOTENTIAL[I] := MonPOTENTIAL[I] + DMInterface.FBStaffHoursbyDateMINUTES_LOGGED.value / 60;
          end;
        end;
      DMInterface.FBStaffHoursbyDate.Next;
      end;
    setBalances(MonPOTENTIAL, POTENTIAL);
    end;
  setBalances(MonSales, SALES);
  setBalances(MonCOGS, COGS);
  setBalances(MonGP, GROSSPROFIT);
  setBalances(MonBILLED, BILLED);

// Here's where we do the Sales Department

  varg := DMInterface.GetTARISalesDept;
  if Not Departments.locate('DEPT_ID', varg, []) then exit;
  CurrentDept_Id := DMInterface.GetTARISalesDept;
  psdate := DepartmentsCurrentMonitoringStart.value;
  pedate := DepartmentsCurrentMonitoringEnd.value;
  getBalances(MonSales, SALES);
  getBalances(MonCOGS, COGS);
  getBalances(MonGP, GROSSPROFIT);
  getBalances(MonBILLED, BILLED);
{  if not getBalances(MonSales, SALES) then exit;
  if not getBalances(MonCOGS, COGS) then exit;
  if not getBalances(MonGP, GROSSPROFIT) then exit;
  if not getBalances(MonBILLED, BILLED) then exit;
}
  // initialise Monitoring data to zero if any of the totals are <> 0
  for I := 0 to 3 do    // Iterate
    Ltemp[I] := 0;
  DMInterface.FB_TARIRetailUPDATE.First;
  while (DMInterface.FB_TARIRetailUPDATE.Eof = False) and ((Ltemp[0] = 0) or (Ltemp[1] = 0))  do
    begin
    Ltemp[0] := Ltemp[0] + DMInterface.FB_TARIRetailUPDATESALES.value;
    Ltemp[1] := Ltemp[1] + DMInterface.FB_TARIRetailUPDATECOGS.value;
    Ltemp[3] := Ltemp[3] + 1;
    DMInterface.FB_TARIRetailUPDATE.Next;
    end;
  Ltemp[2] := Ltemp[0] - Ltemp[1];

  for index := Trunc(GGLobals.TARIStartDate) - Trunc(DepartmentsCurrentMonitoringStart.value)
              to Trunc(GGlobals.TARIEndDate) - trunc(DepartmentsCurrentMonitoringStart.value)
    do
    begin
    if Ltemp[0] <> 0 then
      MonSales[index] := 0;
    if Ltemp[1] <> 0 then
      MonCogs[Index] := 0;
    if Ltemp[2] <> 0 then
      MonGP[Index] := 0;
    if Ltemp[3] <> 0 then
      MonBilled[Index] := 0;
    end;

  DMInterface.FB_TARIRetailUPDATE.First;
  LastDate := 0;
  while DMInterface.FB_TARIRetailUPDATE.Eof = False do
    begin
    I := Trunc(DMInterface.FB_TARIRetailUPDATETRANS_DATE.Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DMInterface.FB_TARIRetailUPDATETRANS_DATE.Value then
      begin
      if Ltemp[0] <> 0 then
        MonSales[I] := DMInterface.FB_TARIRetailUPDATESALES.value;
      if Ltemp[1] <> 0 then
        MonCogs[I] := DMInterface.FB_TARIRetailUPDATECOGS.value;
      if Ltemp[2] <> 0 then
        MonGP[I] := DMInterface.FB_TARIRetailUPDATESALES.value - DMInterface.FB_TARIRetailUPDATECOGS.value;
      if Ltemp[3] <> 0 then
        MonBilled[I] := 1;
      LastDate := DMInterface.FB_TARIRetailUPDATETRANS_DATE.Value;
      end
    else
      begin
      MonSales[I] := MonSales[I] + DMInterface.FB_TARIRetailUPDATESALES.value;
      MonCogs[I] := MonCogs[I] + DMInterface.FB_TARIRetailUPDATECOGS.value;
      MonGP[I] := MonGP[I] + DMInterface.FB_TARIRetailUPDATESALES.value - DMInterface.FB_TARIRetailUPDATECOGS.value;
      MonBilled[I] := MonBilled[I] + 1;
      end;
    DMInterface.FB_TARIRetailUPDATE.Next;
    end;
  setBalances(MonSales, SALES);
  setBalances(MonCOGS, COGS);
  setBalances(MonGP, GROSSPROFIT);
  setBalances(MonBILLED, BILLED);
  ClientDatabase.Commit;
  DMInterface.FB_TARIServiceUPDATE.Active := False;
  DMInterface.FB_TARIRetailUPDATE.Active := False;
  DMInterface.FBStaffHoursbyDate.Active := False;
  DMInterface.FBStaffReport.Active := False;
end;

function TTARIDM.getBalances(var Balances : array of currency; Accountno : integer): Boolean;
Var
  J: Integer;
  Tempbalances : TDetailedBalArray;
begin
  Result := False;
  FillChar(Balances, sizeof(TDetailedBalArray), #0);
  FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
  if getDeptBalances(TempBalances, CurrentDept_Id, Accountno) then
    begin
    Result := True;
    for J := 0 to NUM_DAYSINYEAR - 1 do    // Iterate
      Balances[J] := Balances[J] + Tempbalances[J];
    end;    // for
end;

procedure TTARIDM.RoundArray(var balances: array of currency; startdate, enddate : double);
var
  I: Integer;
  TmpRounded, TmpActual : Currency;
begin
  TmpRounded := 0;
  TmpActual := 0;
  for I := 0 to Trunc(Enddate) - Trunc(StartDate) do    // Iterate
    begin
    tmpactual := TmpActual + Balances[i];
    Balances[I] := Round(TmpActual) - tmpRounded;
    tmprounded := Tmprounded + Balances[I];
    end;    // for
end;

function TTARIDM.getDeptBalances(var Balances : array of currency; DeptId : Integer; Accountno : integer): Boolean;
Var
  tempstream : TmemoryStream;
  tempstream1 : TmemoryStream;
  varg : Variant;
  found, found1 : Boolean;
  d, m, y, y1 : Word;
  daystostart, daystoend, offset : integer;
begin
  Result := False;
  tempstream := TmemoryStream.Create;
  tempstream1 := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  tempstream1.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  decodeDate(psdate, y, m, d);
  decodeDate(pedate, y1, m, d);
  varg := VarArraycreate([0,3], VarVariant);
  varg[1] := AccountNo;
  FillChar(Balances, sizeof(TDetailedBalArray), #0);
  varg[0] := DeptId;
  varg[2] := Y;
  found := MonitoringDataLU.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
  Offset := 0;
  FillChar(tempstream.memory^, tempstream.size, #0);
  FillChar(tempstream1.memory^, tempstream1.size, #0);
  tempstream.Seek(0, soFromBeginning);
  if found then
    begin
    MonitoringDataLUD_Bals.SavetoStream(tempstream);
    if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
      daystostart := 0
    else
      daystostart := DaysfromYearStart(psdate);
    tempstream.Seek(Sizeof(currency) * daystoStart,  soFromBeginning);
    if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
      daystoend := 365
    else
      daystoend := DaysRemainingInYear(psdate);
    offset := Sizeof(currency) * daystoend;
    tempstream1.Seek(0, soFromBeginning);
    tempstream1.CopyFrom(tempstream, offset);
    end;
  found1 := False;
  if (Y <> Y1) and (AccountNo <> WHATIF) and (Accountno <> DETAILEDOPT)then
    begin
    varg[2] := Y1;
    found1 := MonitoringDataLU.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
    tempstream.Seek(0, soFromBeginning);
    if found1 then
      begin
      MonitoringDataLUD_Bals.SavetoStream(tempstream);
      daystostart := DaysfromYearStart(pedate) + 1;
      tempstream.Seek(0, soFromBeginning);
      tempstream1.Seek(offset, sofromBeginning);
      tempstream1.CopyFrom(tempstream, sizeof(Currency) * DaysToStart);
      end;
    end;
  if (found) or (found1) then
    begin
    tempstream1.Seek(0, soFromBeginning);
    if (tempstream1.read(Balances, Sizeof(currency) * integer(Trunc(pedate) - Trunc(psdate) + 1)) > 0) then
      Result := True;
    end;
  tempstream.Free;
  tempstream1.Free;
  if (AccountNo < FTEPROD) or ((BILLED < AccountNo) AND (AccountNo < AR_DAYS)) then
    RoundArray(Balances, psdate, pedate);
end;

function TTARIDM.setBalances(var Balances : array of currency; Accountno : integer): Boolean;
Var
  tempstream, tempstream1 : TmemoryStream;
  Found : boolean;
  varg : variant;
//  recdate : double;
  d, m, y, y1 : Word;
  daystostart, daystoend, offset : integer;
begin
  Result := False;
  tempstream := TmemoryStream.create;
  tempstream1 := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  tempstream1.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  FillChar(tempstream.memory^, tempstream.size, #0);
  FillChar(tempstream1.memory^, tempstream1.size, #0);
  // we dump balances into tempstream but save to DB from tempstream1
  tempstream.Write(Balances, Sizeof(currency) * NUM_DAYSINYEAR);

  decodeDate(psdate, y, m, d);
  decodeDate(pedate, y1, m, d);
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := CurrentDept_ID;
  varg[1] := AccountNo;
  if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
    varg[2] := 0
  else
    varg[2] := y;
  found := MonitoringData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
  if not found then
    begin
    MonitoringData.Insert;
    MonitoringDataDept_ID.value := CurrentDept_ID;
    MonitoringDataAccount_Number.Value := AccountNo;
    MonitoringDataD_TYPE.Value := 2;
    MonitoringDataD_Year.value := Y;
    end
  else
    MonitoringData.Edit;
  tempstream.Seek(0,  soFromBeginning);
  MonitoringDataD_bals.SavetoStream(tempstream1);
  daystostart := DaysfromYearStart(psdate);
  tempstream.seek(0, soFromBeginning);
  tempstream1.Seek(Sizeof(currency) * daystoStart,  soFromBeginning);
  if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
    daystoend := 365
  else
    daystoend := DaysRemainingInYear(psdate);
  offset := Sizeof(currency) * daystoend;
  tempstream1.CopyFrom(tempstream, offset);
  MonitoringDataD_Bals.LoadFromStream(tempstream1);
  MonitoringData.Post;
  if (y <> y1) and (AccountNo <> WHATIF) and (AccountNo <> DETAILEDOPT) then
    begin
    varg[2] := y1;
    found := MonitoringData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
    if not found then
      begin
      MonitoringData.Insert;
      MonitoringDataDept_ID.value := CurrentDept_ID;
      MonitoringDataAccount_Number.Value := AccountNo;
      MonitoringDataD_Year.value := Y1;
      MonitoringDataD_TYPE.Value := 2;
      end
    else
      MonitoringData.Edit;
    tempstream1.Seek(0,  soFromBeginning);
    MonitoringDataD_Bals.SavetoStream(tempstream1);
    daystostart := DaysfromYearStart(pedate) + 1;
    tempstream1.Seek(0,  soFromBeginning);
    tempstream.Seek(offset, sofromBeginning);
    tempstream1.CopyFrom(tempstream, sizeof(Currency) * DaysToStart);
    MonitoringDataD_Bals.LoadFromStream(tempstream1);
    MonitoringData.Post;
    end;
  tempstream.Free;
  tempstream1.Free;
end;

end.
