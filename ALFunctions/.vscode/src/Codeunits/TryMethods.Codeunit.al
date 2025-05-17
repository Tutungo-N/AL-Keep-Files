codeunit 50125 "Try Methods"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin
        MyTryMethod();
        Message('MyTryMethod executed successfully.');
    end;

    procedure MyTryMethod()
    begin
        Error('An error occurred in MyTryMethod.');
    end;

}