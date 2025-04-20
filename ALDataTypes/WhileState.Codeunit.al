codeunit 50113 "While State"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        index, totalSales : Integer;
        sales: array[5] of Integer;

    begin
        GetSales(sales);

        while totalSales < 8 do begin
            totalSales := 0;
            index := 1;
            while index <= 5 do begin
                totalSales := totalSales + sales[index];
                index := index + 1;
            end;
        end;
        Message('Total sales: %1', totalSales);

        while totalSales < 8 do begin
            index := index + 1;
            totalSales := totalSales + sales[index];
            if index > 5 then begin
                index := 1;
                totalSales := 0;
            end;
        end;

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