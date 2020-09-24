program DataGridView;

uses
  Forms,
  fDataGridView in 'fDataGridView.pas' {frmDataGridViewCachedUpdates},
  fSQLMainCompBase in '..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMainQueryBase in '..\TSqlClientQuery\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataGridViewCachedUpdates, frmDataGridViewCachedUpdates);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
