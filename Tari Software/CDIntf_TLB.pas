unit CDIntf_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 14/03/2002 2:20:06 PM from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: D:\HA\cdintf.dll (1)
// IID\LCID: {4856F146-7516-11D3-BBE5-D53DCBD65107}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Hint: TypeInfo 'CDIntf' changed to 'CDIntf_'
//   Error creating palette bitmap of (TCDIntf) : Server D:\HA\cdintf.dll contains no icons
//   Error creating palette bitmap of (TDocument) : Server D:\HA\cdintf.dll contains no icons
// ************************************************************************ //
{$WARN SYMBOL_PLATFORM OFF}
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CDIntfMajorVersion = 1;
  CDIntfMinorVersion = 0;

  LIBID_CDIntf: TGUID = '{4856F146-7516-11D3-BBE5-D53DCBD65107}';

  DIID_ICDIntf: TGUID = '{68B34266-7559-11D3-BBE5-D53DCBD65107}';
  CLASS_CDIntf_: TGUID = '{68B34267-7559-11D3-BBE5-D53DCBD65107}';
  DIID_IDIDocument: TGUID = '{D307A697-F048-4AFC-9170-572440CD523F}';
  CLASS_Document: TGUID = '{4475F8B7-1316-4853-82E6-C6149A7BA4C3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICDIntf = dispinterface;
  IDIDocument = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CDIntf_ = ICDIntf;
  Document = IDIDocument;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}
  PDouble1 = ^Double; {*}


// *********************************************************************//
// DispIntf:  ICDIntf
// Flags:     (4096) Dispatchable
// GUID:      {68B34266-7559-11D3-BBE5-D53DCBD65107}
// *********************************************************************//
  ICDIntf = dispinterface
    ['{68B34266-7559-11D3-BBE5-D53DCBD65107}']
    property FontEmbedding: WordBool dispid 1;
    property PageContentCompression: WordBool dispid 2;
    property JPEGCompression: WordBool dispid 3;
    property PaperSize: Smallint dispid 4;
    property PaperWidth: Integer dispid 5;
    property PaperLength: Integer dispid 6;
    property Orientation: Smallint dispid 7;
    property Resolution: Integer dispid 8;
    property DefaultDirectory: WideString dispid 9;
    property DefaultFileName: WideString dispid 10;
    property FileNameOptions: Smallint dispid 11;
    property HorizontalMargin: Smallint dispid 12;
    property VerticalMargin: Smallint dispid 13;
    property HTMLUseLayers: WordBool dispid 14;
    property HTMLMultipleHTMLs: WordBool dispid 15;
    property Attributes: Integer dispid 31;
    property RTFFullRTF: WordBool dispid 36;
    property RTFTextRTF: WordBool dispid 37;
    property RTFTextOnly: WordBool dispid 38;
    property JPegLevel: Smallint dispid 41;
    property ServerAddress: WideString dispid 45;
    property ServerPort: Integer dispid 46;
    property ServerUsername: WideString dispid 47;
    property EmailFieldTo: WideString dispid 48;
    property EmailFieldCC: WideString dispid 49;
    property EmailFieldBCC: WideString dispid 50;
    property EmailSubject: WideString dispid 51;
    property EmailMessage: WideString dispid 52;
    property EmailPrompt: WordBool dispid 53;
    function  CreateDC: OLE_HANDLE; dispid 16;
    function  SetDefaultConfig: WordBool; dispid 17;
    function  SetDefaultPrinter: WordBool; dispid 18;
    function  StartSpooler: WordBool; dispid 19;
    function  StopSpooler: WordBool; dispid 20;
    function  PDFDriverInit(const PrinterName: WideString): Integer; dispid 21;
    function  HTMLDriverInit(const PrinterName: WideString): Integer; dispid 22;
    function  EMFDriverInit(const PrinterName: WideString): Integer; dispid 23;
    procedure DriverEnd; dispid 24;
    function  GetLastErrorMsg: WideString; dispid 25;
    function  RestoreDefaultPrinter: WordBool; dispid 26;
    function  DriverInit(const PrinterName: WideString): Integer; dispid 27;
    function  GetDocumentTitle(JobID: Integer): WideString; dispid 28;
    function  SetBookmark(hDC: Integer; lParent: Integer; const Title: WideString): Integer; dispid 29;
    function  CaptureEvents(bCapture: Integer): Integer; dispid 30;
    function  SetWatermark(const Watermark: WideString; const FontName: WideString; 
                           FontSize: Smallint; Orientation: Smallint; Color: Integer; 
                           HorzPos: Integer; VertPos: Integer; Foreground: Integer): Integer; dispid 32;
    function  SetHyperLink(hDC: Integer; const URL: WideString): Integer; dispid 33;
    function  SetDefaultConfigEx: WordBool; dispid 34;
    function  RTFDriverInit(const PrinterName: WideString): Integer; dispid 35;
    function  SendMessagesTo(const WndClass: WideString): Integer; dispid 39;
    function  BatchConvert(const FileName: WideString): Integer; dispid 40;
    function  Lock(const szLockName: WideString): Integer; dispid 42;
    function  Unlock(const szLockName: WideString; dwTimeout: Integer): Integer; dispid 43;
    function  SendMail(const szTo: WideString; const szCC: WideString; const szBCC: WideString; 
                       const szSubject: WideString; const szMessage: WideString; 
                       const szFilenames: WideString; lOptions: Integer): Integer; dispid 44;
    function  TestLock(const szLockName: WideString): Integer; dispid 54;
    function  GLock: Integer; dispid 55;
    function  GUnlock: Integer; dispid 56;
    function  SetDocEmailProps(const szDocTitle: WideString; const szTo: WideString; 
                               const szCC: WideString; const szBCC: WideString; 
                               const szSubject: WideString; const szMessage: WideString; 
                               lPrompt: Integer): Integer; dispid 57;
    function  SetDocServerProps(const szDocTitle: WideString; const szHostname: WideString; 
                                const szUsername: WideString): Integer; dispid 58;
  end;

