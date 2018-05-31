unit DMClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, AuchTypes, DBTables, stdctrls, variants,
  printers, {$IFDEF Embedded} IB_Session511, {$ENDIF}
  IBODataset, IB_Components, LGlobals, DateUtils, cxStyles, cxClasses,
  cxGridTableView, cxContainer, cxEdit, cxGridBandedTableView, IB_Process,
  IB_Script, IB_StoredProc, IB_Access;

type

  TDataModuleClient = class(TDataModule)
    ClientDatabase: TIBODatabase;
		LookupSummaryIntervals: TIBOTable;
		MaxInvoiceID: TIBOQuery;
		Departments: TIBOTable;
		BusinessDetails: TIBOTable;
		DepartmentsDEPT_ID: TIntegerField;
		DepartmentsREVENUE_GROUP_NAME: TStringField;
		DepartmentsREPORT_CODE1: TStringField;
		DepartmentsREPORT_CODE2: TStringField;
		DepartmentsLAST_MONITORED: TDateField;
		DepartmentsEXCLUDE_FROM_REPORTING: TSmallintField;
		DepartmentsCURRENCY: TStringField;
		DepartmentsSINGULAR_UNITDESC: TStringField;
		DepartmentsPLURAL_UNITDESC: TStringField;
		DepartmentsLASTDAYOFWEEK: TSmallintField;
		DepartmentsCURRENTPLANSTART: TDateField;
		DepartmentsCOPIEDFROM: TIntegerField;
		DepartmentsFIRSTPLANDATE: TDateField;
		DepartmentsLATESTPLANDATE: TDateField;
		DepartmentsLASTSUMMARYPERIOD: TIntegerField;
		DepartmentsCURRENTMONITORINGSTART: TDateField;
		DepartmentsCURRENTMONITORINGEND: TDateField;
		DepartmentsFIRSTMONITORINGDATE: TDateField;
		DepartmentsINVGROUPNAME: TStringField;
		BusinessDetailsBUSINESS_NAME: TStringField;
		BusinessDetailsDATE_LAST_ACCESSED: TDateTimeField;
		BusinessDetailsMAINDEPT: TIntegerField;
		DateRangers: TIBOTable;
		DateRangersDEPT_ID: TIntegerField;
		DateRangersENDDATE: TDateField;
		DateRangersSTARTDATE: TDateField;
		DateRangersD_INDEX: TIntegerField;
		AccountDetails: TIBOTable;
		AccountDetailsACCOUNT_NUMBER: TIntegerField;
		AccountDetailsACCOUNT_TITLE: TStringField;
		AccountDetailsSTATIC_VALUE: TSmallintField;
		AccountDetailsACCOUNT_SUBTITLE: TStringField;
		LOSystem: TIBOTable;
		LOSystemDBVERSION: TStringField;
		LOSystemDBPASSWORD: TStringField;
		DepartLU: TIBOTable;
		DateRef: TIBOTable;
		DeptRef: TIBOTable;
		DeptRefDEPT_ID: TIntegerField;
		DeptRefREVENUE_GROUP_NAME: TStringField;
		DeptRefREPORT_CODE1: TStringField;
		DeptRefREPORT_CODE2: TStringField;
		DeptRefLAST_MONITORED: TDateField;
		DeptRefEXCLUDE_FROM_REPORTING: TSmallintField;
		DeptRefCURRENCY: TStringField;
		DeptRefSINGULAR_UNITDESC: TStringField;
		DeptRefPLURAL_UNITDESC: TStringField;
		ActualDataLU: TIBOTable;
		ActualDataLUDEPT_ID: TIntegerField;
		ActualDataLUACCOUNT_NUMBER: TIntegerField;
		ActualDataLUPERIODEND: TDateField;
		ActualDataLUBAL: TBCDField;
		ActualData: TIBOTable;
		ActualDataDEPT_ID: TIntegerField;
		ActualDataACCOUNT_NUMBER: TIntegerField;
		ActualDataPERIODEND: TDateField;
		ActualDataBAL: TBCDField;
		PlanData: TIBOTable;
		PlanDataDEPT_ID: TIntegerField;
		PlanDataACCOUNT_NUMBER: TIntegerField;
		PlanDataD_YEAR: TIntegerField;
		PlanDataD_TYPE: TSmallintField;
		PlanDataD_BALS: TBlobField;
		MonitoringData: TIBOTable;
		ActualInvoiceDetails: TIBOTable;
		ActualInvoiceDetailsDEPT_ID: TIntegerField;
		ActualInvoiceDetailsINVOICETYPE: TIntegerField;
		ActualInvoiceDetailsINV_DATE: TDateField;
		ActualInvoiceDetailsINVOICE_ID: TIntegerField;
		ActualInvoiceDetailsQUOTE_NUMBER: TStringField;
		ActualInvoiceDetailsINVOICE_NUMBER: TStringField;
		ActualInvoiceDetailsNETSALES: TBCDField;
		ActualInvoiceDetailsMATERIALSATCOST: TBCDField;
		ActualInvoiceDetailsSUBCONTRACTORS: TBCDField;
		ActualInvoiceDetailsUNITSREQUIRED: TBCDField;
		ActualInvoiceDetailsORDERCOMPLETE: TSmallintField;
		ActualInvoiceDetailsUNITSTORUN: TBCDField;
		ActualInvoiceDetailsRECORDEDUNITS: TBCDField;
		Quotes: TIBOTable;
		QuotesDEPT_ID: TIntegerField;
		QuotesQUOTE_NUMBER: TStringField;
		QuotesCUSTOMERNAME: TStringField;
		QuotesQ_DATE: TDateField;
		QuotesQ_VALUE: TBCDField;
		QuotesQ_MATERIALS: TBCDField;
		QuotesQ_SUBCONTRACTORS: TBCDField;
		QuotesTARGETUNITS: TBCDField;
		MaxInvoiceIDMAX: TIntegerField;
		MonitoringDataLU: TIBOTable;
		MonitoringDataLUDEPT_ID: TIntegerField;
		MonitoringDataLUACCOUNT_NUMBER: TIntegerField;
		MonitoringDataLUD_YEAR: TIntegerField;
		MonitoringDataLUD_TYPE: TSmallintField;
		MonitoringDataLUD_BALS: TBlobField;
		MonitoringDataDEPT_ID: TIntegerField;
		MonitoringDataACCOUNT_NUMBER: TIntegerField;
		MonitoringDataD_YEAR: TIntegerField;
		MonitoringDataD_TYPE: TSmallintField;
		MonitoringDataD_BALS: TBlobField;
		QuotesLU: TIBOTable;
		QuotesLUDEPT_ID: TIntegerField;
		QuotesLUQUOTE_NUMBER: TStringField;
		QuotesLUCUSTOMERNAME: TStringField;
		QuotesLUQ_DATE: TDateField;
		QuotesLUQ_VALUE: TBCDField;
		QuotesLUQ_MATERIALS: TBCDField;
		QuotesLUQ_SUBCONTRACTORS: TBCDField;
		QuotesLUTARGETUNITS: TBCDField;
		InvQuoteLU: TIBOTable;
		InvoiceLU: TIBOTable;
		InvoiceLUDEPT_ID: TIntegerField;
		InvoiceLUINVOICETYPE: TIntegerField;
		InvoiceLUINV_DATE: TDateField;
		InvoiceLUINVOICE_ID: TIntegerField;
		InvoiceLUQUOTE_NUMBER: TStringField;
		InvoiceLUINVOICE_NUMBER: TStringField;
		InvoiceLUNETSALES: TBCDField;
		InvoiceLUMATERIALSATCOST: TBCDField;
		InvoiceLUSUBCONTRACTORS: TBCDField;
		InvoiceLUUNITSREQUIRED: TBCDField;
		InvoiceLUORDERCOMPLETE: TSmallintField;
		InvoiceLUUNITSTORUN: TBCDField;
		InvoiceLURECORDEDUNITS: TBCDField;
		InvoiceLU2: TIBOTable;
    InvoiceLU2DEPT_ID: TIntegerField;
    InvoiceLU2INVOICETYPE: TIntegerField;
    InvoiceLU2INV_DATE: TDateField;
    InvoiceLU2INVOICE_ID: TIntegerField;
    InvoiceLU2QUOTE_NUMBER: TStringField;
    InvoiceLU2INVOICE_NUMBER: TStringField;
    InvoiceLU2NETSALES: TBCDField;
    InvoiceLU2MATERIALSATCOST: TBCDField;
    InvoiceLU2SUBCONTRACTORS: TBCDField;
    InvoiceLU2UNITSREQUIRED: TBCDField;
    InvoiceLU2ORDERCOMPLETE: TSmallintField;
    InvoiceLU2UNITSTORUN: TBCDField;
    InvoiceLU2RECORDEDUNITS: TBCDField;
    Plandel: TIBOTable;
    PlandelDEPT_ID: TIntegerField;
    PlandelD_YEAR: TIntegerField;
    PlandelD_TYPE: TSmallintField;
    Monitordel: TIBOTable;
    InvQuoteLUDEPT_ID: TIntegerField;
    InvQuoteLUINVOICETYPE: TIntegerField;
    InvQuoteLUINV_DATE: TDateField;
    InvQuoteLUINVOICE_ID: TIntegerField;
    InvQuoteLUQUOTE_NUMBER: TStringField;
    InvQuoteLUINVOICE_NUMBER: TStringField;
    InvQuoteLUNETSALES: TBCDField;
    InvQuoteLUMATERIALSATCOST: TBCDField;
    InvQuoteLUSUBCONTRACTORS: TBCDField;
    InvQuoteLUUNITSREQUIRED: TBCDField;
    InvQuoteLUORDERCOMPLETE: TSmallintField;
    InvQuoteLUUNITSTORUN: TBCDField;
    InvQuoteLURECORDEDUNITS: TBCDField;
    MonitordelDEPT_ID: TIntegerField;
    MonitordelD_YEAR: TIntegerField;
    MonitordelD_TYPE: TSmallintField;
    InvoiceLUAverageRate: TCurrencyField;
    DateRefDEPT_ID: TIntegerField;
    DateRefENDDATE: TDateField;
    DateRefSTARTDATE: TDateField;
    DateRefD_INDEX: TIntegerField;
    DepartmentsCURRENTPLANEND: TDateField;
    DepartLUDEPT_ID: TIntegerField;
    AccountDetailsNON_CASH: TSmallintField;
    BSAccounts: TIBOTable;
		BSAccountsACCOUNT_NUMBER: TIntegerField;
    BSAccountsACCOUNT_TITLE: TStringField;
    BSAccountsSTATIC_VALUE: TSmallintField;
    BSAccountsACCOUNT_SUBTITLE: TStringField;
    BSAccountsNON_CASH: TSmallintField;
    JournalTbl: TIBOTable;
    JournalTblJNL_NO: TIntegerField;
    JournalTblJNL_DATE: TDateField;
    JrnlEntries: TIBOTable;
    JrnlEntriesJNL_NO: TIntegerField;
    JrnlEntriesJNL_INDEX: TIntegerField;
    JrnlEntriesACCOUNT_NO: TIntegerField;
    UserOptions: TIBOTable;
    UserOptionsINTEGER_VALUE: TIntegerField;
    UserOptionsCURRENCY_VALUE: TBCDField;
    UserOptionsDATETIME_VALUE: TDateField;
    UserOptionsSTRING_VALUE: TStringField;
    AccountNotes: TIBOTable;
    AccountNotesNOTE_DATE: TDateField;
    AccountNotesACCOUNT_NO: TIntegerField;
    AccountNotesNOTE_NO: TIntegerField;
    AccountNotesNOTE_TEXT: TMemoField;
    DSBSAccounts: TDataSource;
    DSJournals: TDataSource;
    DSJournalEntries: TDataSource;
    DSUserOptions: TDataSource;
    DSAccountNotes: TDataSource;
    JournalTblNON_CASH: TSmallintField;
    BSAccountsWAGE_ACCOUNT: TSmallintField;
    DeptOptions: TIBOTable;
    DSDeptOptions: TDataSource;
    Dept_Accounts: TIBOTable;
    DSDepartmentAccounts: TDataSource;
    UserOptionsOPTION_GROUP_ID: TIntegerField;
    DeptOptionsDEPT_ID: TIntegerField;
    DeptOptionsOPTION_GROUP_ID: TIntegerField;
    DeptOptionsEXPIRY_DATE: TDateField;
    Dept_AccountsDEPT_ID: TIntegerField;
    Dept_AccountsACCOUNT_NUMBER: TIntegerField;
    Dept_AccountsTAX_RATE: TBCDField;
    Dept_AccountsPAID_VIA_AP: TSmallintField;
    Dept_AccountsBALANCE_SHEET_ACCOUNT: TIntegerField;
    Cash_Timing: TIBOTable;
    DSCashTiming: TDataSource;
		Cash_TimingACCOUNT_CODE: TIntegerField;
    Cash_TimingTIMING_INDEX: TIntegerField;
    Cash_TimingPERCENTAGE: TBCDField;
    Cash_TimingT_YEAR: TStringField;
    Cash_TimingT_QUARTER: TStringField;
    Cash_TimingT_MONTH: TStringField;
    Cash_TimingT_WEEK: TStringField;
    Cash_TimingT_DAY: TStringField;
    Cash_TimingT_DAYS_SPREAD: TIntegerField;
    BusinessHours: TIBOTable;
    BusinessHoursDEPT_ID: TIntegerField;
    BusinessHoursNOTOPEN: TDateField;
    BusinessHoursONLYOPENHOURS: TBCDField;
    DSBusinessHours: TDataSource;
    DSEXPACCOUNTS: TDataSource;
    ExpAccounts: TIBOTable;
    ExpAccountsACCOUNT_NUMBER: TIntegerField;
    ExpAccountsACCOUNT_TITLE: TStringField;
    ExpAccountsSTATIC_VALUE: TSmallintField;
    ExpAccountsACCOUNT_SUBTITLE: TStringField;
    ExpAccountsNON_CASH: TSmallintField;
    ExpAccountsWAGE_ACCOUNT: TSmallintField;
    UserOptionsNAMEINDEX: TIntegerField;
    OptionNames: TIBOTable;
    DSOptionNames: TDataSource;
    UserOptionsOptionName: TStringField;
    GetMAXGroupID: TIBOQuery;
    GetMAXGroupIDMAXID: TIntegerField;
    GetMAXGroupIDMAXDATE: TDateField;
    OptionNamesOPTION_NAME: TStringField;
    GetMAXNameIDX: TIBOQuery;
    GetMAXNameIDXMAXID: TIntegerField;
    OptionNamesNAME_INDEX: TIntegerField;
    DeptExpenses: TIBOTable;
    DeptExpensesDEPT_ID: TIntegerField;
    DeptExpensesACCOUNT_NUMBER: TIntegerField;
    DeptExpensesTAX_RATE: TBCDField;
    DeptExpensesPAID_VIA_AP: TSmallintField;
    DeptExpensesBALANCE_SHEET_ACCOUNT: TIntegerField;
    JournalTblDEPT_ID: TIntegerField;
    MaxJournalNo: TIBOQuery;
    MaxJournalNoMAX: TIntegerField;
    JournalTblJNL_NOTE: TStringField;
    JrnlEntriesLINE_NOTE: TStringField;
		JrnlEntriesDR_AMOUNT: TBCDField;
    JrnlEntriesCR_AMOUNT: TBCDField;
    AccountDetailsDR_CASHFLOW_ACCOUNT: TIntegerField;
    AccountDetailsCR_CASHFLOW_ACCOUNT: TIntegerField;
    BSAccountsDR_CASHFLOW_ACCOUNT: TIntegerField;
    BSAccountsCR_CASHFLOW_ACCOUNT: TIntegerField;
    LookupSummaryIntervalsPERIOD_ID: TIntegerField;
    LookupSummaryIntervalsPERIOD_DESC: TStringField;
    QuotesQ_RATE: TCurrencyField;
    QuotesQ_GP: TBCDField;
    InvoiceLUGrossProfit: TBCDField;
    MonitoringInvoices: TIBOTable;
    DSMonitoringInvoices: TDataSource;
    MonitoringInvoicesDEPT_ID: TIntegerField;
    MonitoringInvoicesINVOICETYPE: TIntegerField;
    MonitoringInvoicesINV_DATE: TDateField;
    MonitoringInvoicesINVOICE_ID: TIntegerField;
    MonitoringInvoicesQUOTE_NUMBER: TStringField;
    MonitoringInvoicesINVOICE_NUMBER: TStringField;
    MonitoringInvoicesNETSALES: TBCDField;
    MonitoringInvoicesMATERIALSATCOST: TBCDField;
    MonitoringInvoicesSUBCONTRACTORS: TBCDField;
    MonitoringInvoicesUNITSREQUIRED: TBCDField;
    MonitoringInvoicesORDERCOMPLETE: TSmallintField;
    MonitoringInvoicesUNITSTORUN: TBCDField;
    MonitoringInvoicesRECORDEDUNITS: TBCDField;
    MonitoringInvoicesGrossProfit: TBCDField;
    MonitoringInvoicesAverageRate: TBCDField;
    ActualInvoiceDetailsGROSSPROFIT: TBCDField;
    ActualInvoiceDetailsAVERAGERATE: TBCDField;
    ActualInvoiceDetailsGPPC: TBCDField;
    DSDepartments: TDataSource;
    DSBusinessDetails: TDataSource;
    DSDateRangers: TDataSource;
    DSAccountDetails: TDataSource;
    DSDateRef: TDataSource;
    DSDeptRef: TDataSource;
    DSMaxInvoiceISource1: TDataSource;
    DSActualData: TDataSource;
    DSActualDataLU: TDataSource;
    DSPlanData: TDataSource;
    DSMonitoringDataLU: TDataSource;
    DSActualInvoiceDetails: TDataSource;
    DSSummaryIntervals: TDataSource;
		DSQuotes: TDataSource;
    DSQuotesLU: TDataSource;
    DSMonitoringData: TDataSource;
    DSInvoiceLU: TDataSource;
    AccountDetailsWAGE_ACCOUNT: TSmallintField;
    AccountDetailsINTEREST_ACCOUNT: TSmallintField;
    BSAccountsINTEREST_ACCOUNT: TSmallintField;
    ExpAccountsINTEREST_ACCOUNT: TSmallintField;
    Import_Templates: TIBOTable;
    Import_TemplatesTEMPLATE_ID: TIntegerField;
    Import_TemplatesTEMPLATE_NAME: TStringField;
    Import_TemplatesIMPORT_PROFILE: TMemoField;
    Import_Header: TIBOTable;
    Import_HeaderDEPT_ID: TIntegerField;
    Import_HeaderIMPORT_ID: TIntegerField;
    Import_HeaderTEMPLATE_ID: TIntegerField;
    Import_HeaderIMPORT_DESCRIPTION: TStringField;
    Import_HeaderPERIOD_START: TDateField;
    Import_HeaderPERIOD_END: TDateField;
    Import_HeaderUSE_ACCOUNT_NUMBER: TSmallintField;
    Import_HeaderIS_YTD: TSmallintField;
    Template_Details: TIBOTable;
    Template_DetailsTEMPLATE_ID: TIntegerField;
    Template_DetailsSOURCE_ID: TStringField;
    Template_DetailsACCOUNT_NUMBER: TIntegerField;
    Imported_Data: TIBOTable;
    Imported_DataSEQUENCE_NUMBER: TIntegerField;
    Imported_DataIMPORT_ID: TIntegerField;
    Imported_DataACCOUNT_TITLE: TStringField;
    Imported_DataDR_AMOUNT: TBCDField;
    Imported_DataCR_AMOUNT: TBCDField;
    Account_Mapping: TIBOTable;
    Account_MappingACCOUNT_NUMBER: TIntegerField;
    Account_MappingACCOUNT_TITLE: TStringField;
    Account_MappingACCOUNT_GROUP: TIntegerField;
    DSImport_Templates: TDataSource;
    DSTemplate_Details: TDataSource;
    DSImportHeader: TDataSource;
    DSImportedData: TDataSource;
    DSAccountMapping: TDataSource;
    Tracking_Jrnl: TIBOTable;
    Tracking_JrnlDEPT_ID: TIntegerField;
    Tracking_JrnlJNL_NO: TIntegerField;
    Tracking_JrnlSTART_DATE: TDateField;
		Tracking_JrnlEND_DATE: TDateField;
    Tracking_JrnlDESCRIPTION: TStringField;
    TrackingEntries: TIBOTable;
    DSTrackingJrnl: TDataSource;
    TrackingEntriesJNL_NO: TIntegerField;
    TrackingEntriesJNL_INDEX: TIntegerField;
    TrackingEntriesACCOUNT_NO: TIntegerField;
    TrackingEntriesDR_AMOUNT: TBCDField;
    TrackingEntriesCR_AMOUNT: TBCDField;
    TrackingEntriesLINE_NOTE: TStringField;
    DSTrackingEntries: TDataSource;
    Import_HeaderDESTINATION: TStringField;
    Imported_DataACC_NUMBER: TStringField;
    Imported_DataACCOUNT_NUMBER: TIntegerField;
    ExpAccountsACCOUNT_GROUP: TIntegerField;
    AccountDetailsACCOUNT_GROUP: TIntegerField;
    MappedDataQuery: TIBOQuery;
    MappedDataQueryIMPORT_ID: TIntegerField;
    MappedDataQueryACCOUNT_NUMBER: TIntegerField;
    MappedDataQueryACCTITLE: TStringField;
    MappedDataQueryDRAMOUNT: TBCDField;
    MappedDataQueryCRAMOUNT: TBCDField;
    DSMappedData: TDataSource;
    AccountGroups: TIBOTable;
    AccountGroupsACCOUNT_GRP_ID: TIntegerField;
    AccountGroupsGROUP_NAME: TStringField;
    AccountGroupsGROUP_DR_SIGN: TSmallintField;
    DSAccountGroups: TDataSource;
    DepartmentsINVOICEPASSWORD: TStringField;
    MonitoringImpInv: TIBOTable;
    MonitoringImpInvDEPT_ID: TIntegerField;
    MonitoringImpInvINVOICETYPE: TIntegerField;
    MonitoringImpInvINV_DATE: TDateField;
    MonitoringImpInvINVOICE_ID: TIntegerField;
    MonitoringImpInvQUOTE_NUMBER: TStringField;
    MonitoringImpInvINVOICE_NUMBER: TStringField;
    MonitoringImpInvNETSALES: TBCDField;
    MonitoringImpInvMATERIALSATCOST: TBCDField;
    MonitoringImpInvSUBCONTRACTORS: TBCDField;
    MonitoringImpInvUNITSREQUIRED: TBCDField;
    MonitoringImpInvORDERCOMPLETE: TSmallintField;
    MonitoringImpInvUNITSTORUN: TBCDField;
    MonitoringImpInvRECORDEDUNITS: TBCDField;
    Imported_DataUpdate: TIBOTable;
		Imported_DataUpdateSEQUENCE_NUMBER: TIntegerField;
    Imported_DataUpdateIMPORT_ID: TIntegerField;
    Imported_DataUpdateACC_NUMBER: TStringField;
    Imported_DataUpdateACCOUNT_TITLE: TStringField;
    Imported_DataUpdateDR_AMOUNT: TBCDField;
    Imported_DataUpdateCR_AMOUNT: TBCDField;
    Imported_DataUpdateACCOUNT_NUMBER: TIntegerField;
    MappedDataPost: TIBOQuery;
    MappedDataPostIMPORT_ID: TIntegerField;
    MappedDataPostACCOUNT_NUMBER: TIntegerField;
    MappedDataPostACCTITLE: TStringField;
    MappedDataPostDRAMOUNT: TBCDField;
    MappedDataPostCRAMOUNT: TBCDField;
    DateRangersLU: TIBOTable;
    DateRangersLUDEPT_ID: TIntegerField;
    DateRangersLUENDDATE: TDateField;
    DateRangersLUSTARTDATE: TDateField;
    DateRangersLUD_INDEX: TIntegerField;
    SourceImpTemplate: TIBOTable;
    Src_Temp_Details: TIBOTable;
    DSSourceTmpPlate: TDataSource;
    SourceImpTemplateTEMPLATE_ID: TIntegerField;
    SourceImpTemplateTEMPLATE_NAME: TStringField;
    SourceImpTemplateIMPORT_PROFILE: TMemoField;
    Src_Temp_DetailsTEMPLATE_ID: TIntegerField;
    Src_Temp_DetailsSOURCE_ID: TStringField;
    Src_Temp_DetailsACCOUNT_NUMBER: TIntegerField;
    MaxJrnlIndex: TIBOQuery;
    MaxJrnlIndexMAX: TIntegerField;
    MaxJrnlIndexSUMDR: TBCDField;
    MaxJrnlIndexSUMCR: TBCDField;
    DateRangersCURRENTPERIOD: TSmallintField;
    DateRefCURRENTPERIOD: TSmallintField;
    DeptRef2: TIBOTable;
    DSDeptRef2: TDataSource;
    DeptRef2DEPT_ID: TIntegerField;
    DeptRef2EXCLUDE_FROM_REPORTING: TSmallintField;
    DeptRefCURRENTPLANSTART: TDateField;
    DeptRefCURRENTPLANEND: TDateField;
    DeptRefFIRSTPLANDATE: TDateField;
    DeptRefLATESTPLANDATE: TDateField;
    DeptRefCURRENTMONITORINGSTART: TDateField;
    DeptRefCURRENTMONITORINGEND: TDateField;
    Dept_AccountsLU: TIBOTable;
		IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    BCDField1: TBCDField;
    SmallintField1: TSmallintField;
    IntegerField3: TIntegerField;
    Businesses: TIBOTable;
    DSBusinesses: TDataSource;
    BusinessesBRANCH_ID: TIntegerField;
    BusinessesBRANCH_NAME: TStringField;
    BusinessesHIDDEN_DEPT: TIntegerField;
    BusinessesCURRENCY: TStringField;
    BusinessesCURRENCY_SYMBOL: TStringField;
    BusinessesCONVERSION_RATE: TIBOFloatField;
    BusinessesTARGET_START: TDateField;
    BusinessesTARGET_END: TDateField;
    BusinessesTRACKING_START: TDateField;
    BusinessesTRACKING_END: TDateField;
    BusinessesLASTDAYOFWEEK: TSmallintField;
    DepartmentsBRANCH_ID: TIntegerField;
    DepartmentsHIDDEN_DEPT: TSmallintField;
    DepartmentsSYNC_TARGETDATE: TSmallintField;
    DepartmentsSYNC_TRACKDATE: TSmallintField;
    DepartmentsEXCLUDE_FROM_CASHFLOW: TSmallintField;
    CashFlowDept: TIBOTable;
    DSCashFlowDept: TDataSource;
    CashFlowDeptDEPT_ID: TIntegerField;
    CashFlowDeptBRANCH_ID: TIntegerField;
    CashFlowDeptREVENUE_GROUP_NAME: TStringField;
    CashFlowDeptREPORT_CODE1: TStringField;
    CashFlowDeptREPORT_CODE2: TStringField;
    CashFlowDeptLAST_MONITORED: TDateField;
    CashFlowDeptEXCLUDE_FROM_REPORTING: TSmallintField;
    CashFlowDeptCURRENCY: TStringField;
    CashFlowDeptSINGULAR_UNITDESC: TStringField;
    CashFlowDeptPLURAL_UNITDESC: TStringField;
    CashFlowDeptLASTDAYOFWEEK: TSmallintField;
    CashFlowDeptCURRENTPLANSTART: TDateField;
    CashFlowDeptCURRENTPLANEND: TDateField;
    CashFlowDeptCOPIEDFROM: TIntegerField;
    CashFlowDeptFIRSTPLANDATE: TDateField;
    CashFlowDeptLATESTPLANDATE: TDateField;
    CashFlowDeptLASTSUMMARYPERIOD: TIntegerField;
    CashFlowDeptCURRENTMONITORINGSTART: TDateField;
    CashFlowDeptCURRENTMONITORINGEND: TDateField;
		CashFlowDeptFIRSTMONITORINGDATE: TDateField;
    CashFlowDeptINVGROUPNAME: TStringField;
    CashFlowDeptINVOICEPASSWORD: TStringField;
    CashFlowDeptHIDDEN_DEPT: TSmallintField;
    CashFlowDeptSYNC_TARGETDATE: TSmallintField;
    CashFlowDeptSYNC_TRACKDATE: TSmallintField;
    CashFlowDeptEXCLUDE_FROM_CASHFLOW: TSmallintField;
    SPCreateBusiness: TIB_StoredProc;
    DeptRefBRANCH_ID: TIntegerField;
    DeptRefLASTDAYOFWEEK: TSmallintField;
    DeptRefHIDDEN_DEPT: TSmallintField;
    DeptRefSYNC_TARGETDATE: TSmallintField;
    DeptRefSYNC_TRACKDATE: TSmallintField;
    DeptRefEXCLUDE_FROM_CASHFLOW: TSmallintField;
    DeptRef2BRANCH_ID: TIntegerField;
    DeptRef2HIDDEN_DEPT: TSmallintField;
    DeptRef2SYNC_TARGETDATE: TSmallintField;
    DeptRef2SYNC_TRACKDATE: TSmallintField;
    DeptRef2EXCLUDE_FROM_CASHFLOW: TSmallintField;
    BusinessesRef: TIBOTable;
    BusinessesRefBRANCH_ID: TIntegerField;
    BusinessesRefBRANCH_NAME: TStringField;
    BusinessesRefHIDDEN_DEPT: TIntegerField;
    BusinessesRefCURRENCY: TStringField;
    BusinessesRefCURRENCY_SYMBOL: TStringField;
    BusinessesRefCONVERSION_RATE: TIBOFloatField;
    BusinessesRefTARGET_START: TDateField;
    BusinessesRefTARGET_END: TDateField;
    BusinessesRefTRACKING_START: TDateField;
    BusinessesRefTRACKING_END: TDateField;
    BusinessesRefLASTDAYOFWEEK: TSmallintField;
    DSBusinessesRef: TDataSource;
    BusinessesRefEXCLUDE_FROM_REPORTING: TSmallintField;
    BusinessesEXCLUDE_FROM_REPORTING: TSmallintField;
    CF_BS_Accounts: TIBOTable;
    CF_BS_AccountsDEPT_ID: TIntegerField;
    CF_BS_AccountsACCOUNT_NUMBER: TIntegerField;
    CF_BS_AccountsD_YEAR: TIntegerField;
    CF_BS_AccountsD_TYPE: TSmallintField;
    CF_BS_AccountsD_BALS: TBlobField;
    DeptRef2REVENUE_GROUP_NAME: TStringField;
    DeptRef2CURRENCY: TStringField;
    DeptRef2REPORT_CODE1: TStringField;
    DeptRef2REPORT_CODE2: TStringField;
		DeptRef2SINGULAR_UNITDESC: TStringField;
		DeptRef2PLURAL_UNITDESC: TStringField;
		DeptConsolid: TIBOTable;
		DeptConsolidBranch_id: TIntegerField;
		DeptConsolidHidden_Dept: TSmallintField;
		DeptConsolidSYNC_TARGETDATE: TSmallintField;
		DeptConsolidSYNC_TRACKDATE: TSmallintField;
		DeptConsolidEXCLUDE_FROM_CASHFLOW: TSmallintField;
		deptConsolidREVENUE_GROUP_NAME: TStringField;
		DeptConsolidCURRENCY: TStringField;
		deptConsolidREPORT_CODE1: TStringField;
		DeptConsolidREPORT_CODE2: TStringField;
		DeptConsolidSINGULAR_UNITDESC: TStringField;
		DeptConsolidPLURAL_UNITDESC: TStringField;
		DeptConsolidDEPT_ID: TIntegerField;
		DeptConsolidEXCLUDE_FROM_REPORTING: TSmallintField;
		CFBS_Lookup: TIBOTable;
		CFBS_Journals: TIBOTable;
		CFBS_JournalsDEPT_ID: TIntegerField;
		CFBS_JournalsJNL_NO: TIntegerField;
		DSAccountsGrouping: TDataSource;
		ExpenseGroups: TIBOTable;
		ExpenseGroupsACCOUNT_GRP_ID: TIntegerField;
		ExpenseGroupsGROUP_NAME: TStringField;
		ExpenseGroupsGROUP_DR_SIGN: TSmallintField;
		DSExpenseGroups: TDataSource;
		AccountsGrouping: TIBOTable;
		AccountsGroupingACCOUNT_NUMBER: TIntegerField;
		AccountsGroupingACCOUNT_TITLE: TStringField;
		AccountsGroupingACCOUNT_GROUP: TIntegerField;
		AccountsGroupingGROUP_NAME: TStringField;
		AccountDetailsAccount_DR: TIntegerField;
		procedure DepartmentsNewRecord(DataSet: TDataSet);
		procedure DataModuleCreate(Sender: TObject);
		procedure QuotesAfterPost(DataSet: TDataSet);
		procedure InvoiceLUCalcFields(DataSet: TDataSet);
		procedure BusinessDetailsBeforeClose(DataSet: TDataSet);
		procedure ClientDatabaseAfterConnect(Sender: TIB_Connection);
    procedure ClientDatabaseBeforeDisconnect(Sender: TIB_Connection);
    procedure DateRangersBeforePost(DataSet: TDataSet);
    procedure AccountDetailsNewRecord(DataSet: TDataSet);
		procedure ActualInvoiceDetailsNewRecord(DataSet: TDataSet);
    procedure ActualInvoiceDetailsAfterPost(DataSet: TDataSet);
    procedure DateRangersPostError(DataSet: TDataSet; E: EDatabaseError;
			var Action: TDataAction);
    procedure DateRangersError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure DepartmentsAfterPost(DataSet: TDataSet);
    procedure DateRangersAfterPost(DataSet: TDataSet);
    procedure ActualDataAfterPost(DataSet: TDataSet);
    procedure PlanDataAfterPost(DataSet: TDataSet);
    procedure MonitoringDataAfterPost(DataSet: TDataSet);
    procedure DateRangersAfterInsert(DataSet: TDataSet);
    procedure DateRangersAfterDelete(DataSet: TDataSet);
    procedure QuotesBeforePost(DataSet: TDataSet);
    procedure QuotesError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure DateRangersBeforeInsert(DataSet: TDataSet);
    procedure ClientDatabaseBeforeConnect(Sender: TIB_Connection);
    procedure DeptOptionsNewRecord(DataSet: TDataSet);
    procedure OptionNamesNewRecord(DataSet: TDataSet);
    procedure ExpAccountsNewRecord(DataSet: TDataSet);
    procedure JournalTblNewRecord(DataSet: TDataSet);
    procedure JournalTblAfterScroll(DataSet: TDataSet);
    procedure JrnlEntriesNewRecord(DataSet: TDataSet);
    procedure JournalTblBeforeScroll(DataSet: TDataSet);
    procedure QuotesCalcFields(DataSet: TDataSet);
    procedure ActualInvoiceDetailsRECORDEDUNITSChange(Sender: TField);
    procedure ActualInvoiceDetailsCalcFields(DataSet: TDataSet);
    procedure ExpAccountsAfterPost(DataSet: TDataSet);
    procedure Dept_AccountsNewRecord(DataSet: TDataSet);
    procedure Import_HeaderNewRecord(DataSet: TDataSet);
    procedure Imported_DataNewRecord(DataSet: TDataSet);
    procedure Template_DetailsNewRecord(DataSet: TDataSet);
    procedure MonitoringImpInvNewRecord(DataSet: TDataSet);
    procedure Import_TemplatesNewRecord(DataSet: TDataSet);
    procedure BusinessesNewRecord(DataSet: TDataSet);
    procedure DeptRefAfterPost(DataSet: TDataSet);
    procedure DeptRefNewRecord(DataSet: TDataSet);
    procedure BusinessesAfterPost(DataSet: TDataSet);
    procedure CashFlowDeptNewRecord(DataSet: TDataSet);
    procedure DepartmentsAfterDelete(DataSet: TDataSet);
    procedure DeptRefAfterDelete(DataSet: TDataSet);
    procedure AccountGroupsAfterOpen(DataSet: TDataSet);
    procedure AccountDetailsAfterOpen(DataSet: TDataSet);
    procedure DSDepartmentsDataChange(Sender: TObject; Field: TField);
  private
