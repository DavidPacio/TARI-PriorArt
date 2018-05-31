unit MainInterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SCDM, StdCtrls, SCInterGlobals, auchtypes,{$IFDEF Embedded} IB_Session511, {$ENDIF}
  IB_Components, IB_Script, dbtables, db, SCSetup, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, ExtCtrls, dxNavBar,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxButtons, inifiles;

type
  TMainInterfaceF = class(TForm)
    SC2TariExitBtn: TcxButton;
    cxButton1: TcxButton;
    SCTransactionsGRP: TcxGroupBox;
    SCStartdate: TcxDateEdit;
    cxLabel1: TcxLabel;
    SCEndDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxButton3: TcxButton;
    SCTransProgressBar: TcxProgressBar;
    UpdateTARIBtn: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxButton2: TcxButton;
    SupportProgressBar: TcxProgressBar;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    LastSupportDateLbl: TcxLabel;
    LastTransDateLbl: TcxLabel;
    cxButton6: TcxButton;
    AccountMappingBtn: TcxButton;
    UpdateTARIExpensesBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure SC2TariExitBtnClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure UpdateTARIBtnClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure AccountMappingBtnClick(Sender: TObject);
    procedure UpdateTARIExpensesBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateSupportProgress;
    procedure UpdateTransactionProgress;
//    procedure InsertNewProduct(Prod_ID: Integer);
//    procedure InsertAccountNumber(AccountNo: Integer);
//    procedure InsertNewClient(Client_ID: Integer);
    procedure InsertNewStaff(Staff_ID: Integer);
    procedure createcomponent(ServicesIdNumber: Integer; NewComp: Boolean; CompIdx, ProdGroup: integer; ServiceDesc: string; SellingPrice, LabourTime: Currency);
    procedure RemoveSubComp(ProdID, Index : Integer);
  public
    { Public declarations }
    ProgressInt, ProgressTotal : integer;
    function OpenSCDB(FilePath : String): Boolean;
//    procedure TransferSCData;
//    procedure UpdateTARIData;
  end;

var
  MainInterfaceF: TMainInterfaceF;
  NewFileName : string;

function GetTARIInterfaceINI: Boolean;
function UpdateTARIInterfaceINI: Boolean;
function OpenClientDB : Boolean;

implementation

{$R *.dfm}

uses TARITIMES, SCReports, TARIDataModule, TARIStaff, ImpTemplates;

function GetTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    GGlobals.TARIServer := DataIni.ReadString('TARI', 'TARIServer', '');
    GGlobals.TARIPath := DataIni.ReadString('TARI', 'TARIFBPath', '');
    GGlobals.TARIStartDate := DataIni.ReadDate('TARI', 'TARIStartDate', 0);
    GGlobals.TARIEndDate := DataIni.ReadDate('TARI', 'TARIEndDate', 0);
    GGLobals.TARIInterfaceDBPath := DataIni.ReadString('TARIInterface', 'DBPath', '');
    GGLobals.TARIInterfaceServer := DataIni.ReadString('TARIInterface', 'InterfaceServer', '');
    Dataini.Free;
    Result := True;
    end;
end;

function UpdateTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    DataIni.WriteString('TARIInterface', 'DBPath', GGLobals.TARIInterfaceDBPath);
    if length(GGLobals.TARIInterfaceServer) = 0 then
      DataIni.WriteString('TARIInterface', 'InterfaceServer', GGLobals.TARIServer);
    Dataini.UpdateFile;
    DataIni.Free;
    Result := True;
    end;
end;

function OpenClientDB: Boolean;
var
  i: Integer;
  dbpass : string;
begin
  GGlobals.DebugOut('Open File - Start');
  GGlobals.DebugOut('Open File - Update Checked');
  GGlobals.DebugOut('Attempting to Open - ' + GGLobals.TARIPath);
  Result := True;
  if (Length(GGlobals.CurrentDBPWD) > 0) Then
    If (InputPwdQuery('Database Password', 'Enter the Password', dbpass, False, GGlobals.FormColour)) then
      begin
      if not ansisametext(GGlobals.CurrentDBPWD, dbPass) then
        Result := False;
      end
    else
      Result := False;
  if Result = True then
    begin
    TARIDM.ClientDatabase.Connected := False;
    TARIDM.ClientDatabase.Path := GGlobals.TariPath;
      try
        TARIDM.ClientDatabase.Connected := True;
      except
        on E: EDBEngineError do
          begin
          Result := False;
          for i:= 0 to E.ErrorCount - 1 do
            begin
            GGlobals.DebugOut('DBopen Error - File : ' + GGlobals.TariPath);
            GGlobals.DebugOut('               Code : ' + inttoStr(E.Errors[i].Errorcode));
            GGlobals.DebugOut('               SubCode : ' + InttoStr(E.Errors[i].subCode));
            GGlobals.DebugOut('               Message : ' + E.Errors[i].Message);
            GGlobals.DebugOut('               NativeError : ' + InttoStr(E.Errors[i].NativeError));
            end;
          end;
      else
        ; //raise;
      end;
    end;
  if Result then
    GGlobals.DebugOut('Connected to - ' + GGLobals.TARIPath)
  else
    GGlobals.DebugOut('Failed Connected to - ' + GGLobals.TARIPath);
  if TARIDM.ClientDatabase.Connected then
    GGlobals.TARIBusinessName := TARIDM.Business_DetailsBUSINESS_NAME.Value;
end;


function TMainInterfaceF.OpenSCDB(FilePath : String): Boolean;
begin
  DMInterface.SCPath := DMInterface.GetSCPath;
  DMInterface.SCSQLDatabase.Connected := True;