// *********************************************************************//
// DispIntf:  IDIDocument
// Flags:     (4096) Dispatchable
// GUID:      {D307A697-F048-4AFC-9170-572440CD523F}
// *********************************************************************//
  IDIDocument = dispinterface
    ['{D307A697-F048-4AFC-9170-572440CD523F}']
    property Title: WideString dispid 1;
    property Subject: WideString dispid 2;
    property Creator: WideString dispid 3;
    property Author: WideString dispid 4;
    property Linearized: Integer dispid 19;
    function  Open(const FileName: WideString): WordBool; dispid 6;
    function  Save(const FileName: WideString): WordBool; dispid 7;
    function  Append(const FileName: WideString): WordBool; dispid 8;
    function  AppendEx(const Document: IDispatch): WordBool; dispid 9;
    function  SetBookmark(Page: Integer; const Text: WideString; Level: Integer): WordBool; dispid 10;
    procedure ClearBookmarks; dispid 11;
    function  SearchText(Start: Smallint; const Text: WideString; var Page: Integer; 
                         var xPos: Double; var yPos: Double): WordBool; dispid 12;
    function  Merge(const FileName: WideString; Options: Integer): WordBool; dispid 13;
    function  MergeEx(const Document: IDispatch; Options: Integer): WordBool; dispid 14;
    function  Encrypt(const OwnerPassword: WideString; const UserPassword: WideString; 
                      Permissions: Integer): WordBool; dispid 15;
    function  PageCount: Integer; dispid 16;
    function  OpenEx(const FileName: WideString; const Password: WideString): WordBool; dispid 17;
    procedure SetFlateCompression(Ratio: Smallint); dispid 18;
  end;

// *********************************************************************//
// The Class CoCDIntf_ provides a Create and CreateRemote method to          
// create instances of the default interface ICDIntf exposed by              
// the CoClass CDIntf_. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCDIntf_ = class
    class function Create: ICDIntf;
    class function CreateRemote(const MachineName: string): ICDIntf;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCDIntf
