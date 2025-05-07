page 50002 "Registered Members List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Registered Members";
    CardPageId = "Member Registration Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Member Application No."; Rec."Member Application No.")
                {
                    ApplicationArea = All;
                    Caption = 'Member Number';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field("Member Loan Category"; Rec."Member Loan Category")
                {
                    ApplicationArea = All;
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = All;
                }
                field("National ID No."; Rec."National ID No.")
                {
                    ApplicationArea = All;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Second Name"; Rec."Second Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Official Phone Number"; Rec."Official Phone Number")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }


}