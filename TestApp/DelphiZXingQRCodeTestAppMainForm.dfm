object Form1: TForm1
  Left = 529
  Top = 141
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Delphi port of ZXing QRCode'
  ClientHeight = 726
  ClientWidth = 976
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 130
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
    Left = 137
    Top = 13
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
    Left = 137
    Top = 61
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
    Top = 376
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label6: TLabel
    Left = 24
    Top = 352
    Width = 26
    Height = 13
    Caption = 'Título'
  end
  object Label7: TLabel
    Left = 23
    Top = 328
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label8: TLabel
    Left = 26
    Top = 400
    Width = 24
    Height = 13
    Caption = 'email'
  end
  object Label9: TLabel
    Left = 28
    Top = 448
    Width = 22
    Height = 13
    Caption = 'Foto'
  end
  object Label10: TLabel
    Left = 26
    Top = 424
    Width = 19
    Height = 13
    Caption = 'URL'
  end
  object Label11: TLabel
    Left = 8
    Top = 304
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
  object Label12: TLabel
    Left = 8
    Top = 483
    Width = 30
    Height = 13
    Caption = 'WIFI:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 16
    Top = 528
    Width = 29
    Height = 13
    Caption = 'senha'
  end
  object Label14: TLabel
    Left = 23
    Top = 504
    Width = 23
    Height = 13
    Caption = 'SSID'
  end
  object cmbEncoding: TComboBox
    Left = 137
    Top = 32
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
    Left = 137
    Top = 80
    Width = 32
    Height = 21
    TabOrder = 1
    Text = '4'
    OnChange = edtQuietZoneChange
  end
  object EditTel1: TEdit
    Left = 56
    Top = 376
    Width = 215
    Height = 21
    TabOrder = 2
    OnChange = EditNomeChange
  end
  object EditTitulo: TEdit
    Left = 56
    Top = 352
    Width = 215
    Height = 21
    TabOrder = 3
    OnChange = EditNomeChange
  end
  object EditNome: TEdit
    Left = 56
    Top = 328
    Width = 215
    Height = 21
    TabOrder = 4
    OnChange = EditNomeChange
  end
  object EditEmail: TEdit
    Left = 56
    Top = 400
    Width = 215
    Height = 21
    TabOrder = 5
    OnChange = EditNomeChange
  end
  object EditFoto: TEdit
    Left = 56
    Top = 448
    Width = 215
    Height = 21
    TabOrder = 6
    OnChange = EditNomeChange
  end
  object EditURL: TEdit
    Left = 56
    Top = 424
    Width = 215
    Height = 21
    TabOrder = 7
    OnChange = EditNomeChange
  end
  object rgpModo: TRadioGroup
    Left = 8
    Top = 16
    Width = 121
    Height = 89
    Caption = 'Modo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'VCARD'
      'TEXTO LIVRE'
      'WIFI')
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
    Top = 152
    Width = 265
    Height = 129
    ScrollBars = ssVertical
    TabOrder = 10
    OnChange = MemoTextoLivreChange
  end
  object udQuietZone: TUpDown
    Left = 169
    Top = 80
    Width = 16
    Height = 21
    Associate = edtQuietZone
    Min = 0
    Position = 4
    TabOrder = 11
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
    TabOrder = 12
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
    TabOrder = 13
    OnClick = btnCopiarClipboardClick
  end
  object editSenha: TEdit
    Left = 56
    Top = 528
    Width = 215
    Height = 21
    TabOrder = 14
    OnChange = EditSSIDChange
  end
  object EditSSID: TEdit
    Left = 56
    Top = 504
    Width = 215
    Height = 21
    TabOrder = 15
    OnChange = EditSSIDChange
  end
  object rgpCripto: TRadioGroup
    Left = 56
    Top = 552
    Width = 217
    Height = 41
    Caption = 'Criptografia'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'WPA'
      'WEP')
    TabOrder = 16
    OnClick = rgpCriptoClick
  end
  object chkOculto: TCheckBox
    Left = 56
    Top = 600
    Width = 97
    Height = 17
    Caption = 'SSID Oculto'
    TabOrder = 17
    OnClick = chkOcultoClick
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.jpg'
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 240
    Top = 296
  end
end
