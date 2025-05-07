page 50001 "Member Application List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Member Application";
    Editable = false;
    CardPageId = "Member Registration Card";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Member Application No."; Rec."Member Application No.")
                {
                    ApplicationArea = All;
                }
                field("Member Loan Category"; Rec."Member Loan Category")
                {
                    ApplicationArea = All;
                }
                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = All;
                }
                field("Date of Registration"; Rec."Registration Date")
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
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field("National Identity Number"; Rec."National ID No.")
                {
                    ApplicationArea = All;
                }
                field("Registration Number"; Rec."Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Official Phone Number"; Rec."Official Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = All;
                }
                field("Gender"; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("Nationality"; Rec.Nationality)
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