program FootController;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Principal},
  uConfiguracoes in 'uConfiguracoes.pas' {Configuracoes},
  uInicio in 'uInicio.pas' {Inicio},
  uServer in 'uServer.pas' {Server};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TInicio, Inicio);
  Application.CreateForm(TServer, Server);
  Application.Run;
end.
