program RowFilter;

uses
  Forms,
  fSQLMainCompBase in '..\..\..\SqlClient\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fRowFilter in 'fRowFilter.pas' {frmRowFilter},
  uDatSUtils in '..\..\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRowFilter, frmRowFilter);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.Run;
end.
