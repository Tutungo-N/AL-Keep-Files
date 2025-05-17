pageextension 50102 CustList extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        Report.Run(Report::LBCustList);
    end;
}