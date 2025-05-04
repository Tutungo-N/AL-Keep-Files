codeunit 50132 "Procedure Exit Statement"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin

    end;

    local procedure MyFunction(): Integer
    var
        Result: Integer;
    begin
        Result := Power(2.5, 3); // Call the Power function to calculate 2^3
        exit(Result); // Exit the function with the calculated result
    end;
}