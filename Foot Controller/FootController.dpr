program FootController;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uConfiguracoes in 'uConfiguracoes.pas' {Form2},
  uInicio in 'uInicio.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
