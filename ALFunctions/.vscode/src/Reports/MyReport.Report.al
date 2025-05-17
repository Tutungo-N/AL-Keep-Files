/*report 50100 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Excel;

    dataset
    {
        dataitem("Customer Sales"; Customer)
        {
            column("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Bill-to Customer No." = field ("No.");
            }
        }
    }
    
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    
                }
            }
        }
    }
    
    rendering
    {
        layout('ExcelLayout')
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
    
    var
        myInt: Integer;
}
*/