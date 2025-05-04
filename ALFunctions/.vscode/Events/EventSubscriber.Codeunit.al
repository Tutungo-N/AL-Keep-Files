codeunit 50135 "Event Subscriber"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeModifyEvent, '', true, true)]
    local procedure BeforeModifyCustomer(var Rec: Record Customer; var xRec: Record Customer)
    begin
        // Perform your logic here
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidateEvent, "Phone No.", true, true)]
    local procedure OnBeforeValidatePhoneNo(var Rec: Record Customer)
    begin
        if Rec."Phone No." = '' then
            Error('Phone number cannot be empty.')
        else if (Rec."Phone No.".Contains('+')) then
            Message('A plus sign isn''t needed.');

    end;



    /*[EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesLines', '', true, true)]
    local procedure OnBeforePostSalesLines(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin

    end;*/
}