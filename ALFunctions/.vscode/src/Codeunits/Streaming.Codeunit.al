codeunit 50140 "Stream Data"
{
    trigger OnRun()
    var
        InStr: InStream;
        FileName: Text;
        NumberofBytesToRead: Integer;
        TextRead: Text;

        // var for writing bytes to a stream object
        OuStr: OutStream;
        MyCust: Record Customer;
    // Ensure the "Picture" field is a Blob field in the Customer table
    begin
        if (File.UploadIntoStream('Open File', '', 'All Files (*.*)|*.*', FileName, InStr)) then begin
            while not InStr.EOS() do begin
                NumberofBytesToRead := InStr.ReadText(TextRead, 100);
                Message('%1\Size: %2', TextRead, NumberofBytesToRead);
            end;
        end;

        // Writing bytes to a stream object
        if (MyCust.FindFirst()) then begin
            MyCust."Picture12".CreateOutStream(OuStr);
            OuStr.WriteText('<html>');
            OuStr.WriteText('<body>');
            OuStr.WriteText('<h1>I love AL Language!</h1>');
            OuStr.WriteText('</body>');
            OuStr.WriteText('</html>');
        end;


    end;

    // Using the Picture field (data type MediaSet) of the Customer table to store images through the streaming functions.

    local procedure ChangeCustPicture(Cust: Record Customer)
    var
        CustInStream: InStream;
        ImageFilter: Text;
    begin
        ImageFilter := 'Image Files (*.bmp;*.jpg;*.gif)|*.bmp;*.jpg;*.gif';

        if not UploadIntoStream(ImageFilter, CustInStream) then
            exit;
        Cust.Image.ImportStream(CustInStream, 'Customer Picture');
    end;

    // Donwloading all images in a certain MediaSet. The user will get a prompt for each image to download.
    local procedure DownloadCustPicture(Custo: Record Customer)
    var
        TempBlob: Codeunit "Temp Blob";
        CustoOuStream: OutStream;
        CustoInStream: InStream;
        ImageFilter, FileName : Text;
    begin
        TempBlob.CreateOutStream(CustoOuStream);
        Custo.Image.ExportStream(CustoOuStream);
        TempBlob.CreateInStream(CustoInStream);

        ImageFilter := 'Image Files (*.bmp;*.jpg;*.gif)|*.bmp;*.jpg;*.gif';
        FileName := 'Customer Picture';

        if not DownloadFromStream(CustoInStream, 'Download Customer Picture', '', ImageFilter, FileName) then
            exit;

    end;
}