//  DMInterface.SCDatabase.Connected := True;
//  result := DMInterface.SCDatabase.Connected;
  result := DMInterface.SCSQLDatabase.Connected;
end;

procedure TMainInterfaceF.FormCreate(Sender: TObject);
begin
  GGlobals.DebugOut('Main Form Create');
  color := GGlobals.FormColour;
  SCStartdate.Properties.DisplayFormat := GGlobals.DateFDE;
  SCEnddate.Properties.DisplayFormat := GGLobals.DateFDE;
  SCStartdate.Date := GGlobals.TARIStartDate;
  SCEnddate.Date := GGlobals.TARIEndDate;
  GGlobals.DebugOut('Main Form Create 1');
  if DMInterface.GetLastSupportDate <> 0 then
    LastSupportDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMInterface.GetLastSupportDate);
  if DMInterface.GetLastTransDate <> 0 then
    LastTransDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMInterface.GetLastTransDate);
  UpdateTARIInterfaceINI;
end;

procedure TMainInterfaceF.cxButton1Click(Sender: TObject);
begin
  if (TARIDM.ClientDatabase.Connected) then
    begin
    Application.CreateForm(TSCSetupF, SCSetupF);
    SCSetupf.Showmodal;
    SCSetupf.free;
    end
  else
    showMessage('Not connected to TARI for Business Database. Call Support!');
end;

procedure TMainInterfaceF.createcomponent(ServicesIdNumber: Integer; NewComp: Boolean; CompIdx, ProdGroup: integer; ServiceDesc: string; SellingPrice, LabourTime: Currency);
var
  varg, varg1 : Variant;
  newSubComponent : integer;
  newcomprequired : Boolean;
begin
// look for existing component based on description, labour units and selling price
  if DMInterface.qryAddSubProducts.Active = False then
    DMInterface.qryAddSubProducts.Active := True;
  varg := ServiceDesc;
  newComprequired := false;  // assume it exists
  if not DMInterface.qryAddSubProducts.Locate('DESCRIPTION', varg, []) then
    begin
    DMInterface.qryAddSubProducts.Insert;
    DMInterface.qryAddSubProductsPRODUCT_ID.Value := DMInterface.qryAddSubProducts.GeneratorValue('GEN_PRODUCTS_ID', 1);
    DMInterface.qryAddSubProductsUNITS_LABOUR.Value := LABOURTime;
    newComprequired := True;
    end
  else
    DMInterface.qryAddSubProducts.Edit;
  NewSubComponent := DMInterface.qryAddSubProductsPRODUCT_ID.Value;
  DMInterface.qryAddSubProductsDESCRIPTION.Value := ServiceDesc;
  DMInterface.qryAddSubProductsPRODUCT_GROUP.Value := ProdGroup;
  DMInterface.qryAddSubProductsIS_LABOUR.Value := 1;  // These arelabour products
  if newComprequired then
    DMInterface.qryAddSubProductsIS_LISTED.Value := 0;  // It is not listed
  DMInterface.qryAddSubProductsIS_CALCULATED.Value := 1; // These are base components
  DMInterface.qryAddSubProductsSELLING_PRICE.Value := Sellingprice;
  DMInterface.qryAddSubProductsLAST_UPDATED.Value := now();
  DMInterface.qryAddSubProducts.Post;
  // now add the component entry
  Varg1 := VarArrayCreate([0, 1], varVariant);
  varg1[0] := ServicesIDNumber;
  varg1[1] := newSubComponent;
  if not DMInterface.FB_Components.Locate('PRODUCT_ID;COMPONENT_ID', varg1, []) then
    begin
    DMInterface.FB_Components.Insert;
    DMInterface.FB_ComponentsPRODUCT_ID.Value := ServicesIdNumber;
    DMInterface.FB_ComponentsCOMPONENT_ID.Value := NewSubComponent;
    end
  else
    DMInterface.FB_Components.Edit;
  DMInterface.FB_ComponentsCOMPONENT_QTY.Value := 1;
  DMInterface.FB_ComponentsCOMPONENT_ORDER.Value := CompIdx;
  DMInterface.FB_Components.Post;
end;

procedure TMainInterfaceF.RemoveSubComp(ProdID, Index : Integer);
Var
  I: Integer;
  varg : Variant;
begin
  Varg := VarArrayCreate([0, 1], varVariant);
  varg[0] := ProdID;
  for I := Index to 6 do    // Iterate
    begin
    varg[1] := I;
    if DMInterface.FB_Components.Locate('PRODUCT_ID;COMPONENT_ORDER', varg, []) then
      DMInterface.FB_Components.Delete;
    end;    // for
end;

procedure TMainInterfaceF.cxButton2Click(Sender: TObject);
var
  Varg : variant;
  SubIdx : Integer;
