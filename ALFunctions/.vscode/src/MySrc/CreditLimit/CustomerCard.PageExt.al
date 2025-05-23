pageextension 50101 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                ToolTip = 'Update the credit limit for the customer.';
                Image = CalculateCost;
                trigger OnAction()
                var

                begin
                    CallUpdateCreditLimit();

                end;
            }
        }

    }

    var
        AreYouSureQuest: Label 'Are you sure you want to set the %1 to %2?', Comment = '%1 is Credit Limit caption and %2 is the new Credit Limit value.';
        CreditLimitRoundedText: Label 'The credit limit was rounded to %1 to comply with company policies', Comment = '%1 is new Credit Limit value';
        CreditLimitUpToDateText: Label 'The credit limit is up to date.';


    local procedure CallUpdateCreditLimit()
    var
        CalculatedCreditLimit: Decimal;
        ActualCreditLimit: Decimal;
    begin
        CalculatedCreditLimit := Rec.CalculateCreditLimit();
        if CalculatedCreditLimit = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateText);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQuest, false, Rec.FieldCaption("Credit Limit (LCY)"), CalculatedCreditLimit) then
                exit;

        ActualCreditLimit := CalculatedCreditLimit;
        Rec.UpdateCreditLimit(ActualCreditLimit);
        if ActualCreditLimit <> CalculatedCreditLimit then
            Message(CreditLimitRoundedText, ActualCreditLimit);

    end;
}