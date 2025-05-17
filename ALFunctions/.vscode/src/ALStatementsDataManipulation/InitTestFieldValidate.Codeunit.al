codeunit 50149 "InitTestFieldValidate"
{
    trigger OnRun()
    var
        customer: Record Customer;
    begin
        customer.Init();
        customer.Validate("Name", 'Test Name');
        customer.Validate("No.", 'Test No.');
        customer.Insert(true);
        customer.TestField("Phone No.");

        // In the following example, the TestField checks if the Salesperson Code contains the value ZX. 
        // In this case, it doesn't contain the value because the value is set to DK.
        customer."Salesperson Code" := 'DK';
        customer.TestField("Salesperson Code", 'ZX');

    end;


}