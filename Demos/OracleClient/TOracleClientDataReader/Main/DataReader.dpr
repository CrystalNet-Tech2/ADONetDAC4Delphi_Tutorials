program DataReader;

uses
  Forms,
  fDataReader in 'fDataReader.pas' {frmDataReader},
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas',
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataReader, frmDataReader);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
