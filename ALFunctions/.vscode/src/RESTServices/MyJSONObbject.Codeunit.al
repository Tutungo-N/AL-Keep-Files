codeunit 50155 "Create Object JSON"
{
    trigger OnRun()
    begin

    end;

    procedure CreatePost()
    var
        Client: HttpClient;
        Content: HttpContent;
        ResponseMessage: HttpResponseMessage;
        ResponseString: Text;
        JObject: JsonObject;
        JsonText: Text;

    begin
        JObject.Add('userId', 1);
        JObject.Add('id', 1005);
        JObject.Add('title', 'My Dynamics BC Post Test.');
        JObject.Add('body', 'This is my Dynamics BC Post Test.');
        JObject.WriteTo(JsonText);

        Content.WriteFrom(JsonText);
        if not Client.Post('https://jsonplaceholder.typicode.com/posts', Content, ResponseMessage) then
            Error(ErrorInfo.Create('The call to the web service failed.'));

        if not ResponseMessage.IsSuccessStatusCode() then
            Error(ErrorInfo.Create('The web service returned an error message:\\' +
            'Status Code: ' + Format(ResponseMessage.HttpStatusCode()) +
            'Description: ' + ResponseMessage.ReasonPhrase()));

        ResponseMessage.Content().ReadAs(ResponseString);

        Message(ResponseString);

    end;
}