unit uPDV;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBGrids, DBCtrls, ZDataset;

type

  { TFPDV }

  TFPDV = class(TForm)
    btnEditarItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnInserirItem: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    btnGerarParcelas: TSpeedButton;
    btnConcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    QSomaItensSUM: TFloatField;
    QUltimaChaveContaAReceberADD: TLargeintField;
    QUltimaChaveItemVendaADD: TLargeintField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QUltimaChaveItemVenda: TZQuery;
    QUltimaChaveContaAReceber: TZQuery;
    QSomaItens: TZQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  FPDV: TFPDV;
  inserindo_novo_item: Boolean;

implementation

uses uDM, uEdicaoItemVenda;

{$R *.lfm}

{ TFPDV }

procedure TFPDV.Label3Click(Sender: TObject);
begin

end;

procedure TFPDV.btnInserirItemClick(Sender: TObject);
begin
  inserindo_novo_item := True;
  QUltimaChaveItemVenda.Close;
  QUltimaChaveItemVenda.Open;
  DM.TItemVenda.Insert;
  DM.TItemVendaCHAVE.Value:=QUltimaChaveItemVendaADD.Value;
  DM.TItemVendaCHAVE_VENDA.Value := DM.TVendaCHAVE.Value;
  FEdicaoItemVenda := TFEdicaoItemVenda.Create(Self);
  FEdicaoItemVenda.ShowModal;

  QSomaItens.Close;
  QSomaItens.ParamByName('chavevenda').Value := DM.TVendaCHAVE.Value;
  QSomaItens.Open;
  DM.TVendaVALOR_TOTAL.Value := QSomaItensSUM.Value;
end;

procedure TFPDV.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if (btnCancelar.Enabled = False) then
  begin
    DM.TVenda.Cancel;
  end;
end;

procedure TFPDV.btnEditarItemClick(Sender: TObject);
begin
  inserindo_novo_item := False;
  DM.TItemVenda.Edit;
  FEdicaoItemVenda := TFEdicaoItemVenda.Create(Self);
  FEdicaoItemVenda.ShowModal;

  QSomaItens.Close;
  QSomaItens.ParamByName('chavevenda').Value := DM.TVendaCHAVE.Value;
  QSomaItens.Open;
  DM.TVendaVALOR_TOTAL.Value := QSomaItensSUM.Value;
end;

procedure TFPDV.btnCancelarClick(Sender: TObject);
begin
  btnCancelar.Enabled := False;
  DM.TVenda.Cancel;
  Close;
end;

procedure TFPDV.btnConcluirClick(Sender: TObject);
begin
  btnCancelar.Enabled := False;

  //Baixar estoque
  DM.TItemVenda.First;
  while not (DM.TItemVenda.EOF) do
  begin
    if (DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[])) then
    begin
      DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[]);
      DM.TProdutos.Edit;
      DM.TProdutosESTOQUE.Value := DM.TProdutosESTOQUE.Value - DM.TItemVendaQUANTIDADE.Value;
      DM.TProdutos.Post;
      DM.TProdutos.ApplyUpdates;
    end;
    DM.TItemVenda.Next;
  end;

  DM.TVenda.Post;
  DM.TVenda.ApplyUpdates;
  Close;
end;

procedure TFPDV.btnExcluirItemClick(Sender: TObject);
begin
  DM.TItemVenda.Delete;
  DM.TItemVenda.ApplyUpdates;

  QSomaItens.Close;
  QSomaItens.ParamByName('chavevenda').Value := DM.TVendaCHAVE.Value;
  QSomaItens.Open;
  DM.TVendaVALOR_TOTAL.Value := QSomaItensSUM.Value;
end;

procedure TFPDV.btnGerarParcelasClick(Sender: TObject);
var
  valor_parcela: Double;
  parcelas_lancadas: Integer;
  data_vencimento: String;
  mes, ano: Integer;
begin
  DM.TContaAReceber.First;
  while not(DM.TContaAReceber.EOF) do
  begin
    DM.TContaAReceber.Delete;
    DM.TContaAReceber.ApplyUpdates;
  end;

  if (DM.TVendaQUANTIDADE_PARCELAS.Value > 0) then
  begin
    valor_parcela := (DM.TVendaVALOR_TOTAL.Value - DM.TVendaVALOR_PAGO_ENTRADA.Value) / DM.TVendaQUANTIDADE_PARCELAS.Value;
  end;

  if (DM.TVendaVALOR_PAGO_ENTRADA.Value >0) then
  begin
    QUltimaChaveContaAReceber.Close;
    QUltimaChaveContaAReceber.Open;
    DM.TContaAReceber.Insert;
    DM.TContaAReceberCHAVE.Value := QUltimaChaveContaAReceberADD.Value;
    DM.TContaAReceberCHAVE_CLIENTE.Value:= DM.TVendaCLIENTE.Value;
    DM.TContaAReceberCHAVE_VENDA.Value := DM.TVendaCHAVE.Value;
    DM.TContaAReceberDATA_PAGAMEMTO.Value := DM.TVendaDATA.Value;
    DM.TContaAReceberDATA_VENCIMENTO.Value:= DM.TVendaDATA.Value;
    DM.TContaAReceberSTATUS.Value := 'PAGO';
    DM.TContaAReceberVALOR.Value := DM.TVendaVALOR_PAGO_ENTRADA.Value;
    DM.TContaAReceber.Post;
    DM.TContaAReceber.ApplyUpdates;
  end;

  mes := StrToInt(FormatDateTime('MM', DM.TVendaDATA.Value));
  ano := StrToInt(FormatDateTime('YYYY', DM.TVendaDATA.Value));
  parcelas_lancadas := 0;
  while (parcelas_lancadas < DM.TVendaQUANTIDADE_PARCELAS.Value) do
  begin
    if (mes = 12) then
    begin
      mes := 1;
      ano := ano + 1;
    end else
    begin
      mes := mes + 1;
    end;
    data_vencimento:= DM.TVendaDIA_DO_MES_PRA_VENCER.AsString+'/'+IntToStr(mes)+'/'+IntToStr(ano);

    QUltimaChaveContaAReceber.Close;
    QUltimaChaveContaAReceber.Open;
    DM.TContaAReceber.Insert;
    DM.TContaAReceberCHAVE.Value := QUltimaChaveContaAReceberADD.Value;
    DM.TContaAReceberCHAVE_CLIENTE.Value:= DM.TVendaCLIENTE.Value;
    DM.TContaAReceberCHAVE_VENDA.Value := DM.TVendaCHAVE.Value;
    DM.TContaAReceberDATA_VENCIMENTO.Value:= StrToDateTime(data_vencimento);
    DM.TContaAReceberSTATUS.Value := 'PENDENTE';
    DM.TContaAReceberVALOR.Value := valor_parcela;
    DM.TContaAReceber.Post;
    DM.TContaAReceber.ApplyUpdates;

    parcelas_lancadas:= parcelas_lancadas +1;

  end;

end;

end.

