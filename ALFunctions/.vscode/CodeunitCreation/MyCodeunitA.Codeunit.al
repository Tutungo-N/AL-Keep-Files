codeunit 50131 MyCodeunitA
{
    Subtype = Normal;
    Access = Public;
    trigger OnRun()
    var
        MyCodeunitB: Codeunit MyCodeunit;
        //Result: Boolean;
        Result: Text[50];
    begin
        Result := MyCodeunitB.MyFunction('Hello', '42');
    end;


}