// Help String      : 
// Default Interface: ICDIntf
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCDIntfProperties= class;
{$ENDIF}
  TCDIntf = class(TOleServer)
  private
    FIntf:        ICDIntf;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCDIntfProperties;
    function      GetServerProperties: TCDIntfProperties;
{$ENDIF}
    function      GetDefaultInterface: ICDIntf;
  protected
    procedure InitServerData; override;
    function Get_FontEmbedding: WordBool;
    procedure Set_FontEmbedding(Value: WordBool);
    function Get_PageContentCompression: WordBool;
    procedure Set_PageContentCompression(Value: WordBool);
    function Get_JPEGCompression: WordBool;
    procedure Set_JPEGCompression(Value: WordBool);
    function Get_PaperSize: Smallint;
    procedure Set_PaperSize(Value: Smallint);
    function Get_PaperWidth: Integer;
    procedure Set_PaperWidth(Value: Integer);
    function Get_PaperLength: Integer;
    procedure Set_PaperLength(Value: Integer);
    function Get_Orientation: Smallint;
    procedure Set_Orientation(Value: Smallint);
    function Get_Resolution: Integer;
    procedure Set_Resolution(Value: Integer);
    function Get_DefaultDirectory: WideString;
    procedure Set_DefaultDirectory(const Value: WideString);
    function Get_DefaultFileName: WideString;
    procedure Set_DefaultFileName(const Value: WideString);
    function Get_FileNameOptions: Smallint;
    procedure Set_FileNameOptions(Value: Smallint);
    function Get_HorizontalMargin: Smallint;
    procedure Set_HorizontalMargin(Value: Smallint);
    function Get_VerticalMargin: Smallint;
    procedure Set_VerticalMargin(Value: Smallint);
    function Get_HTMLUseLayers: WordBool;
    procedure Set_HTMLUseLayers(Value: WordBool);
    function Get_HTMLMultipleHTMLs: WordBool;
    procedure Set_HTMLMultipleHTMLs(Value: WordBool);
    function Get_Attributes: Integer;
    procedure Set_Attributes(Value: Integer);
    function Get_RTFFullRTF: WordBool;
    procedure Set_RTFFullRTF(Value: WordBool);
    function Get_RTFTextRTF: WordBool;
    procedure Set_RTFTextRTF(Value: WordBool);
    function Get_RTFTextOnly: WordBool;
    procedure Set_RTFTextOnly(Value: WordBool);
    function Get_JPegLevel: Smallint;
    procedure Set_JPegLevel(Value: Smallint);
    function Get_ServerAddress: WideString;
    procedure Set_ServerAddress(const Value: WideString);
    function Get_ServerPort: Integer;
    procedure Set_ServerPort(Value: Integer);
    function Get_ServerUsername: WideString;
    procedure Set_ServerUsername(const Value: WideString);
    function Get_EmailFieldTo: WideString;
    procedure Set_EmailFieldTo(const Value: WideString);
    function Get_EmailFieldCC: WideString;
    procedure Set_EmailFieldCC(const Value: WideString);
    function Get_EmailFieldBCC: WideString;
    procedure Set_EmailFieldBCC(const Value: WideString);
    function Get_EmailSubject: WideString;
    procedure Set_EmailSubject(const Value: WideString);
    function Get_EmailMessage: WideString;
    procedure Set_EmailMessage(const Value: WideString);
    function Get_EmailPrompt: WordBool;
    procedure Set_EmailPrompt(Value: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICDIntf);
    procedure Disconnect; override;
    function  CreateDC: OLE_HANDLE;
    function  SetDefaultConfig: WordBool;
    function  SetDefaultPrinter: WordBool;
    function  StartSpooler: WordBool;
    function  StopSpooler: WordBool;
    function  PDFDriverInit(const PrinterName: WideString): Integer;
    function  HTMLDriverInit(const PrinterName: WideString): Integer;
    function  EMFDriverInit(const PrinterName: WideString): Integer;
    procedure DriverEnd;
    function  GetLastErrorMsg: WideString;
    function  RestoreDefaultPrinter: WordBool;
    function  DriverInit(const PrinterName: WideString): Integer;
    function  GetDocumentTitle(JobID: Integer): WideString;
    function  SetBookmark(hDC: Integer; lParent: Integer; const Title: WideString): Integer;
    function  CaptureEvents(bCapture: Integer): Integer;
    function  SetWatermark(const Watermark: WideString; const FontName: WideString; 
                           FontSize: Smallint; Orientation: Smallint; Color: Integer; 
                           HorzPos: Integer; VertPos: Integer; Foreground: Integer): Integer;
    function  SetHyperLink(hDC: Integer; const URL: WideString): Integer;
    function  SetDefaultConfigEx: WordBool;
    function  RTFDriverInit(const PrinterName: WideString): Integer;
    function  SendMessagesTo(const WndClass: WideString): Integer;
    function  BatchConvert(const FileName: WideString): Integer;
    function  Lock(const szLockName: WideString): Integer;
    function  Unlock(const szLockName: WideString; dwTimeout: Integer): Integer;
    function  SendMail(const szTo: WideString; const szCC: WideString; const szBCC: WideString; 
                       const szSubject: WideString; const szMessage: WideString; 
                       const szFilenames: WideString; lOptions: Integer): Integer;
    function  TestLock(const szLockName: WideString): Integer;
    function  GLock: Integer;
    function  GUnlock: Integer;
    function  SetDocEmailProps(const szDocTitle: WideString; const szTo: WideString; 
                               const szCC: WideString; const szBCC: WideString; 
                               const szSubject: WideString; const szMessage: WideString; 
                               lPrompt: Integer): Integer;
    function  SetDocServerProps(const szDocTitle: WideString; const szHostname: WideString; 
                                const szUsername: WideString): Integer;
    property  DefaultInterface: ICDIntf read GetDefaultInterface;
    property FontEmbedding: WordBool read Get_FontEmbedding write Set_FontEmbedding;
    property PageContentCompression: WordBool read Get_PageContentCompression write Set_PageContentCompression;
    property JPEGCompression: WordBool read Get_JPEGCompression write Set_JPEGCompression;
    property PaperSize: Smallint read Get_PaperSize write Set_PaperSize;
    property PaperWidth: Integer read Get_PaperWidth write Set_PaperWidth;
    property PaperLength: Integer read Get_PaperLength write Set_PaperLength;
    property Orientation: Smallint read Get_Orientation write Set_Orientation;
    property Resolution: Integer read Get_Resolution write Set_Resolution;
    property DefaultDirectory: WideString read Get_DefaultDirectory write Set_DefaultDirectory;
    property DefaultFileName: WideString read Get_DefaultFileName write Set_DefaultFileName;
    property FileNameOptions: Smallint read Get_FileNameOptions write Set_FileNameOptions;
    property HorizontalMargin: Smallint read Get_HorizontalMargin write Set_HorizontalMargin;
    property VerticalMargin: Smallint read Get_VerticalMargin write Set_VerticalMargin;
    property HTMLUseLayers: WordBool read Get_HTMLUseLayers write Set_HTMLUseLayers;
    property HTMLMultipleHTMLs: WordBool read Get_HTMLMultipleHTMLs write Set_HTMLMultipleHTMLs;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property RTFFullRTF: WordBool read Get_RTFFullRTF write Set_RTFFullRTF;
    property RTFTextRTF: WordBool read Get_RTFTextRTF write Set_RTFTextRTF;
    property RTFTextOnly: WordBool read Get_RTFTextOnly write Set_RTFTextOnly;
    property JPegLevel: Smallint read Get_JPegLevel write Set_JPegLevel;
    property ServerAddress: WideString read Get_ServerAddress write Set_ServerAddress;
    property ServerPort: Integer read Get_ServerPort write Set_ServerPort;
    property ServerUsername: WideString read Get_ServerUsername write Set_ServerUsername;
    property EmailFieldTo: WideString read Get_EmailFieldTo write Set_EmailFieldTo;
    property EmailFieldCC: WideString read Get_EmailFieldCC write Set_EmailFieldCC;
    property EmailFieldBCC: WideString read Get_EmailFieldBCC write Set_EmailFieldBCC;
    property EmailSubject: WideString read Get_EmailSubject write Set_EmailSubject;
    property EmailMessage: WideString read Get_EmailMessage write Set_EmailMessage;
    property EmailPrompt: WordBool read Get_EmailPrompt write Set_EmailPrompt;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCDIntfProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCDIntf
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCDIntfProperties = class(TPersistent)
  private
    FServer:    TCDIntf;
    function    GetDefaultInterface: ICDIntf;
    constructor Create(AServer: TCDIntf);
  protected
    function Get_FontEmbedding: WordBool;
    procedure Set_FontEmbedding(Value: WordBool);
    function Get_PageContentCompression: WordBool;
    procedure Set_PageContentCompression(Value: WordBool);
    function Get_JPEGCompression: WordBool;
    procedure Set_JPEGCompression(Value: WordBool);
    function Get_PaperSize: Smallint;
    procedure Set_PaperSize(Value: Smallint);
    function Get_PaperWidth: Integer;
    procedure Set_PaperWidth(Value: Integer);
    function Get_PaperLength: Integer;
    procedure Set_PaperLength(Value: Integer);
    function Get_Orientation: Smallint;
    procedure Set_Orientation(Value: Smallint);
    function Get_Resolution: Integer;
    procedure Set_Resolution(Value: Integer);
    function Get_DefaultDirectory: WideString;
    procedure Set_DefaultDirectory(const Value: WideString);
    function Get_DefaultFileName: WideString;
    procedure Set_DefaultFileName(const Value: WideString);
    function Get_FileNameOptions: Smallint;
    procedure Set_FileNameOptions(Value: Smallint);
    function Get_HorizontalMargin: Smallint;
    procedure Set_HorizontalMargin(Value: Smallint);
    function Get_VerticalMargin: Smallint;
    procedure Set_VerticalMargin(Value: Smallint);
    function Get_HTMLUseLayers: WordBool;
    procedure Set_HTMLUseLayers(Value: WordBool);
    function Get_HTMLMultipleHTMLs: WordBool;
    procedure Set_HTMLMultipleHTMLs(Value: WordBool);
    function Get_Attributes: Integer;
    procedure Set_Attributes(Value: Integer);
    function Get_RTFFullRTF: WordBool;
    procedure Set_RTFFullRTF(Value: WordBool);
    function Get_RTFTextRTF: WordBool;
    procedure Set_RTFTextRTF(Value: WordBool);
    function Get_RTFTextOnly: WordBool;
    procedure Set_RTFTextOnly(Value: WordBool);
    function Get_JPegLevel: Smallint;
    procedure Set_JPegLevel(Value: Smallint);
    function Get_ServerAddress: WideString;
    procedure Set_ServerAddress(const Value: WideString);
    function Get_ServerPort: Integer;
    procedure Set_ServerPort(Value: Integer);
    function Get_ServerUsername: WideString;
    procedure Set_ServerUsername(const Value: WideString);
    function Get_EmailFieldTo: WideString;
    procedure Set_EmailFieldTo(const Value: WideString);
    function Get_EmailFieldCC: WideString;
    procedure Set_EmailFieldCC(const Value: WideString);
    function Get_EmailFieldBCC: WideString;
    procedure Set_EmailFieldBCC(const Value: WideString);
    function Get_EmailSubject: WideString;
    procedure Set_EmailSubject(const Value: WideString);
    function Get_EmailMessage: WideString;
    procedure Set_EmailMessage(const Value: WideString);
    function Get_EmailPrompt: WordBool;
    procedure Set_EmailPrompt(Value: WordBool);
  public
    property DefaultInterface: ICDIntf read GetDefaultInterface;
  published
    property FontEmbedding: WordBool read Get_FontEmbedding write Set_FontEmbedding;
    property PageContentCompression: WordBool read Get_PageContentCompression write Set_PageContentCompression;
    property JPEGCompression: WordBool read Get_JPEGCompression write Set_JPEGCompression;
    property PaperSize: Smallint read Get_PaperSize write Set_PaperSize;
    property PaperWidth: Integer read Get_PaperWidth write Set_PaperWidth;
    property PaperLength: Integer read Get_PaperLength write Set_PaperLength;
    property Orientation: Smallint read Get_Orientation write Set_Orientation;
    property Resolution: Integer read Get_Resolution write Set_Resolution;
    property DefaultDirectory: WideString read Get_DefaultDirectory write Set_DefaultDirectory;
    property DefaultFileName: WideString read Get_DefaultFileName write Set_DefaultFileName;
    property FileNameOptions: Smallint read Get_FileNameOptions write Set_FileNameOptions;
    property HorizontalMargin: Smallint read Get_HorizontalMargin write Set_HorizontalMargin;
    property VerticalMargin: Smallint read Get_VerticalMargin write Set_VerticalMargin;
    property HTMLUseLayers: WordBool read Get_HTMLUseLayers write Set_HTMLUseLayers;
    property HTMLMultipleHTMLs: WordBool read Get_HTMLMultipleHTMLs write Set_HTMLMultipleHTMLs;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property RTFFullRTF: WordBool read Get_RTFFullRTF write Set_RTFFullRTF;
    property RTFTextRTF: WordBool read Get_RTFTextRTF write Set_RTFTextRTF;
    property RTFTextOnly: WordBool read Get_RTFTextOnly write Set_RTFTextOnly;
    property JPegLevel: Smallint read Get_JPegLevel write Set_JPegLevel;
    property ServerAddress: WideString read Get_ServerAddress write Set_ServerAddress;
    property ServerPort: Integer read Get_ServerPort write Set_ServerPort;
    property ServerUsername: WideString read Get_ServerUsername write Set_ServerUsername;
    property EmailFieldTo: WideString read Get_EmailFieldTo write Set_EmailFieldTo;
    property EmailFieldCC: WideString read Get_EmailFieldCC write Set_EmailFieldCC;
    property EmailFieldBCC: WideString read Get_EmailFieldBCC write Set_EmailFieldBCC;
    property EmailSubject: WideString read Get_EmailSubject write Set_EmailSubject;
    property EmailMessage: WideString read Get_EmailMessage write Set_EmailMessage;
    property EmailPrompt: WordBool read Get_EmailPrompt write Set_EmailPrompt;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDocument provides a Create and CreateRemote method to          
