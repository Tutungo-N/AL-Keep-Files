pageextension 50106 "Item Card Image Extension" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Functions)
        {
            action(ImportItemImage)
            {
                Caption = 'Import Item Image';
                ApplicationArea = All;
                Image = Import;
                ToolTip = 'Import Item Image';

                trigger OnAction()
                var
                    ImageManager: Codeunit "Image Management";
                begin
                    ImageManager.ImportItemImage(Rec);
                end;
            }
        }
    }


}