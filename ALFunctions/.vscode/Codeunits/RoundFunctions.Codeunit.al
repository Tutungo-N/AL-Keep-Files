codeunit 50105 "Round Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyNumber: Decimal;
        MyNumber2: Decimal;
        MyNumber3: Decimal;
        MyNumber4: Decimal;
        MyNumber5: Decimal;
        MyAbsolute: Integer;
        Power1: Decimal;
        Result: Decimal;
        Text0000: Label '%1 raised to the power of %2 is %3';

    begin
        MyNumber := 1234.5678;

        Message('Round: %1', Round(MyNumber, 3, '>')); // Rounds to 1234.57
        Message('Round: %1', Round(MyNumber, 3, '<')); // Rounds to 1234.57

        MyAbsolute := Abs(-1234);
        Message('Absolute: %1', MyAbsolute); // Returns 1234

        Power1 := 0.5;
        Result := Power(MyNumber, Power1); // Returns 35.3553390593274
        Message(Text0000, MyNumber, Power1, Result); // Returns 35.3553390593274

    end;
}