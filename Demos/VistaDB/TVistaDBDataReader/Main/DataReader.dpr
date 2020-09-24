program DataReader;

uses
  Forms,
  fDataReader in 'fDataReader.pas' {frmDataReader},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataReader, frmDataReader);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
