unit SCDM;

interface

uses
  SysUtils, Classes, DB, DBTables, Messages, IB_Components, IBODataset,
  SCInterGlobals, Variants, cxStyles, cxClasses, cxGridTableView, dialogs,
  IB_Process, IB_Script, SqlExpr;

const
  // these definition are for the System Data Table
  SCDBPATH = 1;
  SCDBTYPE = 2;
  LASTSUPPORTDATE = 3;
  LASTTRANSDATE = 4;
  TARISERVICEDEPT = 5;
  TARISALESDEPT = 6;
  TARIUPDATETIME = 7;
  TARIUPDATEPOTENTIAL = 8;
  SERVICEACTIVE = 9;
  STAFFACTIVE = 10;

type
  TDMInterface = class(TDataModule)
    SCDatabase: TDatabase;
    SCHistory: TTable;
    SCHistoryClientIdNumber: TIntegerField;
    SCHistoryDate: TDateField;
    SCHistoryPOSTransNum: TSmallintField;
    SCHistoryService: TIntegerField;
    SCHistoryBlock: TSmallintField;
    SCHistoryStylistIdNumber: TSmallintField;
    SCHistoryQuantity: TFloatField;
    SCHistoryDiscount: TCurrencyField;
    SCHistoryTax: TCurrencyField;
    SCHistoryAmount: TCurrencyField;
    SCHistoryStylistPoints: TFloatField;
    SCHistoryDiscountReason: TSmallintField;
    SCHistoryTaxId: TSmallintField;
    DSSCHistory: TDataSource;
    DSSCProducts: TDataSource;
    SCProducts: TTable;
    SCServices: TTable;
    SCProductsIdNumber: TIntegerField;
    SCProductsName: TStringField;
    SCProductsBuyPrice: TCurrencyField;
    SCServicesIdNumber: TIntegerField;
    SCServicesCategory: TSmallintField;
    SCServicesService: TStringField;
    SCServicesTime1: TSmallintField;
    SCCategory: TTable;
    SCCategoryIdNumber: TSmallintField;
    SCCategoryName: TStringField;
    SCEmploys: TTable;
    SCEmploysIdNumber: TSmallintField;
    SCEmploysLastName: TStringField;
    SCEmploysFirstName: TStringField;
    SC2TARIDB: TIBODatabase;
    FBTRans: TIBOTable;
    FBTRansTRANS_ID: TIntegerField;
    FBTRansTRANS_DATE: TDateField;
    FBTRansCLIENT_ID: TIntegerField;
    FBDailyTrans: TIBOTable;
    FBDailyTransTRANS_ID: TIntegerField;
    FBDailyTransLINE_INDEX: TIntegerField;
    FBDailyTransPRODUCT_ID: TIntegerField;
    FBDailyTransSTAFF_ID: TIntegerField;
    FBDailyTransINTERNAL: TSmallintField;
    FBDailyTransNET_SALE_VALUE: TBCDField;
    FBSystem_Data: TIBOTable;
    FBStaff: TIBOTable;
    FBProducts: TIBOTable;
    FBGroups: TIBOTable;
    FB_Components: TIBOTable;
    FBSystem_DataSYSTEM_ID: TIntegerField;
    FBSystem_DataSTR_FIELD: TStringField;
    FBSystem_DataINT_FIELD: TIntegerField;
    FBSystem_DataNUM_FIELD: TBCDField;
    FBStaffSTAFF_ID: TIntegerField;
    FBStaffLASTNAME: TStringField;
    FBStaffFIRSTNAME: TStringField;
    FBProductsPRODUCT_ID: TIntegerField;
    FBProductsDESCRIPTION: TStringField;
    FBProductsPRODUCT_GROUP: TIntegerField;
    FBProductsIS_LABOUR: TSmallintField;
    FBProductsIS_LISTED: TSmallintField;
    FBProductsIS_CALCULATED: TSmallintField;
    FBProductsSELLING_PRICE: TBCDField;
    FBProductsCOST_PRICE: TBCDField;
    FBProductsUNITS: TBCDField;
    FBProductsUNITS_LABOUR: TBCDField;
    FBProductsSTOCK_ON_HAND: TBCDField;
    FBProductsSTOCK_MIN: TBCDField;
    FBProductsSTOCK_REORDER: TBCDField;
    FBProductsLAST_UPDATED: TDateTimeField;
    FBGroupsGROUP_ID: TIntegerField;
    FBGroupsGROUP_NAME: TStringField;
    FB_ComponentsPRODUCT_ID: TIntegerField;
    FB_ComponentsCOMPONENT_ID: TIntegerField;
    FB_ComponentsCOMPONENT_QTY: TBCDField;
    FBSystem_DataDATE_FIELD: TDateTimeField;
    DSFBTRans: TDataSource;
    DSFBDailyTrans: TDataSource;
    DSFBSystem_data: TDataSource;
    DSFBStaff: TDataSource;
    DSFBProducts: TDataSource;
    DSFBGroups: TDataSource;
    DSFBComponents: TDataSource;
    SCProductsCategoryId: TSmallintField;
    FBDailyTransQUANTITY: TBCDField;
    IB_Query1: TIB_Query;
    SCPettyCash: TTable;
    SCPettyCashPettyCashId: TIntegerField;
    SCPettyCashName: TStringField;
    SCPettyCashDescription: TStringField;
    SCPettyCashActive: TSmallintField;
    SCPettyCashIsPettyCash: TSmallintField;
    FB_Accounts: TIBOTable;
    FB_AccountsACCOUNT_NO: TIntegerField;
    FB_AccountsACCOUNT_TITLE: TStringField;
    FB_AccountsACCOUNT_DESC: TStringField;
    FB_AccountsIS_PETTY_CASH: TSmallintField;
    FB_AccountsIS_ACTIVE: TSmallintField;
    FB_Account_Trans: TIBOTable;
    FB_Account_TransTRANS_DATE: TDateField;
    FB_Account_TransTRANS_ID: TIntegerField;
    FB_Account_TransACCOUNT_NO: TIntegerField;
    FB_Account_TransAMOUNT_PAID: TBCDField;
    IB_Query2: TIB_Query;
    SCProductsSellPrice: TCurrencyField;
    SCServicesCost: TCurrencyField;
    SP_Post_Trans: TIBOStoredProc;
    SCClients: TTable;
    SCClientsIdNumber: TIntegerField;
    SCClientsLastName: TStringField;
    SCClientsFirstName: TStringField;
    FB_Clients: TIBOTable;
    FB_ClientsCLIENT_ID: TIntegerField;
    FB_ClientsLASTNAME: TStringField;
    FB_ClientsFIRSTNAME: TStringField;
    DSFBAccounts: TDataSource;
    DSFBAccount_Trans: TDataSource;
    DSFBClients: TDataSource;
    SCSundry: TTable;
    SCSundryIdNumber: TIntegerField;
    SCSundryName: TStringField;
    SCSundryDefaultAmount: TCurrencyField;
    SCEmployeeHours: TTable;
    SCEmployeeHoursEmployeeId: TSmallintField;
    SCEmployeeHoursLogOff: TDateTimeField;
    SCEmployeeHoursLogOn: TDateTimeField;
    FB_DailyHours: TIBOTable;
    FBStaffPRODUCTION_PC: TBCDField;
    FB_DailyHoursSTAFF_DATE: TDateField;
    FB_DailyHoursSTAFF_ID: TIntegerField;
    FB_DailyHoursMINUTES_LOGGED: TIntegerField;
    DSFBDailyHours: TDataSource;
    IB_Query3: TIB_Query;
    FBUnitsUpdate: TIBOQuery;
    DSFBUnitsUpdate: TDataSource;
    FBUnitsUpdatePRODUCT_ID: TIntegerField;
    FBUnitsUpdatePROD_GROUP: TStringField;
    FBUnitsUpdateDESCRIPTION: TStringField;
    FBUnitsUpdateSELLING_PRICE: TBCDField;
    FBUnitsUpdateUNITS_LABOUR: TBCDField;
    FBUnitsUpdateLAST_UPDATED: TDateTimeField;
    FBUnitsUpdateTARI_Rate: TCurrencyField;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    TARI_DEV_ExpressStyle: TcxGridTableViewStyleSheet;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    GridTableViewStyleSheetUserFormat1: TcxGridTableViewStyleSheet;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    GridTableViewStyleSheetBrick: TcxGridTableViewStyleSheet;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    GridTableViewStyleSheetDesert: TcxGridTableViewStyleSheet;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    GridTableViewStyleSheetLilac: TcxGridTableViewStyleSheet;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    GridTableViewStyleSheetRainyDay: TcxGridTableViewStyleSheet;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    GridTableViewStyleSheetWheat: TcxGridTableViewStyleSheet;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    SCSystemSettings: TTable;
    SCSystemSettingsId: TIntegerField;
    SCSystemSettingsValue: TStringField;
    FBStaffReport: TIBOQuery;
    FBStaffReportFIRSTNAME: TStringField;
    FBStaffReportLASTNAME: TStringField;
    FBStaffReportSALES: TBCDField;
    FBStaffReportCOGS: TBCDField;
    FBStaffReportTOTAL_MINS: TBCDField;
    FBStaffReportFULLNAME: TStringField;
    FBStaffReportTARI_RATE: TCurrencyField;
    FBStaffReportTARI_HOURS: TCurrencyField;
    DSStaffReport: TDataSource;
    FBStaffReportGROSS_PROFIT: TCurrencyField;
    FBStaffReportPRODUCTIVITY: TCurrencyField;
    FBStaffPaidHours: TIBOQuery;
    FBStaffPaidHoursSTAFF_ID: TIntegerField;
    FBStaffPaidHoursPAID_MINUTES: TLargeintField;
    DSStaffPaidHours: TDataSource;
    FBStaffReportSTAFF_ID: TIntegerField;
    FBStaffReportPAID_MINUTES: TIntegerField;
    FBStaffReportPAID_HOURS: TCurrencyField;
    FBClientReport: TIBOQuery;
    FBTransactionsReport: TIBOQuery;
    FBClientReportFIRSTNAME: TStringField;
    FBClientReportLASTNAME: TStringField;
    FBClientReportSALES: TBCDField;
    FBClientReportCOGS: TBCDField;
    FBClientReportTOTAL_MINS: TBCDField;
    FBTransactionsReportTRANS_ID: TIntegerField;
    FBTransactionsReportTRANS_DATE: TDateField;
    FBTransactionsReportFIRSTNAME: TStringField;
    FBTransactionsReportLASTNAME: TStringField;
    FBTransactionsReportSALES: TBCDField;
    FBTransactionsReportCOGS: TBCDField;
    FBTransactionsReportTOTAL_MINS: TBCDField;
    FBClientReportLAST_DATE: TDateField;
    FB_TARIServiceUPDATE: TIBOQuery;
    FB_TARIServiceUPDATETRANS_ID: TIntegerField;
    FB_TARIServiceUPDATETRANS_DATE: TDateField;
    FB_TARIServiceUPDATESALES: TBCDField;
    FB_TARIServiceUPDATECOGS: TBCDField;
    FB_TARIServiceUPDATETOTAL_MINS: TBCDField;
    FB_TARIRetailUPDATE: TIBOQuery;
    FB_TARIRetailUPDATETRANS_ID: TIntegerField;
    FB_TARIRetailUPDATETRANS_DATE: TDateField;
    FB_TARIRetailUPDATESALES: TBCDField;
    FB_TARIRetailUPDATECOGS: TBCDField;
    FB_TARIRetailUPDATETOTAL_MINS: TBCDField;
    SCServicesPoints: TSmallintField;
    SCServicesText1: TStringField;
    SCServicesBreak1: TSmallintField;
    SCServicesCost1: TCurrencyField;
    SCServicesPoints1: TSmallintField;
    SCServicesCount1: TSmallintField;
    SCServicesText2: TStringField;
    SCServicesTime2: TSmallintField;
    SCServicesBreak2: TSmallintField;
    SCServicesCost2: TCurrencyField;
    SCServicesPoints2: TSmallintField;
    SCServicesCount2: TSmallintField;
    SCServicesText3: TStringField;
    SCServicesTime3: TSmallintField;
    SCServicesBreak3: TSmallintField;
    SCServicesCost3: TCurrencyField;
    SCServicesPoints3: TSmallintField;
    SCServicesCount3: TSmallintField;
    SCServicesText4: TStringField;
    SCServicesTime4: TSmallintField;
    SCServicesBreak4: TSmallintField;
    SCServicesCost4: TCurrencyField;
    SCServicesPoints4: TSmallintField;
    SCServicesCount4: TSmallintField;
    SCServicesText5: TStringField;
    SCServicesTime5: TSmallintField;
    SCServicesBreak5: TSmallintField;
    SCServicesCost5: TCurrencyField;
    SCServicesPoints5: TSmallintField;
    SCServicesCount5: TSmallintField;
    SCServicesText6: TStringField;
    SCServicesTime6: TSmallintField;
    SCServicesCost6: TCurrencyField;
    SCServicesPoints6: TSmallintField;
    SCServicesCount6: TSmallintField;
    SCServicesCountFlag: TSmallintField;
    SCServicesActive: TSmallintField;
    SCServicesChemical: TSmallintField;
    SCServicesMainBlock: TSmallintField;
    SCServicesTaxId: TSmallintField;
    FB_ComponentsCOMPONENT_ORDER: TIntegerField;
    qryAddSubProducts: TIBOQuery;
    qryAddSubProductsPRODUCT_ID: TIntegerField;
    qryAddSubProductsDESCRIPTION: TStringField;
    qryAddSubProductsPRODUCT_GROUP: TIntegerField;
    qryAddSubProductsIS_LABOUR: TSmallintField;
    qryAddSubProductsIS_LISTED: TSmallintField;
    qryAddSubProductsIS_CALCULATED: TSmallintField;
    qryAddSubProductsSELLING_PRICE: TBCDField;
    qryAddSubProductsCOST_PRICE: TBCDField;
    qryAddSubProductsUNITS: TBCDField;
    qryAddSubProductsUNITS_LABOUR: TBCDField;
    qryAddSubProductsLAST_UPDATED: TDateTimeField;
    SPUpdateComponents: TIBOStoredProc;
    DSComponentLU: TDataSource;
    ComponentLU: TIBOTable;
    ComponentLUPRODUCT_ID: TIntegerField;
    ComponentLUDESCRIPTION: TStringField;
    ComponentLUSELLING_PRICE: TBCDField;
    ComponentLUUNITS_LABOUR: TBCDField;
    FBComponentsLU: TIBOTable;
    FBComponentsLUPRODUCT_ID: TIntegerField;
    FBComponentsLUCOMPONENT_ID: TIntegerField;
    FBComponentsLUCOMPONENT_ORDER: TIntegerField;
    FBComponentsLUCOMPONENT_QTY: TBCDField;
    DSFBComponentLU: TDataSource;
    FBStaffHoursbyDate: TIBOQuery;
    FBStaffHoursbyDateSTAFF_DATE: TDateField;
    FB_Zero_Paid_Hours: TIBOStoredProc;
    FBStaffHoursbyDateSTAFF_ID: TIntegerField;
    FBStaffHoursbyDateMINUTES_LOGGED: TIntegerField;
    FBStaffPRODUCER: TSmallintField;
    FBStaffIS_ACTIVE: TSmallintField;
    FBProductsIS_ACTIVE: TSmallintField;
    FBStaffReportPRODUCER: TSmallintField;
    SCProductsActive: TSmallintField;
    SCSundryActive: TSmallintField;
    SCEmploysActive: TSmallintField;
    DSSCServices: TDataSource;
    FBServicesReport: TIBOQuery;
    DSServicesReport: TDataSource;
    FBServicesReportDESCRIPTION: TStringField;
    FBServicesReportCOUNT: TIntegerField;
    FBServicesReportSALES: TBCDField;
    FBServicesReportTOTAL_MINS: TBCDField;
    FBHistory: TIBOTable;
    FBHistoryCLIENTIDNUMBER: TIntegerField;
    FBHistoryTRANS_DATE: TDateField;
    FBHistoryPOSTRANSNUM: TSmallintField;
    FBHistorySERVICE: TIntegerField;
    FBHistoryBLOCK: TSmallintField;
    FBHistorySTYLISTIDNUMBER: TIntegerField;
    FBHistoryQUANTITY: TIBOFloatField;
    FBHistoryDISCOUNT: TBCDField;
    FBHistoryTAX: TBCDField;
    FBHistoryAMOUNT: TBCDField;
    FBHistorySTYLISTPOINTS: TIBOFloatField;
    FBHistoryDISCOUNTREASON: TSmallintField;
    FBHistoryTAXID: TSmallintField;
    SPDeleteHistory: TIBOStoredProc;
    FB_UpdateScript: TIB_Script;
    SCTARIAccountLU: TIBOTable;
    SCTARIAccountLUACCOUNT_NO: TIntegerField;
    SCTARIAccountLUACCOUNT_TITLE: TStringField;
    SCTARIAccountLUACCOUNT_DESC: TStringField;
    SCTARIAccountLUIS_PETTY_CASH: TSmallintField;
    SCTARIAccountLUIS_ACTIVE: TSmallintField;
    FB_Tari_Mapping: TIBOTable;
    FB_Tari_MappingSC_ACCOUNT_NO: TIntegerField;
    FB_Tari_MappingSC_TITLE: TStringField;
    FB_Tari_MappingTARI_ACCOUNT: TIntegerField;
    DSTari_Mapping: TDataSource;
    qryFBTARIMapped: TIB_Query;
    SCSQLDatabase: TSQLConnection;
    SQHistory: TSQLTable;
    SQHistoryClientIdNumber: TIntegerField;
    SQHistoryDate: TSQLTimeStampField;
    SQHistoryPOSTransNum: TIntegerField;
    SQHistoryService: TIntegerField;
    SQHistoryBlock: TIntegerField;
    SQHistoryStylistIdNumber: TIntegerField;
    SQHistoryQuantity: TFloatField;
    SQHistoryDiscount: TFMTBCDField;
    SQHistoryTax: TFMTBCDField;
    SQHistoryAmount: TFMTBCDField;
    SQHistoryStylistPoints: TFloatField;
    SQHistoryDiscountReason: TIntegerField;
    SQHistoryTaxId: TIntegerField;
    SQHistoryHistoryID: TIntegerField;
    SQHistorySaleID: TIntegerField;
    SQHistoryTotalCostOfGoodsSold: TBCDField;
    SQProducts: TSQLTable;
    SQProductsIdNumber: TIntegerField;
    SQProductsName: TStringField;
    SQProductsSize: TIntegerField;
    SQProductsMax: TFloatField;
    SQProductsMin: TFloatField;
    SQProductsBuyPrice: TFMTBCDField;
    SQProductsSellPrice: TFMTBCDField;
    SQProductsCurrent: TFloatField;
    SQProductsOnOrder: TFloatField;
    SQProductsRecRetail: TFMTBCDField;
    SQProductsCompanyId: TIntegerField;
    SQProductsLineId: TIntegerField;
    SQProductsActive: TIntegerField;
    SQProductsRetail: TIntegerField;
    SQProductsPLU: TIntegerField;
    SQProductsBarcode: TStringField;
    SQProductsPurchaseTax: TIntegerField;
    SQProductsSaleTax: TIntegerField;
    SQProductsTaxExemption: TIntegerField;
    SQProductsProductCode: TStringField;
    SQProductsMinReOrder: TFloatField;
    SQProductsUnitOfMeasure: TIntegerField;
    SQProductsCategoryId: TIntegerField;
    SQProductsSubCategoryId: TIntegerField;
    SQProductsDefaultSupplierId: TIntegerField;
    SQProductsRequireSerial: TIntegerField;
    SQProductsFixedQty: TIntegerField;
    SQProductsPicture: TBlobField;
    SQProductsCannotOrderAfterDate: TSQLTimeStampField;
    SQProductsAverageCost: TFMTBCDField;
    SQProductsStockValue: TFMTBCDField;
    SQServices: TSQLTable;
    SQServicesIdNumber: TIntegerField;
    SQServicesCategory: TIntegerField;
    SQServicesService: TStringField;
    SQServicesCost: TFMTBCDField;
    SQServicesPoints: TIntegerField;
    SQServicesText1: TStringField;
    SQServicesTime1: TIntegerField;
    SQServicesBreak1: TIntegerField;
    SQServicesCost1: TFMTBCDField;
    SQServicesPoints1: TIntegerField;
    SQServicesCount1: TIntegerField;
    SQServicesText2: TStringField;
    SQServicesTime2: TIntegerField;
    SQServicesBreak2: TIntegerField;
    SQServicesCost2: TFMTBCDField;
    SQServicesPoints2: TIntegerField;
    SQServicesCount2: TIntegerField;
    SQServicesText3: TStringField;
    SQServicesTime3: TIntegerField;
    SQServicesBreak3: TIntegerField;
    SQServicesCost3: TFMTBCDField;
    SQServicesPoints3: TIntegerField;
    SQServicesCount3: TIntegerField;
    SQServicesText4: TStringField;
    SQServicesTime4: TIntegerField;
    SQServicesBreak4: TIntegerField;
    SQServicesCost4: TFMTBCDField;
    SQServicesPoints4: TIntegerField;
    SQServicesCount4: TIntegerField;
    SQServicesText5: TStringField;
    SQServicesTime5: TIntegerField;
    SQServicesBreak5: TIntegerField;
    SQServicesCost5: TFMTBCDField;
    SQServicesPoints5: TIntegerField;
    SQServicesCount5: TIntegerField;
    SQServicesText6: TStringField;
    SQServicesTime6: TIntegerField;
    SQServicesCost6: TFMTBCDField;
    SQServicesPoints6: TIntegerField;
    SQServicesCount6: TIntegerField;
    SQServicesCountFlag: TIntegerField;
    SQServicesActive: TIntegerField;
    SQServicesChemical: TIntegerField;
    SQServicesMainBlock: TIntegerField;
    SQServicesTaxId: TIntegerField;
    SQcategory: TSQLTable;
    SQcategoryIdNumber: TIntegerField;
    SQcategoryName: TStringField;
    SQEmploys: TSQLTable;
    SQEmploysIdNumber: TIntegerField;
    SQEmploysLastName: TStringField;
    SQEmploysFirstName: TStringField;
    SQEmploysActive: TIntegerField;
    SQPettyCash: TSQLTable;
    SQPettyCashPettyCashId: TIntegerField;
    SQPettyCashName: TStringField;
    SQPettyCashDescription: TStringField;
    SQPettyCashActive: TIntegerField;
    SQPettyCashTaxId: TIntegerField;
    SQPettyCashIsPettyCash: TIntegerField;
    SQClients: TSQLTable;
    SQClientsIdNumber: TIntegerField;
    SQClientsLastName: TStringField;
    SQClientsFirstName: TStringField;
    SQSundry: TSQLTable;
    SQSundryIdNumber: TIntegerField;
    SQSundryName: TStringField;
    SQSundryDefaultAmount: TFMTBCDField;
    SQSundryActive: TIntegerField;
    SQEmployeeHours: TSQLTable;
    SQEmployeeHoursEmployeeId: TIntegerField;
    SQEmployeeHoursLogOff: TSQLTimeStampField;
    SQEmployeeHoursLogOn: TSQLTimeStampField;
    SQSystemSettings: TSQLTable;
    SQSystemSettingsId: TIntegerField;
    SQSystemSettingsValue: TStringField;
    procedure SCDatabaseAfterConnect(Sender: TObject);
    procedure SCDatabaseBeforeConnect(Sender: TObject);
    procedure SC2TARIDBBeforeConnect(Sender: TIB_Connection);
    procedure SC2TARIDBAfterConnect(Sender: TIB_Connection);
    procedure SC2TARIDBBeforeDisconnect(Sender: TIB_Connection);
    procedure SCDatabaseBeforeDisconnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FBUnitsUpdateCalcFields(DataSet: TDataSet);
    procedure FBStaffReportCalcFields(DataSet: TDataSet);
    procedure qryComponentUpdateAfterEdit(DataSet: TDataSet);
    procedure SCSQLDatabaseBeforeConnect(Sender: TObject);
    procedure SCSQLDatabaseAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SCPath : String;
    BusinessEndofWeekDay : Integer;
    function GetSCPath: String;
    Procedure SetSCPath(Path: String);
    function GetSCDBType: TDatabaseType;
    Procedure SetSCDBType(dbType: TDatabaseType);
    function GetTARIServiceDept: Integer;
    Procedure SetTARIServiceDept(DeptID: Integer; DeptName: String);
    function GetTARISalesDept: Integer;
    Procedure SetTARISalesDept(DeptID: Integer; DeptName: String);
    function GetLastSupportDate: TDateTime;
    Procedure SetLastSupportDate(NewDate: TDateTime);
    function GetLastTransDate: TDateTime;
    Procedure SetLastTransDate(NewDate: TDateTime);
    function GetUpdateTimeValue: Integer;
    Procedure SetUpdateTimeValue(NewValue: Integer);
    function GetUpdatePotentialValue: Integer;
    Procedure SetUpdatePotentialValue(NewValue: Integer);
    function GetServiceActive: Boolean;
    Procedure SetServiceActive(NewValue: Boolean);
    function GetStaffActive: Boolean;
    Procedure SetStaffActive(NewValue: Boolean);
    procedure DeleteSalesDept;
    procedure DeleteServiceDept;
    procedure MatchTemplate;
  end;

