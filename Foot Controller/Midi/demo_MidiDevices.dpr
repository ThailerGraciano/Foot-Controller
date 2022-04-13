program demo_MidiDevices;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Midi in 'Midi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
