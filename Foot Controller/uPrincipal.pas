unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    pnlPrincipal: TPanel;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CriaBotao(qtdeBotao : Integer = 8);
    function  CalculaAltLarBtn(qtdeBotao : Integer;
                               pdLarAltForm : Double)  : Double;
    procedure RetornaPosition(I,
                              qtdeBotao  : Integer;
                              pdLarForm,
                              pdAltForm  : Double;
                              var pdTop  : Double;
                              var pdLeft : Double);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  viContCons: integer;

implementation

uses
  uConfiguracoes;
{$R *.dfm}

function TForm1.CalculaAltLarBtn(qtdeBotao    : Integer;
                                 pdLarAltForm : Double): Double;
begin
  Result := pdLarAltForm / qtdeBotao / 2;
end;

procedure TForm1.CriaBotao(qtdeBotao: Integer = 8);
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

  vdLarForm := Form1.Width;
  vdAltForm := Form1.Height;

  vdLarBot := vdLarForm / (qtdeBotao / 2);
  vdAltBot := vdAltForm / 2;

  for I := 1 to qtdeBotao do
  begin
    RetornaPosition(I,
                    qtdeBotao,
                    vdLarForm,
                    vdAltForm,
                    vdTop,
                    vdLeft);

    vsNomeBotao := 'btn' + InttoStr(I);

    pnlBotao := TPanel.Create(Form1);
    pnlBotao.Name             := vsNomeBotao;
    pnlBotao.Parent           := pnlPrincipal;
    pnlBotao.Width            := Round(vdLarBot);
    pnlBotao.Height           := Round(vdAltBot);
    pnlBotao.ParentBackground := False;
    pnlBotao.Color            := clWhite;
    pnlBotao.Top              := Round(vdTop);
    pnlBotao.Left             := Round(vdLeft);
  end;

end;

procedure TForm1.RetornaPosition(I,
                                 qtdeBotao  : Integer;
                                 pdLarForm,
                                 pdAltForm  : Double;
                                 var
                                   pdTop,
                                   pdLeft   : Double);
var
  vdTopMetade,
  vdLeftMetade,
  vdLefDivis�o : Double;
begin
  vdTopMetade  := qtdeBotao / 2;
  vdLeftMetade := qtdeBotao / 2;
  vdLefDivis�o := pdLarForm  / (qtdeBotao / 2);

  if I <= vdTopMetade then
  begin
    pdTop := 0;
  end
  else
  begin
    pdTop := pdAltForm / 2;

  end;

  if (I = 1) or
     (I = (vdLeftMetade + 1)) then
  begin
    pdLeft := 0;
    viContCons := 0;
  end
  else
  begin
    viContCons := viContCons + 1;
    pdLeft := viContCons * (pdLarForm / vdLeftMetade);
  end;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Form2 := TForm2.Create(Application);
  Form2.ShowModal;
end;

end.
