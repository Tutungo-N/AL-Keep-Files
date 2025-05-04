codeunit 50103 "String Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyLongString: Text[100];
    begin
        MyLongString := 'This is a long string that needs to be split into smaller parts.';
        SplitString(MyLongString, 20);
        // Example usage of the SplitString function
    end;

    procedure SplitString(InputString: Text[100]; ChunkSize: Integer)
    var
        Result: Text[100];
        i: Integer;
    begin
        i := 1;
        while i <= StrLen(InputString) do begin
            Result := CopyStr(InputString, i, ChunkSize);
            Message(Result);
            i += ChunkSize;
        end;
    end;
}
/*
The string functions are:

StrPos and IndexOf

CopyStr and Substring

SelectStr and Split

InsStr

StrLen and MaxStrLen

LowerCase, UpperCase, ToLower, and ToUpper

IncStr

*/