// create instances of the default interface IDIDocument exposed by              
// the CoClass Document. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDocument = class
    class function Create: IDIDocument;
    class function CreateRemote(const MachineName: string): IDIDocument;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDocument
// Help String      : 
// Default Interface: IDIDocument
// Def. Intf. DISP? : Yes
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDocumentProperties= class;
{$ENDIF}
  TDocument = class(TOleServer)
  private
    FIntf:        IDIDocument;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDocumentProperties;
    function      GetServerProperties: TDocumentProperties;
{$ENDIF}
    function      GetDefaultInterface: IDIDocument;
  protected
    procedure InitServerData; override;
    function Get_Title: WideString;
    procedure Set_Title(const Value: WideString);
    function Get_Subject: WideString;
    procedure Set_Subject(const Value: WideString);
    function Get_Creator: WideString;
    procedure Set_Creator(const Value: WideString);
    function Get_Author: WideString;
    procedure Set_Author(const Value: WideString);
    function Get_Linearized: Integer;
    procedure Set_Linearized(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDIDocument);
    procedure Disconnect; override;
    function  Open(const FileName: WideString): WordBool;
    function  Save(const FileName: WideString): WordBool;
    function  Append(const FileName: WideString): WordBool;
    function  AppendEx(const Document: IDispatch): WordBool;
    function  SetBookmark(Page: Integer; const Text: WideString; Level: Integer): WordBool;
    procedure ClearBookmarks;
    function  SearchText(Start: Smallint; const Text: WideString; var Page: Integer; 
                         var xPos: Double; var yPos: Double): WordBool;
    function  Merge(const FileName: WideString; Options: Integer): WordBool;
    function  MergeEx(const Document: IDispatch; Options: Integer): WordBool;
    function  Encrypt(const OwnerPassword: WideString; const UserPassword: WideString; 
                      Permissions: Integer): WordBool;
    function  PageCount: Integer;
    function  OpenEx(const FileName: WideString; const Password: WideString): WordBool;
    procedure SetFlateCompression(Ratio: Smallint);
    property  DefaultInterface: IDIDocument read GetDefaultInterface;
    property Title: WideString read Get_Title write Set_Title;
    property Subject: WideString read Get_Subject write Set_Subject;
    property Creator: WideString read Get_Creator write Set_Creator;
    property Author: WideString read Get_Author write Set_Author;
    property Linearized: Integer read Get_Linearized write Set_Linearized;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDocumentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDocument
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDocumentProperties = class(TPersistent)
  private
    FServer:    TDocument;
    function    GetDefaultInterface: IDIDocument;
    constructor Create(AServer: TDocument);
  protected
    function Get_Title: WideString;
    procedure Set_Title(const Value: WideString);
    function Get_Subject: WideString;
    procedure Set_Subject(const Value: WideString);
    function Get_Creator: WideString;
    procedure Set_Creator(const Value: WideString);
    function Get_Author: WideString;
    procedure Set_Author(const Value: WideString);
    function Get_Linearized: Integer;
    procedure Set_Linearized(Value: Integer);
  public
    property DefaultInterface: IDIDocument read GetDefaultInterface;
  published
    property Title: WideString read Get_Title write Set_Title;
    property Subject: WideString read Get_Subject write Set_Subject;
    property Creator: WideString read Get_Creator write Set_Creator;
    property Author: WideString read Get_Author write Set_Author;
    property Linearized: Integer read Get_Linearized write Set_Linearized;
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoCDIntf_.Create: ICDIntf;
begin
  Result := CreateComObject(CLASS_CDIntf_) as ICDIntf;
end;

class function CoCDIntf_.CreateRemote(const MachineName: string): ICDIntf;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CDIntf_) as ICDIntf;
end;

procedure TCDIntf.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{68B34267-7559-11D3-BBE5-D53DCBD65107}';
    IntfIID:   '{68B34266-7559-11D3-BBE5-D53DCBD65107}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCDIntf.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICDIntf;
  end;
end;

procedure TCDIntf.ConnectTo(svrIntf: ICDIntf);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCDIntf.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCDIntf.GetDefaultInterface: ICDIntf;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCDIntf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCDIntfProperties.Create(Self);
{$ENDIF}
end;

destructor TCDIntf.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCDIntf.GetServerProperties: TCDIntfProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCDIntf.Get_FontEmbedding: WordBool;
begin
  Result := DefaultInterface.FontEmbedding;
