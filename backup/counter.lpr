program counter;

uses sebastian.vogt;

procedure counterStart(Sender: TObject);
begin
  WriteLn('onCounterStart ', TCounter(Sender).Count);
end;

procedure counterChange(Sender: TObject);
var me: TCounter;
begin
  me := TCounter(Sender);
  WriteLn('onCounterChange ', me.Count);
end;

procedure counterFinish(Sender: TObject);
var me: TCounter;
begin
  me := Sender as TCounter;
  WriteLn('onCounterFinish ', me.Count);
end;

var
  c: TCounter;

begin

  c := TCounter.create;
  c.onCounterStart := @counterStart;
  c.onCounterChange := @counterChange;
  c.onCounterFinish := @counterFinish;

  c.onCounterStart := nil;
  c.run;

  WriteLn('Press any key to quit ...');
  ReadLn;
end.

