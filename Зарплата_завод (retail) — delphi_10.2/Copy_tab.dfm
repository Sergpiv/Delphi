object Copy_tab_s: TCopy_tab_s
  Left = 447
  Top = 485
  Caption = #1050#1086#1087#1080#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 170
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ADOQuery1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'insert into detali in "L:\hh.mdb"'
      'select *from detali')
    Left = 24
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.mdb'
    Filter = #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' Access|*.mdb'
    Left = 264
    Top = 104
  end
end
