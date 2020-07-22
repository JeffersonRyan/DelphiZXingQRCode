unit DelphiZXingQRCodeTestAppMainForm;

// Demo app for ZXing QRCode port to Delphi, by Debenu Pty Ltd
// www.debenu.com

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls,
  StdCtrls, jpeg, ExtDlgs, ComCtrls, DelphiZXIngQRCode, Clipbrd, inifiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cmbEncoding: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtQuietZone: TEdit;
    Label4: TLabel;
    EditTel1: TEdit;
    EditTitulo: TEdit;
    EditNome: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditEmail: TEdit;
    Label8: TLabel;
    EditFoto: TEdit;
    Label9: TLabel;
    EditURL: TEdit;
    Label10: TLabel;
    rgpModo: TRadioGroup;
    Label11: TLabel;
    btnSalvar: TButton;
    MemoTextoLivre: TMemo;
    SavePictureDialog1: TSavePictureDialog;
    udQuietZone: TUpDown;
    Panel1: TPanel;
    Image1: TImage;
    btnCopiarClipboard: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    editSenha: TEdit;
    EditSSID: TEdit;
    rgpCripto: TRadioGroup;
    chkOculto: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtTextChange(Sender: TObject);
    procedure cmbEncodingChange(Sender: TObject);
    procedure edtQuietZoneChange(Sender: TObject);
    procedure rgpModoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure MemoTextoLivreChange(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure btnCopiarClipboardClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditSSIDChange(Sender: TObject);
    procedure rgpCriptoClick(Sender: TObject);
    procedure chkOcultoClick(Sender: TObject);
  private
    QRCodeBitmap: TBitmap;
    procedure Paint;
    procedure GravarINI;
    procedure LerINI;
    function escapeText(texto: string): string;
  public
    procedure Update;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.escapeText(texto:string):string;
var
  i: integer;
begin
  result:='';

  for i:=1 to length(texto) do
  begin
  if texto[i] in [',','"',';',':','\'] then result:=result+'\'+texto[i]
  else
  result:= result+Texto[i];
  End;


end;

procedure TForm1.cmbEncodingChange(Sender: TObject);
begin
  Update;
end;

procedure TForm1.edtQuietZoneChange(Sender: TObject);
begin
  Update;
end;

procedure TForm1.edtTextChange(Sender: TObject);
begin
  Update;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  QRCodeBitmap := TBitmap.Create;
  LerINI();
  cmbEncoding.itemindex:=0;

{$ifdef VER150}
  cmbEncoding.items.add('UTF-8 without BOM');
  cmbEncoding.items.add('UTF-8 with BOM');
{$endif}


  Update;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  QRCodeBitmap.Free;
end;

procedure TForm1.Paint();
var
  Scale: Double;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Rect(0, 0, Image1.Width, Image1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (Image1.Width < Image1.Height) then
    begin
      Scale := Image1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := Image1.Height / QRCodeBitmap.Height;
    end;
    Image1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

procedure TForm1.Update;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  sWiFiString, sOculto:String;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try

      {
        Alphanumeric: Produz um código menos complexo
      e mais fácil de decodificar, porém só suporta um
      subconjunto da tabela ASCII com cerca
      de 44 caracteres: números, o alfabeto maíusculo e
      os caracteres $,:, ,*,+,-,.,/ e %

      ISO-8859-1: Suporta toda a tabela ASCII e mais,
      pois inclui acentuação, mas gera um
      código notávelmente mais difícil de decodificar.
    }


    if rgpModo.itemindex=1 then
    QRCode.Data := MemoTextoLivre.text;


    if chkOculto.checked Then sOculto:='true' else sOculto:='false';

    if rgpModo.itemindex=2 then
      begin
        sWiFiString:= 'WIFI:S:'+escapeText(editSSID.text)+';P:'+escapeText(editSenha.text)+';H:'+sOculto+';T:'+rgpCripto.items[rgpCripto.itemindex]+';';
        QRCode.Data := sWiFiString;
        //Formato:
        //QrCode.data:='WIFI:T:WPA;S:Valar Morghulis;P:Valar Dohaeris;H:false';
      end;

    if rgpModo.itemindex=0 then
      begin
        QRCode.Data :='BEGIN:VCARD'+#10+'N:'+EditNome.Text+#10+'TEL:'+EditTel1.Text+
        #10+'EMAIL:'+Editemail.text+#10+'URL:'+EditURL.text+#10+'TITLE:'+
        EditTitulo.text+#10+'PHOTO;JPEG:'+EditFoto.text +#10+'END:VCARD';
      end;

    QRCode.Encoding := TQRCodeEncoding(cmbEncoding.ItemIndex);
    QRCode.QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    QRCodeBitmap.width:= QRCode.Columns;
    QRCodeBitmap.Height:= QRCode.Rows;

    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  Paint;
end;

procedure TForm1.rgpModoClick(Sender: TObject);
begin
  Update;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
var
  imagemJPG: TJpegImage;
Begin
    if SavePictureDialog1.execute then
    Begin
      imagemJPG:= TJpegImage.create();

      imagemJPG.Assign( image1.Picture.Bitmap);

      imagemJPG.SaveToFile(SavePictureDialog1.filename);
      imagemJPG.free;
    End;
end;




procedure TForm1.MemoTextoLivreChange(Sender: TObject);
begin
  rgpModo.itemindex:=1;
  Update;

end;

procedure TForm1.EditNomeChange(Sender: TObject);
begin
  rgpModo.Itemindex:=0;
  Update;
end;

procedure TForm1.btnCopiarClipboardClick(Sender: TObject);
begin
  Clipboard.Assign(image1.picture.bitmap);
end;

//======================================================

procedure TForm1.GravarINI;
{Nomes Alternativos para busca: GravarINI e SalvarINI}
begin
 Try
   With TIniFile.Create(ChangeFileExt(Application.Exename,'.ini')) do
   Begin
   Try


      WriteString('VCARD', 'Nome', editNome.text);
      WriteString('VCARD', 'Titulo', editTitulo.text);
      WriteString('VCARD', 'Telefone', editTel1.text);
      WriteString('VCARD', 'email', editEmail.text);
      WriteString('VCARD', 'url', editUrl.text);
      WriteString('VCARD', 'foto', editFoto.text);

      WriteString('WIFI', 'ssid', editSSID.text);
      WriteString('WIFI', 'senha', editSenha.text);
      WriteInteger('WIFI', 'cripto', rgpCripto.itemindex);
      WriteBool('WIFI', 'oculto', chkOculto.checked);

     WriteString('Geral', 'textolivre', MemoTextoLivre.text);
     WriteInteger ('Geral','modo', rgpModo.ItemIndex);
     WriteInteger ('Geral','Encoding', cmbEncoding.ItemIndex);
     WriteInteger ('Geral','QuietZone', udQuietZone.position);

   Finally
     Free;
   End; //try-finally
   End; //do
 Except
     on E : Exception do
      ShowMessage('Erro do tipo '+E.ClassName+' ao tentar gravar o arquivo INI, com a mensagem: '+
      E.Message+#10#13+'Você possivelmente está rodando o programa em uma mídia Somente Leitura. '+
      'E a configuração não pôde ser salva.');
  End; //Try-except

end;
//======================================================

Procedure Tform1.LerINI();

Begin

  with TIniFile.Create(ChangeFileExt(Application.Exename,'.ini')) do
    Begin
      editNome.text:=ReadString('VCARD', 'Nome', '');
      editTitulo.text:=ReadString('VCARD', 'Titulo', '');
      editTel1.text:=ReadString('VCARD', 'Telefone', '');
      editEmail.text:=ReadString('VCARD', 'email', '');
      editUrl.text:=ReadString('VCARD', 'url', '');
      editFoto.text:=ReadString('VCARD', 'foto', '');

      editSSID.text:=ReadString('WIFI', 'ssid', '');
      editSenha.text:=ReadString('WIFI', 'senha', '');
      rgpCripto.itemindex:=ReadInteger('WIFI', 'cripto', 0);
      chkOculto.checked:=ReadBool('WIFI', 'oculto', false);

     MemoTextoLivre.text:=ReadString('Geral', 'textolivre', '');
     rgpModo.ItemIndex:=ReadInteger ('Geral','modo', 0);
     cmbEncoding.ItemIndex:=ReadInteger ('Geral','Encoding',0 );
     udQuietZone.position:=ReadInteger ('Geral','QuietZone', 4);
     Free;
   End;



End;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarINI();
end;

procedure TForm1.EditSSIDChange(Sender: TObject);
begin
  Update;
end;

procedure TForm1.rgpCriptoClick(Sender: TObject);
begin
  Update;
end;

procedure TForm1.chkOcultoClick(Sender: TObject);
begin
  Update;
end;

end.
