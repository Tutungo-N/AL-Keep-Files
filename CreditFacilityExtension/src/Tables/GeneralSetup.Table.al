table 50002 "General Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = SystemMetadata;

        }
        field(2; "Member Nos"; Code[20])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }



}