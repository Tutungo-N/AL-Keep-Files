codeunit 50124 "Procedure Call Expression"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        TotalCost: Decimal;
        Quantity: Integer;
    begin
        TotalCost := Quantity * CalculatePrice()
    end;

    procedure CalculatePrice(): Decimal
    begin
        exit(100.00);
    end;

}