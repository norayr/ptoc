program TestPTC;

var
  i: integer;
  total: integer;

procedure PrintHello;
begin
  writeln('Hello from Pascal!');
end;

function Square(x: integer): integer;
begin
  Square := x * x;
end;

begin
  total := 0;
  PrintHello;

  for i := 1 to 5 do
  begin
    writeln('Square of ', i, ' is ', Square(i));
    total := total + Square(i);
  end;

  writeln('Total sum of squares from 1 to 5 is ', total);
end.

