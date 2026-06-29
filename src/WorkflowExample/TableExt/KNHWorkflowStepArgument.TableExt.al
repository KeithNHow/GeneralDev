///<Summary>
///Table extension adds a new field to hold new event responses.
///</Summary>
namespace KNHGenDev;
using System.Automation;

tableextension 50660 "KNH Workflow Step Argument" extends "Workflow Step Argument"
{
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(50660; "My New Response Option"; Text[100])
        {
        }
    }
}