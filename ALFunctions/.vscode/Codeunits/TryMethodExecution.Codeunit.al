codeunit 50112 "Try Method Execution"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin
        if Trymethod() then
            Message('Success')
        else
            Message('An issue came up. Do not fret! It is not your fault!');

    end;

    [TryFunction]

    procedure TryMethod()
    begin
        Error('An error occurred during the operation.');
    end;
}
