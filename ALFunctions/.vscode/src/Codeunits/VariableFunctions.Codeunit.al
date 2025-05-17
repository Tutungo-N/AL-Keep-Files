codeunit 50109 "Variable Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        myText: Text[100];
        myInteger: Integer;

    begin

        //myText := UserId;

        //Clear(myText);
        myText := '5';
        if not Evaluate(myInteger, myText) then
            Error('Invalid integer value: %1', myText); // Converts the string to an integer


        myInteger := 5;
        myText := Format(myInteger); // Converts the integer to a string
        Message('Formatted integer: %1', myText); // Returns '5'
    end;
}