//    NewDeptID : integer;

    { Private declarations }
    procedure FixDateRangers;
  public
    { Public declarations }
    PlanHandle : THandle;
    JournalInit : Boolean;
    LastJrnlDate : TDateTime;
    InvoiceType :  TinvType;
    NoofRecords : integer;
    Old_Branch_ID : integer;
    TSActive : Boolean;
    DMCHandle : THandle;
    procedure SetInvoiceFilter(IType : Integer; StartDate, EndDate : TDateTime);
    procedure SetJournalFilter(Deptid: Integer; StartDate, EndDate : TDateTime);
    function SetDBPassword(pwd: string): Boolean;
    function GetAccountGroup(accountno : integer): string;
    procedure CreateDeptExpenseAccountRecords;
    function AssignDeptnewBranch(DeptID, BranchID: Integer): Boolean;
    procedure ReopenDataset(ADataSet: TDataSet; DisableCtrls: Boolean);
    procedure SetBusinessTargetStart(BranchID: Integer; TargetEnd : TDateTime);
    procedure SetBusinessTrackStart(BranchID: Integer; TrackEnd : TDateTime);
    procedure Sync_Businessdates;
  end;

var
  DataModuleClient: TDataModuleClient;
  GroupIDWarn : Boolean;
  Procedure FindPastDate;

