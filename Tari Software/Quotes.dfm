object QuotesF: TQuotesF
  Left = 435
  Top = 185
  HelpContext = 1024
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Quote Details'
  ClientHeight = 726
  ClientWidth = 886
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 488
    Top = 119
    Width = 382
    Height = 218
    TabOrder = 0
    object QuotesCardView: TcxGridDBCardView
      Navigator.Buttons.CustomButtons = <>
      OnFocusedItemChanged = QuotesCardViewFocusedItemChanged
      DataController.DataSource = DataModuleClient.DSQuotes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      LayoutDirection = ldVertical
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.CardExpanding = True
      OptionsView.ScrollBars = ssNone
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 290
      Styles.Selection = DMRep1.cxStyle309
      Styles.RowCaption = DMRep1.cxStyle309
      object QuotesCardViewQUOTE_NUMBER: TcxGridDBCardViewRow
        Caption = 'Group ID'
        DataBinding.FieldName = 'QUOTE_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Properties.OnValidate = QuotesCardViewQUOTE_NUMBERPropertiesValidate
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewCUSTOMERNAME: TcxGridDBCardViewRow
        Caption = 'Customer/Name/Product'
        DataBinding.FieldName = 'CUSTOMERNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        Options.Filtering = False
        Options.IncSearch = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_DATE: TcxGridDBCardViewRow
        Caption = 'Date'
        DataBinding.FieldName = 'Q_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = []
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Options.Filtering = False
        Options.IncSearch = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_VALUE: TcxGridDBCardViewRow
        Caption = 'Net Sales Value'
        DataBinding.FieldName = 'Q_VALUE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '$,0;-$,0'
        Properties.UseThousandSeparator = True
        Properties.OnEditValueChanged = InvGridUpdateFooter
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_MATERIALS: TcxGridDBCardViewRow
        Caption = 'Materials at Cost'
        DataBinding.FieldName = 'Q_MATERIALS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '$,0;-$,0'
        Properties.UseThousandSeparator = True
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_SUBCONTRACTORS: TcxGridDBCardViewRow
        Caption = 'Subcontractors at Cost'
        DataBinding.FieldName = 'Q_SUBCONTRACTORS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '$,0;-$,0'
        Properties.UseThousandSeparator = True
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_GP: TcxGridDBCardViewRow
        Caption = 'Gross Contribution'
        DataBinding.FieldName = 'Q_GP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '$,0;-$,0'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Properties.OnEditValueChanged = DBNetSalesChange
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Position.BeginsLayer = True
      end
      object QuotesCardViewTARGETUNITS: TcxGridDBCardViewRow
        Caption = 'Units required'
        DataBinding.FieldName = 'TARGETUNITS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0;-,0.0'
        Properties.UseThousandSeparator = True
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object QuotesCardViewQ_RATE: TcxGridDBCardViewRow
        Caption = 'Average Contribution Rate'
        DataBinding.FieldName = 'Q_RATE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Properties.OnEditValueChanged = InvGridUpdateFooter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Position.BeginsLayer = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = QuotesCardView
    end
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 88
    Width = 449
    Height = 249
    TabOrder = 1
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnFocusedRecordChanged = cxGrid2DBTableView1FocusedRecordChanged
      DataController.DataSource = DataModuleClient.DSQuotes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Header = DMRep1.cxStyle476
      object cxGrid2DBTableView1DEPT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'DEPT_ID'
        Visible = False
      end
      object cxGrid2DBTableView1QUOTE_NUMBER: TcxGridDBColumn
        Caption = 'Quote Number'
        DataBinding.FieldName = 'QUOTE_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 122
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 122
      end
      object cxGrid2DBTableView1CUSTOMERNAME: TcxGridDBColumn
        Caption = 'Customer/Name/Product'
        DataBinding.FieldName = 'CUSTOMERNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 198
      end
      object cxGrid2DBTableView1Q_DATE: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'Q_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DateButtons = []
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 85
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 104
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 65
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 26
    Width = 329
  end
  object cxLabel3: TcxLabel
    Left = 584
    Top = 65
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 26
    Width = 185
  end
  object QuoteInsertBtn: TcxButton
    Left = 584
    Top = 88
    Width = 89
    Height = 25
    Caption = 'Insert New'
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF69473169473169473169473169473169
      4731694731694731694731694731694731694731694731FF00FFFF00FF009300
      FFFFFF007500007900007D00008100008500008800008900008E000093000098
      00009800009800694731FF00FF009200FFFFFF40C15D38BB5130B64528B13A20
      AB2F16A0210E921409930D039705009800009800009800694731FF00FF009200
      FFFFFF48C66940C15D38BB5130B64527AF38FFFFFFFFFFFF0D8F120A9A0F039A
      05009800009800694731FF00FF009100FFFFFF50CB7448C6693EBE5A34B54C2B
      AD3EFFFFFFFFFFFF108F180F9A160A9A0F039705009300694731FF00FF009100
      FFFFFF58D0804EC97240BA5D2FA845269E37FFFFFFFFFFFF138C1B108F180D8F
      1209930D008E00694731FF00FF009000FFFFFF58D08056CD7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9214008900694731FF00FF009000
      FFFFFF58D08057CF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF16A021008600694731FF00FF009000FFFFFF58D08058D08057CF7E56CD7D4F
      C873FFFFFFFFFFFF29A03B2FB0432BB13E20AB2F008300694731FF00FF009000
      FFFFFF58D08058D08058D08058D08056CD7CFFFFFFFFFFFF32A94938B85134B9
      4B2CB440007F00694731FF00FF009000FFFFFF58D08058D08058D08058D08057
      CF7EFFFFFFFFFFFF43BD6242C0603CBE5734B94B007C00694731FF00FF009000
      FFFFFF58D08058D08058D08058D08058D08057CF7E56CD7D52CC784BC86E44C3
      633CBE57007700694731FF00FF009000FFFFFF58D08058D08058D08058D08058
      D08058D08058D08058D08054CE7A4CC96F44C363007200694731FF00FF009000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF694731FF00FFFF00FF00900000900000900000900000900000
      9000009000009000009000009100009100009200009200FF00FF}
    TabOrder = 4
    OnClick = QuoteInsertBtnClick
  end
  object QuotesDeleteBtn: TcxButton
    Left = 688
    Top = 88
    Width = 81
    Height = 25
    Caption = 'Delete'
    OptionsImage.Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF69473169473169473169473169473169
      4731694731694731694731694731694731694731694731FF00FFFF00FF009300
      FFFFFF007500007900007D00008100008500008900008C000090000094000098
      00009800009800694731FF00FF009200FFFFFF40C15D38BB5130B64528B13A21
      AD3019A82512A31A0B9F10039A05009800009800009800694731FF00FF009200
      FFFFFF48C66940C15D38BB5130B64528B13A21AD3019A82512A31A0B9F10039A
      05009800009800694731FF00FF009100FFFFFF50CB7448C6693EBE5A34B54C2C
      AF4025AB351EA72C17A222119E180A9A0F039705009300694731FF00FF009100
      FFFFFF58D0804EC97240BA5D2FA845269E38219B2F1B98281795211191190D8F
      1209930D008E00694731FF00FF009000FFFFFF58D08056CD7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9214008900694731FF00FF009000
      FFFFFF58D08057CF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF16A021008600694731FF00FF009000FFFFFF58D08058D08057CF7E56CD7D51
      CB764AC66C42C0603ABB5432B6492BB13E20AB2F008300694731FF00FF009000
      FFFFFF58D08058D08058D08058D08058D08054CE7A4CC96F44C3633CBE5734B9
      4B2CB440007F00694731FF00FF009000FFFFFF58D08058D08058D08058D08058
      D08058D08054CE7A4CC96F44C3633CBE5734B94B007C00694731FF00FF009000
      FFFFFF58D08058D08058D08058D08058D08058D08058D08054CE7A4CC96F44C3
      633CBE57007700694731FF00FF009000FFFFFF58D08058D08058D08058D08058
      D08058D08058D08058D08054CE7A4CC96F44C363007200694731FF00FF009000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF694731FF00FFFF00FF00900000900000900000900000900000
      9000009000009000009000009100009100009200009200FF00FF}
    TabOrder = 5
    OnClick = QuotesDeleteBtnClick
  end
  object cxGrid3: TcxGrid
    Left = 8
    Top = 376
    Width = 862
    Height = 201
    TabOrder = 6
    object RelatedInvoicesTV: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataModuleClient.DSInvoiceLU
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;-,0'
          Kind = skSum
          FieldName = 'NETSALES'
          Column = RelatedInvoicesTVNETSALES
        end
        item
          Format = ',0;-,0'
          Kind = skSum
          FieldName = 'MATERIALSATCOST'
          Column = RelatedInvoicesTVMATERIALSATCOST
        end
        item
          Format = ',0;-,0'
          Kind = skSum
          FieldName = 'SUBCONTRACTORS'
          Column = RelatedInvoicesTVSUBCONTRACTORS
        end
        item
          Format = ',0;-,0'
          Kind = skSum
          FieldName = 'GrossProfit'
          Column = RelatedInvoicesTVGrossProfit
        end
        item
          Format = ',0.0;-,0.0'
          Kind = skSum
          FieldName = 'RECORDEDUNITS'
          Column = RelatedInvoicesTVRECORDEDUNITS
        end
        item
          Format = ',0.00;-0.00'
          Kind = skCount
          FieldName = 'AverageRate'
          Column = RelatedInvoicesTVAverageRate
        end
        item
          Format = ',0.0;-,0.0'
          Kind = skSum
          FieldName = 'UNITSREQUIRED'
          Column = RelatedInvoicesTVUNITSREQUIRED
        end
        item
          Format = 'Totals'
          Kind = skCount
          FieldName = 'INVOICE_ID'
          Column = RelatedInvoicesTVINVOICE_NUMBER
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = RelatedInvoicesTVDataControllerSummaryAfterSummary
      OptionsView.ScrollBars = ssVertical
      OptionsView.CellAutoHeight = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Styles.Header = DMRep1.cxStyle476
      object RelatedInvoicesTVINVOICE_NUMBER: TcxGridDBColumn
        Caption = 'Invoice Number'
        DataBinding.FieldName = 'INVOICE_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.AutoSelect = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 82
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 89
      end
      object RelatedInvoicesTVINV_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'INV_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 88
      end
      object RelatedInvoicesTVNETSALES: TcxGridDBColumn
        Caption = 'Net Sale Value'
        DataBinding.FieldName = 'NETSALES'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 92
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 114
      end
      object RelatedInvoicesTVMATERIALSATCOST: TcxGridDBColumn
        Caption = 'Materials at Cost'
        DataBinding.FieldName = 'MATERIALSATCOST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.AutoSelect = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 86
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 99
      end
      object RelatedInvoicesTVSUBCONTRACTORS: TcxGridDBColumn
        Caption = 'Subcontractors at Cost'
        DataBinding.FieldName = 'SUBCONTRACTORS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.AutoSelect = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 118
      end
      object RelatedInvoicesTVGrossProfit: TcxGridDBColumn
        DataBinding.FieldName = 'GrossProfit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.AutoSelect = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 102
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 113
      end
      object RelatedInvoicesTVRECORDEDUNITS: TcxGridDBColumn
        Caption = 'Time Sheet Units'
        DataBinding.FieldName = 'RECORDEDUNITS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0;-,0.0'
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 92
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 92
      end
      object RelatedInvoicesTVUNITSREQUIRED: TcxGridDBColumn
        Caption = 'Targeted Units'
        DataBinding.FieldName = 'UNITSREQUIRED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0;-,0.0'
        Properties.UseLeftAlignmentOnEditing = False
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 92
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 92
      end
      object RelatedInvoicesTVAverageRate: TcxGridDBColumn
        Caption = 'Average Rate'
        DataBinding.FieldName = 'AverageRate'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 88
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 110
      end
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = RelatedInvoicesTV
    end
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 353
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Related Invoices'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 425
  end
  object cxTextEdit1: TcxTextEdit
    Left = 8
    Top = 616
    Properties.ReadOnly = True
    Style.Color = clGradientActiveCaption
    Style.Shadow = True
    TabOrder = 8
    Text = 'Contribution Rate Comparison'
    Width = 233
  end
  object NetSalesVar: TcxCurrencyEdit
    Left = 200
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 9
    Width = 112
  end
  object MaterialsVar: TcxCurrencyEdit
    Left = 312
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 10
    Width = 96
  end
  object SubContractorsVar: TcxCurrencyEdit
    Left = 410
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 11
    Width = 118
  end
  object GrossProfitVar: TcxCurrencyEdit
    Left = 532
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 12
    Width = 108
  end
  object UnitsVar: TcxCurrencyEdit
    Left = 642
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 1
    Properties.DisplayFormat = ',0.0;-,0.0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 13
    Width = 89
  end
  object RateVar: TcxCurrencyEdit
    Left = 736
    Top = 584
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;-$,0.00'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 14
    Width = 105
  end
  object TargetRate: TcxCurrencyEdit
    Left = 96
    Top = 664
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;-$,0.00'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 15
    Width = 129
  end
  object TrackedRate: TcxCurrencyEdit
    Left = 296
    Top = 664
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;-$,0.00'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 16
    Width = 129
  end
  object TargetRateVar: TcxCurrencyEdit
    Left = 96
    Top = 688
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;-$,0.00'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 17
    Width = 129
  end
  object TrackedRateVar: TcxCurrencyEdit
    Left = 296
    Top = 688
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;-$,0.00'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 18
    Width = 129
  end
  object cxLabel5: TcxLabel
    Left = 24
    Top = 584
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Variances'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 26
    Width = 137
  end
  object CloseBtn: TcxButton
    Left = 760
    Top = 672
    Width = 105
    Height = 41
    Caption = '&Close'
    TabOrder = 20
    OnClick = CloseBtnClick
  end
  object cxLabel6: TcxLabel
    Left = 17
    Top = 688
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Variances'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 30
    Width = 73
  end
  object TargetLabel: TcxLabel
    Left = 96
    Top = 641
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Variances'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 177
  end
  object TrackLabel: TcxLabel
    Left = 296
    Top = 641
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Variances'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 153
  end
  object RateCalcBtn: TcxButton
    Left = 520
    Top = 343
    Width = 313
    Height = 27
    Caption = 'RateCalcBtn'
    TabOrder = 24
    OnClick = RateCalcCBClick
  end
  object cxDBLabel4: TcxDBLabel
    Left = 242
    Top = 8
    DataBinding.DataField = 'BRANCH_NAME'
    DataBinding.DataSource = DataModuleClient.DSBusinesses
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 29
    Width = 511
    AnchorY = 23
  end
  object cxLabel14: TcxLabel
    Left = 10
    Top = 37
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Department / Revenue Group'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 208
  end
  object cxDBLabel3: TcxDBLabel
    Left = 242
    Top = 32
    DataBinding.DataField = 'REVENUE_GROUP_NAME'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 33
    Width = 511
    AnchorY = 49
  end
  object cxLabel15: TcxLabel
    Left = 10
    Top = 12
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Business / Branch'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Width = 124
  end
  object UnitsTSVar: TcxCurrencyEdit
    Left = 641
    Top = 585
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 1
    Properties.DisplayFormat = ',0.0;-,0.0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = 16775673
    TabOrder = 29
    Width = 89
  end
end