end;

procedure TCDIntf.Set_FontEmbedding(Value: WordBool);
begin
  DefaultInterface.FontEmbedding := Value;
end;

function TCDIntf.Get_PageContentCompression: WordBool;
begin
  Result := DefaultInterface.PageContentCompression;
end;

procedure TCDIntf.Set_PageContentCompression(Value: WordBool);
begin
  DefaultInterface.PageContentCompression := Value;
end;

function TCDIntf.Get_JPEGCompression: WordBool;
begin
  Result := DefaultInterface.JPEGCompression;
end;

procedure TCDIntf.Set_JPEGCompression(Value: WordBool);
begin
  DefaultInterface.JPEGCompression := Value;
end;

function TCDIntf.Get_PaperSize: Smallint;
begin
  Result := DefaultInterface.PaperSize;
end;

procedure TCDIntf.Set_PaperSize(Value: Smallint);
begin
  DefaultInterface.PaperSize := Value;
end;

function TCDIntf.Get_PaperWidth: Integer;
begin
  Result := DefaultInterface.PaperWidth;
end;

procedure TCDIntf.Set_PaperWidth(Value: Integer);
begin
  DefaultInterface.PaperWidth := Value;
end;

function TCDIntf.Get_PaperLength: Integer;
begin
  Result := DefaultInterface.PaperLength;
end;

procedure TCDIntf.Set_PaperLength(Value: Integer);
begin
  DefaultInterface.PaperLength := Value;
end;

function TCDIntf.Get_Orientation: Smallint;
begin
  Result := DefaultInterface.Orientation;
end;

procedure TCDIntf.Set_Orientation(Value: Smallint);
begin
  DefaultInterface.Orientation := Value;
end;

function TCDIntf.Get_Resolution: Integer;
begin
  Result := DefaultInterface.Resolution;
end;

procedure TCDIntf.Set_Resolution(Value: Integer);
begin
  DefaultInterface.Resolution := Value;
end;

function TCDIntf.Get_DefaultDirectory: WideString;
begin
  Result := DefaultInterface.DefaultDirectory;
end;

procedure TCDIntf.Set_DefaultDirectory(const Value: WideString);
begin
  DefaultInterface.DefaultDirectory := Value;
end;

function TCDIntf.Get_DefaultFileName: WideString;
begin
  Result := DefaultInterface.DefaultFileName;
end;

procedure TCDIntf.Set_DefaultFileName(const Value: WideString);
begin
  DefaultInterface.DefaultFileName := Value;
end;

function TCDIntf.Get_FileNameOptions: Smallint;
begin
  Result := DefaultInterface.FileNameOptions;
end;

procedure TCDIntf.Set_FileNameOptions(Value: Smallint);
begin
  DefaultInterface.FileNameOptions := Value;
end;

function TCDIntf.Get_HorizontalMargin: Smallint;
begin
  Result := DefaultInterface.HorizontalMargin;
end;

procedure TCDIntf.Set_HorizontalMargin(Value: Smallint);
begin
  DefaultInterface.HorizontalMargin := Value;
end;

function TCDIntf.Get_VerticalMargin: Smallint;
begin
  Result := DefaultInterface.VerticalMargin;
end;

procedure TCDIntf.Set_VerticalMargin(Value: Smallint);
begin
  DefaultInterface.VerticalMargin := Value;
end;

function TCDIntf.Get_HTMLUseLayers: WordBool;
begin
  Result := DefaultInterface.HTMLUseLayers;
end;

procedure TCDIntf.Set_HTMLUseLayers(Value: WordBool);
begin
  DefaultInterface.HTMLUseLayers := Value;
end;

function TCDIntf.Get_HTMLMultipleHTMLs: WordBool;
begin
  Result := DefaultInterface.HTMLMultipleHTMLs;
end;

procedure TCDIntf.Set_HTMLMultipleHTMLs(Value: WordBool);
begin
  DefaultInterface.HTMLMultipleHTMLs := Value;
end;

function TCDIntf.Get_Attributes: Integer;
begin
  Result := DefaultInterface.Attributes;
end;

procedure TCDIntf.Set_Attributes(Value: Integer);
begin
  DefaultInterface.Attributes := Value;
end;

function TCDIntf.Get_RTFFullRTF: WordBool;
begin
  Result := DefaultInterface.RTFFullRTF;
end;

procedure TCDIntf.Set_RTFFullRTF(Value: WordBool);
begin
  DefaultInterface.RTFFullRTF := Value;
end;

function TCDIntf.Get_RTFTextRTF: WordBool;
begin
  Result := DefaultInterface.RTFTextRTF;
end;

procedure TCDIntf.Set_RTFTextRTF(Value: WordBool);
begin
  DefaultInterface.RTFTextRTF := Value;
end;

function TCDIntf.Get_RTFTextOnly: WordBool;
begin
  Result := DefaultInterface.RTFTextOnly;
end;

procedure TCDIntf.Set_RTFTextOnly(Value: WordBool);
begin
  DefaultInterface.RTFTextOnly := Value;
end;

function TCDIntf.Get_JPegLevel: Smallint;
begin
  Result := DefaultInterface.JPegLevel;
end;

procedure TCDIntf.Set_JPegLevel(Value: Smallint);
begin
  DefaultInterface.JPegLevel := Value;
end;

function TCDIntf.Get_ServerAddress: WideString;
begin
  Result := DefaultInterface.ServerAddress;
end;

procedure TCDIntf.Set_ServerAddress(const Value: WideString);
begin
  DefaultInterface.ServerAddress := Value;
end;

function TCDIntf.Get_ServerPort: Integer;
begin
  Result := DefaultInterface.ServerPort;
end;

procedure TCDIntf.Set_ServerPort(Value: Integer);
begin
  DefaultInterface.ServerPort := Value;
end;

function TCDIntf.Get_ServerUsername: WideString;
begin
  Result := DefaultInterface.ServerUsername;
end;

procedure TCDIntf.Set_ServerUsername(const Value: WideString);
begin
  DefaultInterface.ServerUsername := Value;
end;

function TCDIntf.Get_EmailFieldTo: WideString;
begin
  Result := DefaultInterface.EmailFieldTo;
end;

procedure TCDIntf.Set_EmailFieldTo(const Value: WideString);
begin
  DefaultInterface.EmailFieldTo := Value;
end;

function TCDIntf.Get_EmailFieldCC: WideString;
begin
  Result := DefaultInterface.EmailFieldCC;
end;

procedure TCDIntf.Set_EmailFieldCC(const Value: WideString);
begin
  DefaultInterface.EmailFieldCC := Value;
end;

function TCDIntf.Get_EmailFieldBCC: WideString;
begin
  Result := DefaultInterface.EmailFieldBCC;
