program Transactions;

uses
  Forms,
  fTransactions in 'fTransactions.pas' {frmTransaction},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTransaction, frmTransaction);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
