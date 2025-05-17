xmlport 50100 MyXmlport
{
    Caption = 'Export contacts to XML';
    Direction = Export;
    Format = Xml;
    UseRequestPage = false;
    DefaultFieldsValidation = true;



    schema
    {
        textelement(Contacts)
        {
            XmlName = 'Contacts';
            tableelement(Contact; Contact)
            {
                RequestFilterFields = "No.";
                fieldattribute(No; Contact."No.")
                {

                }
                fieldattribute(ExternalID; Contact."External ID")
                {

                }
                fieldattribute(Name; Contact.Name)
                {

                }
                fieldattribute("E-mail"; Contact."E-Mail")
                {

                }
                textelement(Company)
                {
                    XmlName = 'Company';

                    fieldattribute(CompanyNo; Contact."Company No.")
                    {

                    }
                    fieldelement(CompanyName; Contact."Company Name")
                    {

                    }

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }


}