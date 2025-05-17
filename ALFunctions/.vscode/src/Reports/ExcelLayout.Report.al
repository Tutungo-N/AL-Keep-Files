report 50103 "My Excel Layout Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyExcelLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {

            }
            column(CustomerName; Name)
            {

            }
            column(City; City)
            {

            }
            column(BalanceLCY; "Balance (LCY)")
            {

            }
        }
    }



    rendering
    {
        layout(MyExcelLayout)
        {
            Type = Excel;
            LayoutFile = '.Reports/EXCEL/mySpreadsheet.xlsx';
            Caption = 'Excel Layout';
            Summary = 'An example of excel layout';

        }
    }

    var
        myInt: Integer;
}