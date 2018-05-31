unit ChartTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Series, Chart, auchtypes;

type

  TForm1 = class(TForm)
    Chart1: TChart;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure BuilddateArray;
    procedure DeleteSeries(index : Integer);
    procedure BuildSeries(index: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ArraySize : Integer;
  Noofseries : Integer;
  NewArraysize : Integer;
  ChartDates : TDateTimeArray;
  ChartSeries: array[0..DETAILPLANGRAPHLIST - 1] of TLineSeries;
  XValuesArray : Array[0..DETAILPLANGRAPHLIST - 1] of array of Currency;
  YValuesArray : Array[0..DETAILPLANGRAPHLIST - 1] of array of Currency;
//  SummaryBalPtr : Array[0..DETAILPLANGRAPHLIST - 1] of TSummaryBalArrayPtr;
  SummaryBalPtr : TSummaryBalArrayPtr;
  PlanList : TList;
  YearDates : Array[0 .. NUM_DAYSINYEAR] of string[15];
  MyXValues : Array of double;
  MyYValues : array of double;

implementation

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  I, J: Integer;
begin
// Generate
  if Assigned(PlanList)
    then begin
    for I := 0 to PlanList.Count - 1 do    // Iterate
      begin
      SummaryBalPtr := TSummaryBalArrayPtr(PlanList.items[I]);
      Dispose(SummaryBalPtr);
    end;    // for
    PlanList.Clear;
  end
  else
    PlanList := TList.Create;
  NoOfSeries := 2;
  BuildDateArray;
  for I := 0 to NoofSeries - 1 do    // Iterate
    begin
    DeleteSeries(i);
    New(SummaryBalPtr);
    Randomize;
    for J := 0 to Arraysize - 1 do    // Iterate
      begin
      SummaryBalPtr[J] := random(500 + I);
    end;    // for
    PlanList.add(SummaryBalPtr);
    BuildSeries(i);
  end;    // for
end;

procedure TForm1.BuilddateArray;
var
  j: Integer;
begin
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to ArraySize - 1 do    // Iterate
    begin
    ChartDates[j] := StrtoDate('01/07/2000') + j
  end;    //
  Chart1.BottomAxis.Maximum := ChartDates[ArraySize - 1] + 1;
  Chart1.BottomAxis.Minimum := ChartDates[0] - 1;
  //abelStyle := talMark;
end;

procedure TForm1.DeleteSeries(index : Integer);
begin
  if ChartSeries[Index] <> nil
    then begin
    chart1.RemoveSeries(ChartSeries[Index]);
    // remove the link to the data Arrays
//    ChartSeries[Index].XValues.Count := 0;
//    ChartSeries[Index].XValues.Value := Nil;
//    ChartSeries[Index].YValues.Count := 0;
//    ChartSeries[Index].YValues.Value := Nil;
//    ChartSeries[Index].XValues.destroy;
//    ChartSeries[Index].YValues.destroy;
    Chartseries[Index].free;
//    ChartSeries[Index].XValues.Value := Nil;
//    ChartSeries[Index].YValues.Value := Nil;
    Chartseries[Index] := nil;
  end;    // for
end;

procedure TForm1.BuildSeries(index: integer);
var
  I: Integer;
  k: Integer;
//  PlanDataRec : TPlanDataRecPtr;
  Xarray : Pointer;
  YArray : Pointer;
  LabelStr : Pointer;
begin
//  PlanDataRec := PlanDataList.Items[GetaccountListIndex(DetailPlanGraph[Index])];
  SummaryBalPtr := TSummaryBalArrayPtr(PlanList.items[Index]);
  ChartSeries[index] := TLineSeries.create(Chart1);
  ChartSeries[index].Title := 'Sales';
  Chartseries[index].XValues.DateTime := True;
  ChartSeries[Index].BeginUpdate;
  ChartSeries[Index].XValues.Modified := True;
  Chartseries[index].YValues.DateTime := False;
  Chartseries[Index].YValues.Modified := True;
  for I := 0 to ArraySize - 1 do    // Iterate
    begin
    ChartSeries[Index].AddXY(ChartDates[I], SummaryBalPtr[I], '', clTeeColor);
  end;    // for
  ChartSeries[Index].EndUpdate;
  Chart1.AddSeries(ChartSeries[index]);    // with

{  for k := 0 to 365 do    // Iterate
    begin
    YearDates[k] := FormatDateTime('dd' + #13 + 'MMM', ChartDates[k]);
    ChartSeries[Index].Labels.Insert(k, Pointer(@YearDates[k]));
  end;
}
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  i : integer;
begin
for I := 0 to 0 do    // Iterate
  begin
  DeleteSeries(i);
  end;    // for
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  ArraySize := 52;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  I: Integer;
begin
  ArraySize := 12;
  Chart1.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';

  for I := 0 to DETAILPLANGRAPHLIST - 1 do    // Iterate
    begin
    ChartSeries[I] := nil;
    end;    // for
end;

end.
