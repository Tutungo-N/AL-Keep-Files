codeunit 50106 "Array Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        SaleAmount: array[10] of Decimal;
        TotalAmount: Decimal;
        Length: Integer;
    begin
        Length := ArrayLen(SaleAmount); // Returns 10
    end;
}