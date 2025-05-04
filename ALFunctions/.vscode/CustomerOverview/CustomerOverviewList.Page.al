page 50102 "Customer Overview List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Overview";
    Caption = 'Customer Overview List';
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    //Caption = 'Entry No.';
                }
                field("Customer No"; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    //Caption = 'Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    //Caption = 'Customer Name';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    //Caption = 'Source Code';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    //Caption = 'Amount';
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                ApplicationArea = All;
                Caption = 'Import Records';
                Image = Import;
                ToolTip = 'Import Records';

                trigger OnAction()
                var
                    UpdateCustomerOverview: Codeunit "Customer Overview Management";
                begin
                    UpdateCustomerOverview.Run(); // Calling the codeunit's RunTrigger from the OnAction trigger

                end;
            }
        }
    }


}