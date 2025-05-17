codeunit 50144 "My Find Function"
{
    trigger OnRun()
    var
        customer: Record Customer;
    begin
        customer.Find('-'); // Find the first record in the table. 
        // SQL equivalent is SELECT * FROM Customer 

        if customer.Find('+') then
            Message('Customer found: %1', customer.Name)
        else
            Message('Customer not found.');
        // SQL equivalent is SELECT * FROM Customer Order By No. Desc

        customer.FindFirst(); // Find the first record in the table.
        // SELECT TOP 1 * FROM Customer
        Message('Customer found: %1', customer.Name);

        customer.FindLast();
        // SELECT TOP 1 * FROM Customer Order By No. Desc
        Message('Customer found: %1', customer.Name);





        // THE NEXT STATEMENT:
        // To retrieve all records or a set of filtered records, use the FindSet method.
        // The FindSet method returns a recordset that can be used in a repeat loop.
        customer.FindSet(); // Find all records in the table.
        // SQL equivalent is SELECT * FROM Customer

        customer.FindSet();
        repeat
            Message('Customer found: %1', customer.Name);
        until customer.Next() = 0; // Move to the next record in the set.
    end;


}