begin
// here's where we
  screen.Cursor := crHourGlass;
  if Not DMInterface.SCDatabase.Connected then
    DMInterface.SCDatabase.Connected := True;
  if Not DMInterface.SC2TARIDB.Connected then
    DMInterface.SC2TARIDB.Connected := True;
  // let's assume we have connections
  //



  ProgressTotal := DMInterface.SCCategory.RecordCount
                    + DMInterface.SCProducts.RecordCount
                    + DMInterface.SCServices.RecordCount
                    + DMInterface.SCPettyCash.RecordCount
                    + DMInterface.SCSundry.RecordCount
                    + DMInterface.SCClients.RecordCount
                    + DMInterface.SCEmploys.RecordCount;
  ProgressInt := 0;

  // Copy Groups

  DMInterface.SCCategory.First;
  while DMInterface.SCCategory.Eof = false do
    begin
    Varg := DMInterface.SCCategoryIdnumber.Value;
    if not DMInterface.FBGroups.Locate('GROUP_ID', varg, []) then
      begin
      DMInterface.FBGroups.Insert;
      DMInterface.FBGroupsGroup_id.Value := DMInterface.SCCategoryIdnumber.Value;
      end
    else
      DMInterface.FBGroups.Edit;
    DMInterface.FBGroupsGROUP_NAME.Value := DMInterface.SCCategoryName.Value;
    DMInterface.FBGroups.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCCategory.Next;
    end;    // while
  // Add 9999 group to provide for "Sundry Income" (Sundry Table)
  Varg := 9999;
  if not DMInterface.FBGroups.Locate('GROUP_ID', varg, []) then
    begin
    DMInterface.FBGroups.Insert;
    DMInterface.FBGroupsGroup_id.Value := 9999;
    end
  else
    DMInterface.FBGroups.Edit;
  DMInterface.FBGroupsGROUP_NAME.Value := 'Sundry Income';
  DMInterface.FBGroups.Post;

  // Copy Staff
  DMInterface.SCEmploys.First;
  while DMInterface.SCEmploys.Eof = false do
    begin
    Varg := DMInterface.SCEmploysIdNumber.Value;
    if not DMInterface.FBStaff.Locate('STAFF_ID', varg, []) then
      begin
      DMInterface.FBStaff.Insert;
      DMInterface.FBStaffSTAFF_ID.Value := DMInterface.SCEmploysIdNumber.Value;
      DMInterface.FBStaffPRODUCTION_PC.value := 100;
      DMInterface.FBStaffPRODUCER.Value := 1;
      DMInterface.FBStaffIS_ACTIVE.Value := 1;
      end
    else
      DMInterface.FBStaff.Edit;
    DMInterface.FBStaffLASTNAME.Value := DMInterface.SCEmploysLastName.Value;
    DMInterface.FBStaffFIRSTNAME.Value := DMInterface.SCEmploysFirstName.Value;
    DMInterface.FBStaffIS_ACTIVE.Value := DMInterface.SCEmploysActive.Value;
    if DMInterface.FBStaffIS_ACTIVE.IsNull then
      DMInterface.FBStaffIS_ACTIVE.Value := 1;
    DMInterface.FBStaff.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCEmploys.Next;
    end;    // while

  // Copy Clients
  DMInterface.SCClients.First;
  while DMInterface.SCClients.Eof = false do
    begin
    Varg := DMInterface.SCClientsIdNumber.Value;
    if not DMInterface.FB_Clients.Locate('CLIENT_ID', varg, []) then
      begin
      DMInterface.FB_Clients.Insert;
      DMInterface.FB_ClientsCLIENT_ID.Value := DMInterface.SCClientsIdNumber.Value;
      end
    else
      DMInterface.FB_Clients.Edit;
    DMInterface.FB_ClientsLASTNAME.Value := DMInterface.SCClientsLastName.Value;
    DMInterface.FB_ClientsFIRSTNAME.Value := DMInterface.SCClientsFirstName.Value;
    DMInterface.FB_Clients.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCClients.Next;
    end;    // while

  // Copy Products
  DMInterface.SCProducts.First;
  while DMInterface.SCProducts.Eof = false do
    begin
    Varg := DMInterface.SCProductsIdNumber.Value;
    if not DMInterface.FBProducts.Locate('PRODUCT_ID', varg, []) then
      begin
      DMInterface.FBProducts.Insert;
      DMInterface.FBProductsPRODUCT_ID.Value := DMInterface.SCProductsIdNumber.Value;
      end
    else
      DMInterface.FBProducts.Edit;
    DMInterface.FBProductsDESCRIPTION.Value := DMInterface.SCProductsName.Value;
    DMInterface.FBProductsCOST_PRICE.Value := DMInterface.SCProductsBuyPrice.Value;
    DMInterface.FBProductsPRODUCT_GROUP.Value := DMInterface.SCProductsCategoryId.Value;
    DMInterface.FBProductsSELLING_PRICE.Value := DMInterface.SCProductsSellPrice.value;
    DMInterface.FBProductsIS_LABOUR.Value := 0;  // These are not labour products
    DMInterface.FBProductsIS_LISTED.Value := 1;  // It is listed
    DMInterface.FBProductsIS_ACTIVE.Value := DMInterface.SCProductsActive.Value;  // It is listed
    DMInterface.FBProductsIS_CALCULATED.Value := 1; // These are base products
    DMInterface.FBProductsLAST_UPDATED.Value := now();
    DMInterface.FBProducts.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCProducts.Next;
    end;    // while

  // Clear All components
  DMInterface.FB_Components.First;
  while DMInterface.FB_Components.Eof = false do
    DMInterface.FB_Components.Delete;

  // Copy Services

  DMInterface.SCServices.First;
  while DMInterface.SCServices.Eof = false do
    begin
    Varg := DMInterface.SCServicesIdNumber.Value;
    subIdx := -1;
    if not DMInterface.FBProducts.Locate('PRODUCT_ID', varg, []) then
      begin
      DMInterface.FBProducts.Insert;
      DMInterface.FBProductsPRODUCT_ID.Value := DMInterface.SCServicesIdNumber.Value;
      DMInterface.FBProductsUNITS_LABOUR.Value := DMInterface.SCServicesTime1.Value
                                                  + DMInterface.SCServicesTime2.Value
                                                  + DMInterface.SCServicesTime3.Value
                                                  + DMInterface.SCServicesTime4.Value
                                                  + DMInterface.SCServicesTime5.Value
                                                  + DMInterface.SCServicesTime6.Value;
      end
    else
      begin
      DMInterface.FBProducts.Edit;
      if DMInterface.GetUpdateTimeValue = 1 then
        DMInterface.FBProductsUNITS_LABOUR.Value := DMInterface.SCServicesTime1.Value
                                                  + DMInterface.SCServicesTime2.Value
                                                  + DMInterface.SCServicesTime3.Value
                                                  + DMInterface.SCServicesTime4.Value
                                                  + DMInterface.SCServicesTime5.Value
                                                  + DMInterface.SCServicesTime6.Value;
      end;
    DMInterface.FBProductsDESCRIPTION.Value := DMInterface.SCServicesService.Value;
    DMInterface.FBProductsPRODUCT_GROUP.Value := DMInterface.SCServicesCategory.Value;
    DMInterface.FBProductsIS_LABOUR.Value := 1;  // These are not labour products
    DMInterface.FBProductsIS_ACTIVE.Value := DMInterface.SCServicesActive.Value;  // Active or not
    DMInterface.FBProductsIS_LISTED.Value := 1;  // Always Listed
    DMInterface.FBProductsIS_CALCULATED.Value := 1; // These are base products
    DMInterface.FBProductsSELLING_PRICE.Value := DMInterface.SCServicesCost.value;
    DMInterface.FBProductsLAST_UPDATED.Value := now();
    DMInterface.FBProducts.Post;
    if length(DMInterface.SCServicesText2.Value) > 0 then
      begin
      // Delete any existing
      // we have more than one service for this product and we add one and two
      subIdx := 3;  // One More than the current one
      createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       1,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText1.Value,    // Description
                       DMInterface.SCServicesCost1.value,    // Selling Price
                       DMInterface.SCServicesTime1.Value);   // Default time
      createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       2,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText2.Value,    // Description
                       DMInterface.SCServicesCost2.value,    // Selling Price
                       DMInterface.SCServicesTime2.Value);   // Default time
      if length(DMInterface.SCServicesText3.Value) > 0 then
        begin
        SubIdx := 4; // One More than the current one
        createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       3,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText3.Value,    // Description
                       DMInterface.SCServicesCost3.value,    // Selling Price
                       DMInterface.SCServicesTime3.Value);   // Default time
        end;
      if length(DMInterface.SCServicesText4.Value) > 0 then
        begin
        SubIdx := 5; // One More than the current one
        createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       4,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText4.Value,    // Description
                       DMInterface.SCServicesCost4.value,    // Selling Price
                       DMInterface.SCServicesTime4.Value);   // Default time
        end;
      if length(DMInterface.SCServicesText5.Value) > 0 then
        begin
        SubIdx := 6; // One More than the current one
        createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       5,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText5.Value,    // Description
                       DMInterface.SCServicesCost5.value,    // Selling Price
                       DMInterface.SCServicesTime5.Value);   // Default time
        end;
      if length(DMInterface.SCServicesText6.Value) > 0 then
        begin
        SubIdx := 7; // One More than the current one
        createcomponent( DMInterface.SCServicesIdNumber.Value, // main Product
                       True,                       // create if not found, else edit
                       6,                         // Component Index
                       DMInterface.SCServicesCategory.Value, // Product Group
                       DMInterface.SCServicesText6.Value,    // Description
                       DMInterface.SCServicesCost6.value,    // Selling Price
                       DMInterface.SCServicesTime6.Value);   // Default time
        end;
      End;
    if (SubIdx > 0) and (SubIdx < 7) then // Remove any unused subcomponents
      RemoveSubComp(DMInterface.SCServicesIdNumber.Value, subIdx);
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCServices.Next;
    end;    // while

  // Copy Sundry
  DMInterface.SCSundry.First;
  while DMInterface.SCSundry.Eof = false do
    begin
    Varg := DMInterface.SCSundryIdNumber.Value;
    if not DMInterface.FBProducts.Locate('PRODUCT_ID', varg, []) then
      begin
      DMInterface.FBProducts.Insert;
      DMInterface.FBProductsPRODUCT_ID.Value := DMInterface.SCSundryIdNumber.Value;
      end
    else
      DMInterface.FBProducts.Edit;
    DMInterface.FBProductsDESCRIPTION.Value := DMInterface.SCSundryName.Value;
    DMInterface.FBProductsPRODUCT_GROUP.Value := 9999; // specially added above
    DMInterface.FBProductsIS_LABOUR.Value := 0;  // These are not labour products
    DMInterface.FBProductsIS_LISTED.Value := 1;  // It is listed
    DMInterface.FBProductsIS_ACTIVE.Value := DMInterface.SCSundryActive.Value;  // It is listed
    DMInterface.FBProductsIS_CALCULATED.Value := 1; // These are base products
    // Sundries have no TARI Values  Just included for Historys table row
    DMInterface.FBProductsSELLING_PRICE.Value := 0; // DMInterface.SCSundryDefaultAmount.value;
    DMInterface.FBProductsUNITS_LABOUR.Value := 0;
    DMInterface.FBProductsLAST_UPDATED.Value := now();
    DMInterface.FBProducts.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCSundry.Next;
    end;    // while

  // Copy Petty Cash
  DMInterface.SCPettyCash.First;
  while DMInterface.SCPettyCash.Eof = false do
    begin
    Varg := DMInterface.SCPettyCashPettyCashId.Value;
    if not DMInterface.FB_Accounts.Locate('ACCOUNT_NO', varg, []) then
      begin
      DMInterface.FB_Accounts.Insert;
      DMInterface.FB_AccountsACCOUNT_NO.Value := DMInterface.SCPettyCashPettyCashId.Value;
      end
    else
      DMInterface.FB_Accounts.Edit;
    DMInterface.FB_AccountsACCOUNT_TITLE.Value := DMInterface.SCPettyCashName.Value;
    DMInterface.FB_AccountsACCOUNT_DESC.Value := DMInterface.SCPettyCashDescription.Value;
    DMInterface.FB_AccountsIS_PETTY_CASH.Value := DMInterface.SCPettyCashIsPettyCash.Value;  // These are not labour products
    DMInterface.FB_AccountsIS_ACTIVE.Value := DMInterface.SCPettyCashActive.Value;  // It is listed
    DMInterface.FB_Accounts.Post;
    Inc(ProgressInt);
    UpdateSupportProgress;
    DMInterface.SCPettyCash.Next;
    end;    // while
  ProgressInt := 0;
  UpdateSupportProgress;
  DMInterface.SetLastSupportDate(now);
  LastSupportDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMInterface.GetLastSupportDate);
  if DMInterface.ComponentLU.Active then
    DMInterface.ComponentLU.Refresh;
  DMInterface.SPUpdateComponents.ExecProc;
  if DMInterface.FBUnitsUpdate.Active then
    DMInterface.FBUnitsUpdate.Refresh;
  LastSupportDateLbl.Refresh;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.UpdateSupportProgress;
