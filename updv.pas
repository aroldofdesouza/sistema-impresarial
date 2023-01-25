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

end.

