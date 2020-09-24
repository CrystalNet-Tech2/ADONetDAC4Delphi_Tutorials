unit fMainDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs, DB,
  CNClrLib.ADONet.Client, ExtCtrls, DBCtrls, StdCtrls, ComCtrls,
  Grids, DBGrids;

type
  TfrmMainDemo = class(TForm)
    pnlTitle: TPanel;
    bvlTitle: TBevel;
    lblTitle: TLabel;
    pnlMain: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    pgcMain: TPageControl;
    ts1: TTabSheet;
    btnLoadFromFile: TButton;
    btnSaveToFile: TButton;
    btnReset: TButton;
    ts2: TTabSheet;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lstFields: TListBox;
    edtFldName: TEdit;
    edtFldSize: TEdit;
    edtFldPrec: TEdit;
    cbFldDataType: TComboBox;
    btnFldAdd: TButton;
    btnFldDel: TButton;
    btnFldMod: TButton;
    chkFldRequired: TCheckBox;
    chkFldReadOnly: TCheckBox;
    ts3: TTabSheet;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lstIndexes: TListBox;
    edtIndName: TEdit;
    edtIndFields: TEdit;
    chkIndPrimary: TCheckBox;
    chkIndDesc: TCheckBox;
    chkIndUnique: TCheckBox;
    chkIndNoCase: TCheckBox;
    btnIndAdd: TButton;
    btnIndDel: TButton;
    btnIndMod: TButton;
    btnIndClearAll: TButton;
    edtIndInsFields: TEdit;
    edtIndDescFields: TEdit;
    edtIndExpression: TEdit;
    ts4: TTabSheet;
    lbl14: TLabel;
    edtFltExp: TEdit;
    chkFltActive: TCheckBox;
    chkFltFound: TCheckBox;
    btnFltFirst: TButton;
    btnFltPrev: TButton;
    btnFltNext: TButton;
    btnFltLast: TButton;
    dbnvgr1: TDBNavigator;
    pnlButtons: TPanel;
    btnClose: TButton;
    dsMemtable: TDataSource;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    ClrMemTable1: TClrMemTable;
    bvlButtons: TBevel;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnFldAddClick(Sender: TObject);
    procedure btnFldDelClick(Sender: TObject);
    procedure btnFldModClick(Sender: TObject);
    procedure lstFieldsClick(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure btnIndAddClick(Sender: TObject);
    procedure btnIndDelClick(Sender: TObject);
    procedure btnIndModClick(Sender: TObject);
    procedure btnIndClearAllClick(Sender: TObject);
    procedure lstIndexesDblClick(Sender: TObject);
    procedure lstIndexesClick(Sender: TObject);
    procedure chkFltActiveClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnFltFirstClick(Sender: TObject);
    procedure btnFltPrevClick(Sender: TObject);
    procedure btnFltNextClick(Sender: TObject);
    procedure btnFltLastClick(Sender: TObject);
  private
    procedure LoadField;
    procedure LoadFields;
    procedure LoadIndex;
    procedure LoadIndexes;
    procedure UpdateFilter;
    procedure ContentModified;
  public
    { Public declarations }
  end;

var
  frmMainDemo: TfrmMainDemo;

implementation

{$R *.dfm}

const
  S_XML_RegFilter = 'XML Files (*.xml)|*.xml';

procedure TfrmMainDemo.FormCreate(Sender: TObject);
var
  i: TFieldType;
begin
  cbFldDataType.Items.Clear;
  for i := Low(TFieldType) to High(TFieldType) do
    cbFldDataType.Items.Add(FieldTypeNames[i]);

  dlgOpen1.Filter := S_XML_RegFilter;
  dlgSave1.Filter := S_XML_RegFilter;
  pgcMain.ActivePageIndex := 0;
end;

procedure TfrmMainDemo.btn1Click(Sender: TObject);
begin
  Close;
end;

{------------------------------------------------------------------------------}
{ Content                                                                      }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnLoadFromFileClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    btnResetClick(nil);
    ClrMemTable1.ReadXml(dlgOpen1.FileName);
    ContentModified;
  end;
end;

procedure TfrmMainDemo.btnResetClick(Sender: TObject);
begin
  ClrMemTable1.Active := False;
  ClrMemTable1.FieldDefs.Clear;
  ClrMemTable1.IndexDefs.Clear;
  ClrMemTable1.IndexFieldNames := '';
  ClrMemTable1.IndexName := '';
  ClrMemTable1.Filter := '';
  ClrMemTable1.FilterOptions := [];
  ClrMemTable1.Filtered := False;
  ContentModified;
end;

procedure TfrmMainDemo.btnSaveToFileClick(Sender: TObject);
begin
  if dlgSave1.Execute then
    ClrMemTable1.WriteXml(dlgSave1.FileName);
end;

procedure TfrmMainDemo.ContentModified;
begin
  LoadFields;
  lstFields.ItemIndex := 0;
  lstFieldsClick(nil);

  LoadIndexes;
  lstIndexes.ItemIndex := 1;
  lstIndexesClick(nil);
end;

{------------------------------------------------------------------------------}
{ Fields                                                                       }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnFldAddClick(Sender: TObject);
var
  fieldDef: TFieldDef;
begin
  ClrMemTable1.Close;
  fieldDef := ClrMemTable1.FieldDefs.AddFieldDef;
  try
    with fieldDef do
    begin
      Name := edtFldName.Text;
      if cbFldDataType.ItemIndex <> -1 then
        DataType := TFieldType(cbFldDataType.ItemIndex);
      if edtFldSize.Text <> '' then
        Size := StrToInt(edtFldSize.Text);
      if edtFldPrec.Text <> '' then
        Precision := StrToInt(edtFldPrec.Text);
      if chkFldRequired.Checked then
        Attributes := Attributes + [faRequired];
      if chkFldReadOnly.Checked then
        Attributes := Attributes + [faReadOnly];
    end;
  except
    fieldDef.Free;
    raise;
  end;
  ClrMemTable1.Open;
  LoadFields;
end;

procedure TfrmMainDemo.btnFldDelClick(Sender: TObject);
begin
  if lstFields.ItemIndex >= 0 then
  begin
    ClrMemTable1.Close;
    ClrMemTable1.FieldDefs[lstFields.ItemIndex].Free;
    ClrMemTable1.Open;
    LoadFields;
  end;
end;

procedure TfrmMainDemo.btnFldModClick(Sender: TObject);
begin
  if lstFields.ItemIndex >= 0 then
  begin
    ClrMemTable1.Close;
    with ClrMemTable1.FieldDefs[lstFields.ItemIndex] do begin
      Name := edtFldName.Text;
      if cbFldDataType.ItemIndex <> -1 then
        DataType := TFieldType(cbFldDataType.ItemIndex);
      if edtFldSize.Text <> '' then
        Size := StrToInt(edtFldSize.Text);
      if edtFldPrec.Text <> '' then
        Precision := StrToInt(edtFldPrec.Text);
      if chkFldRequired.Checked then
        Attributes := Attributes + [faRequired]
      else
        Attributes := Attributes - [faRequired];
      if chkFldReadOnly.Checked then
        Attributes := Attributes + [faReadOnly]
      else
        Attributes := Attributes - [faReadOnly];
    end;
    ClrMemTable1.Open;
    LoadFields;
  end;
end;

procedure TfrmMainDemo.lstFieldsClick(Sender: TObject);
begin
  LoadField;
end;

procedure TfrmMainDemo.LoadFields;
var
  i, j: Integer;
begin
  j := lstFields.ItemIndex;
  lstFields.Items.Clear;
  if ClrMemTable1.Active then
  begin
    if not ClrMemTable1.FieldDefs.Updated then
      ClrMemTable1.FieldDefs.Update;
    for i := 0 to ClrMemTable1.FieldDefs.Count - 1 do
      lstFields.Items.Add(ClrMemTable1.FieldDefs[i].Name);
  end;
  if j >= lstFields.Items.Count then
    j := lstFields.Items.Count - 1;
  lstFields.ItemIndex := j;
  LoadField;
end;

procedure TfrmMainDemo.LoadField;
begin
  if lstFields.ItemIndex >= 0 then
    with ClrMemTable1.FieldDefs[lstFields.ItemIndex] do
    begin
      edtFldName.Text := Name;
      cbFldDataType.ItemIndex := Integer(DataType);
      edtFldSize.Text := IntToStr(Size);
      edtFldPrec.Text := IntToStr(Precision);
      chkFldRequired.Checked := faRequired in Attributes;
      chkFldReadOnly.Checked := faReadonly in Attributes;
    end
  else
  begin
    edtFldName.Text := '';
    cbFldDataType.ItemIndex := -1;
    edtFldSize.Text := '';
    edtFldPrec.Text := '';
    chkFldRequired.State := cbGrayed;
    chkFldReadOnly.State := cbGrayed;
  end;
end;

{------------------------------------------------------------------------------}
{ Indexes                                                                     }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.dbgrd1TitleClick(Column: TColumn);
var
  S: String;
  ind: TIndexDef;
begin
  S := 'By_' + Column.FieldName;
  ind := TIndexDef(TDefCollection(ClrMemTable1.IndexDefs).Find(S));
  if ind = nil then
  begin
    ind := ClrMemTable1.IndexDefs.AddIndexDef;
    ind.Name := S;
    ind.Fields := Column.FieldName;
  end
  else
  begin
    if ixDescending in ind.Options then
      ind.Options := ind.Options - [ixDescending]
    else
      ind.Options := ind.Options + [ixDescending];
  end;
  ClrMemTable1.IndexName := S;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndAddClick(Sender: TObject);
var
  opts: TIndexOptions;
  indexDef: TIndexDef;
begin
  indexDef := ClrMemTable1.IndexDefs.AddIndexDef;
  try
    with indexDef do
    begin
      Name := 'By_'+ edtIndName.Text;
      if edtIndName.Text <> '' then
      begin
        Fields := edtIndFields.Text;
        CaseInsFields := edtIndInsFields.Text;
        DescFields := edtIndDescFields.Text;
      end
      else if edtIndExpression.Text <> '' then
        Expression := edtIndExpression.Text;
      opts := [];
      if chkIndPrimary.Checked then
        Include(opts, ixPrimary);
      if chkIndUnique.Checked then
        Include(opts, ixUnique);
      if chkIndDesc.Checked then
        Include(opts, ixDescending);
      if chkIndNoCase.Checked then
        Include(opts, ixCaseInsensitive);
      Options := opts;
  //    Filter := edtIndFilter.Text;
    end;
  except
    indexDef.Free;
    raise;
  end;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndDelClick(Sender: TObject);
begin
  if lstIndexes.ItemIndex > 0 then
    ClrMemTable1.IndexDefs.Find(lstIndexes.Items[lstIndexes.ItemIndex]).Free;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndModClick(Sender: TObject);
var
  opts: TIndexOptions;
  oInd: TIndexDef;
begin
  if lstIndexes.ItemIndex > 0 then
  begin
    oInd := ClrMemTable1.IndexDefs.Find(lstIndexes.Items[lstIndexes.ItemIndex]);
    with oInd do
    begin
      ClrMemTable1.IndexDefs.BeginUpdate;
      Name := edtIndName.Text;
      if edtIndName.Text <> '' then
      begin
        Fields := edtIndFields.Text;
        CaseInsFields := edtIndInsFields.Text;
        DescFields := edtIndDescFields.Text;
      end
      else if edtIndExpression.Text <> '' then
        Expression := edtIndExpression.Text;
      opts := [];
      if chkIndPrimary.Checked then
        Include(opts, ixPrimary);
      if chkIndUnique.Checked then
        Include(opts, ixUnique);
      if chkIndDesc.Checked then
        Include(opts, ixDescending);
      if chkIndNoCase.Checked then
        Include(opts, ixCaseInsensitive);
      Options := opts;
      ClrMemTable1.IndexDefs.EndUpdate;
    end;
    LoadIndexes;
  end;
end;

procedure TfrmMainDemo.btnIndClearAllClick(Sender: TObject);
begin
  ClrMemTable1.IndexDefs.Clear;
  LoadIndexes;
end;

procedure TfrmMainDemo.lstIndexesClick(Sender: TObject);
begin
  LoadIndex;
end;

procedure TfrmMainDemo.lstIndexesDblClick(Sender: TObject);
begin
  if lstIndexes.ItemIndex > 0 then
    ClrMemTable1.IndexName := lstIndexes.Items[lstIndexes.ItemIndex]
  else
  begin
    ClrMemTable1.IndexName := '';
    ClrMemTable1.IndexFieldNames := '';
  end;
end;

procedure TfrmMainDemo.LoadIndexes;
var
  i, j: Integer;
begin
  j := lstIndexes.ItemIndex;
  lstIndexes.Items.Clear;
  lstIndexes.Items.Add('<as is>');
  for i := 0 to ClrMemTable1.IndexDefs.Count - 1 do
    lstIndexes.Items.Add(ClrMemTable1.IndexDefs[i].Name);
  if j >= lstIndexes.Items.Count then
    j := lstIndexes.Items.Count - 1;
  lstIndexes.ItemIndex := j;
  LoadIndex;
end;

procedure TfrmMainDemo.LoadIndex;
begin
  if lstIndexes.ItemIndex > 0 then
    with ClrMemTable1.IndexDefs.Find(lstIndexes.Items[lstIndexes.ItemIndex]) do
    begin
      edtIndName.Text := Name;
      edtIndFields.Text := Fields;
      edtIndInsFields.Text := CaseInsFields;
      edtIndDescFields.Text := DescFields;
      edtIndExpression.Text := Expression;
      chkIndPrimary.Checked := ixPrimary in Options;
      chkIndUnique.Checked := ixUnique in Options;
      chkIndDesc.Checked := ixDescending in Options;
      chkIndNoCase.Checked := ixCaseInsensitive in Options;
    end
  else
  begin
    edtIndName.Text := '';
    edtIndFields.Text := '';
    edtIndInsFields.Text := '';
    edtIndDescFields.Text := '';
    edtIndExpression.Text := '';
    chkIndPrimary.State := cbGrayed;
    chkIndUnique.State := cbGrayed;
    chkIndDesc.State := cbGrayed;
    chkIndNoCase.State := cbGrayed;
  end;
end;

{------------------------------------------------------------------------------}
{ Filtering                                                                    }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.UpdateFilter;
begin
  ClrMemTable1.Filter := edtFltExp.Text;
end;

procedure TfrmMainDemo.chkFltActiveClick(Sender: TObject);
begin
  UpdateFilter;
  ClrMemTable1.Filtered := chkFltActive.Checked;
end;

procedure TfrmMainDemo.btnFltFirstClick(Sender: TObject);
begin
  UpdateFilter;
  chkFltFound.Checked := ClrMemTable1.FindFirst;
end;

procedure TfrmMainDemo.btnFltLastClick(Sender: TObject);
begin
  UpdateFilter;
  chkFltFound.Checked := ClrMemTable1.FindLast;
end;

procedure TfrmMainDemo.btnFltNextClick(Sender: TObject);
begin
  UpdateFilter;
  chkFltFound.Checked := ClrMemTable1.FindNext;
end;

procedure TfrmMainDemo.btnFltPrevClick(Sender: TObject);
begin
  UpdateFilter;
  chkFltFound.Checked := ClrMemTable1.FindPrior;
end;


end.
