codeunit 50141 "Image Management"
{
    trigger OnRun()
    begin

    end;

    var
    // myInt: Integer;

    procedure ImportItemImage(MyItem: Record Item)
    var
        ImgInStream: InStream;
        FromFileName: Text;
        OverrideImgQuest: Label 'The existing picture will be replaced. Continue?';
    begin
        if MyItem.Picture.Count() > 0 then
            if not Confirm(OverrideImgQuest) then
                exit;
        if File.UploadIntoStream('Import', '', 'All Files(*.*)|*.*)', FromFileName, ImgInStream) then begin
            Clear(MyItem.Picture);
            MyItem.Picture.ImportStream(ImgInStream, FromFileName);
            MyItem.Modify(true);
        end;

    end;
}