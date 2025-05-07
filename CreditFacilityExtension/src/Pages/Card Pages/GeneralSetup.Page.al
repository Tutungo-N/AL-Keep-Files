page 50003 "General Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "General Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Member Nos"; Rec."Member Nos")
                {

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

    var
        myInt: Integer;
}