begin
  SupportProgressBar.Position := (ProgressInt * 100) /ProgressTotal;
  SupportProgressBar.Refresh;
end;

procedure TMainInterfaceF.UpdateTransactionProgress;
begin
  SCTransProgressBar.Position := (ProgressInt * 100) /ProgressTotal;
  SCTransProgressBar.Refresh;
end;

{
procedure TMainInterfaceF.InsertNewProduct(Prod_ID: Integer);
begin
//    DMInterface.SC2
  DMInterface.FBProducts.Insert;
  DMInterface.FBProductsPRODUCT_ID.Value := Prod_ID;
  DMInterface.FBProductsDESCRIPTION.Value := 'Unknown - Data Transfer';
  DMInterface.FBProductsCOST_PRICE.Value := 0;
  DMInterface.FBProductsPRODUCT_GROUP.Value := 0;
  DMInterface.FBProductsSELLING_PRICE.Value := 0;
  DMInterface.FBProductsIS_LABOUR.Value := 0;  // These are not labour products
  DMInterface.FBProductsIS_LISTED.Value := 1;  // It is listed
  DMInterface.FBProductsIS_CALCULATED.Value := 1; // These are base products
  DMInterface.FBProductsIS_ACTIVE.Value := 1;
  DMInterface.FBProductsLAST_UPDATED.Value := now();
  DMInterface.FBProducts.Post;
end;

procedure TMainInterfaceF.InsertAccountNumber(AccountNo: Integer);
begin
//    DMInterface.SC2
  DMInterface.FB_Accounts.Insert;
  DMInterface.FB_AccountsACCOUNT_NO.Value := AccountNo;
  DMInterface.FB_AccountsACCOUNT_TITLE.Value := 'Unknown Account';
  DMInterface.FB_AccountsACCOUNT_DESC.Value := '';
  DMInterface.FB_AccountsIS_PETTY_CASH.Value := 0;  // These are not labour products
  DMInterface.FB_AccountsIS_ACTIVE.Value := 1;  // It is listed
  DMInterface.FB_Accounts.Post;
end;

procedure TMainInterfaceF.InsertNewClient(Client_ID: Integer);
begin
  DMInterface.FB_Clients.Insert;
  DMInterface.FB_ClientsCLIENT_ID.Value := Client_ID;
  if DMInterface.SCClients.Locate('IdNumber', variant(Client_ID), []) then
    begin
    DMInterface.FB_ClientsLASTNAME.Value := DMInterface.SCClientsLastName.Value;
    DMInterface.FB_ClientsFIRSTNAME.Value := DMInterface.SCClientsFirstName.Value;
    end;
  DMInterface.FB_ClientsLASTNAME.Value := 'Unknown';
  DMInterface.FB_ClientsFIRSTNAME.Value := 'Person';
  DMInterface.FB_Clients.Post;
end;
}