end;

procedure TCDIntf.Set_EmailFieldBCC(const Value: WideString);
begin
  DefaultInterface.EmailFieldBCC := Value;
end;

function TCDIntf.Get_EmailSubject: WideString;
begin
  Result := DefaultInterface.EmailSubject;
end;

procedure TCDIntf.Set_EmailSubject(const Value: WideString);
begin
  DefaultInterface.EmailSubject := Value;
end;

function TCDIntf.Get_EmailMessage: WideString;
begin
  Result := DefaultInterface.EmailMessage;
end;

procedure TCDIntf.Set_EmailMessage(const Value: WideString);
begin
  DefaultInterface.EmailMessage := Value;
end;

function TCDIntf.Get_EmailPrompt: WordBool;
begin
  Result := DefaultInterface.EmailPrompt;
end;

procedure TCDIntf.Set_EmailPrompt(Value: WordBool);
begin
  DefaultInterface.EmailPrompt := Value;
end;

function  TCDIntf.CreateDC: OLE_HANDLE;
begin
  Result := DefaultInterface.CreateDC;
end;

function  TCDIntf.SetDefaultConfig: WordBool;
begin
  Result := DefaultInterface.SetDefaultConfig;
end;

function  TCDIntf.SetDefaultPrinter: WordBool;
begin
  Result := DefaultInterface.SetDefaultPrinter;
end;

function  TCDIntf.StartSpooler: WordBool;
begin
  Result := DefaultInterface.StartSpooler;
end;

function  TCDIntf.StopSpooler: WordBool;
begin
  Result := DefaultInterface.StopSpooler;
end;

function  TCDIntf.PDFDriverInit(const PrinterName: WideString): Integer;
begin
  Result := DefaultInterface.PDFDriverInit(PrinterName);
end;

function  TCDIntf.HTMLDriverInit(const PrinterName: WideString): Integer;
begin
  Result := DefaultInterface.HTMLDriverInit(PrinterName);
end;

function  TCDIntf.EMFDriverInit(const PrinterName: WideString): Integer;
begin
  Result := DefaultInterface.EMFDriverInit(PrinterName);
end;

procedure TCDIntf.DriverEnd;
begin
  DefaultInterface.DriverEnd;
end;

function  TCDIntf.GetLastErrorMsg: WideString;
begin
  Result := DefaultInterface.GetLastErrorMsg;
end;

function  TCDIntf.RestoreDefaultPrinter: WordBool;
begin
  Result := DefaultInterface.RestoreDefaultPrinter;
end;

function  TCDIntf.DriverInit(const PrinterName: WideString): Integer;
begin
  Result := DefaultInterface.DriverInit(PrinterName);
end;

function  TCDIntf.GetDocumentTitle(JobID: Integer): WideString;
begin
  Result := DefaultInterface.GetDocumentTitle(JobID);
end;

function  TCDIntf.SetBookmark(hDC: Integer; lParent: Integer; const Title: WideString): Integer;
begin
  Result := DefaultInterface.SetBookmark(hDC, lParent, Title);
end;

function  TCDIntf.CaptureEvents(bCapture: Integer): Integer;
begin
  Result := DefaultInterface.CaptureEvents(bCapture);
end;

function  TCDIntf.SetWatermark(const Watermark: WideString; const FontName: WideString; 
                               FontSize: Smallint; Orientation: Smallint; Color: Integer; 
                               HorzPos: Integer; VertPos: Integer; Foreground: Integer): Integer;
begin
  Result := DefaultInterface.SetWatermark(Watermark, FontName, FontSize, Orientation, Color, 
                                          HorzPos, VertPos, Foreground);
end;

function  TCDIntf.SetHyperLink(hDC: Integer; const URL: WideString): Integer;
begin
  Result := DefaultInterface.SetHyperLink(hDC, URL);
end;

function  TCDIntf.SetDefaultConfigEx: WordBool;
begin
  Result := DefaultInterface.SetDefaultConfigEx;
end;

function  TCDIntf.RTFDriverInit(const PrinterName: WideString): Integer;
begin
  Result := DefaultInterface.RTFDriverInit(PrinterName);
end;

function  TCDIntf.SendMessagesTo(const WndClass: WideString): Integer;
begin
  Result := DefaultInterface.SendMessagesTo(WndClass);
end;

function  TCDIntf.BatchConvert(const FileName: WideString): Integer;
begin
  Result := DefaultInterface.BatchConvert(FileName);
end;

function  TCDIntf.Lock(const szLockName: WideString): Integer;
begin
  Result := DefaultInterface.Lock(szLockName);
end;

function  TCDIntf.Unlock(const szLockName: WideString; dwTimeout: Integer): Integer;
begin
  Result := DefaultInterface.Unlock(szLockName, dwTimeout);
end;

function  TCDIntf.SendMail(const szTo: WideString; const szCC: WideString; const szBCC: WideString; 
                           const szSubject: WideString; const szMessage: WideString; 
                           const szFilenames: WideString; lOptions: Integer): Integer;
begin
  Result := DefaultInterface.SendMail(szTo, szCC, szBCC, szSubject, szMessage, szFilenames, lOptions);
end;

function  TCDIntf.TestLock(const szLockName: WideString): Integer;
begin
  Result := DefaultInterface.TestLock(szLockName);
end;

function  TCDIntf.GLock: Integer;
begin
  Result := DefaultInterface.GLock;
end;

function  TCDIntf.GUnlock: Integer;
begin
  Result := DefaultInterface.GUnlock;
end;

function  TCDIntf.SetDocEmailProps(const szDocTitle: WideString; const szTo: WideString; 
                                   const szCC: WideString; const szBCC: WideString; 
                                   const szSubject: WideString; const szMessage: WideString; 
                                   lPrompt: Integer): Integer;
begin
  Result := DefaultInterface.SetDocEmailProps(szDocTitle, szTo, szCC, szBCC, szSubject, szMessage, 
                                              lPrompt);
end;

function  TCDIntf.SetDocServerProps(const szDocTitle: WideString; const szHostname: WideString; 
                                    const szUsername: WideString): Integer;
begin
  Result := DefaultInterface.SetDocServerProps(szDocTitle, szHostname, szUsername);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCDIntfProperties.Create(AServer: TCDIntf);
begin
  inherited Create;
  FServer := AServer;
end;

function TCDIntfProperties.GetDefaultInterface: ICDIntf;
begin
  Result := FServer.DefaultInterface;
end;

function TCDIntfProperties.Get_FontEmbedding: WordBool;
begin
  Result := DefaultInterface.FontEmbedding;
end;

procedure TCDIntfProperties.Set_FontEmbedding(Value: WordBool);
begin
  DefaultInterface.FontEmbedding := Value;
