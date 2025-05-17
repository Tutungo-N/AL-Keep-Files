query 50100 Items
{
    QueryType = Normal;
    Caption = 'Items.Query';

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Type; Type)
            {

            }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Unit_Cost; "Unit Cost")
            {

            }
            column(Inventory; Inventory)
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