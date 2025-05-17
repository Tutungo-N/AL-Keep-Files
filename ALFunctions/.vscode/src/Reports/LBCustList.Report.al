report 50104 LBCustList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = EX_ExcelLayout;
    Caption = 'LB Customer List';
    PreviewMode = Normal;

    dataset
    {
        dataitem(Customer; Customer)
        {

            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
            dataitem(CustomerLedgers; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = sorting("Customer No.");

                column(CustomerLedgersCustomerNumber; "Customer No.")
                {

                }
                column(CustLedgersAmountInLCY; "Amount (LCY)")
                {

                }
            }
            trigger OnPreDataItem()
            begin
                if HideBlockedCust then
                    Customer.SetRange(Blocked, Blocked::" ");
            end;
        }
    }


    requestpage
    {
        AboutTitle = 'Customer Ledgers Report';
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(HideBlockedCust; HideBlockedCust)
                    {
                        ApplicationArea = All;
                        Caption = 'Do you want to hide blocked customers?';
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
        layout(EX_ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './.vscode/Reports/LABS/Layouts/EX_SpreadsheetCustomerlist.xlsx';

            Caption = 'LB Customer List';
            Summary = 'An example of an Excel Layout.';


        }
        layout(EX_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './.vscode/Reports/LABS/Layouts/CustomerList.rdl';
            Caption = 'LB Customer List';
            Summary = 'An example of an RDLC Layout.';
        }
        layout(EX_WordLayout)
        {
            Type = Word;
            LayoutFile = './.vscode/Reports/LABS/Layouts/CustomerList.docx';
            Caption = 'LB Customer List';
            Summary = 'An example of an RDLC Layout.';

        }
    }
    var
        HideBlockedCust: Boolean;


    /*local procedure ExpReportInEnabledFormatting(LanguageAbbrev: Text[5]; var MyReportForExport: Report Items): Boolean
    begin
        case LanguageAbbrev of
            'EN-US':
                MyReportForExport := Report::"Customer - English";
            'DE-DE':
                MyReportForExport := Report::"Customer - German";
            'FR-FR':
                MyReportForExport := Report::"Customer - French";
            else
                exit(false);
        end;
        exit(true);
    end;
*/
}