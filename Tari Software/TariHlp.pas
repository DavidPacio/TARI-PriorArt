{ Turbo Pascal Unit:  Lok_onHlp.pas                  }
{                                                 }
{ This is an interface unit containing integer    }
{ mappings of Topic IDs (names of Help            }
{ Topics) which are located in TariHlp.rtf     }
{                                                 }
{ This file is re-written by RoboHELP           }
{ whenever TariHlp.rtf is saved.   	          }
{                                                 }
{ However, the numeric values stored in           }
{ TariHlp.hh are the 'master values' and if you    }
{ modify the value in TariHlp.hh and then          }
{ save the TariHlp.rtf again, this file will }
{ reflect the changed values.                     }
{                                                 }

Unit TariHlp;
  Interface
  Const
	Introduction = 2;
	An_Overview = 3;
	User_Name = 4;
	User_Password = 5;
	INTRODUCTORY_NOTES = 1001;
	Security = 1002;
	Main_Window = 1003;
	Departments_Revenue_Groups = 1004;
	FILE_CREATION = 1005;
	TARGETING_DATA_ENTRY = 1006;
	Establishing_Dates = 1007;
	Past_Profit_and_Loss_Summary = 1008;
	Past_Detailed_Expenses = 1009;
	Identifying_the_Key_Activity = 1010;
	Pinpointing_Activity_and_Contribution = 1011;
	Using_Work_back = 1012;
	Using_Invoices = 1013;
	Entering_another_Past_Period = 1014;
	Targeting_What_If_Scenarios = 1015;
	Target_Profit_and_Loss_Summary = 1016;
	Targeting_Expenses_Detail = 1017;
	Targeting_Activity_and_Contribution = 1018;
	Target_Detail_Activity_and_Contribution_Drivers = 1019;
	How_the_Drivers_Calculate_Gross_Profit = 1020;
	TARGETING_REPORTS = 1021;
	TRACKING_DATA_ENTRY = 1022;
	Grouping_Invoices = 1023;
	Invoice_Grouping = 1024;
	SALES_DETAILS = 1025;
	Invoice_Data_Entry = 1026;
	Other_Income = 1027;
	Tracking_Expense_Details = 1028;
	TRACKING_REPORTS = 1029;
	Contact_Details = 1030;

	Implementation
	end.