end;

function TCDIntfProperties.Get_PageContentCompression: WordBool;
begin
  Result := DefaultInterface.PageContentCompression;
end;

procedure TCDIntfProperties.Set_PageContentCompression(Value: WordBool);
begin
  DefaultInterface.PageContentCompression := Value;
end;

function TCDIntfProperties.Get_JPEGCompression: WordBool;
begin
  Result := DefaultInterface.JPEGCompression;
end;

procedure TCDIntfProperties.Set_JPEGCompression(Value: WordBool);
begin
  DefaultInterface.JPEGCompression := Value;
end;

function TCDIntfProperties.Get_PaperSize: Smallint;
begin
  Result := DefaultInterface.PaperSize;
end;

procedure TCDIntfProperties.Set_PaperSize(Value: Smallint);
begin
  DefaultInterface.PaperSize := Value;
end;

function TCDIntfProperties.Get_PaperWidth: Integer;
begin
  Result := DefaultInterface.PaperWidth;
end;

procedure TCDIntfProperties.Set_PaperWidth(Value: Integer);
begin
  DefaultInterface.PaperWidth := Value;
end;

function TCDIntfProperties.Get_PaperLength: Integer;
begin
  Result := DefaultInterface.PaperLength;
end;

procedure TCDIntfProperties.Set_PaperLength(Value: Integer);
begin
  DefaultInterface.PaperLength := Value;
end;

function TCDIntfProperties.Get_Orientation: Smallint;
begin
  Result := DefaultInterface.Orientation;
end;

procedure TCDIntfProperties.Set_Orientation(Value: Smallint);
begin
  DefaultInterface.Orientation := Value;
end;

function TCDIntfProperties.Get_Resolution: Integer;
begin
  Result := DefaultInterface.Resolution;
end;

procedure TCDIntfProperties.Set_Resolution(Value: Integer);
begin
  DefaultInterface.Resolution := Value;
end;

function TCDIntfProperties.Get_DefaultDirectory: WideString;
begin
  Result := DefaultInterface.DefaultDirectory;
end;

procedure TCDIntfProperties.Set_DefaultDirectory(const Value: WideString);
begin
  DefaultInterface.DefaultDirectory := Value;
end;

function TCDIntfProperties.Get_DefaultFileName: WideString;
begin
  Result := DefaultInterface.DefaultFileName;
end;

procedure TCDIntfProperties.Set_DefaultFileName(const Value: WideString);
begin
  DefaultInterface.DefaultFileName := Value;
end;

function TCDIntfProperties.Get_FileNameOptions: Smallint;
begin
  Result := DefaultInterface.FileNameOptions;
end;

procedure TCDIntfProperties.Set_FileNameOptions(Value: Smallint);
begin
  DefaultInterface.FileNameOptions := Value;
end;

function TCDIntfProperties.Get_HorizontalMargin: Smallint;
begin
  Result := DefaultInterface.HorizontalMargin;
end;

procedure TCDIntfProperties.Set_HorizontalMargin(Value: Smallint);
begin
  DefaultInterface.HorizontalMargin := Value;
end;

function TCDIntfProperties.Get_VerticalMargin: Smallint;
begin
  Result := DefaultInterface.VerticalMargin;
end;

procedure TCDIntfProperties.Set_VerticalMargin(Value: Smallint);
begin
  DefaultInterface.VerticalMargin := Value;
end;

function TCDIntfProperties.Get_HTMLUseLayers: WordBool;
begin
  Result := DefaultInterface.HTMLUseLayers;
end;

procedure TCDIntfProperties.Set_HTMLUseLayers(Value: WordBool);
begin
  DefaultInterface.HTMLUseLayers := Value;
end;

function TCDIntfProperties.Get_HTMLMultipleHTMLs: WordBool;
begin
  Result := DefaultInterface.HTMLMultipleHTMLs;
end;

procedure TCDIntfProperties.Set_HTMLMultipleHTMLs(Value: WordBool);
begin
  DefaultInterface.HTMLMultipleHTMLs := Value;
end;

function TCDIntfProperties.Get_Attributes: Integer;
begin
  Result := DefaultInterface.Attributes;
end;

procedure TCDIntfProperties.Set_Attributes(Value: Integer);
begin
  DefaultInterface.Attributes := Value;
end;

function TCDIntfProperties.Get_RTFFullRTF: WordBool;
begin
  Result := DefaultInterface.RTFFullRTF;
end;

procedure TCDIntfProperties.Set_RTFFullRTF(Value: WordBool);
begin
  DefaultInterface.RTFFullRTF := Value;
end;

function TCDIntfProperties.Get_RTFTextRTF: WordBool;
begin
  Result := DefaultInterface.RTFTextRTF;
end;

procedure TCDIntfProperties.Set_RTFTextRTF(Value: WordBool);
begin
  DefaultInterface.RTFTextRTF := Value;
end;

function TCDIntfProperties.Get_RTFTextOnly: WordBool;
begin
  Result := DefaultInterface.RTFTextOnly;
end;

procedure TCDIntfProperties.Set_RTFTextOnly(Value: WordBool);
begin
  DefaultInterface.RTFTextOnly := Value;
end;

function TCDIntfProperties.Get_JPegLevel: Smallint;
begin
  Result := DefaultInterface.JPegLevel;
end;

procedure TCDIntfProperties.Set_JPegLevel(Value: Smallint);
begin
  DefaultInterface.JPegLevel := Value;
end;

function TCDIntfProperties.Get_ServerAddress: WideString;
begin
  Result := DefaultInterface.ServerAddress;
end;

procedure TCDIntfProperties.Set_ServerAddress(const Value: WideString);
begin
  DefaultInterface.ServerAddress := Value;
end;

function TCDIntfProperties.Get_ServerPort: Integer;
begin
  Result := DefaultInterface.ServerPort;
end;

procedure TCDIntfProperties.Set_ServerPort(Value: Integer);
begin
  DefaultInterface.ServerPort := Value;
end;

function TCDIntfProperties.Get_ServerUsername: WideString;
begin
  Result := DefaultInterface.ServerUsername;
end;

procedure TCDIntfProperties.Set_ServerUsername(const Value: WideString);
begin
  DefaultInterface.ServerUsername := Value;
end;

function TCDIntfProperties.Get_EmailFieldTo: WideString;
begin
  Result := DefaultInterface.EmailFieldTo;
end;

procedure TCDIntfProperties.Set_EmailFieldTo(const Value: WideString);
begin
  DefaultInterface.EmailFieldTo := Value;
end;

function TCDIntfProperties.Get_EmailFieldCC: WideString;
begin
  Result := DefaultInterface.EmailFieldCC;
