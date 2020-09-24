unit ADONetUtils;

interface

type
  TADONetUtility = class
  public
    class function IsAppDirectoryExist: Boolean;
    class function GetAppDirectory: string; static;
    class function GetMSAccessDBFile: string; static;
    class function GetXMLDataFile: string; static;
    class function GetCSVDataFileLocation: string; static;
    class function GetExcelDataFile: string; static;
    class function GetSQLiteFile: string; static;
    class function GetVistaDBFile: string; static;
  end;

implementation

uses System.Win.Registry, Windows, SysUtils, CNClrLib.ADONet.Consts;

const
  C_AppReg = 'Software\CrystalNet Technologies\ADO.Net VCL for Delphi\';

class function TADONetUtility.IsAppDirectoryExist: Boolean;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_READ);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    Result := reg.KeyExists(C_AppReg);
  finally
    reg.free;
  end;
end;

class function TADONetUtility.GetAppDirectory: string;
var
  reg: TRegistry;
begin
  Result := '';
  reg := TRegistry.Create(KEY_READ);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if not reg.KeyExists(C_AppReg) then
      Exit;

    reg.OpenKey(C_AppReg, False);
    Result := reg.ReadString('RootDir');
  finally
    reg.free;
  end;
end;

class function TADONetUtility.GetMSAccessDBFile: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\MSAccess\dbdemos.mdb'
end;

class function TADONetUtility.GetXMLDataFile: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\XML\Customers.xml'
end;

class function TADONetUtility.GetCSVDataFileLocation: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\CSV\'
end;

class function TADONetUtility.GetExcelDataFile: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\Excel\Customers.xlsx'
end;

class function TADONetUtility.GetSQLiteFile: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\SQLite\Northwind.sqlite'
end;

class function TADONetUtility.GetVistaDBFile: string;
begin
  Result := GetAppDirectory + '\Demos\DB\Data\VistaDB\Northwind.vdb5'
end;



end.
