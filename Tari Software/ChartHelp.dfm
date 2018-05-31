object ChartHelpF: TChartHelpF
  Left = 501
  Top = 268
  Width = 614
  Height = 480
  HorzScrollBar.Visible = False
  BorderWidth = 3
  Caption = 'Detailed Targeting Help'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object RTFEdit1: TEPRichEdit
    Left = 0
    Top = 0
    Width = 600
    Height = 440
    Align = alClient
    BorderStyle = bsNone
    HideScrollBars = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    RichText = 
      '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset' +
      '0 Arial;}}'#13#10'{\stylesheet{ Normal;}{\s1 heading 1;}{\s2 heading 2' +
      ';}}'#13#10'\viewkind4\uc1\pard\keepn\s1\qc\lang3081\b\f0\fs32 Detailed' +
      ' Targeting'#13#10'\par \pard\fs20 '#13#10'\par \pard\keepn\s2 Steps'#13#10'\par \p' +
      'ard\b0 '#13#10'\par \pard\fi-360\li720\tx720 1.\tab Select Period View' +
      '. Click on one of the following:'#13#10'\par \pard\fi-360\li1440\tx144' +
      '0 a.\tab Daily'#13#10'\par \pard\fi-360\li1440 b.\tab Weekly'#13#10'\par c.\' +
      'tab 4 Weekly'#13#10'\par d.\tab 4/5 Weekly'#13#10'\par e.\tab Calendar Month' +
      'ly'#13#10'\par f.\tab Quarterly'#13#10'\par g.\tab Half Yearly'#13#10'\par \pard\f' +
      'i-360\li720\tx720 2.\tab Select a Key Driver to \b Change\b0  OR' +
      ' a Financial Target to \b View\b0  by clicking on the Maroon col' +
      'oured button near the title.'#13#10'\par \pard\fi-360\li1440\tx1440 a.' +
      '\tab Changes to a Key Drivers will alter the Financial Target bo' +
      'th in the period detail and in the whole period targets as shown' +
      ' in the lower right of the window.'#13#10'\par \pard\fi-360\li1440 b.\' +
      'tab Details of a Financial Target on a period basis can only be ' +
      'viewed, not changed directly.'#13#10'\par \pard\fi-360\li720\tx720 3.\' +
      'tab If Daily or Weekly period has been selected, use the Chart P' +
      'ages buttons to move between pages.'#13#10'\par \pard\fi-360\li720 4.\' +
      'tab If a Key Driver has been selected, see \b Mouse Methods of D' +
      'ata Manipulation\b0  below.'#13#10'\par 5.   If you wish to change a v' +
      'alue that exceeds the current range of the chart, you can adjust' +
      ' the value manually ane then click your \b Right Mouse \b0 butto' +
      'n on the chart to adjust the scalling.'#13#10'\par \pard '#13#10'\par \pard\' +
      'keepn\s2\b History and Undo\b0 '#13#10'\par \pard\fs24 '#13#10'\par \fs20 Hi' +
      'story of the last 20 changes is kept for each driver, commencing' +
      ' from when the driver was last selected. The "undo" button is ac' +
      'tivated after the first change and the most recent changed value' +
      ' restored on each click. The number of changes is also displayed' +
      ' on the button.'#13#10'\par \'#39'b7\tab\'#39'b7\tab\'#39'b7\tab '#13#10'\par \pard\keep' +
      'n\s2\b Mouse Methods of Data Manipulation'#13#10'\par \pard\b0 '#13#10'\par ' +
      'When the mouse is moved over the chart, the value at the cursor ' +
      'is displayed in a yellow box.'#13#10'\par '#13#10'\par Using the left mouse ' +
      'button only, the value for the period will be changed to value a' +
      't the mouse cursor when it is click over the period.'#13#10'\par '#13#10'\pa' +
      'r Dragging the mouse, with the left mouse button down, across pe' +
      'riods will change the value of each period crossed to the value ' +
      'of the cursor when it crossed the period.'#13#10'\par '#13#10'\par Using Oth' +
      'er Keys with the Mouse.'#13#10'\par '#13#10'\par \pard\fi-360\li720\tx720 1.' +
      '\tab Holding the \b Shift\b0  key down and clicking the left mou' +
      'se will allow a new value manually to be keyed for the period se' +
      'lected by the cursor.'#13#10'\par \pard\fi-360\li720 2.\tab Holding th' +
      'e \b CTRL\b0  key down and clicking with the left mouse in any p' +
      'eriod where there is a value (nothing will happen is the current' +
      ' value is zero) will increase all non zero values by the percent' +
      'age change (increase or decrease) of the period under the cursor' +
      '. Example: if the selected period had a value of 500 and the cur' +
      'sor was clicked at 600, then 20% would be added to all values of' +
      ' that driver. '#13#10'\par 3.\tab Holding both \b Shift\b0  and \b CTR' +
      'L\b0  keys down will allow the value to be keyed in as a percent' +
      'age change and applied as in (2) above.'#13#10'\par 4.\tab Holding the' +
      ' \b Alt\b0  key down and clicking on a period will initially mar' +
      'k the new value. Moving to a new period and again holding the \b' +
      ' Alt\b0  key down and clicking will change all values between th' +
      'e first marker to the second point to a straight line between ea' +
      'ch point. '#13#10'\par 5.\tab Holding both \b Shift\b0  and \b Alt\b0 ' +
      ' keys down will allow manual edit of the start and end values be' +
      'fore drawing a straight line for the values between the points.'#13 +
      #10'\par 6.   The \b Right Mouse \b0 button will automatically adju' +
      'st the scalling to show all values with room to make further cha' +
      'nges. Particularly useful after making value adjustments close t' +
      'he edge of the current range.'#13#10'\par \pard '#13#10'\par \pard\qc ******' +
      '**************\b\fs32 '#13#10'\par }'#13#10#0
  end
end
