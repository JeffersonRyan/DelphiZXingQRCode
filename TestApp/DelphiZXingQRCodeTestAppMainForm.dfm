object Form1: TForm1
  Left = 420
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Delphi port of ZXing QRCode'
  ClientHeight = 726
  ClientWidth = 988
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 90
    Width = 67
    Height = 13
    Caption = 'Texto Livre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 477
    Width = 67
    Height = 13
    Caption = 'Codificação:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 661
    Width = 52
    Height = 13
    Caption = 'Quiet zone'
  end
  object Label4: TLabel
    Left = 288
    Top = 13
    Width = 45
    Height = 13
    Caption = 'Preview'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 368
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label6: TLabel
    Left = 24
    Top = 344
    Width = 26
    Height = 13
    Caption = 'Título'
  end
  object Label7: TLabel
    Left = 23
    Top = 320
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label8: TLabel
    Left = 26
    Top = 392
    Width = 24
    Height = 13
    Caption = 'email'
  end
  object Label9: TLabel
    Left = 28
    Top = 440
    Width = 22
    Height = 13
    Caption = 'Foto'
  end
  object Label10: TLabel
    Left = 26
    Top = 416
    Width = 19
    Height = 13
    Caption = 'URL'
  end
  object Label11: TLabel
    Left = 8
    Top = 296
    Width = 41
    Height = 13
    Caption = 'VCARD:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cmbEncoding: TComboBox
    Left = 9
    Top = 496
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cmbEncodingChange
    Items.Strings = (
      'Auto'
      'Numeric'
      'Alphanumeric'
      'ISO-8859-1')
  end
  object edtQuietZone: TEdit
    Left = 9
    Top = 680
    Width = 32
    Height = 21
    TabOrder = 1
    Text = '4'
    OnChange = edtQuietZoneChange
  end
  object EditTel1: TEdit
    Left = 56
    Top = 368
    Width = 215
    Height = 21
    TabOrder = 2
    Text = '81 9 0000 0000'
    OnChange = EditNomeChange
  end
  object EditTitle: TEdit
    Left = 56
    Top = 344
    Width = 215
    Height = 21
    TabOrder = 3
    Text = 'Programador'
    OnChange = EditNomeChange
  end
  object EditNome: TEdit
    Left = 56
    Top = 320
    Width = 215
    Height = 21
    TabOrder = 4
    Text = 'Jefferson Ryan'
    OnChange = EditNomeChange
  end
  object EditEmail: TEdit
    Left = 56
    Top = 392
    Width = 215
    Height = 21
    TabOrder = 5
    Text = 'xxxxxx@ryan.com.br'
    OnChange = EditNomeChange
  end
  object EditPhoto: TEdit
    Left = 56
    Top = 440
    Width = 215
    Height = 21
    TabOrder = 6
    Text = 'http://ryan.com.br/imagens/avatar.jpg'
    OnChange = EditNomeChange
  end
  object EditURL: TEdit
    Left = 56
    Top = 416
    Width = 215
    Height = 21
    TabOrder = 7
    Text = 'ryan.com.br'
    OnChange = EditNomeChange
  end
  object rgpModo: TRadioGroup
    Left = 8
    Top = 16
    Width = 265
    Height = 65
    Caption = 'Modo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'VCARD'
      'TEXTO LIVRE')
    ParentFont = False
    TabOrder = 8
    OnClick = rgpModoClick
  end
  object btnSalvar: TButton
    Left = 137
    Top = 682
    Width = 134
    Height = 25
    Caption = 'Salvar como JPG'
    TabOrder = 9
    OnClick = btnSalvarClick
  end
  object MemoTextoLivre: TMemo
    Left = 8
    Top = 112
    Width = 265
    Height = 153
    Lines.Strings = (
      '17/07/2020 09:56; Fórmula R6.100-28; SACOLA '
      '255; Registro 1512; EMBRA 100,20; CARA '
      '200,45; NF02 45,12, SBEL1 250,32; AGUA '
      '100,00; SOL 45,12')
    ScrollBars = ssVertical
    TabOrder = 10
    OnChange = MemoTextoLivreChange
  end
  object Memo1: TMemo
    Left = 9
    Top = 520
    Width = 263
    Height = 129
    Lines.Strings = (
      'Alphanumeric: Produz um código menos complexo '
      'e mais fácil de decodificar, porém só suporta um '
      'subconjunto da tabela ASCII com cerca '
      'de 44 caracteres: números, o alfabeto maíusculo e '
      'os caracteres $,:, ,*,+,-,.,/ e %'
      ''
      'ISO-8859-1: Suporta toda a tabela ASCII e mais, '
      'pois inclui acentuação, mas gera um '
      'código notávelmente mais difícil de decodificar.')
    TabOrder = 11
  end
  object udQuietZone: TUpDown
    Left = 41
    Top = 680
    Width = 16
    Height = 21
    Associate = edtQuietZone
    Min = 0
    Position = 4
    TabOrder = 12
    Wrap = False
  end
  object Panel1: TPanel
    Left = 288
    Top = 32
    Width = 680
    Height = 680
    BevelInner = bvRaised
    BevelOuter = bvSpace
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 13
    object Image1: TImage
      Left = 4
      Top = 4
      Width = 668
      Height = 668
      Align = alClient
      AutoSize = True
    end
  end
  object btnCopiarClipboard: TButton
    Left = 137
    Top = 651
    Width = 134
    Height = 25
    Caption = 'Copiar para o clipboard'
    TabOrder = 14
    OnClick = btnCopiarClipboardClick
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.jpg'
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 104
    Top = 672
  end
end
