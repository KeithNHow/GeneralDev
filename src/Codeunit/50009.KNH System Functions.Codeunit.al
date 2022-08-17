/// <summary>
/// Codeunit KNH System Functions (ID 50009).
/// </summary>
codeunit 50009 "KNH System Functions"
{
    trigger OnRun()
    var
        selection: Integer;
        options: Text;
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
                RandomizeNumber();
            11:
                RoundingNumber();
            12:
                Evaluation();
            13:
                FormatDateInteger();
            14:
                FormatDateText();
            15:
                FormatDateText2();
            16:
                CopyString();
            17:
                ShowMessage();
            18:
                StrPosition();
            19:
                StrLength();
            20:
                CalculateDate();
            21:
                CreateGUID();
            22:
                DateToDMY();
            23:
                MyError();
            24:
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
        myDateTime := CurrentDateTime;
        myDate := System.DT2Date(myDateTime);
        Message(Format(myDate));
    end;

    local procedure TimefromDateTime()
    var
        myTime: Time;
        myDateTime: DateTime;
    begin
        myDateTime := CurrentDateTime;
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
        day := 12;
        week := 23;
        year := 2019;
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
        myExtract: Text;
        myText: Text[100];
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
        mySubString: Text;
        newString: Text;
        Pos: Integer;
    begin
        oldString := 'Oh God';
        mySubString := 'My';
        Pos := 4;
        newString := Text.InsStr(oldString, mySubString, Pos);
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
        Number := Random(Number);
        Message(Format(Number));
    end;

    local procedure RoundingNumber()
    var
        myNumber: Decimal;
    begin
        myNumber := Round(50.3468, 0.01, '<');
        Message(Format(myNumber)); //Ans = 50.34
        myNumber := ROUND(50.3468, 0.01, '>');
        Message(Format(myNumber)); //Ans = 50.35
        myNumber := ROUND(50.3468, 0.01);
        Message(Format(myNumber)); //Ans = 50.34    
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

    //Format(Value: Any [, Length: Integer] [, FormatNumber: Integer])
    //FormatNumber --> 0,1,2,3,4,9
    local procedure FormatDateInteger()
    var
        myDate: Date;
        myTime: Time;
    begin
        myDate := 20220415D;
        myTime := 110540T;
        Message(Format(myDate, 0, 9));
        //2022-04-15
        Message(Format(myDate, 0, 9) + 'T' + FORMAT(myTime, 0, 9));
        //2022-04-15T11:05:40
    end;

    //Format(Value: Any, Length: Integer, FormatString: Text)
    //if Length = 0 then the entire value is returned (default).
    //if Length > 0 then the returned string will be exactly Length characters.
    //If Length < 0 then the returned string will not have leading or trailing spaces.
    local procedure FormatDateText()
    var
        myDate: Date;

    begin
        myDate := 20220415D;
        Message(Format(myDate, 0, '<Month Text> <Day> <Year, 4>'));
        //April 15 2022
    end;

    local procedure FormatDateText2()
    var
        myDate: Date;
    begin
        myDate := 20220415D;
        Message(Format(myDate, 0, '<Year, 4> <Month> <Weekday Text> <Day>'));
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
        MyDate := CalcDate('<1M+CM+1D>', Today()); //first of curr mth
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
        myTxt: Label 'Today is day %1 of month %2 of the year %3.', Comment = '%1 = Day ; %2 = Week ; %3 = Year';
    begin
        inputDate := Today;
        day := Date2DMY(inputDate, 1);
        month := Date2DMY(inputDate, 2);
        year := Date2DMY(inputDate, 3);
        Message(myTxt, Day, Month, Year);
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
