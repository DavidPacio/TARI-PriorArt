unit ChartHistory;
interface

uses
  SysUtils, Variants, Classes, Graphics, StdCtrls, Dialogs, cxButtons;

Const
  HISTORYSIZE = 20;


type

  TCurrencyArray = Array of Currency;

  TCustomHist = Class(TObject)
  FDepth : Integer;
  FWidth : Integer;
  fCurrstored : integer;
	fUndoBtn : TcxButton;
  private

    Hctrl : array of integer;
  Public
    HistoryArray : array[0..HISTORYSIZE - 1] of TCurrencyArray;
    constructor Create;
    destructor Destroy; override;
    Property StoredDepth : integer read fCurrstored;
    Property UnDoButton : TcxButton read FUndoBtn write fUndoBtn;
    function GetNextHistArrayNo : Integer;
    Function GetRestoreHistArrayNo : Integer;
    Procedure InitializeHistory(HistoryDepth, HistoryWidth: Integer);
  end;


implementation

constructor TCustomHist.create;
var
  I : Integer;
begin
  inherited create;
  for I := 0 to HISTORYSIZE - 1 do    // Iterate
    setLength(HistoryArray[I], 367);
end;

destructor TCustomHist.Destroy;
begin
  inherited destroy;
end;

Procedure TCustomHist.InitializeHistory(HistoryDepth, HistoryWidth: Integer);
var
  I, J: Integer;
begin
  fdepth := HistoryDepth;
  fWidth := HistoryWidth;
  SetLength(Hctrl, fDepth);
  for I := 0 to fDepth - 1 do    // Iterate
    begin
//    setLength(HistoryArray[I], fWidth);
    for J := 0 to fDepth - 1 do    // Iterate
      HistoryArray[I][J] := 0;
    HCtrl[I] := -1;
    end;    // for
  fCurrstored := 0;
end;

function TCustomHist.GetNextHistArrayNo : Integer;
var
  I: Integer;
  J, NewItem: Integer;
begin
//  fCtrl always contains 0 (YOUNGEST) TO FDEPTH -1 ELEMENTS
//  In all cases either the next HCtrl that contains either -1 or fDepth -1 is used
//  J contains the slot number and NewItem will be the currenthighest
  J := -1;
  newItem := -1;
  for I := 0 to fDepth - 1 do    // Iterate
    begin
    if (HCtrl[i] = -1) and (J < 0) then
      j := I;
    if HCtrl[I] > newitem then
      newitem := HCtrl[I];
    end;    // for
  if J = -1 then
    J := Newitem;
  if J <> NewItem then
    begin
    for I := 0 to fDepth - 1 do    // Iterate
      begin
      if (I < J) and (HCtrl[i] <> -1) then
        HCtrl[I] := HCtrl[I] + 1;
      end;
    inc(fCurrstored);
    end
  else
    begin
    for I := 0 to fDepth - 1 do    // Iterate
      begin
      if HCtrl[i] = (fDepth - 1) then
        J := i
      else
        HCtrl[I] := HCtrl[I] + 1;
      end;    // for
    end;
  HCtrl[J] := 0;
  Result := J;
end;

Function TCustomHist.GetRestoreHistArrayNo : Integer;
var
  I: Integer;
  J: Integer;
begin
  J := -1;
  for I := 0 to Fdepth - 1 do    // Iterate
    begin
    if HCtrl[i] = 0 then
      J := I;
    end;    // for
  if J <> -1 then
    begin
    HCtrl[J] := -1;
    for I := 0 to fDepth - 1 do    // Iterate
      begin
      if HCtrl[I] > -1 then
        HCtrl[I] := HCtrl[I] - 1;
      end;    // for
    end
  else
    J := 0;
  dec(fCurrstored);
  Result := J;
end;

end.
