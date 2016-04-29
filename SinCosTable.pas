{SinCosTable version 0.0.1 beta
copyright pakanir}

program SinCosTable;{�������� ���������}

uses GraphABC;{���������� ������ � ��������}

const{��������� ���������}
  {�������� ���� � ���� ��������}
  angles: array of integer = (0, 30, 45, 60);

var{��������� ����������}
  i, j: integer;{���������� ��� ������}
  degrees: array of integer;{������ ��������}
  radians: array of real;{������ ������}

function MyRound(number: real; ten: integer): real;
begin
  if (ten = 0) then MyRound := Round(number);
  if (ten > 0) then MyRound := MyRound(number / 10, ten - 1) * 10;
  if (ten < 0) then MyRound := MyRound(number * 10, ten + 1) / 10;
end;

begin
  {�������� �������}
  for i := 0 to 100 do
  begin
    {������ �������������� �����}
    Line(0, i * 30, 2000, i * 30);
    {������ ������������ �����}
    Line(i * 50, 0, i * 50, 2000);
  end;
  {������������� �������� ��������}
  {����������� ������� �������� �����}
  SetLength(degrees, Length(angles) * 4);
  {������������� �������, ����������� ������ 90�}
  for i := 0 to 3 do
    {���� �� �������� ��������� ���� � ��������}
    for j := Low(angles) to High(angles) do
      degrees[i * Length(angles) + j] := angles[j] + 90 * i;
  {������������� �������� ������}
  {����������� ������� ������ �����}
  SetLength(radians, Length(degrees));
  {���� �� ��������}
  for i := Low(degrees) to High(degrees) do
    {������� ����������� �������� � �������}
    radians[i] := degrees[i] * Pi / 180;
  {������� ������ �������}
  TextOut(5, 5, 'a�');
  TextOut(5, 35, 'sin(a)');
  TextOut(5, 65, 'cos(a)');
  TextOut(5, 95, 'tn(a)');
  {���� �� ���� �������� (��� ��������)}
  for i := Low(degrees) to High(degrees) do
  begin
    {������� �������}
    TextOut(i * 50 + 55, 5, degrees[i]);
    {������� ������}
    TextOut(i * 50 + 55, 35, MyRound(Sin(radians[i]), -3));
    {������� ��������}
    TextOut(i * 50 + 55, 65, MyRound(Cos(radians[i]), -3));
    {������� ��������
    ������� �� ����� ��������� �������: 90, 270}
    if (degrees[i] <> 90) and (degrees[i] <> 270) then
      TextOut(i * 50 + 55, 95, MyRound(Tan(radians[i]), -3))
    else TextOut(i * 50 + 55, 95, 'infinity');
  end;
  {��������� ������ ����}
  SetWindowSize(Length(degrees) * 50 + 51, 121);
  {��������� ��� ������� � ����}
  SaveWindow('D:\SinCosTable.png');
end.