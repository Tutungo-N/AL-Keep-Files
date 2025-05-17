query 50104 "My Customer Ledger Entry Sales"
{
    QueryType = Normal;


    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            column(SumSalesLCY; "Sales (LCY)")
            {
                Method = Sum;
            }
            filter(DocumentTypeFilter; "Document Type")
            {

            }
            filter(PostingDateFilter; "Posting Date")
            {

            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}