object Form3: TForm3
  Left = 317
  Top = 156
  Width = 1088
  Height = 563
  VertScrollBar.Position = 8
  Caption = 'Form3'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 680
    Top = 176
    Width = 187
    Height = 46
    Caption = 'Monstruos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 640
    Top = 248
    Width = 265
    Height = 265
    Stretch = True
  end
  object StringGrid1: TStringGrid
    Left = 1360
    Top = 544
    Width = 89
    Height = 120
    ColCount = 1
    FixedCols = 0
    FixedRows = 0
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 448
    Top = 288
    Width = 163
    Height = 113
    Caption = 'Anterior'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 928
    Top = 280
    Width = 161
    Height = 113
    Caption = 'Siguiente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
