unit uCadastroProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, ZDataset;

type

  { TFCadastroProduto }

  TFCadastroProduto = class(TForm)
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnInserir: TSpeedButton;
    DBGrid1: TDBGrid;
    EdtBusca: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    QUltimaChaveProduto: TZQuery;
    QUltimaChaveProdutoADD: TLargeintField;
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EdtBuscaChange(Sender: TObject);
  private

  public

  end;

var
  FCadastroProduto: TFCadastroProduto;

implementation

uses uDM, uEdicaoProduto;

{$R *.lfm}

{ TFCadastroProduto }

procedure TFCadastroProduto.btnInserirClick(Sender: TObject);
begin
  DM.TProdutos.Filtered:=False;
  QUltimaChaveProduto.Close;
  QUltimaChaveProduto.Open;
  DM.TProdutos.Insert;
  DM.TProdutosCHAVE.Value:=QUltimaChaveProdutoADD.Value;
  FEdicaoProduto := TFEdicaoProduto.Create(Self);
  FEdicaoProduto.ShowModal;
end;

procedure TFCadastroProduto.EdtBuscaChange(Sender: TObject);
begin
  DM.TProdutos.Filter:='NOME LIKE' + QuotedStr('*'+EdtBusca.Text+'*');
  DM.TProdutos.Filtered:=True;
end;

procedure TFCadastroProduto.btnEditarClick(Sender: TObject);
begin
  DM.TProdutos.Filtered:=False;
  DM.TProdutos.Edit;
  FEdicaoProduto := TFEdicaoProduto.Create(Self);
  FEdicaoProduto.ShowModal;
end;

procedure TFCadastroProduto.btnExcluirClick(Sender: TObject);
begin
  DM.TProdutos.Delete;
  DM.TProdutos.ApplyUpdates;
end;

end.

