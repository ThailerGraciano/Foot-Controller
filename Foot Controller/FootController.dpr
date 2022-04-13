program FootController;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Principal},
  uConfiguracoes in 'uConfiguracoes.pas' {Configuracoes},
  uInicio in 'uInicio.pas' {Inicio},
  uServer in 'uServer.pas' {Server},
  Midi in 'Midi\Midi.pas',
  Unit1 in 'Midi\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TInicio, Inicio);
  Application.CreateForm(TServer, Server);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
