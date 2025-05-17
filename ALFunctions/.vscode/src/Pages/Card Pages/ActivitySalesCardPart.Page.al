page 50142 "My Activity Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "My Activity Cues";
    Caption = 'My Activities';

    layout
    {
        area(Content)
        {
            cuegroup(Control514)
            {
                CuegroupLayout = Wide;
                ShowCaption = false;

                field("Sales This Month"; Rec."Sales This Month")
                {
                    DrillDownPageId = "Customer Ledger Entries";
                    trigger OnDrillDown()
                    begin

                    end;
                }
            }
            cuegroup("Ongoing Sales")
            {
                Caption = 'Ongoing Sales';

                field("Ongoing Sales Quotes"; Rec."Ongoing Sales Quotes")
                {
                    Caption = 'Sales Quotes';
                    DrillDownPageId = "Sales Quotes";
                }

                field("Ongoing Sales Invoices"; Rec."Ongoing Sales Invoices")
                {
                    Caption = 'Sales Invoices';
                    DrillDownPageId = "Sales Invoice List";
                }
            }
            cuegroup("Ongoing Purchases")
            {
                Caption = 'Ongoing Purchases';

                field("Ongoing Purchase Invoices"; Rec."Ongoing Purchase Invoices")
                {
                    DrillDownPageId = "Purchase Invoices";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Set UP Cues")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKPIs.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    var
        CuesAndKPIs: Codeunit "Cues And KPIs";

    trigger OnOpenPage()
    begin
        // Implementing the Singleton Design Pattern
        if not Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;

    trigger OnAfterGetRecord()
    begin
        Rec."Sales This Month" := Rec.CalcSalesThisMonth();
    end;

    local procedure Get(): Boolean
    begin
        // Try to find the current record; return true if found, false otherwise
        exit(Rec.FindFirst());
    end;
}