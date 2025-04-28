codeunit 50104 "String Function"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyLongString: Text[100];
        MyString: Text[100];
    begin
        MyLongString := 'This is a long string that needs to be split into smaller parts.';
        //SplitString(MyLongString, 20);
        // Example usage of the SplitString function
        // Example usage of StrPos and IndexOf:
        Message('%1', StrPos(MyLongString, 'long'));
        Message('%1', MyLongString.IndexOf('long'));
        // Example usage of CopyStr and Substring:
        MyString := CopyStr(MyLongString, 1, 4);
        Message('%1', MyString);
        MyString := MyLongString.Substring(5, 10);
        Message('%1', MyString);
    end;

}