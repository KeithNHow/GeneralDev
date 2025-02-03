//PageExtension CustomerListExt (ID 50602) extends Record Customer List.

namespace KNHGenDev;
using System.Text;
using System.Email;
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
    //ContentFile: File;
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
        //EmailMessage.AddAttachment(AttachmentName, ContentType, MyInstream);
        Email.Send(EmailMessage, "Email Scenario"::Default);
    end;
}
