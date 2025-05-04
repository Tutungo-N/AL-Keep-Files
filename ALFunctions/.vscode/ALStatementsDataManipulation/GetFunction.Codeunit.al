codeunit 50143 "My Get Function"
{
    trigger OnRun()
    var
        customer: Record Customer;
    begin
        customer.Get('30000');

        if customer.Get('10000') then
            Message('Customer found: %1', customer)
        else
            Message('Customer not found.');
    end;


}