Implementation

{$R *.DFM}

procedure TDataModuleClient.SetInvoiceFilter(IType : Integer; StartDate, EndDate : TDateTime);
begin
  with ActualInvoiceDetails do
  begin
    Active := False;
    Filtered := False;
    Filter := '';
    if StartDate < EndDate then
      Filter := 'InvoiceType = ' + inttostr(IType) +
              ' and Inv_Date >= ''' + formatDateTime('c', StartDate) +
              ''' and Inv_Date <= ''' + formatDateTime('c', EndDate) + '''';
    if (StartDate = Enddate) then
      Filter := 'InvoiceType = ' + inttostr(IType) +
              ' and Inv_Date = ''' + formatDateTime('c', StartDate) + '''';
    if Filter > ''
      then begin
      Filtered := True;
      Active := True;
    end;
  end;
end;

procedure TDataModuleClient.SetJournalFilter(Deptid: Integer; StartDate, EndDate : TDateTime);
begin
//  with JournalTbl do
//    begin
    JournalTbl.Active := False;
    JournalTbl.Filtered := False;
    JournalTbl.Filter := '';
    if StartDate < EndDate then
      JournalTbl.Filter := 'Dept_ID = '+ inttostr(Deptid) + ' and JNL_DATE >= ''' + formatDateTime('c', StartDate) +
              ''' and JNL_DATE <= ''' + formatDateTime('c', EndDate) + '''';
    if JournalTbl.Filter > '' then
      JournalTbl.Filtered := True;
    JournalTbl.Active := True;
    DMCHandle := Application.Handle;
//    end;
end;

function TDataModuleClient.GetAccountGroup(accountno : integer): string;
begin
  result := '';
  if AccountNo < FTEPROD then
    Result := INCOMEACCOUNT;
  if (AccountNo >= COGS) and (AccountNo < GROSSPROFIT) then
    Result := COGSACCOUNT;
  if (AccountNo >= FIRSTEXPENSE) and (AccountNo < NETOPERATINGPROFIT) then
    Result := EXPENSEACCOUNT;
  if (AccountNo >= NETPROFIT) and (AccountNo < FIRSTBALANCESHEET) then
    Result := PNLAPPROP;
  if (AccountNo >= CASH_AT_BANK) and (AccountNo < TOTAL_CURRENT_ASSETS) then
    Result := CURASSETS;
  if (AccountNo >= NON_DEP_ASSETS) and (AccountNo < TOTALOTHERASSETS) then
    Result := OTHERASSETS;
  if (AccountNo >= BANK_OVERDRAFT) and (AccountNo < TOTAL_CURR_LIAB) then
    Result := CURLIAB;
  if (AccountNo = LOANS) then
    Result := OTHERLIAB;
  if (AccountNo = EQUITY) then
    Result := TOTALEQUITY;
  if ((AccountNo >= CASH_MAN_DEPOSITS) and (AccountNo <= INTANG_ASSET_SALES))
    or ((AccountNo >= OTHER_LIAB_INCURRED) and (AccountNo <= EQUITY_WITHDRAWN)) then
    Result := CASHFLOWDIRECT
  else if (AccountNo >= TAX_ON_SALES) and (AccountNo <= AE_DAYS) then
    Result := CASHFLOWOTHER;
end;

procedure TDataModuleClient.DepartmentsNewRecord(DataSet: TDataSet);
begin
  // Get the current Generator Number from the DB and manually add 1. This overcomes a
  // development fault by not doing a conditional asignment when the new record is inserted
  DepartmentsDEPT_ID.Value := Departments.GeneratorValue('DEPT_NO_GEN', 0) + 1;
	DepartmentsCurrency.AsString := GetLocaleCurrency;
  DepartmentsEXCLUDE_FROM_REPORTING.Value := 0;
  DepartmentsEXCLUDE_FROM_CASHFLOW.Value := 0;
  DepartmentsSYNC_TARGETDATE.Value := 1;
  DepartmentsSYNC_TRACKDATE.Value := 1;
  DepartmentsHIDDEN_DEPT.Value := 0;
  DepartmentsBRANCH_ID.Value := BusinessesBRANCH_ID.Value;
end;

procedure TDataModuleClient.DataModuleCreate(Sender: TObject);
begin
//  NewBusiness.Departments := nil;
  TSActive := False;
  JournalInit := False;
  InvoiceType := AnalysisInv;
end;

function TDataModuleClient.SetDBPassword(Pwd: string): boolean;
begin
  result := True;
  LOSystem.active := True;
  LOSystem.First;
  LOSystem.edit;
	LOSystemDBPassword.AsString := Pwd;
  LOSystem.Post;
  LOSystem.active := False;
end;

procedure TDataModuleClient.QuotesAfterPost(DataSet: TDataSet);
begin
Quotes.Refresh;
QuotesLU.Refresh;
end;

procedure TDataModuleClient.InvoiceLUCalcFields(DataSet: TDataSet);
begin
  InvoiceLUGrossProfit.Value := InvoiceLUNetSales.value - InvoiceLUMaterialsatCost.value - InvoiceLUSubcontractors.value;
  if (not GGlobals.TimeSheetRate) and (InvoiceLUUnitsRequired.value <> 0) then
    InvoiceLUAverageRate.value := InvoiceLUGrossProfit.value / InvoiceLUUnitsRequired.value;
  if GGlobals.TimeSheetRate and (InvoiceLURecordedUnits.value <> 0) then
      InvoiceLUAverageRate.value := InvoiceLUGrossProfit.value / InvoiceLURecordedUnits.value;
end;

procedure TDataModuleClient.BusinessDetailsBeforeClose(DataSet: TDataSet);
begin
  BusinessDetails.edit;
  BusinessDetailsDate_Last_Accessed.value := Now;
  BusinessDetails.post;
end;


procedure TDataModuleClient.ClientDatabaseAfterConnect(
  Sender: TIB_Connection);
begin
  // Open and close this table to correct account grouping first.
  AccountGroups.Active := True;
//  Timeout('CDM After Connect');
  BusinessDetails.Active := True;
//  Timeout('CDM Business Details');
//  Timeout('CDM DateRangers');
  AccountDetails.Active := True;
//  Timeout('CDM AccountDetails');
  Businesses.Active := True;
  BusinessesRef.Active := True;
  Departments.Active := True;
  DateRangers.Active := True;
  CashFlowDept.Active := True;
//  Timeout('CDM Departments');
  DeptRef.active := True;
  DeptRef2.active := True;
//  Timeout('CDM Dept Ref');
  ActualData.Active := True;
//  Timeout('CDM Past Data');
  ActualDataLU.Active := True;
//  Timeout('CDM BPast Data LU');
  PlanData.Active := True;
//  Timeout('CDM PlanData');
  ActualInvoiceDetails.Active := True;
//  Timeout('CDM Actual Invoices');
  LookupSummaryIntervals.Active := True;
//  Timeout('CDM Lookup Summary');
  DateRef.Active := True;
//  Timeout('CDM Date Ref');
  MonitoringData.active := True;
//  Timeout('CDM Monitoring Data');
  MonitoringDataLU.active := True;
//  Timeout('CDM Monitoring Data LU');
  Quotes.Active := True;
//  Timeout('CDM Quotes');
  QuotesLU.Active := True;
//  Timeout('CDM QuotesLU');
  InvoiceLU.Active := True;
//  Timeout('CDM Invoices LU');
  InvoiceLU2.Active := True;
//  Timeout('CDM Invoices LU2');
  InvQuoteLU.Active := True;
//  Timeout('CDM Quotes LU');
  JournalTbl.Active := True;
  JrnlEntries.Active := True;
  DeptOptions.Active := True;
  UserOptions.Active := True;
//  DeptRef
  Cash_Timing.Active := True;
  BusinessHours.Active := True;
  AccountNotes.Active := True;
  OptionNames.Active := True;
  Tracking_Jrnl.Active := True;
  TrackingEntries.Active := True;
  fixDateRangers;
end;

procedure TDataModuleClient.FixDateRangers;
var
  lDataSource : TDataSource;
begin
  LdataSource := DateRangers.MasterSource;
  DateRangers.MasterSource := nil;
  DateRangers.First;
  while DateRangers.Eof = False do
    begin
    if DateRangersStartdate.Value > DateRangersEnddate.Value then
      DateRangers.Delete
    else
      DateRangers.Next;
    end;    // while
  DateRangers.MasterSource := LdataSource;
  DateRef.Refresh;
end;

procedure TDataModuleClient.ClientDatabaseBeforeDisconnect(
  Sender: TIB_Connection);
var
  I: Integer;
begin
	for I := 0 to ComponentIndex - 1 do
		begin
		if ((Components[i].Classname = 'TIBOTable') AND (TIBOTable(Components[i]).Active = True)) Then
			 TIBOTable(Components[i]).Active := False;
		if ((Components[i].ClassName = 'TIBOQuery') AND (TIBOQuery(Components[i]).Active = True)) Then
			 TIBOQuery(Components[i]).Active := False;
		end;
//  Timeout('CDM Disconnect');
{  AccountGroups.Active := False;
  BusinessDetails.Active := False;
  DateRangers.Active := False;
  AccountDetails.Active := False;
  Businesses.Active := False;
  Businessesref.Active := False;
  Departments.Active := False;
  CashFlowDept.Active := False;
  DeptRef.active := False;
  DeptRef2.active := False;
  ActualData.Active := False;
  ActualDataLU.Active := False;
  PlanData.Active := False;
  ActualInvoiceDetails.Active := False;
  LookupSummaryIntervals.Active := False;
  DateRef.Active := False;
  MonitoringData.active := False;
  MonitoringDataLU.active := False;
  Quotes.Active := False;
  QuotesLU.Active := False;
  InvoiceLU.Active := False;
  InvoiceLU2.Active := False;
  InvQuoteLU.Active := False;
  JournalTbl.Active := false;
  JrnlEntries.Active := False;
  DeptOptions.Active := False;
  UserOptions.Active := False;
//  DeptRef
  Cash_Timing.Active := False;
  BusinessHours.Active := False;
  AccountNotes.Active := False;
  OptionNames.Active := False;
  Tracking_Jrnl.Active := False;
	TrackingEntries.Active := False;
	}
  if ClientDatabase.PATH <> '' then
    GGlobals.servers.currentServer.CurrentDBAlias := ClientDatabase.AliasName
  else
    GGlobals.servers.currentServer.CurrentDBAlias := '';
//  Timeout('CDM Disconnected');
end;

procedure TDataModuleClient.DateRangersBeforePost(DataSet: TDataSet);
begin
  if dsDateRangers.State in [dsEdit, dsInsert] then
    DateRangersDept_id.Value := DepartmentsDept_ID.Value;
end;

procedure TDataModuleClient.AccountDetailsNewRecord(DataSet: TDataSet);
begin
  AccountDetailsSTATIC_VALUE.Value := 0;
  AccountDetailsNON_CASH.Value := 0;
end;

procedure TDataModuleClient.ActualInvoiceDetailsNewRecord(
  DataSet: TDataSet);
begin
  ActualInvoiceDetailsORDERCOMPLETE.Value := 0;
  if InvoiceType = MonitorInv then
    begin
    MaxInvoiceID.Active := True;
    if MaxInvoiceIDMax.value > 0 then
      ActualInvoiceDetailsINVOICE_ID.Value := MaxInvoiceIDMax.value + 1
    else
      ActualInvoiceDetailsINVOICE_ID.Value := 1;
    MaxInvoiceID.Active := false;
    ActualInvoiceDetailsINVOICETYPE.Value := integer(MonitorInv);
    end;
end;

procedure TDataModuleClient.ActualInvoiceDetailsAfterPost(
  DataSet: TDataSet);
var
  LBookMark : Pointer;
begin
  Lbookmark := Dataset.GetBookmark;
  Departments.Refresh;
  deptref.Refresh;
  DataSet.GotoBookmark(LBookMark);
end;

procedure TDataModuleClient.DateRangersPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
end;

procedure TDataModuleClient.DateRangersError(Sender: TObject;
  const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList;
  const SQLCODE: Integer; SQLMessage, SQL: TStringList;
  var RaiseException: Boolean);
begin
  RaiseException := False;
  MessageDlg('The date(s) you have entered have one of the following errors:' + #10#13 + '1. The Period End date is the same as an existing period end date' + #10#13 + '2. There is no period Start Date' + #10#13 + '3. The Period Start Date is after the Period End Date' + #10#13 + '4. The period is longer than 366 days (1 Year)', mtWarning, [mbOK], 0);
end;

procedure TDataModuleClient.DepartmentsAfterPost(DataSet: TDataSet);
begin
  DataModuleClient.Departments.refresh;
  DataModuleClient.CashFlowDept.Refresh;
  DataModuleClient.DeptRef.Refresh;
  FindpastDate;
end;

procedure TDataModuleClient.DateRangersAfterPost(DataSet: TDataSet);
begin
  if DateRangers.RecordCount > 4 then
    PostMessage(PlanHandle, LoPastDatePeriods, DateRangers.RecordCount, POSTING);
  DataModuleClient.DateRangers.Refresh;
  DataModuleClient.DateRef.Refresh;
//  Application.ProcessMessages;
end;

procedure TDataModuleClient.ActualDataAfterPost(DataSet: TDataSet);
begin
DataModuleClient.ActualData.Refresh;
DataModuleClient.ActualDataLU.Refresh;
end;

procedure TDataModuleClient.PlanDataAfterPost(DataSet: TDataSet);
begin
DataSet.Refresh;
end;

procedure TDataModuleClient.MonitoringDataAfterPost(DataSet: TDataSet);
begin
DataModuleClient.MonitoringData.Refresh;
DataModuleClient.MonitoringDataLU.Refresh;
end;

procedure TDataModuleClient.DateRangersAfterInsert(DataSet: TDataSet);
begin
// Check if the start date is close to be valid ie > 30/6/1995
// check that the new end date does not exist already. warn
end;

procedure TDataModuleClient.DateRangersAfterDelete(DataSet: TDataSet);
begin
// refresh to update nav control
  if DateRangers.RecordCount < 5 then
   SendMessage(PlanHandle, LoPastDatePeriods, DateRangers.RecordCount, DELETION);
//  Application.ProcessMessages;
end;

Procedure FindPastDate;
begin
//  if SelectedPastDate < 32000 then exit;
  DataModuleClient.DateRangers.IndexName := 'PK_DATERANGERS';
  DataModuleClient.DateRangers.Refresh;
  DataModuleClient.DateRangers.First;
  while (DataModuleClient.DateRangers.eof = False) do
    begin
    if DataModuleClient.DateRangersCURRENTPERIOD.Value <> 0 then
      break;
    DataModuleClient.DateRangers.next;
    end;    // while
end;


procedure TDataModuleClient.QuotesBeforePost(DataSet: TDataSet);
begin
  GroupIDWarn := False;
  if Length(DataModuleClient.QuotesQUOTE_NUMBER.Value) < 1 then
    begin
    GroupIDWarn := True;
    Messagedlg('The Group ID field can not be blank. Please enter a value.', mtWarning, [mbOK], 0);
    end;

end;

procedure TDataModuleClient.QuotesError(Sender: TObject;
  const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList;
  const SQLCODE: Integer; SQLMessage, SQL: TStringList;
  var RaiseException: Boolean);
begin
  if GroupIDWarn then
    RaiseException := False;
end;

procedure TDataModuleClient.DateRangersBeforeInsert(DataSet: TDataSet);
begin
  if DateRangers.RecordCount > 4 then
    BEGIN
    sendMessage(PlanHandle, LoPastDatePeriods, DateRangers.RecordCount, POSTING);
    //Application.ProcessMessages;
    END;
end;

procedure TDataModuleClient.ClientDatabaseBeforeConnect(
  Sender: TIB_Connection);
begin
  if (not GGLobals.Servers.CurrentServer.isEmbedded) or (not fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'fbclient.dll'))then
    ClientDatabase.Server := GGlobals.Servers.CurrentServer.servername + '/' + GGlobals.Servers.CurrentServer.port
  else
    ClientDatabase.Server := '';
  ClientDatabase.Username := GGlobals.Servers.CurrentServer.Currentusername;
  ClientDatabase.Password := GGlobals.Servers.CurrentServer.currentUserPwd;
  if length(GGlobals.Servers.CurrentServer.currentUserRole) > 0 then
    ClientDatabase.SQLRole := GGlobals.Servers.CurrentServer.currentUserRole
  else
    ClientDatabase.SQLRole := 'FBMADMIN';
  ClientDatabase.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
end;

procedure TDataModuleClient.DeptOptionsNewRecord(DataSet: TDataSet);
begin
// Add new Group ID based on last max
  GetMaxGroupID.Active := False;
  GetMaxGroupId.SQL.Clear;
  GetMaxGroupID.SQL.Add('SELECT MAX(OPTION_GROUP_ID) AS MAXID, MAX(EXPIRY_DATE) as MAXDATE FROM DEPT_OPTION_GROUPS');
  GetMaxGroupID.Active := True;
  DeptOptionsOPTION_GROUP_ID.Value := GetMAXGROUPIDMAXID.Value + 1;
  DeptOptionsDEPT_ID.Value := CashFlowDeptDEPT_ID.Value;
  DeptOptionsEXPIRY_DATE.Value := CashFlowDeptCURRENTPLANEND.Value;
  DeptOptions.Post;
  DeptOptions.Refresh;
end;

procedure TDataModuleClient.OptionNamesNewRecord(DataSet: TDataSet);
begin
  GetMaxNameIDX.Active := False;
  GetMaxNameIDX.SQL.Clear;
  GetMaxNameIDX.SQL.Add('SELECT MAX(NAME_INDEX) AS MAXID FROM OPTIONNAMES');
  GetMaxNameIDX.Active := True;
  OptionNamesNAME_INDEX.Value := GetMAXNameIDXMAXID.Value + 1;
end;

procedure TDataModuleClient.CreateDeptExpenseAccountRecords;
var
  Isdepn : Boolean;
  varg : Variant;
begin
  varg := VarArraycreate([0,1], VarVariant);
  ExpAccounts.First;
  while ExpAccounts.Eof = false do
    begin
    if ExpAccountsACCOUNT_TITLE.Value > '' then
      begin
      isDepn := False;
      if ExpAccountsACCOUNT_TITLE.Value = 'Depreciation' then
        begin
        isDepn := True;
        ExpAccounts.Edit;
        ExpAccountsNON_CASH.value := 1;
        ExpAccounts.Post;
        end;
      varg[0] := CashFlowDeptDEPT_ID.Value;
      varg[1] := ExpAccountsACCOUNT_NUMBER.Value;
      if not Dept_Accounts.Locate('DEPT_ID;ACCOUNT_NUMBER', varg, []) then
        begin
        Dept_Accounts.INSERT;
        Dept_Accounts.Post;
        end;
      if (isdepn = True) and (Dept_AccountsBALANCE_SHEET_ACCOUNT.Value <> 1310)  then
        begin
        Dept_Accounts.edit;
        Dept_AccountsBALANCE_SHEET_ACCOUNT.Value := 1310;
        Dept_Accounts.Post;
        end;
      end;
    ExpAccounts.Next;
    end;    // while
  ExpAccounts.First;
end;

procedure TDataModuleClient.ExpAccountsNewRecord(DataSet: TDataSet);
var
  foundAccno : boolean;
  varg : variant;
  AccountCount : integer;
begin
// Provide a new account number
  AccountDetails.Refresh;
  AccountCount := TOTALOTHEREXPENSES - FIRSTEXPENSE;
  Randomize;
  FoundAccNo := False;
  while (foundaccno = False) do
    begin
    varg := Random(AccountCount) + FIRSTEXPENSE; //FIRSTEXPENSE
    if ((varg < TOTALOTHEREXPENSES) and (varg > FIRSTEXPENSE)) then
      begin;
      if AccountDetails.Locate('ACCOUNT_NUMBER', varg, []) = false then
        begin
       // foundaccno := true;
        break;
        end;
      end;
  end;    // while
  if varg <> TOTALOTHEREXPENSES then
    begin
      ExpAccountsACCOUNT_NUMBER.Value := varg;
      ExpAccountsNON_CASH.Value := 0;
      ExpAccountsWAGE_ACCOUNT.Value := 0;
      ExpAccountsINTEREST_ACCOUNT.Value := 0;
      ExpAccountsSTATIC_VALUE.Value := 0;
      ExpAccountsACCOUNT_SUBTITLE.Value := '';
      ExpAccountsACCOUNT_GROUP.Value := AGEXPENSES; // Expenses
   end;
end;

procedure TDataModuleClient.JournalTblNewRecord(DataSet: TDataSet);
begin
  if LastJrnlDate > 0 then
    JournalTblJNL_DATE.Value := LastJrnlDate
  else
    JournalTblJNL_DATE.Value := DepartmentsCURRENTPLANEND.Value;
  JournalTblJNL_NO.Value := JournalTbl.GeneratorValue('GEN_JOURNAL_ID', 1);
  JournalTblDEPT_ID.Value := CashFlowDeptDEPT_ID.Value;
  JournalTblNON_CASH.Value := 0;
  JournalInit := True;
end;

procedure TDataModuleClient.JournalTblAfterScroll(DataSet: TDataSet);
begin
  if JournalInit then
    begin
    if JrnlEntries.Active then
      begin
      if JrnlEntries.RecordCount = 0 then
        JrnlEntries.Insert;
      end;
    end;
end;

procedure TDataModuleClient.JrnlEntriesNewRecord(DataSet: TDataSet);
begin
  if JournalInit and (JournalTbl.RecordCount > 0) then
    begin
    MaxJrnlIndex.Active := False;
    MaxJrnlIndex.SQL.Clear;
    MaxJrnlIndex.SQL.Add('select MAX(JNL_INDEX), Sum(DR_AMOUNT) as SUMDR, SUM(CR_AMOUNT) as SUMCR from JNL_ENTRIES Where JNL_NO = ''' + JournalTblJNL_NO.AsString + '''');
    MaxJrnlIndex.Active := True;
    JrnlEntriesJNL_INDEX.Value := MaxJrnlIndexMAX.Value + 1;
    if MaxJrnlIndexSUMDR.Value <> MaxJrnlIndexSUMCR.Value then
      begin
      if MaxJrnlIndexSUMDR.Value > MaxJrnlIndexSUMCR.Value then
        begin
        JrnlEntriesCR_AMOUNT.Value := MaxJrnlIndexSUMDR.Value - MaxJrnlIndexSUMCR.Value;
        JrnlEntriesDR_AMOUNT.Value := 0;
        end
      else
        begin
        JrnlEntriesDR_AMOUNT.Value := MaxJrnlIndexSUMCR.Value - MaxJrnlIndexSUMDR.Value;
        JrnlEntriesCR_AMOUNT.Value := 0;
        end;
      end;
    end;
end;

procedure TDataModuleClient.JournalTblBeforeScroll(DataSet: TDataSet);
begin
  if JournalInit then
    begin
    if DSJournalEntries.State in [dsInsert] then
      begin
      if (JrnlEntriesDR_AMOUNT.Value <> 0) or (JrnlEntriesCR_AMOUNT.Value <> 0) then
        JrnlEntries.Post
      else
        JrnlEntries.Cancel;
      end;
    end;
end;

procedure TDataModuleClient.QuotesCalcFields(DataSet: TDataSet);
begin
  QuotesQ_GP.Value := Round(QuotesQ_Value.Value - QuotesQ_Materials.Value - QuotesQ_SubContractors.Value);
  if QuotesTargetUnits.Value <> 0 then
    QuotesQ_Rate.Value := QuotesQ_GP.Value / QuotesTargetUnits.Value;
end;

procedure TDataModuleClient.ActualInvoiceDetailsRECORDEDUNITSChange(
  Sender: TField);
begin
  if ActualInvoiceDetailsUnitsRequired.Value = 0 then
    ActualInvoiceDetailsUnitsRequired.Value := ActualInvoiceDetailsRECORDEDUNITS.Value;
end;

procedure TDataModuleClient.ActualInvoiceDetailsCalcFields(
  DataSet: TDataSet);
begin
  ActualInvoiceDetailsGrossProfit.Value := ActualInvoiceDetailsNetSales.Value
              - ActualInvoiceDetailsMaterialsatCost.Value - ActualInvoiceDetailsSubcontractors.Value;
  if ActualInvoiceDetailsNetSales.Value <> 0 then
    ActualInvoiceDetailsGPPC.Value :=  ActualInvoiceDetailsGrossProfit.Value * 100 / ActualInvoiceDetailsNetSales.Value;
  if ActualInvoiceDetailsUnitsRequired.Value <> 0 then
    ActualInvoiceDetailsaverageRate.Value := ActualInvoiceDetailsGrossProfit.Value / ActualInvoiceDetailsUnitsRequired.Value;
end;

procedure TDataModuleClient.ExpAccountsAfterPost(DataSet: TDataSet);
begin
  ExpAccounts.Refresh;
end;

procedure TDataModuleClient.Dept_AccountsNewRecord(DataSet: TDataSet);
begin
  Dept_AccountsDEPT_ID.Value := CashFlowDeptDEPT_ID.Value;
  Dept_AccountsACCOUNT_NUMBER.Value := EXPAccountsACCOUNT_NUMBER.Value;
  Dept_AccountsPAID_VIA_AP.Value := 0;
  Dept_AccountsTAX_RATE.Value := 0;
end;

procedure TDataModuleClient.DSDepartmentsDataChange(Sender: TObject;
  Field: TField);
var
  NewDeptID, LParam : integer;
begin
  if TSActive then
    begin
    NewDeptID := Integer(DepartmentsDept_id.NewValue);
    Lparam := POSTING;
    SendGetIntMessage(DMCHandle, LoDepartmentChange, NewDeptID, Lparam);
    end;
end;

procedure TDataModuleClient.Import_HeaderNewRecord(DataSet: TDataSet);
begin
  Import_HeaderIMPORT_ID.Value := Import_Header.GeneratorValue('GEN_IMPORT_HEADER_ID', 1);
  Import_HeaderUSE_ACCOUNT_NUMBER.Value := 0;
  Import_HeaderIS_YTD.Value := 1;
  Import_HeaderTEMPLATE_ID.Value := 1;
  Import_HeaderDESTINATION.Value := 'Past Information';
end;

procedure TDataModuleClient.Imported_DataNewRecord(DataSet: TDataSet);
begin
  Imported_DataSEQUENCE_NUMBER.value := 1;
  Imported_DataIMPORT_ID.Value := Import_HeaderIMPORT_ID.value;
  Imported_DataACCOUNT_NUMBER.Value := 1500;
end;

procedure TDataModuleClient.Template_DetailsNewRecord(DataSet: TDataSet);
begin
  Template_DetailsTEMPLATE_ID.Value := Import_HeaderTEMPLATE_ID.Value;
  Template_DetailsACCOUNT_NUMBER.Value := 1500; // Suspense Account
end;

procedure TDataModuleClient.MonitoringImpInvNewRecord(DataSet: TDataSet);
begin
  MonitoringImpInvDept_ID.Value := DATAMODULECLIENT.DepartmentsDEPT_ID.Value;
  MonitoringImpInvINVOICETYPE.Value := 2;
  MonitoringImpInvINVOICE_ID.value := MonitoringImpInv.GeneratorValue('INV_NO_GEN', 1);
  MonitoringImpInvUNITSTORUN.Value := 0;
  MonitoringImpInvQUOTE_NUMBER.Value := '';
end;

procedure TDataModuleClient.Import_TemplatesNewRecord(DataSet: TDataSet);
begin
  Import_TemplatesTEMPLATE_ID.Value := Import_Templates.GeneratorValue('temp_id_gen', 1);
end;

procedure TDataModuleClient.BusinessesNewRecord(DataSet: TDataSet);
begin
  BusinessesBranch_id.Value := Businesses.GeneratorValue('GEN_BUSINESS_BRANCH_ID', 1);
  BusinessesEXCLUDE_FROM_REPORTING.Value := 0;
  BusinessesHIDDEN_DEPT.Value := 0;
end;

procedure TDataModuleClient.DeptRefAfterPost(DataSet: TDataSet);
begin
  DataModuleClient.Departments.refresh;
  DataModuleClient.DeptRef.Refresh;
end;

procedure TDataModuleClient.ReopenDataset(ADataSet: TDataSet; DisableCtrls: Boolean);
begin
  if DisableCtrls then
    ADataSet.DisableControls;
  try
    ADataSet.Close;
    ADataSet.Open;
  finally
  if DisableCtrls then
    ADataSet.EnableControls;
  end;
end;

function TDataModuleClient.AssignDeptnewBranch(DeptID, BranchID: Integer): Boolean;
begin
  if DeptRef.Locate('DEPT_ID', Variant(DeptID), []) then
    begin
    DeptRef.Edit;
    Old_Branch_ID := DeptRefBRANCH_ID.Value;
    DeptRefBRANCH_ID.Value := BranchID;
    DeptRef.Post;
    DeptRef.refresh;
    Departments.refresh;
    Businesses.refresh;
//    ReopenDataset(DeptRef, True);
//    ReopenDataset(Departments, True);
    Result := True;
    end
  else
    result := False;
end;

procedure TDataModuleClient.DeptRefNewRecord(DataSet: TDataSet);
begin
  DeptRefDEPT_ID.Value := DeptRef.GeneratorValue('DEPT_NO_GEN', 0) + 1;
	DeptRefCurrency.AsString := GetLocaleCurrency;
  DeptRefEXCLUDE_FROM_REPORTING.Value := 0;
  DeptRefEXCLUDE_FROM_CASHFLOW.Value := 0;
  DeptRefSYNC_TARGETDATE.Value := 0;
  DeptRefSYNC_TRACKDATE.Value := 0;
  DeptRefHIDDEN_DEPT.Value := 0;
  DeptRefBRANCH_ID.Value := BusinessesBRANCH_ID.Value;
end;

procedure TDataModuleClient.SetBusinessTargetStart(BranchID: Integer; TargetEnd : TDateTime);
begin
  DeptRef.DisableControls;
  if Businesses.locate('BRANCH_ID', variant(BranchID), []) then
    begin
    Businesses.edit;
    if (DaySpan(Targetend, DataModuleClient.BusinessesTARGET_START.value) > 366) then
      BusinessesTARGET_START.value := IncYear(TargetEnd, - 1) + 1;
    Businesses.Post;
    Businesses.locate('BRANCH_ID', variant(BranchID), []);
    end;
  Sync_Businessdates;
  ReopenDataset(DeptRef, False);
  Deptref.EnableControls;
end;

procedure TDataModuleClient.SetBusinessTrackStart(BranchID: Integer; TrackEnd : TDateTime);
begin
  DeptRef.DisableControls;
  if Businesses.locate('BRANCH_ID', variant(BranchID), []) then
    begin
    Businesses.edit;
    if (DaySpan(Trackend, DataModuleClient.BusinessesTRACKING_START.value) > 366) then
      BusinessesTRACKING_START.value := IncYear(TrackEnd, - 1) + 1;
    Businesses.Post;
    Businesses.locate('BRANCH_ID', variant(BranchID), []);
    end;
  Sync_Businessdates;
  ReopenDataset(DeptRef, false);
  Deptref.EnableControls;
end;

procedure TDataModuleClient.Sync_Businessdates; // this works with current Business record
begin
  DeptRef.Refresh;
  NoofRecords := DeptRef.RecordCount;
  DeptRef.First;
  while DeptRef.Eof = False do
    begin
    if (DeptRefSYNC_TARGETDATE.Value > 0) or (DeptRefSYNC_TRACKDATE.Value > 0) then
      begin
      DeptRef.Edit;
      if (DeptRefSYNC_TARGETDATE.Value > 0) then
        begin
        DeptRefCURRENTPLANSTART.Value := BusinessesTARGET_START.value;
        DeptRefCURRENTPLANEND.Value := BusinessesTARGET_END.value;
        end;
      if (DeptRefSYNC_TRACKDATE.Value > 0) then
        Begin
        DeptRefCURRENTMONITORINGSTART.Value := BusinessesTRACKing_START.value;
        DeptRefCURRENTMONITORINGEND.Value := BusinessesTRACKing_END.value;
        end;
      if DataModuleClient.DeptrefCurrentPlanStart.value < DataModuleClient.DeptrefFIRSTPLANDATE.value then
        DataModuleClient.DeptrefFIRSTPLANDATE.value := DataModuleClient.DeptrefCurrentPlanStart.value;
      if DataModuleClient.DeptrefCurrentPlanEnd.value > DataModuleClient.DeptrefLATESTPLANDATE.value then
          DataModuleClient.DeptrefLATESTPLANDATE.value := DataModuleClient.DeptrefCurrentPlanEnd.value;
      if (DeptRefSYNC_TARGETDATE.Value > 0) or (DeptRefSYNC_TRACKDATE.Value > 0) then
      DeptRef.Post;
      end;
    DeptRef.next;
    end;    // while
end;

procedure TDataModuleClient.BusinessesAfterPost(DataSet: TDataSet);
begin
  if CashFlowDept.RecordCount > 0 then Exit;
  CashFlowDept.Insert;
  CashFlowDeptREVENUE_GROUP_NAME.Value := 'Hidden';
  CashFlowDeptEXCLUDE_FROM_REPORTING.Value := 1;
  CashFlowDeptHIDDEN_DEPT.Value := 1;
  CashFlowDeptSYNC_TARGETDATE.Value := 1;
  CashFlowDeptSYNC_TRACKDATE.Value := 1;
  CashFlowDeptEXCLUDE_FROM_CASHFLOW.Value := 0;
  CashFlowDept.Post;
end;

procedure TDataModuleClient.CashFlowDeptNewRecord(DataSet: TDataSet);
begin
  CashFlowDeptDEPT_ID.Value := Departments.GeneratorValue('DEPT_NO_GEN', 0) + 1;
  CashFlowDeptCurrency.AsString := GetLocaleCurrency;
  CashFlowDeptEXCLUDE_FROM_REPORTING.Value := 0;
  CashFlowDeptEXCLUDE_FROM_CASHFLOW.Value := 0;
  CashFlowDeptSYNC_TARGETDATE.Value := 0;
  CashFlowDeptSYNC_TRACKDATE.Value := 0;
  CashFlowDeptHIDDEN_DEPT.Value := 0;
  CashFlowDeptBRANCH_ID.Value := BusinessesBRANCH_ID.Value;
end;

procedure TDataModuleClient.DepartmentsAfterDelete(DataSet: TDataSet);
begin
// here we must refresh other tables that also look at Departments Table
  DeptRef.Refresh;
  Dateref.Refresh;
  if DeptRef2.Active then
    DeptRef2.Refresh;
end;

procedure TDataModuleClient.DeptRefAfterDelete(DataSet: TDataSet);
begin
  Departments.Refresh;
  Dateref.Refresh;
  if DeptRef2.Active then
    DeptRef2.Refresh;
end;

procedure TDataModuleClient.AccountGroupsAfterOpen(DataSet: TDataSet);
begin
// here is check to see if grouping is set up correctly.
// Scan through the groups to find 'Other Income and Expenses'
// if the Group ID == 4, then change it to 9 and insert 4 'Direct' and 5 'Depreciation, Interest and Tax'
  AccountGroups.First;
  while (AccountGroups.Eof = false) do
    begin
    if AccountGroupsGROUP_Name.Value = 'Other Income and Expenses' then
      begin
      if AccountGroupsACCOUNT_GRP_ID.Value = 4 then
        begin
        AccountGroups.edit;
        AccountGroupsACCOUNT_GRP_ID.Value := 9;
        AccountGroups.Post;
        end;
      end;
    Accountgroups.Next;
    end;
  AccountGroups.First;
  while (AccountGroups.Eof = false) do
    begin
    if AccountGroupsGROUP_Name.Value = 'Operating Expenses' then
      begin
      AccountGroups.edit;
      AccountGroupsGROUP_NAME.Value := 'General';
      AccountGroupsACCOUNT_GRP_ID.value := 4;
      AccountGroups.Post;
      AccountGroups.Insert;
      AccountGroupsGROUP_Name.Value := 'Direct';
      AccountGroupsACCOUNT_GRP_ID.value := 3;
      AccountGroupsGROUP_DR_SIGN.Value := 1;
      AccountGroups.Post;
      AccountGroups.Insert;
      AccountGroupsACCOUNT_GRP_ID.value := 5;
      AccountGroupsGROUP_Name.Value := 'Misc. Depn, Interest and Tax';
      AccountGroupsGROUP_DR_SIGN.Value := 1;
      AccountGroups.Post;
      break;
      end;
    Accountgroups.Next;
    end;    // while
end;

procedure TDataModuleClient.AccountDetailsAfterOpen(DataSet: TDataSet);
begin
  // check to see if Total Direct Expenses and Total Depreciation, Interest is present
  if not AccountDetails.Locate('ACCOUNT_NUMBER', variant(OTHERDIRECT), []) then
    begin
    Accountdetails.Insert;
    AccountDetailsACCOUNT_NUMBER.Value := OTHERDIRECT;
    AccountDetailsACCOUNT_TITLE.Value := 'Total Direct Expenses';
    AccountDetailsACCOUNT_SUBTITLE.Value := 'Includes COGS (Goods, Materials and Subcontractors)';
    AccountDetailsSTATIC_VALUE.Value := 0;
    AccountDetailsNON_CASH.Value := 0;
    AccountDetailsWAGE_ACCOUNT.Value := 0;
    AccountDetailsINTEREST_ACCOUNT.Value := 0;
    AccountDetailsACCOUNT_GROUP.Value := AGDIRECTEXP;
    AccountDetails.Post;
    end;
  if not AccountDetails.Locate('ACCOUNT_NUMBER', variant(DEPNINTEREST), []) then
    begin
    Accountdetails.Insert;
    AccountDetailsACCOUNT_NUMBER.Value := DEPNINTEREST;
    AccountDetailsACCOUNT_TITLE.Value := 'Total Depreciation and Interest';
    AccountDetailsACCOUNT_SUBTITLE.Value := '';
    AccountDetailsSTATIC_VALUE.Value := 0;
    AccountDetailsNON_CASH.Value := 0;
    AccountDetailsWAGE_ACCOUNT.Value := 0;
    AccountDetailsINTEREST_ACCOUNT.Value := 0;
    AccountDetailsACCOUNT_GROUP.Value := AGDEPNINT;
    AccountDetails.Post;
    end;
  if AccountDetails.Locate('ACCOUNT_NUMBER', variant(GROSSPROFIT), []) then
    begin
    if AccountDetailsACCOUNT_GROUP.IsNull then
      begin
      AccountDetails.Edit;
      AccountDetailsACCOUNT_GROUP.Value := 1;
      AccountDetails.Post;
      end;
    end;
  if AccountDetails.Locate('ACCOUNT_NUMBER', variant(TOTALEXPENSES), []) then
    begin
    if AccountDetailsACCOUNT_GROUP.IsNull then
      begin
      AccountDetails.Edit;
      AccountDetailsACCOUNT_GROUP.Value := 4;
      AccountDetails.Post;
      end;
    end;
  if AccountDetails.Locate('ACCOUNT_NUMBER', variant(TOTALNONCASHEXP), []) then
    begin
    if AccountDetailsACCOUNT_GROUP.IsNull then
      begin
      AccountDetails.Edit;
      AccountDetailsACCOUNT_GROUP.Value := 4;
      AccountDetails.Post;
      end;
    end;
  if AccountDetails.Locate('ACCOUNT_NUMBER', variant(NETOPERATINGPROFIT), []) then
    begin
    if AccountDetailsACCOUNT_GROUP.IsNull then
      begin
      AccountDetails.Edit;
      AccountDetailsACCOUNT_GROUP.Value := 1;
      AccountDetails.Post;
      end;
    end;
  if AccountDetails.Locate('ACCOUNT_NUMBER', variant(NETPROFIT), []) then
    begin
    if AccountDetailsACCOUNT_GROUP.IsNull then
      begin
      AccountDetails.Edit;
      AccountDetailsACCOUNT_GROUP.Value := 1;
      AccountDetails.Post;
      end;
    end;
end;

end.
