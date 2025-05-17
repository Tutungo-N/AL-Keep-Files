codeunit 50157 "Notify Company Info"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure ShowMyCompanyWizard(ThisNotification: Notification)
    begin
        Page.Run(Page::"Assisted Company Setup Wizard");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnOpenPageEvent, '', false, false)]
    local procedure CheckInfoOnOpenSalesOrder(var Rec: Record "Sales Header")
    var
        CompanyInfo: Record "Company Information";
        CompanyNotify: Notification;
    begin
        if CompanyInfo.Get() then
            if (CompanyInfo.Name <> '') and (CompanyInfo."E-Mail" <> '') then
                exit;
        CompanyNotify.Id := CreateGuid();
        CompanyNotify.Message := 'Company Information is missing.';
        CompanyNotify.AddAction('Open Company Information', Codeunit::"Notify Company Info", 'ShowMyCompanyWizard');
        CompanyNotify.Send();

    end;
}