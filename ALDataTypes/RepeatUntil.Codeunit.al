codeunit 50118 "Repeat Until"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        index, totalSales : Integer;
        sales: array[5] of Integer;
    begin
        GetSales(sales);

        repeat
            totalSales := 0;
            index := 1;
            repeat
                totalSales := totalSales + sales[index];
                index := index + 1;
            until (index > 5);
        until (totalSales >= 8);

        Message('Total sales: %1', totalSales);
    end;

    procedure GetSales(var sales: array[5] of Integer)
    begin
        sales[1] := 1;
        sales[2] := 2;
        sales[3] := 3;
        sales[4] := 4;
        sales[5] := 5;
    end;
}