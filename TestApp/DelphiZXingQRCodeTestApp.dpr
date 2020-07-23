program DelphiZXingQRCodeTestApp;

uses
  Forms,
  DelphiZXingQRCodeTestAppMainForm in 'DelphiZXingQRCodeTestAppMainForm.pas' {Form1},
  DelphiZXingQRCode in '..\Source\DelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
