unit fMainQueryBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase, CNClrLib.ADONet.EventArgs,
  StdCtrls, ComCtrls, DB, CNClrLib.ADONet.Client, ExtCtrls, Buttons,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.OracleEventArgs,
  CNClrLib.ADONet.OracleClient;

type
  TfrmMainQueryBase = class(TfrmORACLEMainCompBase)
    pgcMain: TPageControl;
    tsData: TTabSheet;
    tsOptions: TTabSheet;
    pnlTree: TPanel;
    grp1: TGroupBox;
    lblAutoFetchAll: TLabel;
    lblDefFieldSize: TLabel;
    lblfetchMode: TLabel;
    lblRowsetSize: TLabel;
    lblSilentMode: TLabel;
    lblWaitCursor: TLabel;
    lblUndirectional: TLabel;
    cbAutoFetchAll: TComboBox;
    cbFetchMode: TComboBox;
    cbWaitCursor: TComboBox;
    edtRowsetSize: TEdit;
    chkUnidirectional: TCheckBox;
    edtDefaultFieldSize: TEdit;
    chkSilentMode: TCheckBox;
    pnlDataSet: TPanel;
    btnSave: TSpeedButton;
    lblDataSet: TLabel;
    cbDataSet: TComboBox;
    grp2: TGroupBox;
    lblUpdateMode: TLabel;
    lbl8: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cbUpdateMode: TComboBox;
    chkContinueUpdateOnError: TCheckBox;
    chkReadOnly: TCheckBox;
    chkRequestLive: TCheckBox;
    cbUpdateRowSource: TComboBox;
    edtUpdateBatchSize: TEdit;
    edtMinMemoSize: TEdit;
    lblCursorKind: TLabel;
    lbl9: TLabel;
    chkStrsEmpty2Null: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbDataSetChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure pgcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure chkReadOnlyClick(Sender: TObject);
    procedure chkRequestLiveClick(Sender: TObject);
  private
    FDataSets: TList;
  protected
    procedure RegisterDS(ADataSet: TCustomClrDataSet);
  public
    { Public declarations }
  end;

  TClrHackDataSet = class(TCustomClrDataSet)
  public
    property FetchOptions;
    property UpdateOptions;
  end;

var
  frmMainQueryBase: TfrmMainQueryBase;

implementation

{$R *.dfm}

procedure TfrmMainQueryBase.btnSaveClick(Sender: TObject);
var
  oDS: TClrHackDataSet;
begin
  oDS := TClrHackDataSet(FDataSets[cbDataSet.ItemIndex]);
  oDS.Close;
  oDS.FetchOptions.AutoFetchAll := TAutoFetchAll(cbAutoFetchAll.ItemIndex);
  oDS.FetchOptions.MemoMinSize := StrToIntDef(edtMinMemoSize.Text, 256);
  oDS.FetchOptions.FetchMode := TFetchMode(cbFetchMode.ItemIndex);
  oDS.FetchOptions.WaitCursor := TDBScreenCursor(cbWaitCursor.ItemIndex);
  oDS.FetchOptions.Unidirectional := chkUnidirectional.Checked;
  oDS.FetchOptions.SilentMode := chkSilentMode.Checked;
  oDS.FetchOptions.RowsetSize := StrToIntDef(edtRowsetSize.Text, 100);
  oDS.FetchOptions.DefaultFieldSize := StrToIntDef(edtDefaultFieldSize.Text, 30);

  oDS.UpdateOptions.ContinueUpdateOnError := chkContinueUpdateOnError.Checked;
  oDS.UpdateOptions.ReadOnly := chkReadOnly.Checked;
  oDS.UpdateOptions.RequestLive := chkRequestLive.Checked;
  oDS.UpdateOptions.UpdateBatchSize := StrToIntDef(edtUpdateBatchSize.Text, 1);
  oDS.UpdateOptions.UpdateMode := TUpdateMode(cbUpdateMode.ItemIndex);
  oDS.UpdateOptions.UpdateRowSource := TUpdateRowSource(cbUpdateRowSource.ItemIndex);
  oDS.UpdateOptions.StrsEmpty2Null := chkStrsEmpty2Null.Checked;
end;

procedure TfrmMainQueryBase.cbDataSetChange(Sender: TObject);
var
  oDS: TClrHackDataSet;
begin
  if FDataSets.Count = 0 then
    Exit;
  oDS := TClrHackDataSet(FDataSets[cbDataSet.ItemIndex]);

  cbAutoFetchAll.ItemIndex := Ord(oDS.FetchOptions.AutoFetchAll);
  edtMinMemoSize.Text := IntToStr(oDS.FetchOptions.MemoMinSize);
  cbFetchMode.ItemIndex := Ord(oDS.FetchOptions.FetchMode);
  cbWaitCursor.ItemIndex := Ord(oDS.FetchOptions.WaitCursor);
  chkUnidirectional.Checked := oDS.FetchOptions.Unidirectional;
  chkSilentMode.Checked := oDS.FetchOptions.SilentMode;
  EdtRowsetSize.Text := IntToStr(oDS.FetchOptions.RowsetSize);
  EdtDefaultFieldSize.Text := IntToStr(oDS.FetchOptions.DefaultFieldSize);

  chkContinueUpdateOnError.Checked := oDS.UpdateOptions.ContinueUpdateOnError;
  chkReadOnly.Checked := oDS.UpdateOptions.ReadOnly;
  chkRequestLive.Checked := oDS.UpdateOptions.RequestLive;
  edtUpdateBatchSize.Text := IntToStr(oDS.UpdateOptions.UpdateBatchSize);
  cbUpdateMode.ItemIndex := Ord(oDS.UpdateOptions.UpdateMode);
  cbUpdateRowSource.ItemIndex := Ord(oDS.UpdateOptions.UpdateRowSource);
  chkStrsEmpty2Null.Checked := oDS.UpdateOptions.StrsEmpty2Null;
end;

procedure TfrmMainQueryBase.chkReadOnlyClick(Sender: TObject);
begin
  chkRequestLive.Checked := not chkReadOnly.Checked;
end;

procedure TfrmMainQueryBase.chkRequestLiveClick(Sender: TObject);
begin
  chkReadOnly.Checked := not chkRequestLive.Checked;
end;

procedure TfrmMainQueryBase.FormCreate(Sender: TObject);
begin
  inherited;
  pgcMain.ActivePageIndex := 0;
  FDataSets := TList.Create;
end;

procedure TfrmMainQueryBase.FormDestroy(Sender: TObject);
begin
  inherited;
  FDataSets.Free;
  FDataSets := nil;
end;

procedure TfrmMainQueryBase.pgcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgcMain.ActivePage = tsData then begin
    if cbDataSet.ItemIndex = -1 then
      cbDataSet.ItemIndex := 0;
    cbDataSetChange(nil);
  end;
  AllowChange := True;
end;

procedure TfrmMainQueryBase.RegisterDS(ADataSet: TCustomClrDataSet);
begin
  FDataSets.Add(ADataSet);
  cbDataSet.Items.Add(ADataSet.Name);
end;

end.
