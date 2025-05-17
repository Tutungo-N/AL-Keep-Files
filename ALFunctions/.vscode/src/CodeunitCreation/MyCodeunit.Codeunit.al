codeunit 50130 "MyCodeunit"
{
    Subtype = Normal;
    Access = Public;
    trigger OnRun()
    begin

    end;

    procedure MyFunction(Param1: Text[50]; Param2: Code[20])
    Result: Text[50];
    begin
        Result := Param1 + ' ' + Param2;
        //exit(true); // Example return value
    end;
}