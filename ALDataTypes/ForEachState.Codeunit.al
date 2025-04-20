codeunit 50100 "ForEachState"
{
    Subtype = Normal;
    Access = Internal;
    //ApplicationArea = All;

    trigger OnRun()
    var
        stringList: List of [Text[20]];
        stringItem: Text[20];

    begin
        foreach stringItem in stringList do begin
            // Process each item in the list
            Message('Processing: %1', stringItem);
        end;

    end;
}
// The foreach statement can only be used on enumerable collections (List of and Dictionary of)
// and is not available for arrays. The foreach statement iterates over each element in the collection, allowing you to process each item without needing to manage the index manually. This is particularly useful for collections where the size may change or when you want to avoid off-by-one errors that can occur with traditional for loops.
// The foreach statement is a more readable and less error-prone way to iterate over collections compared to traditional for loops. It abstracts away the index management, making the code cleaner and easier to understand.