object DBUpdateF: TDBUpdateF
  Left = 656
  Top = 320
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Database Update'
  ClientHeight = 271
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object cxMemo1: TcxMemo
    Left = 40
    Top = 8
    Lines.Strings = (
      'cxMemo1')
    Properties.ScrollBars = ssVertical
    TabOrder = 0
    Height = 217
    Width = 347
  end
  object cxButton1: TcxButton
    Left = 40
    Top = 238
    Width = 105
    Height = 25
    Caption = 'Do Update'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxButton2: TcxButton
    Left = 272
    Top = 238
    Width = 115
    Height = 25
    NumGlyphs = 2
    Caption = 'OK'
    OptionsImage.Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    OptionsImage.NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object IB_Script1: TIB_Script
    OnError = IB_Script1Error
    IB_Connection = IB_Connection1
    IB_Transaction = IB_Transaction1
    OnStatement = IB_Script1Statement
    Left = 360
    Top = 8
  end
  object IB_Connection1: TIB_Connection
    DefaultTransaction = IB_Transaction1
    SQLDialect = 3
    DatabaseName = 'FB_UPDATE'
    Params.Strings = (
      'PROTOCOL=TCP/IP'
      
        'PATH=C:\Program Files\Focus Based Management\TARI for Business\D' +
        'ata\Sample.fdb'
      'SERVER=DEVWORK1'
      'USER NAME=SYSDBA'
      'SQL DIALECT=3'
      'FORCED WRITES=TRUE'
      'RESERVE PAGE SPACE=TRUE')
    Left = 88
  end
  object IB_Transaction1: TIB_Transaction
    IB_Connection = IB_Connection1
    ServerAutoCommit = True
    AnnounceFocus = True
    Isolation = tiConcurrency
    Left = 184
  end
  object IB_Query1: TIB_Query
    DatabaseName = 'FB_UPDATE'
    IB_Connection = IB_Connection1
    SQL.Strings = (
      'SELECT * FROM ACCOUNT_TITLES'
      'for update;')
    OrderingItemNo = 1
    OrderingItems.Strings = (
      'ACCOUNT_NUMBER=ACCOUNT_NUMBER;ACCOUNT_NUMBER DESC')
    OrderingLinks.Strings = (
      'ACCOUNT_NUMBER=ITEM=1')
    RequestLive = True
    Left = 256
    Top = 8
  end
  object qryMasterDB: TIB_Query
    DatabaseName = 'MASTERDBCON'
    IB_Connection = MasterDB
    SQL.Strings = (
      'SELECT ACCOUNT_GRP_ID'
      'FROM ACCOUNT_GROUPS')
    Left = 80
    Top = 72
  end
  object MasterDB: TIB_Connection
    PasswordStorage = psKeyFromEnviron
    SQLDialect = 3
    DatabaseName = 'MASTERDBCON'
    Params.Strings = (
      
        'PATH=C:\Program Files\Focus Based Management\TARI for Business\P' +
        'roto\Master.fdb'
      'PROTOCOL=TCP/IP'
      'SERVER=DEVWORK1'
      'SQL DIALECT=3'
      'USER NAME=SYSDBA'
      'FORCED WRITES=TRUE'
      'RESERVE PAGE SPACE=TRUE')
    Left = 16
    Top = 72
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object IB_Transaction2: TIB_Transaction
    IB_Connection = MasterDB
    AutoCommit = True
    AnnounceFocus = True
    Isolation = tiConcurrency
    Left = 48
    Top = 128
  end
  object SPCreateBusiness: TIB_StoredProc
    DatabaseName = 'FB_UPDATE'
    IB_Connection = IB_Connection1
    SQL.Strings = (
      'EXECUTE PROCEDURE CREATE_BUSINESS'
      '  ?CREATE_BUSINESS.BUS_NAME,'
      '  ?CREATE_BUSINESS.LAST_DAY,'
      '  ?CREATE_BUSINESS.P_START,'
      '  ?CREATE_BUSINESS.P_END,'
      '  ?CREATE_BUSINESS.CURR_NAME,'
      '  ?CREATE_BUSINESS.CURR_SYMBOL,'
      '  ?CREATE_BUSINESS.CONVERSION,'
      '  ?CREATE_BUSINESS.DEFAULT_DEPT')
    ParamNames.Strings = (
      'BUS_NAME'
      'LAST_DAY'
      'P_START'
      'P_END'
      'CURR_NAME'
      'CURR_SYMBOL'
      'CONVERSION'
      'DEFAULT_DEPT')
    StoredProcName = 'CREATE_BUSINESS'
    Left = 256
    Top = 72
  end
end
