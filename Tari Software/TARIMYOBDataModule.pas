unit TARIMYOBDataModule;

interface

uses
  SysUtils, Classes, DB, IBODataset, IB_Components, MYOBInterGlobals, MYOBDM,
  auchTypes, Variants, AMiscFunctions;

type
  TTARIMYOBDM = class(TDataModule)
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
    procedure UpdateTariSaleTracking;
  end;

var
  TARIMYOBDM: TTARIMYOBDM;

implementation

{$R *.dfm}

procedure TTARIMYOBDM.ClientDatabaseAfterConnect(Sender: TIB_Connection);
begin
  Business_Details.Active := True;
  Departments.Active := True;
  MonitoringData.Active := True;
  MonitoringDataLU.Active := True;
end;

procedure TTARIMYOBDM.ClientDatabaseBeforeConnect(Sender: TIB_Connection);
begin
  ClientDatabase.Server := GGlobals.Servers.CurrentServer.servername;
  ClientDatabase.Username := 'SYSDBA';
  ClientDatabase.Password := 'masterkey';
  ClientDatabase.SQLRole := 'FBMADMIN';
  ClientDatabase.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
end;

procedure TTARIMYOBDM.ClientDatabaseBeforeDisconnect(Sender: TIB_Connection);
begin
  Business_Details.Active := False;
  Departments.Active := False;
  MonitoringData.Active := False;
  MonitoringDataLU.Active := False;
end;

procedure TTARIMYOBDM.UpdateTariSaleTracking;
var
  I: Integer;
  index: integer;
  LastDate : TdateTime;
  MonSales : TDetailedBalArray;
  MonCOGS : TDetailedBalArray;
  MonGP : TDetailedBalArray;
  MonBILLED : TDetailedBalArray;
  ltemp : array[0..3] of Currency;
  varg : Variant;
