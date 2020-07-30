object Professia: TProfessia
  Left = 1050
  Top = 2
  Caption = #1050#1086#1076#1099' '#1087#1088#1086#1092#1077#1089#1089#1080#1081
  ClientHeight = 289
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 14
    Top = 16
    Width = 223
    Height = 257
    DataSource = DataModule1.DataSource17
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name_prof'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Color = clHighlight
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 136
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'kod_prof'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGreen
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 49
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
