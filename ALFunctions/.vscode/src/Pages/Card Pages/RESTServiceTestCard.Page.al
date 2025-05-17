page 50130 "Test REST Service"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AccessExternalService)
            {

                trigger OnAction()
                var

                    MyNum: Integer;
                begin
                    RESTManagement.GetUserInformation(MyNum);
                end;
            }
            action(PostToExternalService)
            {
                trigger OnAction()
                var
                    ItemRecord: Record Item;
                begin

                    RESTManagement.ChangePictureToBlackAndWhite(ItemRecord);

                end;
            }
        }
    }
    var
        RESTManagement: Codeunit "My REST Services";

}