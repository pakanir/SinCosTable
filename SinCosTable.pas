{SinCosTable version 0.0.1 beta
copyright pakanir}

program SinCosTable;{название программы}

uses GraphABC;{подключаем модуль с графикой}

const{объявляем константы}
  {основные углы в виде градусов}
  angles: array of integer = (0, 30, 45, 60);

var{объявляем переменные}
  i, j: integer;{переменные для циклов}
  degrees: array of integer;{массив градусов}
  radians: array of real;{массив радиан}

function MyRound(number: real; ten: integer): real;
begin
  if (ten = 0) then MyRound := Round(number);
  if (ten > 0) then MyRound := MyRound(number / 10, ten - 1) * 10;
  if (ten < 0) then MyRound := MyRound(number * 10, ten + 1) / 10;
end;

begin
  {начертим таблицу}
  for i := 0 to 100 do
  begin
    {чертим горизонтальные линии}
    Line(0, i * 30, 2000, i * 30);
    {чертим вертикальные линии}
    Line(i * 50, 0, i * 50, 2000);
  end;
  {устанавливаем значения градусов}
  {присваиваем массиву градусов длину}
  SetLength(degrees, Length(angles) * 4);
  {повторяющиеся градусы, повторяются каждые 90°}
  for i := 0 to 3 do
    {цикл от меньшего основного угла к большему}
    for j := Low(angles) to High(angles) do
      degrees[i * Length(angles) + j] := angles[j] + 90 * i;
  {устанавливаем значения радиан}
  {присваиваем массиву радиан длину}
  SetLength(radians, Length(degrees));
  {цикл по градусам}
  for i := Low(degrees) to High(degrees) do
    {формула конвертации градусов в радианы}
    radians[i] := degrees[i] * Pi / 180;
  {Выводим первый столбец}
  TextOut(5, 5, 'a°');
  TextOut(5, 35, 'sin(a)');
  TextOut(5, 65, 'cos(a)');
  TextOut(5, 95, 'tn(a)');
  {цикл по всем градусам (или радианам)}
  for i := Low(degrees) to High(degrees) do
  begin
    {выводим градусы}
    TextOut(i * 50 + 55, 5, degrees[i]);
    {выводим синусы}
    TextOut(i * 50 + 55, 35, MyRound(Sin(radians[i]), -3));
    {выводим косинусы}
    TextOut(i * 50 + 55, 65, MyRound(Cos(radians[i]), -3));
    {выводим тангенсы
    тангенс не любит следующие градусы: 90, 270}
    if (degrees[i] <> 90) and (degrees[i] <> 270) then
      TextOut(i * 50 + 55, 95, MyRound(Tan(radians[i]), -3))
    else TextOut(i * 50 + 55, 95, 'infinity');
  end;
  {подгоняем размер окна}
  SetWindowSize(Length(degrees) * 50 + 51, 121);
  {сохраняем эту таблицу в файл}
  SaveWindow('D:\SinCosTable.png');
end.