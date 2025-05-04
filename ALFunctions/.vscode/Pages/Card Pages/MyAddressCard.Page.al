page 50101 "My Address Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(WhatIsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'What is the address?';
                ToolTip = 'Click to get the address from the provider.';
                Image = Addresses;

                trigger OnAction()
                var
                    AddressProvider: Interface "MyAddressProvider";

                begin
                    AddressProviderFactory(AddressProvider);
                    Message('The address is: %1', AddressProvider.GetAddress());

                end;
            }
            action(SendToHome)
            {
                ApplicationArea = All;
                Caption = 'Send to Home';
                ToolTip = 'Set the interface implementation to private.';
                Image = Home;
                trigger OnAction()
                begin
                    sendTo := sendTo::Private;
                end;
            }
            action(SendToWork)
            {
                ApplicationArea = All;
                Caption = 'Send to Work';
                ToolTip = 'Set the interface implementation to work.';
                Image = WorkCenter;
                trigger OnAction()
                begin
                    sendTo := sendTo::Company;
                end;
            }
        }
    }

    local procedure AddressProviderFactory(var AddressProvider: Interface "MyAddressProvider")
    var
        WorkAddressProvider: Codeunit "CompanyAddressProvider";
        PrivateAddressProvider: Codeunit "MyPrivateAddressProvider";
    begin
        if sendTo = sendTo::Company then
            AddressProvider := WorkAddressProvider;
        if sendTo = sendTo::Private then begin
            AddressProvider := PrivateAddressProvider;
        end;
    end;

    var
        sendTo: Enum SendTo;
}