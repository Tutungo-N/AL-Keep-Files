codeunit 50129 "Return Complex Types"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin

    end;

    /// <summary>
    /// This function returns a complex type, specifically a record of type Customer.
    /// It takes a name and returns the first customer record that matches the name.
    /// The name is used as a filter to find the customer record.
    /// You can use this feature to call members directly on the returned variable, for example, in expressions.
    /// As an example, you could use it in an IF statement like this:
    /// IF GetCustomerByName('John Doe').Name = 'John Doe' THEN BEGIN
    /// or this: if GetCustomerByName('John Doe')."Balance (LCY)" > 0 THEN BEGIN
    /// </summary>
    /// <param name="Name"></param>
    /// <returns></returns>

    procedure GetCustomerByName(Name: Text): Record Customer
    var
        CustomerRec: Record Customer;
    begin
        CustomerRec.SetFilter(Name, '@' + Name + '*');
        CustomerRec.FindFirst;
        exit(CustomerRec); // Return the customer record
    end;
}