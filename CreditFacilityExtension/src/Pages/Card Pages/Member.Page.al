page 50000 "Member Registration Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Member Application";


    layout
    {
        area(Content)
        {
            group(General)
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
            }
            group(SpecificDetails)
            {
                Caption = 'Specific Details';

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
            action(Process)
            {
                Caption = 'Register Member';
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    MemberReg: Codeunit "Member Management";

                begin
                    if Confirm('Do you want to register this member?') then begin
                        MemberReg.RegisterMember(Rec);
                        Message('Member %1 has been registered.', Rec."Full Name");
                        CurrPage.Close();
                    end else
                        Message('Registration cancelled.');
                end;

            }
        }
    }



}