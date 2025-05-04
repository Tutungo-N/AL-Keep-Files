codeunit 50104 "String Function"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyLongString: Text[100];
        MyString: Text[100];
        MyString2: Text[100];
        newString: Text[100];
        MakeSplit: Text[100];
    begin
        MyLongString := 'This is a long string that needs to be split into smaller parts.';
        MakeSplit := MyLongString.Split(' ').Get(2);
        Message('%1', MakeSplit);
        // Example usage of the SplitString function
        // Example usage of StrPos and IndexOf:
        Message('%1', StrPos(MyLongString, 'long'));
        Message('%1', MyLongString.IndexOf('long'));
        // Example usage of CopyStr and Substring:
        MyString := CopyStr(MyLongString, 1, 4);
        Message('%1', MyString);
        MyString := MyLongString.Substring(5, 10);
        Message('%1', MyString);

        // Example usage of SelectStr and Split:
        MyString2 := 'This, is a comma, separated, string.';
        newString := SelectStr(2, MyString2);
        Message('%1', newString);
        MakeSplit := MyString2.Split(',').Get(2); //Results in 'is a comma'
        Message('%1', MakeSplit);
    end;

}