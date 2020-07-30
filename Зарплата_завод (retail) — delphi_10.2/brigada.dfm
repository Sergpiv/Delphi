object Brig: TBrig
  Left = 0
  Top = 0
  Caption = #1041#1088#1080#1075#1072#1076#1099
  ClientHeight = 160
  ClientWidth = 182
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
  object DBGrid1: TDBGridEh
    Left = 8
    Top = 8
    Width = 153
    Height = 137
    AllowedSelections = [gstRecordBookmarks]
    AutoFitColWidths = True
    DataSource = DataModule1.DataSource20
    DynProps = <>
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh]
    Flat = True
    GridLineParams.DataHorzColor = clTeal
    GridLineParams.DataVertColor = clTeal
    HorzScrollBar.ExtraPanel.Visible = True
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    EmptyDataInfo.Active = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentShowHint = False
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    SearchPanel.Location = splHorzScrollBarExtraPanelEh
    ShowHint = True
    STFilter.InstantApply = True
    STFilter.Local = True
    TabOrder = 0
    TitleParams.Font.Charset = DEFAULT_CHARSET
    TitleParams.Font.Color = clWindowText
    TitleParams.Font.Height = -11
    TitleParams.Font.Name = 'MS Sans Serif'
    TitleParams.Font.Style = []
    TitleParams.ParentFont = False
    Columns = <
      item
        Color = clInfoBk
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name_brig'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1041#1088#1080#1075#1072#1076#1099
        Title.Color = clLime
        Width = 99
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
