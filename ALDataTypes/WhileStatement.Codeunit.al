codeunit 50111 "While Statement"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var

    begin

    end;


    procedure TestWhileStatement()
    var
        i: Integer;
        total: Integer;
        sales: array[5] of Integer;
    begin
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;

        i := 1;
        total := 0;

        while i <= 5 do begin
            // Increment the total by the current count
            // This is a simple example of a repetitive statement
            total := total + sales[i];
            i := i + 1;
        end;

    end;

    procedure TestWhileStatement2()
    var
        i: Integer;
        total: Integer;
        sales: array[5] of Integer;

    begin
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;

        i := 1;
        total := 0;

        while i <= 5 do begin
            // Increment the total by the current count
            // This is a simple example of a repetitive statement
            total := total + sales[i];
            i := i + 1;
        end;

    end;
}