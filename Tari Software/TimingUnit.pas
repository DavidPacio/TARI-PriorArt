unit TimingUnit;

interface

uses sysUtils, DateUtils;

//procedure SetupStartTime;
//procedure Timeout(Topic : string);

var
  StartTime : TDateTime;
  LastTime : TdateTime;
  Ft : TextFile;

implementation

procedure SetupStartTime;
begin
// Set up timing
  StartTime := now;
  AssignFile(Ft, 'Time.txt');  // File selected in dialog box
  ReWrite(Ft);
  writeln(Ft, 'Starting Timer');
  writeln(Ft, 'Time = ' + FormatDateTime('yyyy-mmm-dd h:n:s:z', startTime));
  flush(Ft);
  LastTime := now;
end;

procedure Timeout(Topic : string);
Var
  Dtime : TDateTime;
begin
  DTime := Now - LastTime;
  writeln(Ft, Topic + '   Time = ' + FormatDateTime('n:s:z', Now) + '        Delta = ' + FormatDateTime('ss:zzz', dtime));
  flush(Ft);
  LastTime := Now;
end;

end.
