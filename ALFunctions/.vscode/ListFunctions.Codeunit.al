codeunit 50108 "List Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyList: List of [Integer];

    begin
        MyList.Add(1);
        MyList.Add(2);
        MyList.Add(3);
        MyList.Add(4);
        MyList.Add(5);

        // Example usage of List functions
        Message('Count: %1', MyList.Count()); // Returns 5
        Message('First: %1', MyList.Get(1)); // Returns 1


        // Remove an item from the list
        MyList.Remove(3); // Removes the item with value 3

        // Check if the list contains a specific item
        if MyList.Contains(2) then
            Message('The list contains 2.');
    end;
}