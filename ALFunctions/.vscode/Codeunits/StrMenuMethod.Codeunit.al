codeunit 50101 "Str Menu Method"
{
    Subtype = Normal;
    Access = Internal;

    Trigger OnRun()
    var
        Days: Text[100];
        Selection: Integer;

    begin
        Days := 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday';
        // Display a message box with the days of the week and a default selection of 0 (Monday)
        Selection := StrMenu(Days, 1, 'Which day is today?');
        Message('You selected %1', Selection);
        // Display a message box with the days of the week and a default selection of 1 (Tuesday)

    end;

}