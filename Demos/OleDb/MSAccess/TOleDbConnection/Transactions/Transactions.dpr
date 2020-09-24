program Transactions;

uses
  Forms,
  fTransactions in 'fTransactions.pas' {frmTransaction},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTransaction, frmTransaction);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
