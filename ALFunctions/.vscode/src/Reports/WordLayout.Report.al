report 50102 MyWordLayoutReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyWordLayoutReport;
    Caption = 'My Word Layout Report';

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
            column(Balance__LCY_; "Balance (LCY)")
            {

            }
        }
    }


    rendering
    {
        layout(MyWordLayoutReport)
        {
            Type = Word;
            LayoutFile = './Reports/WORD/MyWordLayout.docx';
            Caption = 'My Word Layout Report';
            Summary = 'An example of a word layout';

        }
    }

    var
        myInt: Integer;
}