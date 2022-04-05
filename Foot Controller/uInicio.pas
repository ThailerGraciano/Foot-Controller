unit uInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TInicio = class(TForm)
    pnlFundo: TPanel;
    btnClose: TSpeedButton;
    pnlCentral: TPanel;
    Panel1: TPanel;
    btnPreset: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPresetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CriaBotao(qtdeBotao : Integer = 8);

  public
    { Public declarations }
  end;

var
  Inicio: TInicio;

implementation

uses
  uConfiguracoes, uPrincipal;

{$R *.dfm}

procedure TInicio.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TInicio.btnPresetClick(Sender: TObject);
begin
  Configuracoes := TConfiguracoes.Create(Application);
  Configuracoes.ShowModal;
end;

procedure TInicio.CriaBotao(qtdeBotao: Integer);
var
  pnlBotao    : TPanel;
  vdLarForm,
  vdAltForm,
  vdLarBot,
  vdAltBot,
  vdTop,
  vdLeft      : Double;
  I           : Integer;
  vsNomeBotao : String;
begin

  vdLarForm := Inicio.Width;
  vdAltForm := Inicio.Height;

  vdLarBot := vdLarForm / (qtdeBotao / 2);
  vdAltBot := vdAltForm / 2;

  for I := 1 to qtdeBotao do
  begin
  {
    RetornaPosition(I,
                    qtdeBotao,
                    vdLarForm,
                    vdAltForm,
                    vdTop,
                    vdLeft);
   }
    vsNomeBotao := 'btn' + InttoStr(I);

    pnlBotao := TPanel.Create(Principal);
    pnlBotao.Name             := vsNomeBotao;
    pnlBotao.Parent           := pnlCentral;
    pnlBotao.Width            := Round(vdLarBot);
    pnlBotao.Height           := Round(vdAltBot);
    pnlBotao.ParentBackground := False;
    pnlBotao.Color            := clWhite;
    pnlBotao.Top              := Round(vdTop);
    pnlBotao.Left             := Round(vdLeft);
  end;
end;

procedure TInicio.FormCreate(Sender: TObject);
begin
  Inicio.Width  := 1280;
  Inicio.Height := 720;
end;

procedure TInicio.FormShow(Sender: TObject);
begin
  CriaBotao;
end;

end.
