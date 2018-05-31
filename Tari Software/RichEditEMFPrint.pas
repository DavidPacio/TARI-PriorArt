unit RichEditEMFPrint;

interface

uses
  Windows, SysUtils, RichEdit, commdlg, classes, messages, Comctrls;

procedure RichEditToMetaFile(LHDC: HDC; AControl : TRichEdit; AFileName : string);
var
  hRefDC : HDC;

implementation

// returns a printer DC - uses Printer Common Dialog
// Get the length, in characters, of the text in the control
function GetRTFTextLength(hWndRTF : HWND) : integer;
begin
  Result := SendMessage(hWndRTF, WM_GETTEXTLENGTH, 0, 0 );
end;

// RTFToEMF - Tell the control to draw itself on the EMF
// Parameters:
//     hRefDC is used to create the EMF
//     pszMetaFileName is the file name of the new EMF (can be nil)
//     prcMeta is the RECT used to in CreateEnhMetaFile(), in 0.01mm
//          units (should not be nil)
//     hWndRTF is the control of interest
//     nStart is the starting character location
//     pEnd is a integer which receives the position of
//          the next character to print after this page 
function RTFToEMF(pszMetaFileName : LPCTSTR;  prcMeta : TRECT;
             hWndRTF : HWND; nStart : integer; var pEnd : integer) : HENHMETAFILE;
var
  hMetaDC : HDC;
  fr : FORMATRANGE;
  nTextPrinted : integer;
begin
    // Create the EMF
    hMetaDC := CreateEnhMetaFile( hRefDC, pszMetaFileName, @prcMeta, nil );
    if( hMetaDC = 0 ) then
     begin
        Result := 0;
        Exit;
     end;

    ZeroMemory(@fr, sizeof(fr));
    // Set up the page (convert 0.01mm to twips)
    fr.rcPage.top       := prcMeta.left*1440 div 2540;
    fr.rcPage.left      := prcMeta.top*1440 div 2540;
    fr.rcPage.right     := prcMeta.right*1440 div 2540;
    fr.rcPage.bottom    := prcMeta.bottom*1440 div 2540;
    // Set up no margins all around.
    fr.rc.Left := fr.rcPage.left + 14400 div 2540;   // 10mm
    fr.rc.Top := fr.rcPage.Top + 14400 div 2540;   // 10mm
    fr.rc.right := fr.rcPage.right - 14400 div 2540;   // 10mm
    fr.rc.bottom := fr.rcPage.bottom - 14400 div 2540;   // 10mm
    // Set up the range of text to print as nStart to end of document
    fr.chrg.cpMin := nStart;
    fr.chrg.cpMax := -1;
    fr.hdcTarget := hMetaDC;
    fr.hdc := fr.hdcTarget;
    // Tell the control to draw itself on our (meta) DC
    nTextPrinted := SendMessage(hWndRTF, EM_FORMATRANGE, 1, integer(@(fr)));
    pEnd := nTextPrinted;
    Result :=  CloseEnhMetaFile( hMetaDC );
end;

// DumpRTFToPagedEMFs - demonstrates using RTFToEMF() to create an EMF
//                      for each page in an RTF control
// Parameters:
//     hWndRTFControl - the control
//     szEMFFileTitleBase - base filename for EMF files, number is appended
procedure DumpRTFToPagedEMFs(hWndRTFControl : HWND; szEMFFileTitleBase : LPTSTR);
var
  szMetaName : string;
  nRTFTextLength, nStart, nPage : integer;
//  hRefDC : HDC;
  rcMeta : TRECT;
  hEMF :   HENHMETAFILE;

begin
    // First, determine how many chars are in the RTF
    nRTFTextLength := GetRTFTextLength( hWndRTFControl );
    // Get a reference DC (based on a printer)
//    hRefDC := GetPrinterDC();
    // Set up the meta RECT for 0.01mm units
    rcMeta := Classes.Rect( 0, 0, GetDeviceCaps(hRefDC, HORZSIZE)*100 - 2000,
                            GetDeviceCaps(hRefDC, VERTSIZE)*100 - 2000);

    nPage := 0;
    nStart := 0;
    while nStart<nRTFTextLength do
    // Loop while we've not reached the end of the text in the control
    begin
        // construct a file name for this page
        szMetaName := Format('%s', [szEMFFileTitleBase]);
        // call function above to draw this portion of the RTF on the EMF
        hEMF := RTFToEMF(PChar(szMetaName), rcMeta, hWndRTFControl,
                         nStart, nStart );
        // clean up
        DeleteEnhMetaFile( hEMF );
        inc(nPage);
        if nStart = 0 then
         break;
    end;
end;


procedure RichEditToMetaFile(LHDC: HDC;AControl : TRichEdit; AFileName : string);
begin
  hRefDC := LHDC;
   DumpRTFToPagedEMFs(AControl.Handle, PChar(AFileName));
end;

end.

