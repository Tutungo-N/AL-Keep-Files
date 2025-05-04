codeunit 50147 "My CalcFieldsFunction"
{
    trigger OnRun()
    var
        customer: Record Customer;
    begin
        customer.SetRange("Date Filter", 0D, Today());

        // Using CalcFields
        if customer.FindSet() then begin
            repeat
                customer.CalcFields(Balance, "Net Change");
                // Do something with the calculated fields or additional logic here
            until customer.Next() = 0;
        end;


        // Using SetAutoCalcFields
        customer.SetAutoCalcFields(Balance, "Net Change");
        if customer.FindSet() then begin
            repeat
                // The Balance and Net Change fields are automatically calculated here
                // Do something with the calculated fields or additional logic here
            until customer.Next() = 0;
        end;



    end;

    // In the above example, only the Balance and Net Change fields are calculated. Outside the repeat until loop,
    // the FlowFields are no longer calcullated, only within their scope.
    

    // Note: if you always want to calculate certain FlowFields (within the function scope), you can use the 
    // SetAutoCalcFields function to set the FlowFields to be calculated automatically.)
    
    
}
   