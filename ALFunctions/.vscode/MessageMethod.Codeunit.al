codeunit 50100 "Message Method"
{
    Subtype = Normal;
    Access = Internal;

    Trigger OnRun()
    var
        Message: Text[100];

        MessageTypeValue: Integer;
        MyInt: Integer;
        TheValueofTxt: Label 'The value of %1 is %2';
    begin
        Message := 'Are you sure you want to continue?';
        MyInt := 5;
        Message(TheValueofTxt, 'My Int', MyInt);
        if Confirm(Message, false) then begin
            MessageTypeValue := 1;
            Message('The value of MessageTypeValue is %1', MessageTypeValue);
        end else begin
            MessageTypeValue := 0;
            Message('The value of MessageTypeValue is %1', MessageTypeValue);
        end;
        Message('The value of MyInt is %1', MyInt);
    end;
}