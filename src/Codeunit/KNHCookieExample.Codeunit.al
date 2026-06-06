namespace KNHGenDev;

codeunit 50680 KNHCookieExample
{
    procedure SendMessage()
    var
        Client: HttpClient;
        Cookie: Cookie;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        RequestID: Text;
        CookieName: Text;
    begin
        RequestID := CreateGuid();

        // New Cookie 
        Cookie.Name := 'HOW-IT-Services-ID';
        Cookie.Value := RequestID;

        Request.SetCookie(Cookie); // send a cookie with the request

        Request.SetCookie('How-IT-Services', 'IT-Services'); // Can set cookie directly
        Request.GetCookie('How-IT-Servi', Cookie); // And retrieve from the request again

        foreach CookieName in Request.GetCookieNames() do
            Request.GetCookie(CookieName, Cookie); // Do something with the cookie

        // HttpClient can now also use response cookies between requests
        // This can be very useful for session based cookies
        Client.UseResponseCookies(true);

        // Cookies can be read from the response.
        foreach CookieName in Response.GetCookieNames() do
            Response.GetCookie(CookieName, Cookie); // Do something with the cookie
    end;
}