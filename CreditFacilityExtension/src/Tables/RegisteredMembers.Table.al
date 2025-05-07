table 50001 "Registered Members"
{
    DataClassification = CustomerContent;
    Caption = 'Registered Members';

    fields
    {
        field(1; "Member Application No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Member Application No.';

        }
        field(2; "Member Loan Category"; Enum "Loan Category")
        {
            DataClassification = CustomerContent;
            Caption = 'Member Loan Category';
        }
        field(3; "Member Type"; Enum "Member Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Member Type';
        }
        field(4; "Registration Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Date';
        }
        field(5; "First Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
        }
        field(6; "Second Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Second Name';
        }
        field(7; "Last Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
        }
        field(8; Gender; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Gender';
            OptionMembers = Male,Female,Other;
            OptionCaption = 'Male, Female, Other';
        }
        field(9; "Marital Status"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Marital Status';
            OptionMembers = Married,Single,Divorced;
            OptionCaption = 'Married, Single, Divorced';
        }
        field(10; Nationality; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Nationality';
            OptionMembers = KenyaCitizen,NonCitizen;
            OptionCaption = 'Kenyan Citizen, Non-Citizen';
        }
        field(11; "National ID No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'National Identity Number';

        }
        field(12; "Registration No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Number';
            ToolTip = 'Registration Number for Saccos, companies, Cooperative societies, etc. Does not apply to individuals.';
        }
        field(13; "Official Phone Number"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Official Phone Number';
        }
        field(14; "Email Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Official Email Address';
        }
        field(15; Registered; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Registered';
        }
        field(16; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(17; "Full Name"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Full Name';
        }
        field(18; "Registered Member No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "Member Application No.")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}