
{                                                                              }
{ IB_SESSION511                                                                }
{                                                                              }

{***************************************************************}
{                                                               }
{          IB Objects Components and Resources Library          }
{                                                               }
{          Copyright (C) 1996-2004 Jason Wharton                }
{          and Computer Programming Solutions, Mesa, AZ         }
{                                                               }
{  This source code unit is released under the terms of the     }
{  CPS Trustware License.                                       }
{  It may be distributed or deployed as source code or in       }
{  compiled form only in compliance with the terms and          }
{  conditions of the CPS Trustware License which may be         )
{  examined at http://www.ibobjects.com/ibo_trustware.html      )
{                                                               }
{***************************************************************}

{******************************************************************************}
{  CONTRIBUTED MODIFICATIONS                                                   }
{  Additions or modifications listed below using format:                       }
{                                                                              }
{  Joe Citizen <joe@joecitizen.com>                                            }
{  mm/dd/yyyy                                                                  }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                 }
{            Copyright (C) 2001 Joe Citizen                                    }
{                                                                              }
{------------------------------------------------------------------------------}
{  Place your credits and information in the top of the section                }
{  below with any other descriptions or explanations desired.                  }
{------------------------------------------------------------------------------}
{                                                                              }
{                                                                              }
{******************************************************************************}

{$INCLUDE IB_Directives.inc}

{: This unit hooks in the necessary code to make sure that the app will use
the GDS511.DLL client library that does not contain the bug with events that
causes problems.
<br><br>
In order to make sure this will work, put this unit in the uses clause of the
project at the very first entry so that it's initialization will for sure be
prior to the initialization of the IB_Components unit.
<br><br>
I am doing this so that I can have my service applications using TCP/IP even
though they are running on the local machine. This causes the bugs in the
IB5.6 client library to bit you when you stop the service and it attempts to
disconnect from the server. By renaming the GDS32.DLL of the IB5.1 client to
GDS511.DLL and then including this unit my service apps exclusively use the
IB5.1 client DLL while all other apps will continue to use the normal client.
<br><br>
This capability could also come in very handy for applications that may need to
connect to different servers from the same machine. This allows each application
explicitly tell which file is used as the client DLL.
<br><br>
Of course, you also need to make sure you have copied the GDS32.DLL from the
InterBase 5.1 client as GDS511.DLL and put it in the WinNT\System32
(or equivalent) directory so that it will work.}
unit
  IB_Session511;

interface

uses
  IB_Constants;

implementation

initialization
// Replace the normal value with the alternate client DLL value.
  IB_Constants.IB_GDS32 := 'FBEmbedded.DLL';

end.


