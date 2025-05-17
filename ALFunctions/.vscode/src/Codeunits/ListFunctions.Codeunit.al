codeunit 50108 "List Functions"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        MyList: List of [Integer];
        myTextList: List of [Text[100]];
        CheckCompany: Text[100];

    begin
        MyList.Add(1);
        MyList.Add(2);
        MyList.Add(3);
        MyList.Add(4);
        MyList.Add(5);

        CheckCompany := CompanyName;

        myTextList.Add('Hello');
        myTextList.Add('Dynamics');
        myTextList.Add('Business Central');

        myTextList.Set(2, 'Microsoft Dynamics 365');

        // Example usage of List functions
        Message('Count: %1', MyList.Count()); // Returns 5
        // Get(index) function
        Message('First: %1', MyList.Get(1)); // Returns 1


        // Remove an item from the list
        MyList.Remove(3); // Removes the item with value 3

        // Check if the list contains a specific item
        if MyList.Contains(2) then
            Message('The list contains 2.');
    end;
}