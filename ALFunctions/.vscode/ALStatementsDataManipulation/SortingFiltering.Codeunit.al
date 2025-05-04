codeunit 50145 "Sort and Filter Functions"
{
    trigger OnRun()
    var
        custoomer: Record Customer;
        CustNo: Code[20];
    begin
        custoomer.SetCurrentKey("Credit Amount"); // Set the current key to "No."

        custoomer.FindFirst();
        Message('Customer found: %1', custoomer.Name);


        custoomer.SetRange("No.", '11000', '19000'); // Set a range on the "No." field.
        custoomer.FindSet();
        repeat
            Message('Customer found: %1', custoomer.Name);
        until custoomer.Next() = 0; // Move to the next record in the set.

        // SetFilter function retrieving all customers where the N0. field is greater than 11000 and different from 15000.
        custoomer.SetFilter("No.", '>11000&<>15000'); // Set a filter on the "No." field.
        custoomer.FindSet();
        repeat
            Message('Customer found: %1', custoomer.Name);
        until custoomer.Next() = 0; // Move to the next record in the set.


        CustNo := '20000'; // Set a range on the "No." field.

        custoomer.SetRange("No.", CustNo); // Set a filter on the "No." field.
        if (custoomer.IsEmpty()) then
            Message('Customer not found.')
        else
            Message('Customer found: %1', custoomer.Name);

    end;


}

/*
The SetFilter function accepts a string value, where you can specify your filtering conditions, such as:

>
<
< >
<=
>=
'*'
.. (range)
& (and)
| (or) and more in this filter condition



*/
