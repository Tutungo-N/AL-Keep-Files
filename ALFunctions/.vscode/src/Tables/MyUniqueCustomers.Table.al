table 50101 "My Unique Customer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            TableRelation = User."User Name";

        }
        field(2; "Customer No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                SetCustomerFields();
            end;
        }
        field(3; Name; Text[100])
        {
            Editable = false;
        }
        field(4; "Phone No"; Text[30])
        {
            Editable = false;
        }
        field(5; "Balance LCY"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("Customer No")));
            FieldClass = FlowField;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "User ID", "Customer No")
        {
            Clustered = true;
        }
    }

    procedure SetCustomerFields()
    var
        Cust: Record Customer;
    begin
        if Cust.Get("Customer No") then begin
            Name := Cust.Name;
            "Phone No" := Cust."Phone No.";
        end;

    end;
}