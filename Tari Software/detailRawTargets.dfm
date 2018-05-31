object DetailRawTargetsF: TDetailRawTargetsF
  Left = 495
  Top = 232
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Detailed Raw Targets'
  ClientHeight = 726
  ClientWidth = 924
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object CloseBtn: TcxButton
    Left = 768
    Top = 672
    Width = 145
    Height = 41
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 0
  end
  object RGIndex: TcxRadioGroup
    Left = 8
    Top = 568
    Caption = 'Period Type'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Daily'
        Value = 0
      end
      item
        Caption = 'Weekly'
        Value = 1
      end
      item
        Caption = '4 Weekly'
        Value = 2
      end
      item
        Caption = '4/5 Weekly'
        Value = 3
      end
      item
        Caption = 'Calendar Monthly'
        Value = 4
      end
      item
        Caption = 'Quarterly'
        Value = 5
      end
      item
        Caption = 'Half Yearly'
        Value = 6
      end>
    ItemIndex = 0
    TabOrder = 1
    OnClick = RGIndexClick
    Height = 145
    Width = 289
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 905
    Height = 513
    TabOrder = 2
    object GRIDVRawTargets: TcxGridBandedTableView
      OnKeyDown = GRIDVRawTargetsKeyDown
      Navigator.Buttons.CustomButtons = <>
      OnFocusedItemChanged = GRIDVRawTargetsFocusedItemChanged
      OnFocusedRecordChanged = GRIDVRawTargetsFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.0;(,0.0)'
          Kind = skSum
          Column = BandGVBilledCol
        end
        item
          Format = ',0.0;(,0.0)'
          Kind = skSum
          Column = BandGVPotentialCol
        end
        item
          Format = '0.0 %;(0.0 %)'
          Kind = skCount
          Column = BandGVProdCol
        end
        item
          Format = ',0.00;(,0.00)'
          Kind = skCount
          Column = BandGVSaleUnitCol
        end
        item
          Format = ',0.00;(,0.00)'
          Kind = skCount
          Column = BandGVGPUnitCol
        end
        item
          Format = '0.00 %;(0.00 %)'
          Kind = skCount
          Column = BandGVGPPCCol
        end
        item
          Format = '0;(0)'
          Kind = skSum
          Column = BandGVOtherCol
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = BandGVSalesCol
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = BandGCGPCol
        end
        item
          Format = 'Totals'
          Kind = skCount
          Column = BandGVDateCol
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = GRIDVRawTargetsDataControllerSummaryAfterSummary
      DataController.OnRecordChanged = GRIDVRawTargetsDataControllerRecordChanged
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.BandHeaders = False
      Styles.Header = DMRep1.cxStyle476
      Bands = <
        item
          FixedKind = fkLeft
          Options.HoldOwnColumnsOnly = True
          Options.Moving = False
        end
        item
          Options.HoldOwnColumnsOnly = True
        end
        item
          FixedKind = fkRight
          Options.HoldOwnColumnsOnly = True
          Options.Moving = False
        end>
      object BandGVDateCol: TcxGridBandedColumn
        Tag = 1
        Caption = 'Date'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 103
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object BandGVBilledCol: TcxGridBandedColumn
        Tag = 2
        Caption = 'Billed'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0;-,0.0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 105
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object BandGVPotentialCol: TcxGridBandedColumn
        Tag = 3
        Caption = 'Potential'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0;-,0.0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object BandGVProdCol: TcxGridBandedColumn
        Tag = 4
        Caption = 'Productivity %'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 93
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object BandGVSaleUnitCol: TcxGridBandedColumn
        Tag = 5
        Caption = 'Sales per'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 81
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object BandGVGPUnitCol: TcxGridBandedColumn
        Tag = 6
        Caption = 'Gross Profit per'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 98
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object BandGVGPPCCol: TcxGridBandedColumn
        Tag = 7
        Caption = 'GP %'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object BandGVOtherCol: TcxGridBandedColumn
        Tag = 8
        Caption = 'Other Income'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Options.VertSizing = False
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object BandGVSalesCol: TcxGridBandedColumn
        Tag = 9
        Caption = 'Total Sales'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object BandGCGPCol: TcxGridBandedColumn
        Tag = 10
        Caption = 'Total Gross Profit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 89
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object cxGLTargets: TcxGridLevel
      GridView = GRIDVRawTargets
    end
  end
  object CalcSalesGPUP: TcxCheckBox
    Left = 336
    Top = 592
    AutoSize = False
    Caption = 
      'Check to calculate using  Average Sale .'#13#10'Uncheck to calculate u' +
      'sing Average GP.'
    Properties.MultiLine = True
    TabOrder = 3
    Transparent = True
    Height = 41
    Width = 289
  end
  object SmartEditCB: TcxCheckBox
    Left = 336
    Top = 648
    AutoSize = False
    Caption = 'Use Smart Edit (Down Arrow Key)'
    TabOrder = 4
    Transparent = True
    Height = 33
    Width = 249
  end
  object DeptLbl: TcxLabel
    Left = 40
    Top = 0
    AutoSize = False
    Caption = 'DeptLbl'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 34
    Width = 857
    AnchorY = 17
  end
end
