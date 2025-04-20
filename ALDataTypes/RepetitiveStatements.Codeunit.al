codeunit 50116 "Repetitive Statements"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        intCount, total : Integer;
    begin
        for intCount := 1 to 10 do begin
            // Increment the total by the current count
            // This is a simple example of a repetitive statement
            total := total + intCount;
        end;

    end;
}