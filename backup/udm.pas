unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSClientes: TDataSource;
    ZConnection1: TZConnection;
    TClientes: TZTable;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

