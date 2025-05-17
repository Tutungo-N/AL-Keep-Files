table 50103 "My Activity Cues"
{
    DataClassification = ToBeClassified;
    Caption = 'My Activity Cues';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {


        }
        field(40; "Ongoing Sales Invoices"; Integer)
        {

            CalcFormula = count("Sales Header" where("Document Type" = filter(Invoice)));
            FieldClass = FlowField;
        }
        field(50; "Ongoing Purchase Invoices"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Invoice)));
            FieldClass = FlowField;
        }
        field(60; "Sales This Month"; Decimal)
        {

        }
        field(70; "Ongoing Sales Quotes"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = filter(Quote)));
            FieldClass = FlowField;
        }
        field(75; "User ID Filter"; Code[50])
        {
            // This field is used for filtering approval entries by user
        }
        field(80; "Requests To Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"), Status = filter(Open)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure CalcSalesThisMonth() Amount: Decimal
    var
        CustomLedgEntry: Record "Cust. Ledger Entry";
        CustLedgEntrySales: Query "My Customer Ledger Entry Sales";

    begin
        CustLedgEntrySales.SetRange(DocumentTypeFilter, CustomLedgEntry."Document Type"::Invoice);
        CustLedgEntrySales.SetRange(PostingDateFilter, CalcDate('<-CM>', WorkDate()));

        CustLedgEntrySales.Open();
        if CustLedgEntrySales.Read() then
            Amount := CustLedgEntrySales.SumSalesLCY;
        CustLedgEntrySales.Close();

    end;
}