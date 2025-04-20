page 50111 "ImplicitWith"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {

            group(GroupName)
            {
                field("No."; Rec."No.")
                {

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.Name := 'Test';
                    end;
                }
            }
        }
    }
    trigger OnInit()
    begin
        if IsDirty() then Insert()
    end;

    local procedure Insert()
    var
        myTable: Record Customer;
    begin
    end;

    local procedure IsDirty(): Boolean
    begin
        exit(Rec.Name <> '');
    end;
}
