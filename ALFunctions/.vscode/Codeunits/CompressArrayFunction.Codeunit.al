codeunit 50107 "Compress Array Function"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyArray: array[4] of Text[20];
        Count: Integer;
    begin
        MyArray[1] := 'Paris';
        MyArray[2] := 'London';
        MyArray[3] := '';
        MyArray[4] := 'New York';

        CompressArray(MyArray); // Compresses the array to remove empty elements
        Count := CompressArray(MyArray);
        Message('Number of non-empty elements: %1', Count); // Returns 3

    end;


}