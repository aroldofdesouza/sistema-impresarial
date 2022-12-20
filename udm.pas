unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSProdutos: TDataSource;
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
    TProdutosCHAVE: TLongintField;
    TProdutosCODIGOBARRAS: TStringField;
    TProdutosDESCRICAO: TStringField;
    TProdutosESTOQUE: TFloatField;
    TProdutosOBSERVACAO: TStringField;
    TProdutosPRECO_COMPRA: TFloatField;
    TProdutosPRECO_VENDA: TFloatField;
    TProdutosUNIDADE: TStringField;
    ZConnection1: TZConnection;
    TClientes: TZTable;
    TProdutos: TZTable;
    TVenda: TZTable;
    TItemVenda: TZTable;
    TContaAReceber: TZTable;
  private

  public

  end;

var
  DM: TDM;

implementation


{$R *.lfm}

end.

