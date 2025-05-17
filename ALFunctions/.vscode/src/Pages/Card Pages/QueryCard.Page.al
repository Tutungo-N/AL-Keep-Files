page 50131 "Query Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(RunMyQuery)
            {

                trigger OnAction()
                var
                    SweetItemsQuery: Query Items;

                begin

                    if SweetItemsQuery.Open() then begin
                        while SweetItemsQuery.Read() do begin
                            //do some stuff here
                        end;
                        SweetItemsQuery.Close();
                    end;



                end;
            }
        }
    }


}