codeunit 50148 "My CalcSumsStatement"
{
    trigger OnRun()
    var
        SalesInvHeader: Record "Sales Invoice Header";

    begin

        SalesInvHeader.SetCurrentKey("Bill-to Customer No.");
        SalesInvHeader.SetRange("Bill-to Customer No.", '20000', '70000');
        SalesInvHeader.SetRange("Document Date", 0D, Today());
        //SalesInvHeader.CalcSums("Amount Including VAT");
        Message('The total is: %1', SalesInvHeader.Amount);

        if SalesInvHeader."Location Code" = '' then
            SalesInvHeader.FieldError("Location Code", 'cannot be empty');

    end;


}