procedure TMainInterfaceF.InsertNewStaff(Staff_ID: Integer);
begin
  DMInterface.FBStaff.Insert;
  DMInterface.FBStaffSTAFF_ID.Value := Staff_ID;
  if DMInterface.SCEmploys.Locate('IdNumber', variant(Staff_ID), []) then
    begin
    DMInterface.FBStaffLASTNAME.Value := DMInterface.SCEmploysLastName.Value;
    DMInterface.FBStaffFIRSTNAME.Value := DMInterface.SCEmploysFirstName.Value;
    DMInterface.FBStaffPRODUCER.Value := 1;
    DMInterface.FBStaffIS_ACTIVE.Value := 1;
    end;
  DMInterface.FBStaffLASTNAME.Value := 'Unknown';
  DMInterface.FBStaffFIRSTNAME.Value := 'Person';
  DMInterface.FBStaffPRODUCTION_PC.value := 100;
  DMInterface.FBStaff.Post;
end;

procedure TMainInterfaceF.cxButton3Click(Sender: TObject);
var
//  CurrentClientID, newtrans_id, Lindex, I, AccountIndex : Integer;
  I : Integer;
  ReachedEnd : Boolean;
  Varg1,{ Svarg, }Svarg1 : Variant;
begin
  screen.Cursor := crHourGlass;
  if Not DMInterface.SCDatabase.Connected then
    DMInterface.SCDatabase.Connected := True;
  if Not DMInterface.SC2TARIDB.Connected then
    DMInterface.SC2TARIDB.Connected := True;
  // let's assume we have connections
  // Apply a filter to source table
  DMInterface.SCHistory.Active := False;
