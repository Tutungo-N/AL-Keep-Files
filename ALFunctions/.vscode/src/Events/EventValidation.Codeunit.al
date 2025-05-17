codeunit 50137 Validations
{
    trigger OnRun()
    begin

    end;

    local procedure CheckForPlusSign(TextToVerify: Text[50])
    var

    begin
        if TextToVerify.Contains('+') then
            Error('Text contains a plus sign. Remove it!');
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, Address, false, false)]
    local procedure TableCustomerOnAfterValidateAddress(Rec: Record Customer)
    begin

        CheckForPlusSign(Rec.Address);
    end;
}