var
  DMInterface: TDMInterface;

implementation

{$R *.dfm}

procedure TDMInterface.SCDatabaseAfterConnect(Sender: TObject);
var
  I: Integer;
  Indicies : Tstringlist;
  IdxFound : Boolean;
begin
  Indicies := Tstringlist.Create;
  SCHistory.Active := True;
  if SCHistory.Active then
    begin
    SCHistory.GetIndexNames(indicies);
    idxFound := False;
    for I := 0 to indicies.Count - 1 do    // Iterate
      begin
      if Indicies[I] = 'DateClient' then
        idxfound := True;
      end;
    Indicies.Free;
    SCHistory.Active := False;
    if idxFound then
      begin
      SCHistory.Exclusive := True;
      SCHistory.Active := True;
      if SCHistory.Active then
        SCHistory.DeleteIndex('DateClient');
      SCHistory.Active := False;
      SCHistory.Exclusive := False;
      end;

//    if not idxfound then
//      begin
//      showmessage('Press OK to build a new Index for History');
//      SCHistory.Exclusive := True;
//      SCHistory.Active := True;
//      if SCHistory.Active then
//        SCHistory.AddIndex('DateClient', 'Date;ClientIdNumber',[ixCaseInsensitive], '')
//      else
//        showmessage('Unable to create a new Index - Currently opened by Shortcuts.' + #13#10 + 'Reboot your computer and try before Shortcuts starts up.');
//      SCHistory.Active := False;
//      SCHistory.Exclusive := False;
//      showmessage('Index Built!');
//      end;
    SCHistory.IndexName := 'Unique History';
    SCHistory.Active := True;
    end;
  SCProducts.Active := True;
  SCServices.Active := True;
  SCCategory.Active := True;
  SCEmploys.Active := True;
  SCPettyCash.Active := True;
  SCClients.Active := True;
  SCSundry.Active := True;
  SCSystemSettings.Active := True;
  SCTARIAccountLU.Active := True;

  if SCSystemSettings.Locate('Id', Variant(28), []) then
    BusinessEndofWeekDay := SCSystemSettingsValue.AsInteger;
  if Not SCHistory.Active then
    showmessage('Failed to connect to History Table');
