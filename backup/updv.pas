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
    QUltimaChaveContaAReceberADD: TLargeintField;
    QUltimaChaveItemVendaADD: TLargeintField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QUltimaChaveItemVenda: TZQuery;
    QUltimaChaveContaAReceber: TZQuery;
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
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
end;

procedure TFPDV.btnEditarItemClick(Sender: TObject);
begin
  inserindo_novo_item := False;
  DM.TItemVenda.Edit;
  FEdicaoItemVenda := TFEdicaoItemVenda.Create(Self);
  FEdicaoItemVenda.ShowModal;
end;

end.

