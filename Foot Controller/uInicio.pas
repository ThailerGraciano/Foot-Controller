unit uInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm3 = class(TForm)
    pnlFundo: TPanel;
    btnClose: TSpeedButton;
    pnlCentral: TPanel;
    Panel1: TPanel;
    btnPreset: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPresetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  uconfiguracoes, uPrincipal;

{$R *.dfm}

procedure TForm3.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.btnPresetClick(Sender: TObject);
begin
  Form2 := TForm2.Create(Application);
  Form2.ShowModal;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Form3.Width  := 1280;
  Form3.Height := 720;
end;

end.
