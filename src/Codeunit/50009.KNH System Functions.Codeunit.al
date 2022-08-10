/// <summary>
/// Codeunit KNH System Functions (ID 50009).
/// </summary>
codeunit 50009 "KNH System Functions"
{
    trigger OnRun()
    var
        selection: Integer;
        options: Text[50];
        functionTxt: Label 'DateFromDateTime,TimeFromDateTime,DWYtoDate,EncryptText,Substring,Trim,Replace,PadRight,InsertString,RandomizeNumber,RoundingNumber,Evaluation,FormatDateInteger,FormatDateText,FormatDateText2,CopyString,ShowMessage,StrPosition,StrLength,CalculateDate,CreateGUID,DateToDMY,MyError,MyLastError';
        selectionTxt: Label 'Choose one of the following options:';
    begin
        Options := functionTxt;
        selection := Dialog.StrMenu(Options, 1, selectionTxt);
        case selection of
            1:
                DatefromDateTime();
            2:
                TimefromDateTime();
            3:
                DWYtoDate();
            4:
                EncryptText();
            5:
                Substring();
            6:
                Trim();
            7:
                Replace();
            8:
                PadRight();
            9:
                InsertString();
            10:
                RoundingNumber();
            11:
                Evaluation();
            12:
                FormatDateInteger();
            13:
                FormatDateText();
            14:
                FormatDateText2();
            15:
                CopyString();
            16:
                ShowMessage();
            17:
                StrPosition();
            18:
                StrLength();
            19:
                CalculateDate();
            20:
                CreateGUID();
            21:
                DateToDMY();
            22:
                MyError();
            23:
                MyLastError();
            else
                exit;
        end;
    end;

    #region
    local procedure DatefromDateTime()
    var
        myDate: Date;
        myDateTime: DateTime;
    begin
        myDate := System.DT2Date(myDateTime);
        Message(Format(myDate));
    end;

    local procedure TimefromDateTime()
    var
        myTime: Time;
        myDateTime: DateTime;
    begin
        myTime := System.DT2Time(myDateTime);
        Message(Format(myTime));
    end;

    local procedure DWYtoDate()
    var
        myDate: Date;
        day: Integer;
        week: Integer;
        year: Integer;
    begin
        myDate := System.DWY2Date(day, week, year);
        Message(Format(myDate));
    end;

    local procedure EncryptText()
    var
        myText: Text;
    begin
        myText := 'ABC123';
        myText := Encrypt(myText);
        Message('Value: ' + myText);
    end;

    #endregion

    #region
    local procedure SubString()
    var
        mySubstring: Text[50];
        myText: Text[50];
    begin
        myText := 'Here we go again. Another difficult day.';
        mySubstring := myText.Substring(12, 5);
        Message(mySubstring);
    end;

    local procedure Trim()
    var
        myExtract: Text[50];
        myText: Text[50];
    begin
        myText := '    Here we go again. Another difficult day.    ';
        myExtract := myText.Trim();
        Message(myExtract);
    end;

    local procedure Replace()
    var
        oldText: Text;
        newText: Text;
        myText: Text;
    begin
        oldText := 'Merry Christmas';
        newText := 'Happy New Year';
        myText := myText.Replace(oldText, newText);
        Message(newText);
    end;

    local procedure PadRight()
    var
        Result: Text;
        myText: Text;
    begin
        Result := myText.PadRight(10, 'X');
        Message(Result);
    end;

    local procedure InsertString()
    var
        oldString: Text;
        subString: Text;
        newString: Text;
        myText: Text;
        Pos: Integer;
    begin
        oldString := 'Oh God';
        subString := 'My';
        Pos := 4;
        newString := Text.InsStr(oldString, SubString, Pos);
        Message(newString);
    end;

    #endregion

    #region

    local procedure RandomizeNumber()
    var
        Number: Integer;
    begin
        //RANDOMIZE - Generates a set of random numbers from which the RANDOM Function (Integer) will select a random number
        Number := 100;
        Randomize(Number);
        //RANDOM - Returns a pseudo-random number
        Number := RANDOM(Number);
        MESSAGE(FORMAT(Number));
    end;

    local procedure RoundingNumber()
    var
        myNumber: Decimal;
    begin
        myNumber := ROUND(50.3468, 0.01, '<');
        MESSAGE(FORMAT(myNumber)); //Ans = 50.34
        myNumber := ROUND(50.3468, 0.01, '>');
        MESSAGE(FORMAT(myNumber)); //Ans = 50.35
        myNumber := ROUND(50.3468, 0.01);
        MESSAGE(FORMAT(myNumber)); //Ans = 50.34    
    end;

    local procedure Evaluation()
    var
        myNumber: Integer;
        MyDate: Date;
    begin
        Evaluate(myNumber, '123456'); //Convert string to number
        Message('This is the life - ' + Format(myNumber)); //Convert back to string
        Evaluate(MyDate, '020622'); //Convertstring to date
        Message('The date is - ' + Format(MyDate)); //convert back to string
    end;

    local procedure FormatDateInteger()
    var
        myDate: Date;
        myTime: Time;
    begin
        myDate := 20220415D;
        Message(Format(myDate, 0, 9) + 'T' + FORMAT(myTime, 0, 9))
    end;

    local procedure FormatDateText()
    var
        myDate: Date;
        myTime: Time;
    begin
        myDate := 20220415D;
        Message(Format(myDate, 0, '<Month Text> <Day> <Year, 4>'));
        //April 15 2022
    end;

    local procedure FormatDateText2()
    var
        myDate: Date;
        myTime: Time;
    begin
        myDate := 20220415D;
        Message(Format(myDate, 0, '<Year, 4> <Month> <Day Text>, <Day>'));
        //2022 04 Friday 15
    end;

    #endregion

    #region

    local procedure CopyString()
    var
        newString: Text;
    begin
        newString := COPYSTR('I am a very old man', 8, 4);
        Message(newString); //Copies characters 'very'
    end;

    local procedure ShowMessage()
    var
        ShowTxt: Label 'Code is running on a client.';
    begin
        if GuiAllowed then
            Message(ShowTxt);
    end;

    local procedure StrPosition()
    var
        Pos: Integer;
        myText: Text;
    begin
        myText := 'I am a very old man.';
        Pos := StrPos(MyText, 'v');
        Message(Format(Pos)); //Searches str for matching character.
    end;

    local procedure StrLength()
    var
        Len: Integer;
        myText: Text;
    begin
        myText := 'I am a very old man.';
        Len := StrLen(myText);
        Message(Format(Len)); //Len = 20
    end;

    #endregion

    #region

    local procedure CalculateDate()
    var
        MyDate: Date;
    begin
        MyDate := CalcDate('1M+CM+1D', Today()); //first of curr mth
        Message(Format(MyDate));
    end;

    local procedure CreateGUID()
    var
        myGuid: Guid;
    begin
        myGuid := System.CreateGuid();
        Message(Format(myGuid));
    end;

    local procedure DateToDMY()
    var
        inputDate: Date;
        day: Integer;
        month: Integer;
        year: Integer;
        myText: Label 'Today is day %1 of month %2 of the year %3.';
    begin
        inputDate := Today;
        day := Date2DMY(inputDate, 1);
        month := Date2DMY(inputDate, 2);
        year := Date2DMY(inputDate, 3);
        Message(myText, Day, Month, Year);
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

    #endregion
}
