unit sebastian.vogt;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils;

type
  TListener = procedure(VSender: TObject);


  TCounter = class
    private
      FStart: Integer;
      FEnd: Integer;
      FCount: Integer;



    public
      onCounterStart: TListener;
      onCounterChange: TListener;
      onCounterFinish: TListener;

      constructor create(VStart: Integer; VEnd: Integer); overload;
      constructor create; overload;
      procedure run;

      function getCount(): Integer;

      property Count: Integer read getCount;




  end;


implementation

constructor TCounter.create(VStart: Integer; VEnd: Integer);
begin
  FStart := VStart;
  FEnd := VEnd;
  FCount := FStart;
end;

constructor TCounter.create;
begin
  inherited;
  create(0, 10);
end;

procedure TCounter.run;
var i: Integer;
begin
  if Assigned(onCounterStart) then onCounterStart(self);
  for i := FStart to FEnd do begin
    FCount := i;
    if Assigned(onCounterChange) then onCounterChange(self);
  end;
  if Assigned(onCounterFinish) then onCounterFinish(self);

end;

function TCounter.getCount(): Integer;
begin
  Result := FCount;
end;

end.

