unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    DSVenda: TDataSource;
    DSItemVenda: TDataSource;
    DSContaAReceber: TDataSource;
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
    TContaAReceberCHAVE: TLongintField;
    TContaAReceberCHAVE_CLIENTE: TLongintField;
    TContaAReceberCHAVE_VENDA: TLongintField;
    TContaAReceberDATA_PAGAMEMTO: TDateField;
    TContaAReceberDATA_VENCIMENTO: TDateField;
    TContaAReceberSTATUS: TStringField;
    TContaAReceberVALOR: TFloatField;
    TItemVendaCHAVE: TLongintField;
    TItemVendaCHAVE_PRODUTO: TLongintField;
    TItemVendaCHAVE_VENDA: TLongintField;
    TItemVendaPRECO_UNITARIO: TFloatField;
    TItemVendaQUANTIDADE: TFloatField;
    TItemVendaVALOR_TOTAL: TFloatField;
    TProdutosCHAVE: TLongintField;
    TProdutosCODIGOBARRAS: TStringField;
    TProdutosDESCRICAO: TStringField;
    TProdutosESTOQUE: TFloatField;
    TProdutosOBSERVACAO: TStringField;
    TProdutosPRECO_COMPRA: TFloatField;
    TProdutosPRECO_VENDA: TFloatField;
    TProdutosUNIDADE: TStringField;
    TVendaCHAVE: TLongintField;
    TVendaCLIENTE: TLongintField;
    TVendaDATA: TDateField;
    TVendaDIA_DO_MES_PRA_VENCER: TLongintField;
    TVendaHORARIO: TTimeField;
    TVendaNUMERO: TLongintField;
    TVendaQUANTIDADE_PARCELAS: TLongintField;
    TVendaVALOR_PAGO_ENTRADA: TFloatField;
    TVendaVALOR_TOTAL: TFloatField;
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

