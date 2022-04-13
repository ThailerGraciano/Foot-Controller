unit uConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Midi, Vcl.CheckLst, MMSystem,
  Vcl.StdCtrls, System.SyncObjs;

type
  TConfiguracoes = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    memLog: TMemo;
    procedure CheckListBox1ClickCheck(Sender: TObject);
  private
    { Private declarations }
    fCriticalSection: TCriticalSection;
  public
    { Public declarations }
    procedure DoMidiInData( const aDeviceIndex: integer; const aStatus, aData1, aData2: byte );
    procedure DoSysExData( const aDeviceIndex: integer; const aStream: TMemoryStream );
  end;

var
  Configuracoes: TConfiguracoes;

implementation

{$R *.dfm}

procedure TConfiguracoes.DoSysExData(const aDeviceIndex : integer;
                                     const aStream      : TMemoryStream);
begin
  fCriticalSection.Acquire;
  memLog.Lines.BeginUpdate;
  try
    // print the message log
    memLog.Lines.Insert( 0, Format( '[%s] %s: <Bytes> %d <SysEx> %s',
      [ FormatDateTime( 'HH:NN:SS.ZZZ', now ),
        MidiInput.Devices[aDeviceIndex],
        aStream.Size,
        SysExStreamToStr( aStream ) ] ));
  finally
    memLog.Lines.EndUpdate;
    fCriticalSection.Leave;
  end;
end;

procedure TConfiguracoes.DoMidiInData(const aDeviceIndex: integer;
                                      const aStatus,
                                      aData1,
                                      aData2: byte);
var
  i: integer;
begin
  // skip active sensing signals from keyboard
  if aStatus = $FE then Exit;

  case aData1 of
    $29: if aData2 = $7F then
           pnl1A.Caption := 'Apertado'
         else
           pnl1A.Caption := 'Não Apertado';

    $2A: if aData2 = $7F then
           pnl1B.Caption := 'Apertado'
         else
           pnl1B.Caption := 'Não Apertado'
  end;


  fCriticalSection.Acquire;
  memLog.Lines.BeginUpdate;
  try
    // print the message log
    memLog.Lines.Insert( 0, Format( '[%s] %s: <Status> %.2x, <Data 1> %.2x <Data 2> %.2x',
      [ FormatDateTime( 'HH:NN:SS.ZZZ', now ),
        MidiInput.Devices[aDeviceIndex],
        aStatus,
        aData1,
        aData2 ] ));
  finally
    memLog.Lines.EndUpdate;
    fCriticalSection.Leave;
  end;
end;


procedure TConfiguracoes.CheckListBox1ClickCheck(Sender: TObject);
begin
  if CheckListBox1.Checked[ CheckListBox1.ItemIndex ] then
    MidiInput.Open( CheckListBox1.ItemIndex)
  else
    MidiInput.Close( CheckListBox1.ItemIndex)
end;

end.
