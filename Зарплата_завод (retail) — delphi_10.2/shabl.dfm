object Shablon: TShablon
  Left = 0
  Top = 0
  Caption = #1064#1072#1073#1083#1086#1085' '#1088#1072#1073#1086#1090#1085#1080#1082#1072' '#1087#1086' '#1076#1077#1090#1072#1083#1103#1084
  ClientHeight = 245
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormShow
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 280
    Top = 15
    Width = 145
    Height = 18
    DataField = 'Familia'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 17
    Width = 240
    Height = 18
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGridEh1: TDBGridEh
    Left = 56
    Top = 56
    Width = 409
    Height = 153
    AutoFitColWidths = True
    DataSource = DataModule1.DataSource31
    DynProps = <>
    Flat = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnKeyDown = DBGridEh1KeyDown
    OnMouseUp = DBGridEh1MouseUp
    Columns = <
      item
        AlwaysShowEditButton = True
        AutoDropDown = True
        CellButtons = <>
        Color = clInfoBk
        DropDownRows = 31
        DynProps = <>
        EditButtons = <>
        FieldName = 'detal'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
        Title.Color = clLime
        Width = 199
        OnUpdateData = DBGridEh1Columns0UpdateData
      end
      item
        AlwaysShowEditButton = True
        AutoDropDown = True
        CellButtons = <>
        Color = clInfoBk
        DropDownRows = 17
        DropDownWidth = 230
        DynProps = <>
        EditButtons = <>
        FieldName = 'oper'
        Footers = <>
        LookupDisplayFields = 'Nomer_operazii;Poasnenie'
        LookupParams.LookupCache = False
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1086#1087#1077#1088'.'
        Title.Color = clLime
        Width = 173
        OnOpenDropDownForm = DBGridEh1Columns1OpenDropDownForm
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object labeltext1: TLabeledEdit
    Left = 452
    Top = 16
    Width = 69
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = '     '#1087#1086#1080#1089#1082
    EditLabel.Color = clBtnFace
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clBlue
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentColor = False
    EditLabel.ParentFont = False
    TabOrder = 2
    OnChange = labeltext1Change
    OnClick = labeltext1Click
    OnExit = labeltext1Exit
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    CommandText = 'SELECT rabotniki.Cod, rabotniki.Familia'#13#10'FROM rabotniki;'#13#10
    Parameters = <>
    Left = 488
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 488
    Top = 104
  end
end