//  DMInterface.SCHistory.IndexName := 'DateClient';
  DMInterface.SCHistory.Filtered := False;
  DMInterface.SCHistory.Filter := '(Date >= ''' + Datetostr(SCStartdate.Date) + ''') and (Date <= ''' + Datetostr(SCEndDate.date) + ''')';
  DMInterface.SCHistory.Filtered := True;
  DMInterface.SCHistory.Active := True;
  DMInterface.SCEmployeeHours.Active := False;
  DMInterface.SCEmployeeHours.Filtered := False;
  DMInterface.SCEmployeeHours.Filter := '(LogOff >= ''' + Datetostr(SCStartdate.Date) + ''') and (LogOff <= ''' + Datetostr(SCEndDate.date) + ''')';
  DMInterface.SCEmployeeHours.Filtered := True;
  DMInterface.SCEmployeeHours.Active := True;
  // Delete transaction from Destination Table
  // ie this will always insert transactions
  ProgressTotal := DMInterface.SCHistory.RecordCount + DMInterface.SCEmployeeHours.RecordCount;
  ProgressInt := 0;
  // Used for components lokup
  Svarg1 := VarArrayCreate([0, 1], varVariant);
  // Copy History
  // A new tranaction is based on a new Client_ID
  I := 0;
  ReachedEnd := False;
  DMInterface.SPDeleteHistory.ExecProc;
  DMInterface.FBHistory.Refresh;

  while (ReachedEnd = False) do
    begin
    DMInterface.SCHistory.active := False;
    DMInterface.SCHistory.Filter := 'Date = ''' + Datetostr(Trunc(SCStartdate.Date) + I) + '''';
    DMInterface.SCHistory.Filtered := True;
    DMInterface.SCHistory.Active := True;
    Inc(I);
    while DMInterface.SCHistory.Eof = false do
      begin
      DMInterface.FBHistory.Insert;
      DMInterface.FBHistoryCLIENTIDNUMBER.Value := DMInterface.SCHistoryClientIdNumber.Value;
      DMInterface.FBHistoryTRANS_DATE.Value := DMInterface.SCHistoryDate.Value;
      DMInterface.FBHistoryPOSTRANSNUM.Value := DMInterface.SCHistoryPOSTransNum.Value;
      DMInterface.FBHistorySERVICE.Value := DMInterface.SCHistoryService.Value;
      DMInterface.FBHistoryBLOCK.Value := DMInterface.SCHistoryBlock.Value;
      DMInterface.FBHistorySTYLISTIDNUMBER.Value := DMInterface.SCHistoryStylistIdNumber.Value;
      DMInterface.FBHistoryQUANTITY.Value := DMInterface.SCHistoryQuantity.Value;
      DMInterface.FBHistoryDISCOUNT.Value := DMInterface.SCHistoryDiscount.Value;
      DMInterface.FBHistoryTAX.Value := DMInterface.SCHistoryTax.Value;
      DMInterface.FBHistoryAMOUNT.Value := DMInterface.SCHistoryAmount.Value;
      DMInterface.FBHistorySTYLISTPOINTS.Value := DMInterface.SCHistoryStylistPoints.Value;
      DMInterface.FBHistoryDISCOUNTREASON.Value := DMInterface.SCHistoryDiscountReason.Value;
      DMInterface.FBHistoryTAXID.Value := DMInterface.SCHistoryTaxId.Value;
      DMInterface.FBHistory.Post;
      Inc(ProgressInt);
      UpdateTransactionProgress;
      DMInterface.SCHistory.Next;
      end;
    if (I > trunc(SCEnddate.Date) - trunc(SCStartdate.Date)) then
      ReachedEnd := True;
    end;    // while

  // here we develop a DB procedure to place the above into the correct tables
  // Date Client posnumber order
  DMInterface.SP_Post_Trans.Active := False;
  DMInterface.SP_Post_Trans.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMInterface.SP_Post_Trans.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  DMInterface.SP_Post_Trans.ExecProc;
  DMInterface.SP_Post_Trans.Active := False;
  DMInterface.FBTRans.Refresh;
  DMInterface.FBDailyTrans.Refresh;
  DMInterface.FB_Account_Trans.Refresh;
  // Here is the old code
  {
    // Copy History
  // A new tranaction is based on a new Client_ID
  I := 0;
  ReachedEnd := False;
  while (ReachedEnd = False) do
    begin
    DMInterface.SCHistory.active := False;
    DMInterface.SCHistory.Filter := 'Date = ''' + Datetostr(Trunc(SCStartdate.Date) + I) + '''';
    DMInterface.SCHistory.Filtered := True;
    DMInterface.SCHistory.Active := True;
    Inc(I);
//    DMInterface.SCHistory.First;
    CurrentClientID := 0;
    Lindex := 1;
    AccountIndex := 1;
    newtrans_id := 0;
    while DMInterface.SCHistory.Eof = false do
      begin
      if (DMInterface.SCHistoryService.Value >= 2000000) and (DMInterface.SCHistoryService.Value <= 2999999) then
        begin
        DMInterface.FB_Account_Trans.Insert;
        DMInterface.FB_Account_TransTRANS_DATE.Value := DMInterface.SCHistoryDate.Value;
        DMInterface.FB_Account_TransTRANS_ID.Value := AccountIndex;
        Inc(AccountIndex);
        if not DMInterface.FB_Accounts.Locate('ACCOUNT_NO', variant(DMInterface.SCHistoryService.Value), []) then
          InsertAccountNumber(DMInterface.SCHistoryService.Value);
        DMInterface.FB_Account_TransACCOUNT_NO.Value := DMInterface.SCHistoryService.Value;
        DMInterface.FB_Account_TransAMOUNT_PAID.Value := DMInterface.SCHistoryAmount.Value * -1;
        DMInterface.FB_Account_Trans.Post;
        end
      else
        begin
        if DMInterface.SCHistoryClientIdNumber.Value <> CurrentClientID then
          begin
          CurrentClientID := DMInterface.SCHistoryClientIdNumber.Value;
          newtrans_id := DMInterface.FBTRans.GeneratorValue('GEN_TRANSACTIONS_ID', 1);
          DMInterface.FBTRans.Insert;
          DMInterface.FBTRansTRANS_ID.Value := newtrans_id;
          DMInterface.FBTRansTRANS_DATE.Value := DMInterface.SCHistoryDate.Value;
          if not DMInterface.FB_Clients.Locate('CLIENT_ID', variant(DMInterface.SCHistoryClientIdNumber.Value), []) then
            InsertNewClient(DMInterface.SCHistoryClientIdNumber.Value);
          DMInterface.FBTRansCLIENT_ID.Value := DMInterface.SCHistoryClientIdNumber.Value;
          DMInterface.FBTRans.Post;
          Lindex := 1;
          end;
        DMInterface.FBDailyTrans.Insert;
        DMInterface.FBDailyTransTRANS_ID.Value := newtrans_id;
        DMInterface.FBDailyTransLINE_INDEX.Value := Lindex;
        inc(Lindex);
        if not DMInterface.FBProducts.Locate('PRODUCT_ID', variant(DMInterface.SCHistoryService.Value), []) then
          InsertNewProduct(DMInterface.SCHistoryService.Value);
        // here we decide if the real service is identified. If the service is included in Product components
        // then we use the block number to select the real service.
        svarg := DMInterface.SCHistoryService.Value;
        if DMInterface.FB_Components.Locate('PRODUCT_ID', SVarg, []) then
          begin
          Svarg1[0] := DMInterface.SCHistoryService.Value;
          Svarg1[1] := DMInterface.SCHistoryBlock.Value;
          if DMInterface.FB_Components.Locate('PRODUCT_ID;COMPONENT_ORDER', SVarg1, []) then
            DMInterface.FBDailyTransPRODUCT_ID.Value := DMInterface.FB_ComponentsCOMPONENT_ID.Value
          else
            DMInterface.FBDailyTransPRODUCT_ID.Value := DMInterface.SCHistoryService.Value;
          end
        else
          DMInterface.FBDailyTransPRODUCT_ID.Value := DMInterface.SCHistoryService.Value;
        DMInterface.FBDailyTransSTAFF_ID.Value := DMInterface.SCHistoryStylistIdNumber.Value;
        if DMInterface.SCHistoryAmount.Value = 0 then
          DMInterface.FBDailyTransINTERNAL.Value := 1
        else
          DMInterface.FBDailyTransINTERNAL.Value := 0;
        DMInterface.FBDailyTransQUANTITY.Value := DMInterface.SCHistoryQuantity.value;
        if (DMInterface.SCHistoryService.Value >= 1000000) and (DMInterface.SCHistoryService.Value <= 1100000) then
        // get get the net tax amount
          DMInterface.FBDailyTransNET_SALE_VALUE.Value := 0
        else
          // get get the net tax amount
          DMInterface.FBDailyTransNET_SALE_VALUE.Value := DMInterface.SCHistoryAmount.Value - DMInterface.SCHistoryTax.Value;
        DMInterface.FBDailyTrans.Post;
        end;
      Inc(ProgressInt);
      UpdateTransactionProgress;
      DMInterface.SCHistory.Next;
      end;    // while
    if (I > trunc(SCEnddate.Date) - trunc(SCStartdate.Date)) then
      ReachedEnd := True;
    end;    // while

}
// Now we import Staff Hours - Do this based on an option
// First Delete all staff minutes logged for the period concerned by a stored procedure
  DMInterface.FB_Zero_Paid_Hours.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMInterface.FB_Zero_Paid_Hours.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  DMInterface.FB_Zero_Paid_Hours.ExecProc;
  DMInterface.FB_DailyHours.Refresh;
  Varg1 := VarArrayCreate([0, 1], varVariant);
  while DMInterface.SCEmployeeHours.Eof = False do
    begin
    varg1[0] := trunc(DMInterface.SCEmployeeHoursLogOff.Value);
    Varg1[1] := DMInterface.SCEmployeeHoursEmployeeId.Value;
    if not DMInterface.FB_DailyHours.Locate('STAFF_DATE;STAFF_ID', Varg1, []) then
      begin
      if Not DMInterface.FBStaff.Locate('STAFF_ID', variant(DMInterface.SCEmployeeHoursEmployeeId.Value), []) then
        InsertNewStaff(DMInterface.SCEmployeeHoursEmployeeId.Value);
      DMInterface.FB_DailyHours.Insert;
      DMInterface.FB_DailyHoursSTAFF_DATE.value := trunc(DMInterface.SCEmployeeHoursLogOff.Value);
      DMInterface.FB_DailyHoursSTAFF_ID.value := DMInterface.SCEmployeeHoursEmployeeId.Value;
      end
    else
      DMInterface.FB_DailyHours.edit;
    DMInterface.FB_DailyHoursMINUTES_LOGGED.Value := DMInterface.FB_DailyHoursMINUTES_LOGGED.Value + Trunc(1400 * (DMInterface.SCEmployeeHoursLogOFF.Value - DMInterface.SCEmployeeHoursLogOn.Value));
    DMInterface.FB_DailyHours.Post;
    DMInterface.SCEmployeeHours.Next;
    Inc(ProgressInt);
    UpdateTransactionProgress;
    end;    // while
  ProgressInt := 0;
  UpdateTransactionProgress;
//  DMInterface.SCHistory.Active := False;
//  DMInterface.SCHistory.IndexName := 'Unique History';
//  DMInterface.SCHistory.Active := True;
  DMInterface.SetLastTransDate(now);
  LastTransDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMInterface.GetLastTransDate);
  LastTransDateLbl.Refresh;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.SC2TariExitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TMainInterfaceF.cxButton4Click(Sender: TObject);
begin
  DMInterface.FBUnitsUpdate.Active := True;
  Application.CreateForm(TTARITimesF, TARITimesF);
  TARITIMESF.formstarted := True;
  TARITimesF.ShowModal;
  TARITimesF.free;
  DMInterface.FBUnitsUpdate.Active := False;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.cxButton5Click(Sender: TObject);
begin
  if Not DMInterface.SCDatabase.Connected then
    DMInterface.SCDatabase.Connected := True;
  if Not DMInterface.SC2TARIDB.Connected then
    DMInterface.SC2TARIDB.Connected := True;
  Application.CreateForm(TSCReportsF, SCReportsF);
  SCReportsF.showmodal;
  SCReportsF.free;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.UpdateTARIBtnClick(Sender: TObject);
begin
  if not TARIDM.ClientDatabase.Connected then
    begin
    showMessage('Not connected to TARI for Business Database. Call Support!');
    exit;
    end;
  if ((DMInterface.GetTARIServiceDept = -1) or (DMInterface.GetTARISalesDept = -1))
     and (TARIDM.ClientDatabase.Connected) then
    begin
    Application.CreateForm(TSCSetupF, SCSetupF);
    SCSetupf.Showmodal;
    SCSetupf.free;
    end;
  screen.Cursor := crHourglass;
  if (DMInterface.GetTARIServiceDept <> -1) AND (DMInterface.GetTARISalesDept <> -1)
     and (TARIDM.ClientDatabase.Connected) then
    TARIDM.UpdateTariSaleTracking;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.cxButton6Click(Sender: TObject);
begin
  Application.CreateForm(TTARIStaffF, TARIStaffF);
  TARIStaffF.formstarted := True;
  TARIStaffF.ShowModal;
  TARIStaffF.free;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.AccountMappingBtnClick(Sender: TObject);
begin
  screen.Cursor := crHourglass;
  DMInterface.MatchTemplate;
  TARIDM.MappingComplete;
  Application.CreateForm(TImpTemplatesF, ImpTemplatesF);
  ImpTemplatesF.ShowModal;
  ImpTemplatesF.Free;
  screen.Cursor := crDefault;
end;

procedure TMainInterfaceF.UpdateTARIExpensesBtnClick(Sender: TObject);
begin
  if not TARIDM.ClientDatabase.Connected then
    begin
    showMessage('Not connected to TARI for Business Database. Call Support!');
    exit;
    end;
  if Not TARIDM.MappingComplete then
    AccountMappingBtnClick(Sender);
  screen.Cursor := crHourglass;
  if (DMInterface.GetTARIServiceDept <> -1)
     and (TARIDM.ClientDatabase.Connected) then
    TARIDM.UPdateExpenses;
  screen.Cursor := crDefault;
end;

initialization
  GGlobals := TSCInterGlobals.Create;
  if Not GGlobals.SecondInstance then
    begin
    GGlobals.initFailed := False;
    GGlobals.LoadData;
    NewFileName := '';
    if (Not GetTARIInterfaceINI) then
       GGlobals.initFailed := True;

    if (not GGlobals.initFailed) and (not Fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + ExtractFileName(GGlobals.TARIInterfaceDBPath))) then
      begin
      If (InputQuery('New Shortcuts Interface File', 'Enter File Name', NewFileName)) then
        begin
        newFileName := ChangeFileext(NewFileName, '.FDB');
        GGlobals.TARIInterfaceDBPath := GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + NewFileName;
        if not GGlobals.CopyMastFile(GGlobals.Servers.CurrentServer.NetworkFolder + 'proto\SHORTCUTSMASTER.FDB', GGlobals.TARIInterfaceDBPath) then
          begin
          showmessage('Failed to create Interface Master File');
          GGlobals.initFailed := True;
          end
        else
          begin
          UpdateTARIInterfaceINI;
          end;
        end
      else
        GGlobals.initFailed := True;
      end;
    GGlobals.DebugOut('Init Phase 1');
    if not GGlobals.initFailed then
      begin
      GGlobals.DebugOut('Init Phase 2');
      Application.CreateForm(TDMInterface, DMInterface);
      Application.CreateForm(TTARIDM, TARIDM);
      if not SameText(GGLobals.Servers.CurrentServer.ServerName, GGLobals.TARIServer) then
        GGLobals.Servers.SetCurrentServer(GGLobals.TARIServer);
      GGlobals.DebugOut('Init Phase 3');

      If Not OpenClientDB then
        begin
        showMessage('Failed to open TARI Database File');
        GGlobals.initFailed := True;
        end;
      GGlobals.DebugOut('Init Phase 4 - Interface Server is ' + GGlobals.TARIInterfaceServer);
      DMInterface.SC2TARIDB.Server := GGlobals.TARIInterfaceServer;
      GGlobals.DebugOut('Init Phase 5 - Path is ' + GGlobals.TARIInterfaceDBPath);
      DMInterface.SC2TARIDB.Path := GGlobals.TARIInterfaceDBPath;
      GGlobals.DebugOut('Init Phase 6');
      DMInterface.SC2TARIDB.Connected := True;
      GGlobals.DebugOut('Init Phase 7');
      DMInterface.SCPath := DMInterface.GetSCPath;
      GGlobals.DebugOut('Init Phase 8');
      if (Length(NewFileName) > 0)  and (TARIDM.ClientDatabase.Connected) then
        begin
        UpdateTARIInterfaceINI;
        Application.CreateForm(TSCSetupF, SCSetupF);
        SCSetupf.Showmodal;
        SCSetupf.free;
        end;
      end;
    end;

Finalization
if Not GGlobals.Secondinstance then
  begin
  GGlobals.DebugOut('On Finalization');
  GGlobals.Destroy;
  end;

end.
