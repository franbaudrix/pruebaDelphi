object Form2: TForm2
  Left = 123
  Top = 92
  Width = 1088
  Height = 563
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 488
    Top = 288
    Width = 82
    Height = 32
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 48
    Top = 168
    Width = 977
    Height = 33
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object Edit2: TEdit
    Left = 768
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 904
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Curar'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Monstruo 1'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 168
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Monstruo 2'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 272
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Monstruo 3'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 400
    Top = 96
    Width = 97
    Height = 33
    Caption = 'Ataque 1'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 512
    Top = 96
    Width = 97
    Height = 33
    Caption = 'Ataque 2'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 624
    Top = 96
    Width = 97
    Height = 33
    Caption = 'Ataque 3'
    TabOrder = 8
    OnClick = Button8Click
  end
  object StringGrid2: TStringGrid
    Left = 48
    Top = 344
    Width = 977
    Height = 33
    TabOrder = 9
    OnDrawCell = StringGrid2DrawCell
  end
  object Button14: TButton
    Left = 1005
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Ventana'
    TabOrder = 10
  end
end
