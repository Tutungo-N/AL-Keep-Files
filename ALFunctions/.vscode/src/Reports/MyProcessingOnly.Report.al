report 50106 MyProcessOnlyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                Clear(Customer);
                Clear(Counter);
                if not ReplaceExisting then
                    Customer.SetRange("Name 2", ' ');
            end;

            trigger OnAfterGetRecord()
            begin
                if MyCustomer.Get(Customer."No.") then begin
                    MyCustomer."Name 2" := MyNameToApply;
                    MyCustomer.Modify();
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Ready!, %1 Customers were updated.', Counter);
            end;

        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(MyNameToApply; MyNameToApply)
                    {
                        ApplicationArea = All;
                        Caption = 'MyName to apply';
                        ToolTip = 'Specifies the MyName/Name2 to apply';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                        Caption = 'Replace existing?';

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

    /*rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
*/
    var

        MyNameToApply: Text;
        MyCustomer: Record Customer;
        ReplaceExisting: Boolean;
        Counter: Integer;

}