codeunit 50121 "Repeat until Loop Record"
{
    SubType = Normal;
    Access = Internal;

    trigger OnRun()
    var
        myTable: Record Customer;
    begin
        myTable.SetRange("No.", 'CUST0001', 'CUST0005');
        myTable.FindSet();
        repeat
            // Do something with the record
            myTable."Name" := 'Updated Name';
            myTable.Modify(true);
            myTable.Amount := myTable.Amount + 1000;
        until myTable.Next() = 0;

    end;
}