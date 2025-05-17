page 50143 "My Unique Customers"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "My Unique Customer";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Customer No"; Rec."Customer No")
                {
                    trigger OnValidate()
                    begin
                        SyncFieldsWithCustomer();
                    end;

                }
                field(Name; Rec.Name)
                {

                }
                field("Phone No"; Rec."Phone No")
                {

                }
                field("Balance LCY"; Rec."Balance LCY")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {

                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No");
                RunPageMode = View;
                RunPageView = sorting("No.");
            }
        }
    }

    var
        Custm: Record Customer;

    local procedure SyncFieldsWithCustomer()
    var
        MyUniqueCustomer: Record "My Unique Customer";
    begin
        Clear(Custm);

        if Custm.Get(Rec."Customer No") then
            if (Rec.Name <> Custm.Name) or
                (Rec."Phone No" <> Custm."Phone No.") then begin
                Rec.Name := Custm.Name;
                Rec."Phone No" := Custm."Phone No.";
                if MyUniqueCustomer.Get(Rec."User ID", Rec."Phone No") then
                    MyUniqueCustomer.Modify();
            end;

    end;
}