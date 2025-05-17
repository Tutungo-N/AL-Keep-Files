codeunit 50146 "My AddModifyDelete"
{
    trigger OnRun()
    var
        customer: Record Customer;
    begin
        customer.Init(); // Initialize a new record.
        customer."No." := '5678'; // Set the "No." field.
        customer.Name := 'James Laugh'; // Set the "Name" field.
        customer."Address 2" := '123 Main St'; // Set the "Address 2" field.
        customer."City" := 'Seattle'; // Set the "City" field.
        customer."Country/Region Code" := 'US'; // Set the "Country/Region Code" field.
        customer."Phone No." := '1234567890'; // Set the "Phone No." field.
        customer.Insert(true);


        customer.Get('5678'); // Retrieve the record with "No." = '5678'.
        customer."Address 2" := '456 Elm St'; // Modify the "Address 2" field.
        customer."City" := 'Redmond'; // Modify the "City" field.   
        customer.Modify(true); // Save the changes.


        // In the following example, all records where the Salesperson Code field equals (PS) are retrieved first, 
        // and then all the retrieved records are updated with the value (JR).
        customer.SetRange("Salesperson Code", 'PS'); // Set the filter for "Salesperson Code".
        if customer.FindSet() then begin // Find the first record in the set.
            repeat
                customer."Salesperson Code" := 'JR'; // Modify the "Salesperson Code" field.
                customer.Modify(true); // Save the changes.
            until customer.Next() = 0; // Continue until no more records are found.
        end;

        // Usig ModifyAll()
        customer.SetRange("Salesperson Code", 'PS'); // Set the filter for "Salesperson Code".
        if customer.FindSet() then begin // Find the first record in the set.
            customer.ModifyAll("Salesperson Code", 'JR'); // Modify all records in the set.
        end;

        customer.Get('5678');
        customer.Delete(true); // Delete the record with "No." = '5678'.
        // In the following example, all records where the Salesperson Code field equals (PS) are retrieved first,  
        customer.SetRange("Salesperson Code", 'PS'); // Set the filter for "Salesperson Code".
        if customer.FindSet() then begin // Find the first record in the set.
            repeat
                customer.Delete(true); // Delete the record.
            until customer.Next() = 0; // Continue until no more records are found.
        end;

        //or using DeleteAll()
        customer.SetRange("Salesperson Code", 'PS'); // Set the filter for "Salesperson Code".
        if customer.FindSet() then begin // Find the first record in the set.
            customer.DeleteAll(true); // Delete all records in the set.
        end;

    end;
}
