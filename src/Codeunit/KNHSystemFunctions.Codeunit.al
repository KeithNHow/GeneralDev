/// <summary>
/// Codeunit "KNH System Functions" (ID 50609).
/// </summary>
codeunit 50609 "KNH System Functions"
{
    trigger OnRun()
    var
        selection: Integer;
        functionTxt: Label 'DateFromDateTime,TimeFromDateTime,DWYtoDate,DateToDMY,FormatDateInteger,FormatDateText,FormatDateInteger2,FormatDateText2,Contains,CopyString,IncString,InsertString,LowerUpperCase,PadRight,Replace,ReplaceText,Remove,Split,StrPosition,StrLength,StringSubstNo,Substring,Trim,TrimEnd,CalculateDate,CreateGUID,MyError,MyLastError,ShowMessage,ThisModule,FindCustomer,EncryptText,RandomizeNumber,RoundingNumber,Evaluation';
        selectionTxt: Label 'Choose one of the following options:';
        options: Text;
    begin
        options := functionTxt;
        selection := Dialog.StrMenu(options, 1, selectionTxt);
        case selection of
            //Date Operations
            1:
                DatefromDateTime();
            2:
                TimefromDateTime();
            3:
                DWYtoDate();
            4:
                DateToDMY();
            5:
                FormatDateInteger();
            6:
                FormatDateText();
            7:
                FormatDateInteger2();
            8:
                FormatDateText2();

            //String Operations
            9:
                Contains();
            10:
                CopyString();
            11:
                IncString();
            12:
                InsertString();
            13:
                LowerUpperCase();
            14:
                PadRight();
            15:
                Replace();
            16:
                ReplaceText();
            17:
                Remove();
            18:
                Split();
            19:
                StrPosition();
            20:
                StrLength();
            21:
                StringSubStNo();
            22:
                SubString();
            23:
                Trim();
            24:
                TrimEnd();

            //Sundry Operations    
            25:
                CalculateDate();
            26:
                CreateGUID();
            27:
                MyError();
            28:
                MyLastError();
            29:
                ShowMessage();
            30:
                ThisModule();
            31:
                FindCustomer();
            32:
                EncryptText();
            33:
                RandomizeNumber();
            34:
                RoundingNumber();
            35:
                Evaluation();
            else
                exit;
        end;
    end;

    #region Dates

    local procedure DatefromDateTime()
    var
        myDate: Date;
        myDateTime: DateTime;
    begin
        myDateTime := CurrentDateTime;
        myDate := System.DT2Date(myDateTime);
        Message(Format(myDate));
        //25/06/24
    end;

    local procedure TimefromDateTime()
    var
        myDateTime: DateTime;
        myTime: Time;
    begin
        myDateTime := CurrentDateTime;
        myTime := System.DT2Time(myDateTime);
        Message(Format(myTime));
        //23:35:49
    end;

    local procedure DWYtoDate()
    var
        myDate: Date;
        day: Integer;
        week: Integer;
        year: Integer;
    begin
        day := 5; //permitted range 1 -7
        week := 23;
        year := 2023;
        myDate := System.DWY2Date(day, week, year);
        Message(Format(myDate));
        //25/06/24
    end;

    local procedure DateToDMY()
    var
        inputDate: Date;
        day: Integer;
        month: Integer;
        year: Integer;
        myTxt: Label 'Today is day %1 of month %2 of the year %3.', Comment = '%1 = Day ; %2 = Week ; %3 = Year';
    begin
        inputDate := Today;
        day := Date2DMY(inputDate, 1);
        month := Date2DMY(inputDate, 2);
        year := Date2DMY(inputDate, 3);
        Message(myTxt, day, month, year);
        //23:21:28
    end;

    local procedure FormatDateInteger()
    var
        myDate: Date;
        myTime: Time;
    begin
        myDate := 20220415D;
        myTime := 110540T;
        Message(Format(myDate, 0, 9));
        //2022-04-15
        Message(Format(myDate, 0, 9) + 'T' + Format(myTime, 0, 9));
        //2022-04-15T11:05:40
    end;

    local procedure FormatDateText()
    var
        myDate: Date;
    begin
        myDate := WorkDate();
        Message(Format(myDate, 0, '<WeekDay Text> <Month Text> <Year4>'));
        //Monday April 2024
    end;

    local procedure FormatDateInteger2()
    var
        myDate: Date;
    begin
        myDate := WorkDate();
        Message(Format(myDate, 0, '<Day>/<Month>/<Year4>'));
        //8/4/2024
    end;

    local procedure FormatDateText2()
    var
        myDate: Date;
    begin
        myDate := WorkDate();
        Message(Format(myDate, 0, 4));
        //08 April 2024
    end;

    #endregion

    #region Strings

    local procedure Contains()
    var
        Ok: Boolean;
        MyText: Text[100];
    begin
        MyText := 'Hello there World';
        Ok := MyText.Contains('there');
        Message(Format(Ok));
        //true
    end;

    local procedure CopyString()
    var
        newString: Text;
    begin
        newString := CopyStr('I am a very old man', 8, 4);
        Message(newString);
        //very
    end;

    local procedure IncString()
    var
        MyString: Text;
    begin
        MyString := 'AB000100X';
        MyString := IncStr(MyString);
        Message(MyString);
        //AB000101X
    end;

    local procedure InsertString()
    var
        Pos: Integer;
        mySubString: Text;
        newString: Text;
        oldString: Text;
    begin
        oldString := 'Oh God';
        mySubString := 'My ';
        Pos := 4;
        newString := Text.InsStr(oldString, mySubString, Pos);
        Message(newString);
        //Oh My God
    end;

    local procedure LowerUpperCase();
    var
        Text1Msg: Label 'Outstanding Order Status';
        Text2Msg: Label 'The test string before UpperCase is called:\\%1', Comment = '%1 = Lower';
        Text3Msg: Label 'The string after UpperCase is called:\\%1', Comment = '%2 = Upper';
        Lower: Text;
        Upper: Text;
    begin
        Lower := Text1Msg;
        Message(Text2Msg, Lower);
        //Outstanding Order Status
        Upper := UpperCase(Lower);
        Message(Text3Msg, Upper);
        //OUTSTANDING ORDER STATUS
    end;

    local procedure PadRight()
    var
        myText: Text;
        Result: Text;
    begin
        Result := myText.PadRight(10, 'X');
        Message(Result);
        //XXXXXXXXXX
    end;

    local procedure Replace()
    var
        myText: Text;
        newText: Text;
        oldText: Text;
    begin
        oldText := 'Merry Christmas';
        newText := 'Happy New Year';
        myText := myText.Replace(oldText, newText);
        Message(newText);
        //Happy New Year
    end;

    local procedure ReplaceText()
    var
        Description: Text[100];
    begin
        Description := 'my & my < my > my "     ';
        Description := CopyStr(Description.Replace('&', 'X'), 1, 100);
        Description := CopyStr(Description.Replace('<', 'X'), 1, 100);
        Description := CopyStr(Description.Replace('>', 'X'), 1, 100);
        Description := CopyStr(Description.Replace('"', 'X'), 1, 100);
        Description := CopyStr(Description.Replace(' ', ''), 1, 100);
        Message(Description);
        //Result = 'myXmyXmyXmyX';
    end;

    local procedure Remove()
    var
        myText: Text;
        Result: Text;
    begin
        myText := 'Hello there World';
        Result := myText.Remove(7, 5);
        Message(Result);
        //Hello World
    end;

    local procedure Split()
    var
        ListText: List of [Text];
        MyText: Text[100];
    begin
        MyText := 'Hello, there, World';
        ListText := MyText.Split(',');
        Message(ListText.Get(3));
        //World
    end;

    local procedure StrLength()
    var
        Len: Integer;
        myText: Text;
    begin
        myText := 'I am a very old man.';
        Len := StrLen(myText);
        Message(Format(Len));
        //20
    end;

    local procedure StrPosition()
    var
        Pos: Integer;
        myText: Text;
    begin
        myText := 'I am a very old man.';
        Pos := StrPos(myText, 'v');
        Message(Format(Pos));
        //8
    end;

    local procedure SubString()
    var
        mySubstring: Text[50];
        myText: Text[50];
    begin
        myText := 'Here we go again. Another day in paradis.';
        mySubstring := myText.Substring(12, 5);
        Message(mySubstring);
        //again
    end;

    local procedure StringSubStNo()
    var
        Balance: Decimal;
        AccountNo: Integer;
        AfterStrSubstNoMsg: Label 'The string after StrSubstNo is called:\\%1', Comment = '%1 = Text2Txt';
        BeforeStrSubstNoMsg: Label 'The test string before StrSubstNo is called:\\%1', Comment = '%1 = String';
        Text0Txt: Label 'The balance of account %1 is $%2', Comment = '%1 = AccountNo, %2 = Balance, %3 = String';
        Str: Text[1024];
    begin
        Str := Text0Txt;
        AccountNo := 3452;
        Balance := 2345 + 5462;
        Message(BeforeStrSubstNoMsg, Str);
        Str := StrSubstNo(Str, AccountNo, Balance);
        Message(AfterStrSubstNoMsg, Str);
    end;

    local procedure Trim()
    var
        myExtract: Text;
        myText: Text[100];
    begin
        myText := '    Here we go again.              Another difficult day.    ';
        myExtract := myText.Trim();
        Message(myExtract);
        //Here we go again. Another difficult day.
    end;

    local procedure TrimEnd()
    var
        MyText: Text[100];
        Result: Text[100];
    begin
        MyText := 'Hello there World only me.';
        Result := CopyStr(MyText.TrimEnd('only me.'), 1, 100);
        Message(Result);
        //Hello there World
    end;

    #endregion

    #region Other

    local procedure CalculateDate()
    var
        MyDate: Date;
    begin
        MyDate := CalcDate('<1M+CM+1D>', Today());
        Message(Format(MyDate));
        //1st June 2024
    end;

    local procedure CreateGUID()
    var
        myGuid: Guid;
    begin
        myGuid := System.CreateGuid();
        Message(Format(myGuid));
        //
    end;

    local procedure ShowMessage()
    var
        ShowTxt: Label 'Code is running on a client.';
    begin
        if GuiAllowed then
            Message(ShowTxt);
        //Code is running on a client.
    end;

    local procedure MyError()
    begin
        Error('My codeunit does not work.');
    end;

    local procedure MyLastError()
    begin
        ClearLastError();
        Message('The last error was error code: ' + GetLastErrorCode() + ' error text ' + GetLastErrorText());
    end;

    local procedure Evaluation()
    var
        MyDate: Date;
        myNumber: Integer;
    begin
        Evaluate(myNumber, '123456'); //Convert string to number
        Message('This is the life - ' + Format(myNumber)); //Convert back to string
        //123456
        Evaluate(MyDate, '020622'); //Convertstring to date
        Message('The date is - ' + Format(MyDate)); //convert back to string
        //02/06/22
    end;

    local procedure ThisModule()
    var
        MyModule: ModuleInfo;
    begin
        Message(Format(MyModule.Name()));
    end;

    local procedure FindCustomer()
    var
        Customer: Record Customer;
        FirstRecord: Code[20];
        LastRecord: Code[20];
        Counter: Integer;
        FindCustomerMsg: Label 'First customer record %1, Last customer record %2', Comment = '%1 = FirstRecord, %2 = Last Record';
    begin
        Counter := 0;
        if Customer.Find('+') then
            repeat
                if Counter = 0 then begin
                    FirstRecord := Customer."No.";
                    Counter := 1;
                end;
            until Customer.Next(-1) = 0;
        LastRecord := Customer."No.";
        Message(FindCustomerMsg, FirstRecord, LastRecord);
    end;

    local procedure RandomizeNumber()
    var
        Number: Integer;
    begin
        //RANDOMIZE - Generates a set of random numbers from which the RANDOM Function (Integer) will select a random number
        Number := 100;
        Randomize(Number);
        //RANDOM - Returns a pseudo-random number
        Number := Random(Number);
        Message(Format(Number));
    end;

    local procedure RoundingNumber()
    var
        myNumber: Decimal;
    begin
        myNumber := Round(50.3438, 0.01, '<');
        Message(Format(myNumber)); //Ans = 50.34
        myNumber := Round(50.3438, 0.01, '>');
        Message(Format(myNumber)); //Ans = 50.35
        myNumber := Round(50.3438, 0.01);
        Message(Format(myNumber)); //Ans = 50.34    
    end;

    local procedure EncryptText()
    var
        myText: Text;
    begin
        myText := 'ABC123';
        myText := Encrypt(myText);
        Message('Value: ' + myText);
        //Value: xxxxxx
    end;

    #endregion
}