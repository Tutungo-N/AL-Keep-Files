pageextension 50107 "My Customer List Ext" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Customer")
        {
            action(ExportToXml)
            {
                Caption = 'Export to XML';
                ApplicationArea = All;
                Image = XMLFile;

                trigger OnAction()
                var
                    CustXml: XmlPort "My Customer XML";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;

                Begin
                    TempBlob.CreateOutStream(OutStr);
                    CustXml.SetDestination(OutStr);
                    CustXml.Export();
                    TempBlob.CreateInStream(InStr);
                    FileName := 'Customers.xml';
                    File.DownloadFromStream(InStr, 'Download', '', '', FileName);


                End;

            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}