end;

procedure TCDIntfProperties.Set_EmailFieldCC(const Value: WideString);
begin
  DefaultInterface.EmailFieldCC := Value;
end;

function TCDIntfProperties.Get_EmailFieldBCC: WideString;
begin
  Result := DefaultInterface.EmailFieldBCC;
end;

procedure TCDIntfProperties.Set_EmailFieldBCC(const Value: WideString);
begin
  DefaultInterface.EmailFieldBCC := Value;
end;

function TCDIntfProperties.Get_EmailSubject: WideString;
begin
  Result := DefaultInterface.EmailSubject;
end;

procedure TCDIntfProperties.Set_EmailSubject(const Value: WideString);
begin
  DefaultInterface.EmailSubject := Value;
end;

function TCDIntfProperties.Get_EmailMessage: WideString;
begin
  Result := DefaultInterface.EmailMessage;
end;

procedure TCDIntfProperties.Set_EmailMessage(const Value: WideString);
begin
  DefaultInterface.EmailMessage := Value;
end;

function TCDIntfProperties.Get_EmailPrompt: WordBool;
begin
  Result := DefaultInterface.EmailPrompt;
end;

procedure TCDIntfProperties.Set_EmailPrompt(Value: WordBool);
begin
  DefaultInterface.EmailPrompt := Value;
end;

{$ENDIF}

class function CoDocument.Create: IDIDocument;
begin
  Result := CreateComObject(CLASS_Document) as IDIDocument;
end;

class function CoDocument.CreateRemote(const MachineName: string): IDIDocument;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Document) as IDIDocument;
end;

procedure TDocument.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4475F8B7-1316-4853-82E6-C6149A7BA4C3}';
    IntfIID:   '{D307A697-F048-4AFC-9170-572440CD523F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDocument.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDIDocument;
  end;
end;

procedure TDocument.ConnectTo(svrIntf: IDIDocument);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDocument.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDocument.GetDefaultInterface: IDIDocument;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDocumentProperties.Create(Self);
{$ENDIF}
end;

destructor TDocument.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDocument.GetServerProperties: TDocumentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDocument.Get_Title: WideString;
begin
  Result := DefaultInterface.Title;
end;

procedure TDocument.Set_Title(const Value: WideString);
begin
  DefaultInterface.Title := Value;
end;

function TDocument.Get_Subject: WideString;
begin
  Result := DefaultInterface.Subject;
end;

procedure TDocument.Set_Subject(const Value: WideString);
begin
  DefaultInterface.Subject := Value;
end;

function TDocument.Get_Creator: WideString;
begin
  Result := DefaultInterface.Creator;
end;

procedure TDocument.Set_Creator(const Value: WideString);
begin
  DefaultInterface.Creator := Value;
end;

function TDocument.Get_Author: WideString;
begin
  Result := DefaultInterface.Author;
end;

procedure TDocument.Set_Author(const Value: WideString);
begin
  DefaultInterface.Author := Value;
end;

function TDocument.Get_Linearized: Integer;
begin
  Result := DefaultInterface.Linearized;
end;

procedure TDocument.Set_Linearized(Value: Integer);
begin
  DefaultInterface.Linearized := Value;
end;

function  TDocument.Open(const FileName: WideString): WordBool;
begin
  Result := DefaultInterface.Open(FileName);
end;

function  TDocument.Save(const FileName: WideString): WordBool;
begin
  Result := DefaultInterface.Save(FileName);
end;

function  TDocument.Append(const FileName: WideString): WordBool;
begin
  Result := DefaultInterface.Append(FileName);
end;

function  TDocument.AppendEx(const Document: IDispatch): WordBool;
begin
  Result := DefaultInterface.AppendEx(Document);
end;

function  TDocument.SetBookmark(Page: Integer; const Text: WideString; Level: Integer): WordBool;
begin
  Result := DefaultInterface.SetBookmark(Page, Text, Level);
end;

procedure TDocument.ClearBookmarks;
begin
  DefaultInterface.ClearBookmarks;
end;

function  TDocument.SearchText(Start: Smallint; const Text: WideString; var Page: Integer; 
                               var xPos: Double; var yPos: Double): WordBool;
begin
  Result := DefaultInterface.SearchText(Start, Text, Page, xPos, yPos);
end;

function  TDocument.Merge(const FileName: WideString; Options: Integer): WordBool;
begin
  Result := DefaultInterface.Merge(FileName, Options);
end;

function  TDocument.MergeEx(const Document: IDispatch; Options: Integer): WordBool;
begin
  Result := DefaultInterface.MergeEx(Document, Options);
end;

function  TDocument.Encrypt(const OwnerPassword: WideString; const UserPassword: WideString; 
                            Permissions: Integer): WordBool;
begin
  Result := DefaultInterface.Encrypt(OwnerPassword, UserPassword, Permissions);
end;

function  TDocument.PageCount: Integer;
begin
  Result := DefaultInterface.PageCount;
end;

function  TDocument.OpenEx(const FileName: WideString; const Password: WideString): WordBool;
begin
  Result := DefaultInterface.OpenEx(FileName, Password);
end;

procedure TDocument.SetFlateCompression(Ratio: Smallint);
begin
  DefaultInterface.SetFlateCompression(Ratio);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDocumentProperties.Create(AServer: TDocument);
begin
  inherited Create;
  FServer := AServer;
end;

function TDocumentProperties.GetDefaultInterface: IDIDocument;
begin
  Result := FServer.DefaultInterface;
end;

function TDocumentProperties.Get_Title: WideString;
begin
  Result := DefaultInterface.Title;
end;

procedure TDocumentProperties.Set_Title(const Value: WideString);
begin
  DefaultInterface.Title := Value;
end;

function TDocumentProperties.Get_Subject: WideString;
begin
  Result := DefaultInterface.Subject;
end;

procedure TDocumentProperties.Set_Subject(const Value: WideString);
begin
  DefaultInterface.Subject := Value;
end;

function TDocumentProperties.Get_Creator: WideString;
begin
  Result := DefaultInterface.Creator;
end;

procedure TDocumentProperties.Set_Creator(const Value: WideString);
begin
  DefaultInterface.Creator := Value;
end;

function TDocumentProperties.Get_Author: WideString;
begin
  Result := DefaultInterface.Author;
end;

procedure TDocumentProperties.Set_Author(const Value: WideString);
begin
  DefaultInterface.Author := Value;
end;

function TDocumentProperties.Get_Linearized: Integer;
begin
  Result := DefaultInterface.Linearized;
end;

procedure TDocumentProperties.Set_Linearized(Value: Integer);
begin
  DefaultInterface.Linearized := Value;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('ActiveX',[TCDIntf, TDocument]);
end;

end.
