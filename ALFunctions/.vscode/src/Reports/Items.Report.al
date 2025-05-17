report 50101 Items
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    Caption = 'Items based on Query';

    dataset
    {
        dataitem(Integer; Integer)
        {
            column(ItemNo; Items.No)
            {

            }
            column(Description; Items.Description)
            {

            }
            column(Type; Items.Type)
            {

            }
            column(UnitCost; Items.Unit_Cost)
            {

            }
            column(UnitPrice; Items.Unit_Price)
            {

            }
            column(Inventory; Items.Inventory)
            {

            }

            trigger OnPreDataItem()
            begin
                Items.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not Items.Read() then
                    CurrReport.Break();
            end;
        }
    }

    var
        Items: Query Items;
}