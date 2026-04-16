/// <summary>
/// Send email with attachment. Attachment is created from a temp blob, converted to base 64 string and added to email message. Email message is then sent using the Email codeunit. The parameters for the email (recipient, subject, body, attachment name, content type) are hardcoded in this example, but can be easily modified to be passed in as parameters or read from a table.
///</summary>

namespace KNHGenDev;
using System.Email;
using System.Text;
using System.Utilities;

codeunit 50620 "KNH Send Email"
{
    trigger OnRun()
    var
        Base64Convert: Codeunit "Base64 Convert";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        MyInStream: InStream;
        MyOutStream: OutStream;
        AttachmentBase64: Text;
        Body: Text;
        Recipient: Text;
        Subject: Text;
        AttachmentName: Text[250];
        ContentType: Text[250];
    begin
        Recipient := 'kn_how@hotmail.com';
        Subject := 'Test Email';
        Body := 'This email has been sent from Business Central.';
        AttachmentName := 'C:\Temp\Prices.txt';
        ContentType := 'TXT';
        TempBlob.CreateOutStream(MyOutStream);
        MyOutStream.Write('xxxyyyzzz');
        TempBlob.CreateInStream(MyInStream);
        AttachmentBase64 := Base64Convert.ToBase64(MyInStream);
        EmailMessage.Create(Recipient, Subject, Body);
        EmailMessage.AddAttachment(AttachmentName, ContentType, AttachmentBase64);
        Email.Send(EmailMessage, "Email Scenario"::Default);
    end;
}