begin
  varg := DMMYOBInterface.GetTARIServiceDept;
  CurrentDept_Id := DMMYOBInterface.GetTARIServiceDept;
  if Not Departments.locate('DEPT_ID', varg, []) then exit;
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
{
  DMMYOBInterface.FB_TARIServiceUPDATE.ParamByName('STARTDATE').Value := psdate;
  DMMYOBInterface.FB_TARIServiceUPDATE.ParamByName('ENDDATE').Value := pedate;
  DMMYOBInterface.FB_TARIServiceUPDATE.Active := True;
  DMMYOBInterface.FB_TARIRetailUPDATE.ParamByName('STARTDATE').Value := psdate;
  DMMYOBInterface.FB_TARIRetailUPDATE.ParamByName('ENDDATE').Value := pedate;
  DMMYOBInterface.FB_TARIRetailUPDATE.Active := True;
  for I := 0 to 3 do    // Iterate
    Ltemp[I] := 0;

  DMMYOBInterface.FB_TARIServiceUPDATE.First;
  while (DMMYOBInterface.FB_TARIServiceUPDATE.Eof = False) and ((Ltemp[0] = 0) or (Ltemp[1] = 0) OR (Ltemp[3] = 0))  do
    begin
    Ltemp[0] := Ltemp[0] + DMMYOBInterface.FB_TARIServiceUPDATESALES.value;
    Ltemp[1] := Ltemp[1] + DMMYOBInterface.FB_TARIServiceUPDATECOGS.value;
    Ltemp[3] := Ltemp[3] + DMMYOBInterface.FB_TARIServiceUPDATETOTAL_MINS.value;
    DMMYOBInterface.FB_TARIServiceUPDATE.Next;
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

  DMMYOBInterface.FB_TARIServiceUPDATE.First;
  LastDate := 0;
  while DMMYOBInterface.FB_TARIServiceUPDATE.Eof = False do
    begin
    I := Trunc(DMMYOBInterface.FB_TARIServiceUPDATETRANS_DATE.Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DMMYOBInterface.FB_TARIServiceUPDATETRANS_DATE.Value then
      begin
      if Ltemp[0] <> 0 then
        MonSales[I] := DMMYOBInterface.FB_TARIServiceUPDATESALES.value;
      if Ltemp[1] <> 0 then
        MonCogs[I] := DMMYOBInterface.FB_TARIServiceUPDATECOGS.value;
      if Ltemp[2] <> 0 then
        MonGP[I] := DMMYOBInterface.FB_TARIServiceUPDATESALES.value - DMMYOBInterface.FB_TARIServiceUPDATECOGS.value;
      if Ltemp[3] <> 0 then
        MonBilled[I] := DMMYOBInterface.FB_TARIServiceUPDATETOTAL_MINS.value / 60;
      LastDate := DMMYOBInterface.FB_TARIServiceUPDATETRANS_DATE.Value;
      end
    else
      begin
      MonSales[I] := MonSales[I] + DMMYOBInterface.FB_TARIServiceUPDATESALES.value;
      MonCogs[I] := MonCogs[I] + DMMYOBInterface.FB_TARIServiceUPDATECOGS.value;
      MonGP[I] := MonGP[I] + DMMYOBInterface.FB_TARIServiceUPDATESALES.value - DMMYOBInterface.FB_TARIServiceUPDATECOGS.value;
      MonBilled[I] := MonBilled[I] + DMMYOBInterface.FB_TARIServiceUPDATETOTAL_MINS.value / 60;
      end;
    DMMYOBInterface.FB_TARIServiceUPDATE.Next;
    end;
  setBalances(MonSales, SALES);
  setBalances(MonCOGS, COGS);
  setBalances(MonGP, GROSSPROFIT);
  setBalances(MonBILLED, BILLED);

// Here's where we do the Sales Department

  varg := DMMYOBInterface.GetTARISalesDept;
  if Not Departments.locate('DEPT_ID', varg, []) then exit;
  CurrentDept_Id := DMMYOBInterface.GetTARISalesDept;
  psdate := DepartmentsCurrentMonitoringStart.value;
  pedate := DepartmentsCurrentMonitoringEnd.value;
  getBalances(MonSales, SALES);
  getBalances(MonCOGS, COGS);
  getBalances(MonGP, GROSSPROFIT);
  getBalances(MonBILLED, BILLED);
}
{  if not getBalances(MonSales, SALES) then exit;
  if not getBalances(MonCOGS, COGS) then exit;
  if not getBalances(MonGP, GROSSPROFIT) then exit;
  if not getBalances(MonBILLED, BILLED) then exit;
}
  // initialise Monitoring data to zero if any of the totals are <> 0
{
  for I := 0 to 3 do    // Iterate
    Ltemp[I] := 0;
  DMMYOBInterface.FB_TARIRetailUPDATE.First;
  while (DMMYOBInterface.FB_TARIRetailUPDATE.Eof = False) and ((Ltemp[0] = 0) or (Ltemp[1] = 0))  do
    begin
    Ltemp[0] := Ltemp[0] + DMMYOBInterface.FB_TARIRetailUPDATESALES.value;
    Ltemp[1] := Ltemp[1] + DMMYOBInterface.FB_TARIRetailUPDATECOGS.value;
    Ltemp[3] := Ltemp[3] + 1;
    DMMYOBInterface.FB_TARIRetailUPDATE.Next;
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

  DMMYOBInterface.FB_TARIRetailUPDATE.First;
  LastDate := 0;
  while DMMYOBInterface.FB_TARIRetailUPDATE.Eof = False do
    begin
    I := Trunc(DMMYOBInterface.FB_TARIRetailUPDATETRANS_DATE.Value) - Trunc(DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DMMYOBInterface.FB_TARIRetailUPDATETRANS_DATE.Value then
      begin
      if Ltemp[0] <> 0 then
        MonSales[I] := DMMYOBInterface.FB_TARIRetailUPDATESALES.value;
      if Ltemp[1] <> 0 then
        MonCogs[I] := DMMYOBInterface.FB_TARIRetailUPDATECOGS.value;
      if Ltemp[2] <> 0 then
        MonGP[I] := DMMYOBInterface.FB_TARIRetailUPDATESALES.value - DMMYOBInterface.FB_TARIRetailUPDATECOGS.value;
      if Ltemp[3] <> 0 then
        MonBilled[I] := 1;
      LastDate := DMMYOBInterface.FB_TARIRetailUPDATETRANS_DATE.Value;
      end
    else
      begin
      MonSales[I] := MonSales[I] + DMMYOBInterface.FB_TARIRetailUPDATESALES.value;
      MonCogs[I] := MonCogs[I] + DMMYOBInterface.FB_TARIRetailUPDATECOGS.value;
      MonGP[I] := MonGP[I] + DMMYOBInterface.FB_TARIRetailUPDATESALES.value - DMMYOBInterface.FB_TARIRetailUPDATECOGS.value;
      MonBilled[I] := MonBilled[I] + 1;
      end;
    DMMYOBInterface.FB_TARIRetailUPDATE.Next;
    end;
  setBalances(MonSales, SALES);
  setBalances(MonCOGS, COGS);
  setBalances(MonGP, GROSSPROFIT);
  setBalances(MonBILLED, BILLED);
  ClientDatabase.Commit;
  DMMYOBInterface.FB_TARIServiceUPDATE.Active := False;
  DMMYOBInterface.FB_TARIRetailUPDATE.Active := False;
}
end;

function TTARIMYOBDM.getBalances(var Balances : array of currency; Accountno : integer): Boolean;
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

procedure TTARIMYOBDM.RoundArray(var balances: array of currency; startdate, enddate : double);
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

function TTARIMYOBDM.getDeptBalances(var Balances : array of currency; DeptId : Integer; Accountno : integer): Boolean;
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

function TTARIMYOBDM.setBalances(var Balances : array of currency; Accountno : integer): Boolean;
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
