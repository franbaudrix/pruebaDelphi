object Form3: TForm3
  Left = 317
  Top = 156
  Width = 1088
  Height = 563
  HorzScrollBar.Position = 166
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
    Left = 282
    Top = 184
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
    Left = 242
    Top = 256
    Width = 265
    Height = 265
    Stretch = True
  end
  object Label2: TLabel
    Left = 858
    Top = 176
    Width = 214
    Height = 46
    Caption = 'Estadisticas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 50
    Top = 296
    Width = 163
    Height = 113
    Caption = 'Anterior'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 530
    Top = 288
    Width = 161
    Height = 113
    Caption = 'Siguiente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
end
