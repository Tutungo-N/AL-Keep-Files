report 50105 "My Processing Only Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'My Processing Only Report';
    AdditionalSearchTerms = 'My ProcessingOnly Report';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                Counter += 1;
            end;

            trigger OnPostDataItem()
            begin

            end;
        }
    }
    trigger OnInitReport()
    begin
        Clear(Counter);
    end;

    trigger OnPreReport()
    begin

    end;

    trigger OnPostReport()
    begin
        Message('Records processed: %1 for: %2', Counter, Customer.GetFilters());
    end;

    var
        Counter: Integer;
}

// This report loops over all customer records and displays a message with the number of records that were processed.
// If you apply filters in the request page, fewer records might be processed, which will be shown in the message, 
// including the applied filters.