codeunit 50138 CompanyAddressProvider implements MyAddressProvider
{
    trigger OnRun()
    begin

    end;

    procedure GetAddress(): Text
    begin
        exit('Company Address\ 00100 - Nairobi, Kenya');
    end;
}