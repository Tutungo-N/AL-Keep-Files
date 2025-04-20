codeunit 50122 "With Statement"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        myTable: Record Customer;
        myRecRef: RecordRef;
        myFieldRef: FieldRef;
        myFieldValue: Text[100];
        Reason: Option Returned,CreditLimit,InvoiceAmounts;
    begin
        myTable."No." := 'CUST0001';
        myTable.Amount := 1000;
        myTable."Credit Limit (LCY)" := 5000;
        myTable."Invoice Amounts" := 2000;
        myTable."Credit Amount (LCY)" := myTable."Credit Limit (LCY)" - myTable."Invoice Amounts";
        Reason := Reason::Returned;
        myTable.Refunds := myTable."Credit Amount (LCY)" * 0.1;

        //Instead of using variable myTable, we can use with statement.
        myTable.Amount := myTable.Amount + 1000;
        myTable."Credit Limit (LCY)" := myTable."Credit Limit (LCY)" - 500;
        myTable."Invoice Amounts" := myTable."Invoice Amounts" + 200;
        myTable."Credit Amount (LCY)" := myTable."Credit Limit (LCY)" - myTable."Invoice Amounts";
        myTable.Refunds := myTable."Credit Amount (LCY)" * 0.1;
    end;

}