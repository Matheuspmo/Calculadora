object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 369
  ClientWidth = 330
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn_0: TButton
    Left = 84
    Top = 316
    Width = 80
    Height = 50
    Caption = '0'
    TabOrder = 0
    OnClick = btn_0Click
  end
  object btn_1: TButton
    Left = 2
    Top = 264
    Width = 80
    Height = 50
    Caption = '1'
    TabOrder = 1
    OnClick = btn_1Click
  end
  object btn_2: TButton
    Left = 84
    Top = 264
    Width = 80
    Height = 50
    Caption = '2'
    TabOrder = 2
    OnClick = btn_2Click
  end
  object btn_3: TButton
    Left = 166
    Top = 264
    Width = 80
    Height = 50
    Caption = '3'
    TabOrder = 3
    OnClick = btn_3Click
  end
  object btn_4: TButton
    Left = 2
    Top = 212
    Width = 80
    Height = 50
    Caption = '4'
    TabOrder = 4
    OnClick = btn_4Click
  end
  object btn_5: TButton
    Left = 84
    Top = 212
    Width = 80
    Height = 50
    Caption = '5'
    TabOrder = 5
    OnClick = btn_5Click
  end
  object btn_6: TButton
    Left = 166
    Top = 212
    Width = 80
    Height = 50
    Caption = '6'
    TabOrder = 6
    OnClick = btn_6Click
  end
  object btn_7: TButton
    Left = 2
    Top = 160
    Width = 80
    Height = 50
    Caption = '7'
    TabOrder = 7
    OnClick = btn_7Click
  end
  object btn_8: TButton
    Left = 84
    Top = 160
    Width = 80
    Height = 50
    Caption = '8'
    TabOrder = 8
    OnClick = btn_8Click
  end
  object btn_9: TButton
    Left = 166
    Top = 160
    Width = 80
    Height = 50
    Caption = '9'
    TabOrder = 9
    OnClick = btn_9Click
  end
  object lb_tela1: TLabeledEdit
    Left = 2
    Top = 46
    Width = 326
    Height = 56
    Alignment = taRightJustify
    BorderStyle = bsNone
    EditLabel.Width = 3
    EditLabel.Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = '0'
  end
  object btn_adic: TButton
    Left = 248
    Top = 264
    Width = 80
    Height = 50
    Caption = '+'
    TabOrder = 11
    OnClick = btn_adicClick
  end
  object btn_sub: TButton
    Left = 248
    Top = 212
    Width = 80
    Height = 50
    Caption = '-'
    TabOrder = 12
    OnClick = btn_subClick
  end
  object btn_mult: TButton
    Left = 248
    Top = 160
    Width = 80
    Height = 50
    Caption = 'x'
    TabOrder = 13
    OnClick = btn_multClick
  end
  object btn_div: TButton
    Left = 248
    Top = 108
    Width = 80
    Height = 50
    Caption = #247
    TabOrder = 14
    OnClick = btn_divClick
  end
  object lb_tela2: TLabeledEdit
    Left = 2
    Top = 8
    Width = 326
    Height = 32
    Alignment = taRightJustify
    BorderStyle = bsNone
    EditLabel.Width = 3
    EditLabel.Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
  end
  object btn_igual: TButton
    Left = 248
    Top = 316
    Width = 80
    Height = 50
    Caption = '='
    TabOrder = 16
    OnClick = btn_igualClick
  end
  object btn_limpar: TButton
    Left = 84
    Top = 108
    Width = 80
    Height = 50
    Caption = 'C'
    TabOrder = 17
    OnClick = btn_limparClick
  end
  object btn_virgula: TButton
    Left = 166
    Top = 316
    Width = 80
    Height = 50
    Caption = ','
    TabOrder = 18
    OnClick = btn_virgulaClick
  end
  object btn_invertersinal: TButton
    Left = 2
    Top = 316
    Width = 80
    Height = 50
    Caption = '+/-'
    TabOrder = 19
    OnClick = btn_invertersinalClick
  end
  object btn_limparentrada: TButton
    Left = 2
    Top = 108
    Width = 80
    Height = 50
    Caption = 'CE'
    TabOrder = 20
    OnClick = btn_limparentradaClick
  end
  object btn_apagardigito: TButton
    Left = 166
    Top = 108
    Width = 80
    Height = 50
    Caption = #9003' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = btn_apagardigitoClick
  end
end