end;

procedure TDMInterface.SCDatabaseBeforeConnect(Sender: TObject);
var
  DBAliases : TstringList;
  I : Integer;
  AliasFound : Boolean;
  AParams: TStringList;
  Dir: string;
begin
  DBAliases := TStringList.Create;
  AliasFound := False;
  session.NetFileDir := ExtractFileDrive(SCPath) + '\';
  try
    Session.GetAliasNames(DBAliases);
    { fill a list box with alias names for the user to select from }
    for I := 0 to DBAliases.Count - 1 do
      if DBAliases[i] = 'SC2TARI' then
        AliasFound := True;
  finally
  DBAliases.Free;
  end;

  if AliasFound then
    begin
    AParams := TStringList.Create;
      try
      // get the current PATH parameter
      Session.GetAliasParams('SC2TARI',AParams);
      Dir := Copy(AParams.Strings[0],6,255);
      // Update the alias parameters
      AParams.Clear;
      AParams.Add('PATH=' + SCPath);
      Session.ModifyAlias('SC2TARI',AParams);
      Session.SaveConfigFile;
      finally
        AParams.Free;
      end;
    end
  else
    begin
    if not Session.IsAlias('SC2TARI') then
      begin
      session.AddStandardAlias('SC2TARI',SCPath,'Paradox');
      end;
    end;
   Scdatabase.AliasName := 'SC2TARI';
