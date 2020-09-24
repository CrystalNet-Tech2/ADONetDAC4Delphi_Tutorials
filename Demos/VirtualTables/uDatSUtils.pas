unit uDatSUtils;

interface

uses
  SysUtils, Classes, Controls, Variants, StdCtrls, CNClrLib.ADONetWrapper.Intf,
  CNClrLib.ADONetWrapper.EnumTypes, CNClrLib.ADONet.Client;

  procedure PrintHeader(ATab: _DataTable; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False);
  procedure PrintRow(ARow: _DataRow; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRow(ARow: _DataRow; AConsole: TStrings;
    ARowVer: TDataRowVersion; const ALabel: String = '';
    AWithState: Boolean = False); overload;
  procedure PrintRows(ATab: _DataTable; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRows(ATab: TClrDataTable; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRows(ARows: _DataRowArray; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRows(AView: _DataView; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRowVersion(ARow: _DataRow; AConsole: TStrings);
  procedure PrintRowStates(ATab: _DataTable; AConsole: TStrings; const ALabel: String = '');

implementation

uses DB, CNClrLib.ADONetWrapper.Enums, CNClrLib.ADONetWrapper.EnumArrays;

function GetRowStateAsString(ARowState: DataRowState): string;
begin
  case ARowState of
    DataRowState_Detached: Result := 'drsDetached';
    DataRowState_Unchanged: Result := 'drsUnchanged';
    DataRowState_Added: Result := 'drsAdded';
    DataRowState_Deleted: Result := 'drsDeleted';
    DataRowState_Modified: Result := 'drsModified';
  else
    Result := '';
  end;
end;

function GetRowVersionAsString(ADataVersion: DataRowVersion): string;
begin
  case ADataVersion of
    DataRowVersion_Original: Result := 'drvOriginal';
    DataRowVersion_Current: Result := 'drvCurrent';
    DataRowVersion_Proposed: Result := 'drvProposed';
    DataRowVersion_Default: Result := 'drvDefault';
  else
    Result := '';
  end;
end;

function PadVal(AColumn: _DataColumn; const AVal: String): String;
var
  iDispWidth: Integer;
begin
  iDispWidth := AColumn.MaxLength;
  if iDispWidth < Length(AColumn.Caption) then
    iDispWidth := Length(AColumn.Caption)
  else if iDispWidth > 25 then
    iDispWidth := 25;
  if Length(AVal) > iDispWidth then
    Result := Copy(AVal, 1, iDispWidth - 4) + ' ...'
  else
    Result := AVal;
  if DotNetTypeToFieldType(AColumn.DataType) in [ftString, ftWideString,
                                                 ftBlob, ftMemo, ftWideMemo,
                                                 ftFmtMemo] then
    Result := Result + StringOfChar(' ', iDispWidth - Length(Result))
  else
    Result := StringOfChar(' ', iDispWidth - Length(Result)) + Result;
end;

procedure PrintHeader(ATab: _DataTable; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
  s: String;
begin
  if ALabel <> '' then
    AConsole.Add(ALabel);
  with ATab do begin
    if AWithState then
      s := 'State      '
    else
      s := '';
    for i := 0 to Columns.Count - 1 do
      s := s + '  ' + PadVal(Columns[i], Columns[i].ColumnName);
    AConsole.Add(s);
  end;
end;

procedure PrintRow(ARow: _DataRow; AConsole: TStrings; ARowVer: TDataRowVersion;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  c: Integer;
  s: String;
begin
  if ALabel <> '' then
    AConsole.Add(ALabel);
  if AWithState then begin
    s := GetRowStateAsString(ARow.RowState);
    if Length(s) < 11 then
      s := s + StringOfChar(' ', 11 - Length(s));
  end
  else
    s := '';
  for c := 0 to ARow.Table.Columns.Count - 1 do
    if DotNetTypeToFieldType(ARow.Table.Columns[c].DataType) <> ftTime then
      s := s + '  ' + PadVal(ARow.Table.Columns[c], VarToStr(ARow.Item_3[c, DataRowVersionValues[ARowVer]]))
    else
      s := s + '  ' + PadVal(ARow.Table.Columns[c], TimeToStr(VarAsType(ARow.Item_3[c, DataRowVersionValues[ARowVer]], varDate)));
  AConsole.Add(s);
end;

procedure PrintRow(ARow: _DataRow; AConsole: TStrings; const ALabel: String = '';
  AWithState: Boolean = False);
begin
  PrintRow(ARow, AConsole, drvDefault, ALabel, AWithState);
end;

procedure PrintRows(ATab: _DataTable; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
begin
  PrintHeader(ATab, AConsole, ALabel, AWithState);
  with ATab do
    for i := 0 to Rows.Count - 1 do
      PrintRow(Rows[i], AConsole, '', AWithState);
  AConsole.Add('');
end;

procedure PrintRows(ATab: TClrDataTable; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False); overload;
begin
  PrintRows(ATab.DataTable, AConsole, ALabel, AWithState);
end;

procedure PrintRows(AView: _DataView; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
begin
  PrintHeader(AView.Table, AConsole, ALabel, AWithState);
  with AView do
    for i := 0 to Count - 1 do
      PrintRow(Item[i].Row, AConsole, '', AWithState);
  AConsole.Add('');
end;

procedure PrintRows(ARows: _DataRowArray; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
  oTab: _DataTable;
begin
  if ARows.Length = 0 then
    Exit;

  oTab := ARows[0].Table;
  PrintHeader(oTab, AConsole, ALabel, AWithState);
  for i := 0 to ARows.Length - 1 do
    PrintRow(ARows[i], AConsole, '', AWithState);
  AConsole.Add('');
end;

procedure PrintRowVersion(ARow: _DataRow; AConsole: TStrings);
var
  oTab: _DataTable;
  oRowVer: TDataRowVersion;
  oRowVerEnum: DataRowVersion;
begin
  oTab := ARow.Table;
  for oRowVer := Low(TDataRowVersion) to High(TDataRowVersion) do
  begin
    oRowVerEnum := DataRowVersionValues[oRowVer];
    if oTab.Select_3('', '', oRowVerEnum).Length > 0 then
    begin
      PrintRow(ARow, AConsole, oRowVer, 'Row version is ' + GetRowVersionAsString(oRowVerEnum));
    end;
  end;
end;

procedure PrintRowStates(ATab: _DataTable; AConsole: TStrings; const ALabel: String = '');
var
  i: Integer;
begin
  if ALabel = '' then
    AConsole.Add('Row states...')
  else
    AConsole.Add(ALabel);
  for i := 0 to ATab.Rows.Count - 1 do
    AConsole.Add(GetRowStateAsString(ATab.Rows[i].RowState));
end;

end.
