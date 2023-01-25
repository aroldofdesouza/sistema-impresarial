unit uEdicaoItemVenda;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons;

type

  { TFEdicaoItemVenda }

  TFEdicaoItemVenda = class(TForm)
    btnCancelar: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSalvar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  FEdicaoItemVenda: TFEdicaoItemVenda;

implementation

uses uDM;

{$R *.lfm}

{ TFEdicaoItemVenda }

procedure TFEdicaoItemVenda.btnCancelarClick(Sender: TObject);
begin
  btnCancelar.Enabled:=False;
  DM.TItemVenda.Cancel;
  Close;
end;

procedure TFEdicaoItemVenda.btnSalvarClick(Sender: TObject);
begin
  btnCancelar.Enabled:=False;
  DM.TItemVenda.Post;
  DM.TItemVenda.ApplyUpdates;
  Close;
end;

procedure TFEdicaoItemVenda.DBEdit1Exit(Sender: TObject);
begin
  if (DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[])) then
  begin
    DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[];
    DM.TItemVendaPRECO_UNITARIO.Value := DM.TProdutosPRECO_VENDA.Value;
    DM.TItemVendaVALOR_TOTAL.Value := DM.TItemVendaPRECO_UNITARIO.Value * DM.TItemVendaQUANTIDADE.Value;
  end;

end;

procedure TFEdicaoItemVenda.DBEdit2Exit(Sender: TObject);
begin
  DM.TItemVendaVALOR_TOTAL.Value := DM.TItemVendaPRECO_UNITARIO.Value * DM.TItemVendaQUANTIDADE.Value;
end;

procedure TFEdicaoItemVenda.DBEdit3Exit(Sender: TObject);
begin
  DM.TItemVendaVALOR_TOTAL.Value := DM.TItemVendaPRECO_UNITARIO.Value * DM.TItemVendaQUANTIDADE.Value;
end;

procedure TFEdicaoItemVenda.DBLookupComboBox1Exit(Sender: TObject);
begin
    if (DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[])) then
  begin
    DM.TProdutos.Locate('CHAVE', DM.TItemVendaCHAVE_PRODUTO.Value,[];
    DM.TItemVendaPRECO_UNITARIO.Value := DM.TProdutosPRECO_VENDA.Value;
    DM.TItemVendaVALOR_TOTAL.Value := DM.TItemVendaPRECO_UNITARIO.Value * DM.TItemVendaQUANTIDADE.Value;
  end;
end;

procedure TFEdicaoItemVenda.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if (btnCancelar.Enabled = True) then
  begin
    DM.TItemVenda.Cancel;
  end;
end;

end.

