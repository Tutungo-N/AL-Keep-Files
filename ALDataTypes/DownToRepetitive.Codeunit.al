codeunit 50117 "DownToRepetitive"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        intCount, totalSales, numberSales : Integer;
        sales: array[5] of Integer;
    begin
        GetSales(sales);
        totalSales := 0;

        for intCount := 5 downto 1 do begin
            // Decrement the totalSales by the current count
            // This is a simple example of a repetitive statement
            totalSales := totalSales + sales[intCount];
            numberSales := numberSales + 1;
        end;

    end;

    procedure GetSales(var sales: array[5] of Integer)
    begin
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;
    end;
}