end;

procedure TDMInterface.MatchTemplate;
var
  Varg : Variant;
begin
  FB_Accounts.First;
  while FB_Accounts.Eof = False do
    begin
    Varg := FB_AccountsACCOUNT_NO.Value;
    if not FB_TARI_Mapping.locate('SC_ACCOUNT_NO', varg, []) then
      begin
      FB_Tari_Mapping.insert;
      FB_Tari_MappingSC_ACCOUNT_NO.Value := FB_AccountsACCOUNT_NO.value;
      end
    else
      FB_Tari_Mapping.Edit;
    FB_Tari_MappingSC_TITLE.Value := FB_AccountsACCOUNT_TITLE.value;
    FB_Tari_Mapping.post;
    FB_Accounts.Next;
    end;    // while
end;

procedure TDMInterface.SC2TARIDBBeforeConnect(Sender: TIB_Connection);
begin
  // standard            GGlobals.Servers.CurrentServer.servername
  SC2TARIDB.Server := GGLobals.Servers.CurrentServer.ServerName;
  SC2TARIDB.Username := 'SYSDBA';
  SC2TARIDB.Password := 'masterkey';
  SC2TARIDB.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
end;

procedure TDMInterface.SC2TARIDBAfterConnect(Sender: TIB_Connection);
begin
// before we activate tables look for an update
  if Fileexists(GGlobals.BaseDir + '\Proto\SCDBUpdate.sql') then
    begin
    fb_Updatescript.SQL.LoadFromFile(GGlobals.BaseDir + '\Proto\SCDBUpdate.sql');
    fb_UpdateScript.Execute;
    if not FB_UpdateScript.ExecutingFailed then
      deletefile(GGlobals.BaseDir + '\Proto\SCDBUpdate.sql');
    end;
  FBTRans.Active := True;
  FBDailyTrans.Active := True;
  FBSystem_Data.Active := True;
  FBStaff.Active := True;
  FBProducts.Active := True;
  FBGroups.Active := True;
  FB_Components.Active := True;
  FB_Accounts.Active := True;
  FB_Account_Trans.Active := True;
  FB_Clients.Active := True;
  FB_DailyHours.Active := True;
  FB_Tari_Mapping.Active := True;
  FBComponentsLU.Active := True;
  FBHistory.Active := True;
  ComponentLU.Active := True;
