//Codeunit KNH Username List (ID 50606).
//Add(T)	                                    Adds a value to the end of the List.
//AddRange(T [, T,...])                         Adds the elements of the specified collection to the end of the list.
//AddRange(List of [T])                         Adds the elements of the specified collection to the end of the list.
//Contains(T)	                                Determines whether an element is in the List.
//Count()	                                    Gets the number of elements contained in the List.
//Get(Integer, var T)	                        Gets the element at the specified index.
//Get(Integer)                                  Gets the element at the specified index. This method will raise an error if the index is outside the valid range.
//GetRange(Integer, Integer)                    Get a shallow copy of a range of elements in the source.
//GetRange(Integer, Integer, var List of [T])	Get a shallow copy of a range of elements in the source.
//IndexOf(T)                                    Searches for the specified value and returns the one-based index of the first occurrence within the entire List.
//Insert(Integer, T)                            Inserts an element into the List at the specified index.
//LastIndexOf(T)                                Searches for the specified value and returns the one-based index of the last occurrence within the entire List.
//Remove(T)                                     Removes the first occurrence of a specified value from the List.
//RemoveAt(Integer)                             Removes the element at the specified index of the List.
//RemoveRange(Integer, Integer)                 Removes a range of elements from the List.
//Reverse()                                     Reverses the order of the elements in the entire List.
//Set(Integer, T)	                            Sets the element at the specified index.
//Set(Integer, T, var T)                        Sets the element at the specified index.

namespace KNHGenDev;
codeunit 50606 "KNH List"
{
    var
        Names: List of [Text];

    trigger OnRun()
    begin
        //List
        Names.Insert(1, 'James');
        Names.Insert(2, 'John');
        Names.Insert(3, 'Jack');
        Names.Insert(4, 'Jim');
        PrintCustomerNames(Names); //local procedure foreach loop
        NumberCount(); //local procedure for loop
        NumberCount2(0); //local procedure while loop
    end;

    //PrintCustomerNames from list
    //<param name="CustomerNames">List of [Text].</param>
    local procedure PrintCustomerNames(CustomerNames: List of [Text]);
    var
        CustomerName: Text;
    begin
        foreach CustomerName in CustomerNames do
            Message('Foreach loop - Customer Name = ' + CustomerName);
        CustomerNames.Set(2, 'Thomas');
        Message('CustomerName = %1', CustomerNames.Get(2));
    end;

    //NumberCount
    //<returns>Return value of type Integer</returns>
    local procedure NumberCount()
    var
        Total: array[10] of Decimal;
        I: Integer;
    begin
        for I := 1 to 10 do
            Total[I] := I * I;
        Message('Value of cell 5 in list array = ' + Format(Total[5])) //25
    end;

    //NumberCount2
    //<returns>Return value of type Integer</returns>
    local procedure NumberCount2(Counter: Integer)
    begin
        while Counter < 1000 do begin
            Counter := Counter + 1;
            Message('While loop - ' + Format(Counter));
            if Counter = 5 then
                break;
        end;
    end;
}
