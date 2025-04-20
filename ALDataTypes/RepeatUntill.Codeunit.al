codeunit 50119 "Repeat Until Statement"
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
            index := index + 1;
            totalSales := totalSales + sales[index];
        until (totalSales >= 8) or (index > 5);
        Message('Total sales: %1', totalSales);
    end;

    procedure GetSales(var sales: array[5] of Integer)
    begin

    end;
}