end;

procedure TDMInterface.SC2TARIDBBeforeDisconnect(Sender: TIB_Connection);
begin
{  FBTRans.Active := False;
  FBDailyTrans.Active := False;
  FBSystem_Data.Active := False;
  FBStaff.Active := False;
  FBProducts.Active := False;
  FBGroups.Active := False;
  FB_Components.Active := False;
}
end;

procedure TDMInterface.SCDatabaseBeforeDisconnect(Sender: TObject);
begin
{
  SCHistory.Active := False;
  SCProducts.Active := False;
  SCServices.Active := False;
  SCCategory.Active := False;
  SCEmploys.Active := False;
}
end;

function TDMInterface.GetSCPath: String;
var
  varg : Variant;
begin
  Result := '';
  if not FBSystem_Data.Active then exit;
  Varg := SCDBPATH;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataSTR_FIELD.Value;
end;

Procedure TDMInterface.SetSCPath(Path: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := SCDBPATH;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := SCDBPATH;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataSTR_FIELD.Value := Path;
  FBSystem_Data.post;
end;

function TDMInterface.GetSCDBType: TDatabaseType;
var
  varg : Variant;
begin
  Result := dtParadox;
  if not FBSystem_Data.Active then exit;
  Varg := SCDBTYPE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := TDatabaseType(FBSystem_DataINT_FIELD.Value);
end;

Procedure TDMInterface.SetSCDBType(dbType: TDatabaseType);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := SCDBTYPE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := SCDBTYPE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := Integer(dbType);
  FBSystem_Data.post;
end;

function TDMInterface.GetTARIServiceDept: Integer;
var
  varg : Variant;
begin
  Result := -1;
  if not FBSystem_Data.Active then exit;
  Varg := TARISERVICEDEPT;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMInterface.SetTARIServiceDept(DeptID: Integer; DeptName: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISERVICEDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARISERVICEDEPT;
    end
  else
    FBSystem_Data.edit;
  if Deptid = null then
    begin
    FBSystem_Data.Delete;
    exit;
    end;
  FBSystem_DataINT_FIELD.Value := DeptID;
  FBSystem_DataSTR_FIELD.Value := DeptName;
  FBSystem_Data.post;
end;

procedure TDMInterface.DeleteSalesDept;
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISALESDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then exit;
  FBSystem_Data.Delete;
end;

procedure TDMInterface.DeleteServiceDept;
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISERVICEDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then exit;
  FBSystem_Data.Delete;
end;


function TDMInterface.GetTARISalesDept: Integer;
var
  varg : Variant;
begin
  Result := -1;
  if not FBSystem_Data.Active then exit;
  Varg := TARISALESDEPT;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMInterface.SetTARISalesDept(DeptID: Integer; DeptName: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISALESDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARISALESDEPT;
    end
  else
    FBSystem_Data.edit;
  if Deptid = null then
    begin
    FBSystem_Data.Delete;
    exit;
    end;
  FBSystem_DataINT_FIELD.Value := DeptID;
  FBSystem_DataSTR_FIELD.Value := DeptName;
  FBSystem_Data.post;
end;

function TDMInterface.GetLastSupportDate: TDateTime;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := LASTSUPPORTDATE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataDATE_FIELD.Value;
end;

Procedure TDMInterface.SetLastSupportDate(NewDate: TDateTime);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := LASTSUPPORTDATE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := LASTSUPPORTDATE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataDATE_FIELD.Value := NewDate;
  FBSystem_Data.post;
end;

function TDMInterface.GetLastTransDate: TDateTime;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := LASTTRANSDATE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataDATE_FIELD.Value;
end;

Procedure TDMInterface.SetLastTransDate(NewDate: TDateTime);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := LASTTRANSDATE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := LASTTRANSDATE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataDATE_FIELD.Value := NewDate;
  FBSystem_Data.post;
end;

function TDMInterface.GetUpdateTimeValue: Integer;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := TARIUPDATETIME;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMInterface.SetUpdateTimeValue(NewValue: Integer);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARIUPDATETIME;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARIUPDATETIME;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := NewValue;
  FBSystem_Data.post;
end;

function TDMInterface.GetUpdatePotentialValue: Integer;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := TARIUPDATEPOTENTIAL;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMInterface.SetUpdatePotentialValue(NewValue: Integer);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARIUPDATEPOTENTIAL;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARIUPDATEPOTENTIAL;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := NewValue;
  FBSystem_Data.post;
end;

function TDMInterface.GetServiceActive: Boolean;
var
  varg : Variant;
begin
  Result := False;
  if not FBSystem_Data.Active then exit;
  Varg := SERVICEACTIVE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    if FBSystem_DataINT_FIELD.Value > 0 then
      Result := True;
end;

Procedure TDMInterface.SetServiceActive(NewValue: Boolean);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := SERVICEACTIVE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := SERVICEACTIVE;
    end
  else
    FBSystem_Data.edit;
  if NewValue then
    FBSystem_DataINT_FIELD.Value := 1
  else
    FBSystem_DataINT_FIELD.Value := 0;
  FBSystem_Data.post;
end;

function TDMInterface.GetStaffActive: Boolean;
var
  varg : Variant;
begin
  Result := False;
  if not FBSystem_Data.Active then exit;
  Varg := STAFFACTIVE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    if FBSystem_DataINT_FIELD.Value > 0 then
      Result := True;
end;

Procedure TDMInterface.SetStaffActive(NewValue: Boolean);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := STAFFACTIVE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := STAFFACTIVE;
    end
  else
    FBSystem_Data.edit;
  if NewValue then
    FBSystem_DataINT_FIELD.Value := 1
  else
    FBSystem_DataINT_FIELD.Value := 0;
  FBSystem_Data.post;
end;

procedure TDMInterface.DataModuleCreate(Sender: TObject);
begin
  SCDatabase.Connected := False;
  SC2TARIDB.Connected := False;
end;

procedure TDMInterface.FBUnitsUpdateCalcFields(DataSet: TDataSet);
begin
  if (FBUnitsUpdateSELLING_PRICE.Value <> 0) and (FBUnitsUpdateUNITS_LABOUR.Value <> 0) then
    FBUnitsUpdateTARI_Rate.Value := trunc((FBUnitsUpdateSELLING_PRICE.Value * 60 / FBUnitsUpdateUNITS_LABOUR.Value) * 100) / 100
  else
    FBUnitsUpdateTARI_Rate.Value := 0;
end;

procedure TDMInterface.FBStaffReportCalcFields(DataSet: TDataSet);
begin
  FBStaffReportFULLNAME.Value := FBStaffReportFIRSTNAME.Value + ' ' + FBStaffReportLASTNAME.Value;
  FBStaffReportTARI_HOURS.Value := FBStaffReportTOTAL_MINS.Value / 60;
  FBStaffReportGROSS_PROFIT.Value := FBStaffReportSALES.Value - FBStaffReportCOGS.Value;
  if (FBStaffReportTARI_HOURS.Value <> 0) then
    begin
    FBStaffReportTARI_RATE.Value := (FBStaffReportGROSS_PROFIT.Value) / FBStaffReportTARI_HOURS.Value;
    end
  else
    begin
    FBStaffReportTARI_RATE.Value := 0;
    end;
  if (FBStaffReportPRODUCER.Value = 1) then
    begin
    FBStaffReportPAID_HOURS.Value := FBStaffReportPAID_MINUTES.Value / 60;
    end
  else
    begin
    FBStaffReportPAID_HOURS.Value := 0;
    end;
  if FBStaffReportPAID_HOURS.Value <> 0 then
    FBStaffReportPRODUCTIVITY.Value := FBStaffReportTARI_HOURS.Value  * 100 / FBStaffReportPAID_HOURS.Value
  else
    FBStaffReportPRODUCTIVITY.Value := 0;
end;

procedure TDMInterface.qryComponentUpdateAfterEdit(DataSet: TDataSet);
begin
//  SPUpdateComponents.ExecProc;
end;

procedure TDMInterface.SCSQLDatabaseBeforeConnect(Sender: TObject);
var
  AParams: TStringList;
  Dir: string;
begin
  SCSQLDatabase.Params.Values['HostName'] := 'ALPHA1\SQLEXPRESS';
  SCSQLDatabase.Params.Values['DataBase'] := 'ShortsCutsPOS';
  SCSQLDatabase.Params.Values['UserName'] := 'sa';
  SCSQLDatabase.Params.Values['Password'] := 'kupunn22';
end;

procedure TDMInterface.SCSQLDatabaseAfterConnect(Sender: TObject);
var
  I: Integer;
  Indicies : Tstringlist;
  IdxFound : Boolean;
begin
  Indicies := Tstringlist.Create;
  SQHistory.Active := True;
  SQProducts.Active := True;
  SQServices.Active := True;
  SQCategory.Active := True;
  SQEmploys.Active := True;
  SQPettyCash.Active := True;
  SQClients.Active := True;
  SQSundry.Active := True;
  SQSystemSettings.Active := True;
  SCTARIAccountLU.Active := True;

  if SQSystemSettings.Locate('Id', Variant(28), []) then
    BusinessEndofWeekDay := SQSystemSettingsValue.AsInteger;
  if Not SQHistory.Active then
    showmessage('Failed to connect to History Table');
end;

end.
