codeunit 50134 "Subscription Event"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Event", 'OnBeforePostSalesLine', '', true, true)]
    local procedure BeforePostSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin

    end;
}