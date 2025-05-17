codeunit 50154 "My JSON Doc"
{
    trigger OnRun()
    begin

    end;

    procedure GetUserInfo(MyUserNumber: Integer)
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ResponseString: Text;
        Jtoken: JsonToken;
        Jtoken1: JsonToken;
        JObject: JsonObject;

    begin
        if not Client.Get(StrSubstNo('https://jsonplaceholder.typicode.com/users/%1', MyUserNumber), ResponseMessage) then
            Error(ErrorInfo.Create('The call to the web service failed.'));

        if not ResponseMessage.IsSuccessStatusCode() then
            Error(ErrorInfo.Create('The web service returned an error message:\\' +
                'Status Code: ' + Format(ResponseMessage.HttpStatusCode()) +
                'Description: ' + ResponseMessage.ReasonPhrase()));

        ResponseMessage.Content.ReadAs(ResponseString);

        if not Jtoken.ReadFrom(ResponseString) then
            Error(ErrorInfo.Create('Invalid JSON document.'));

        if not Jtoken.IsObject() then
            Error(ErrorInfo.Create('Expected a JSON Object.'));

        JObject := Jtoken.AsObject();

        if not JObject.Get('name', Jtoken1) then
            Error(ErrorInfo.Create('Value for key name not found.'));

        if not Jtoken1.IsValue then
            Error(ErrorInfo.Create('Expected a JSON value.'));

        Message(Jtoken1.AsValue().AsText());

    end;


}