xmlport 50101 "My Customer XML"
{
    Caption = 'Export customers to XML';
    Direction = Export;
    Format = Xml;

    schema
    {
        textelement(Customers)
        {
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.")
                {

                }
                fieldattribute(Language_Code; Customer."Language Code")
                {

                }
                fieldelement(Name; Customer.Name)
                {

                }
                fieldelement(PhoneNo; Customer."Phone No.")
                {

                }
                textelement(Address)
                {
                    XmlName = 'Address';
                    fieldelement(Address; Customer.Address)
                    {

                    }
                    fieldelement(PostCode; Customer."Post Code")
                    {

                    }
                    fieldelement(City; Customer.City)
                    {

                    }
                }
            }
        }
    }

}