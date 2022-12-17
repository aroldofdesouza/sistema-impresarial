unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSClientes: TDataSource;
    TClientesBAIRRO: TStringField;
    TClientesCEP: TStringField;
    TClientesCHAVE: TLongintField;
    TClientesCIDADE: TStringField;
    TClientesCOMPLEMENTO: TStringField;
    TClientesCPF_CNPJ: TStringField;
    TClientesEMAIL: TStringField;
    TClientesLOGRADOURO: TStringField;
    TClientesNOME: TStringField;
    TClientesNUMERO: TStringField;
    TClientesOBSERVACAO: TStringField;
    TClientesRG_IE: TStringField;
    TClientesSEXO: TStringField;
    TClientesTELEFONE_1: TStringField;
    TClientesTELEFONE_2: TStringField;
    TClientesTIPO_PESSOA: TStringField;
    TClientesUF: TStringField;
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

