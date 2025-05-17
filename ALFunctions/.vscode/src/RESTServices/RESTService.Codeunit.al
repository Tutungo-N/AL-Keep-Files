codeunit 50152 "My REST Services"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    // The following example combines all the different HTTP classes and functions to retrieve data from an external service. 
    // The external service returns a JSON document with user information. 
    procedure GetUserInformation(id: Integer)
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ResponseString: Text;

    begin
        if not Client.Get(StrSubstNo('https://my-json-server.typicode.com/typicode/demo/posts%1', id), ResponseMessage) then
            Error(ErrorInfo.Create('The call to the web service failed.'));

        if not ResponseMessage.IsSuccessStatusCode() then
            Error(ErrorInfo.Create('The web service returned an error message:\\' +
            'Status Code:' + Format(ResponseMessage.HttpStatusCode()) + 'Description: ' + ResponseMessage.ReasonPhrase()));

        ResponseMessage.Content.ReadAs(ResponseString);

    end;

    // The subsequent code example sends data and an image to an external service. 
    // This service can, for example, perform image processing. 
    // In this example, the first picture from a certain item is retrieved. 
    // The Picture field in Items is a MediaSet field; therefore, it can contain multiple images. 
    // Those images are stored in the Tenant Media table.

    procedure ChangePictureToBlackAndWhite(Item: Record Item)
    var
        Client: HttpClient;
        TenantMedia: Record "Tenant Media";
        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        Stream: InStream;
        Url: Text;
    begin
        if not (Item.Picture.Count() > 0) then
            exit;

        TenantMedia.CalcFields(Content);

        if not TenantMedia.Content.HasValue() then
            exit;

        TenantMedia.Content.CreateInStream(Stream);

        Content.WriteFrom(Stream);
        Url := 'https://mywebsite.com/ImageConverter';
        if not client.Post(Url, Content, ResponseMessage) then
            exit;

        if not ResponseMessage.IsSuccessStatusCode() then
            exit;

        ResponseMessage.Content().ReadAs(Stream);
        Clear(Item.Picture);
        Item.Picture.ImportStream(Stream, 'New Image');
        Item.Modify(true);

    end;
}