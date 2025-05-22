namespace KNHGenDev;

codeunit 50603 "KNH Selection"
{
    trigger OnRun()
    var
        A: Integer;
        I: Integer;
        J: Integer;
        WhoAmI: Text;
    begin
        //Case selection
        WhoAmI := 'Mark';
        for A := 1 to 5 do begin
            if A = 3 then
                WhoAmI := 'Keith';
            case WhoAmI of
                'Keith':
                    begin
                        continue;
                        I := 10;
                        J := 20;
                        Message('Keith your score is ' + Format(I * J));
                    end;
                'Mark':
                    begin
                        I := 5;
                        J := 4;
                        Message('Mark ' + Format(A) + ' your score is ' + Format(I * J));
                    end;
                'Paul':
                    begin
                        I := 30;
                        J := 50;
                        Message('Paul your score is ' + Format(I * J));
                    end;
                else
                    Message('Case has failed, no name found.');
            end;
        end;
    end;
}
