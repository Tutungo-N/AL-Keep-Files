codeunit 50139 MyPrivateAddressProvider implements MyAddressProvider
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin

    end;

    procedure GetAddress(): Text
    begin
        exit('My Home/Private Address\ 00100 - Nairobi, Kenya');
    end;
}
