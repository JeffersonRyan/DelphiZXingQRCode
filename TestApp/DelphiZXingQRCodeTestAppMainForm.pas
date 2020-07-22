unit DelphiZXingQRCodeTestAppMainForm;

// Demo app for ZXing QRCode port to Delphi, by Debenu Pty Ltd
// www.debenu.com

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, DelphiZXingQRCode_D5, ExtCtrls,
  StdCtrls, jpeg, ExtDlgs, ComCtrls, Clipbrd;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cmbEncoding: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtQuietZone: TEdit;
    Label4: TLabel;
    EditTel1: TEdit;
    EditTitle: TEdit;
    EditNome: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditEmail: TEdit;
    Label8: TLabel;
    EditPhoto: TEdit;
    Label9: TLabel;
    EditURL: TEdit;
    Label10: TLabel;
    rgpModo: TRadioGroup;
    Label11: TLabel;
    btnSalvar: TButton;
    MemoTextoLivre: TMemo;
    Memo1: TMemo;
    SavePictureDialog1: TSavePictureDialog;
    udQuietZone: TUpDown;
    Panel1: TPanel;
    Image1: TImage;
    btnCopiarClipboard: TButton;
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
  private
    QRCodeBitmap: TBitmap;
    procedure Paint;
  public
    procedure Update;
  end;

type
  TRGBArray = ARRAY[0..32767] OF TRGBTriple;
  pRGBArray = ^TRGBArray;
  
var
  Form1: TForm1;

implementation

{$R *.dfm}

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
  cmbEncoding.itemindex:=0;
  QRCodeBitmap := TBitmap.Create;
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
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
 //   edtText.text:= 'BEGIN:VCARD'+#10+'PHOTO;JPEG:http://ryan.com.br/imagens/avatar.jpg'+#10+'N:Ryan;Jefferson'+#10+'TEL:81 988064017'+#10+'EMAIL:teste@ryan.com.br'+#10+'URL:ryan.com.br'+#10+'TITLE:Técnico em Informática'+#10+'END:VCARD';


if rgpModo.itemindex=1 then
    QRCode.Data := MemoTextoLivre.text
    else
    QRCode.Data :='BEGIN:VCARD'+#10+'N:'+EditNome.Text+#10+'TEL:'+EditTel1.Text+
    #10+'EMAIL:'+Editemail.text+#10+'URL:'+EditURL.text+#10+'TITLE:'+
    EditTitle.text+#10+'PHOTO;JPEG:'+EditPhoto.text +#10+'END:VCARD';

    
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

end.
