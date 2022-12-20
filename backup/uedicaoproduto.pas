unit uEdicaoProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  DBCtrls;

type

  { TFEdicaoProduto }

  TFEdicaoProduto = class(TForm)
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    DBchave: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBMemo1: TDBMemo;
    DBnome: TDBEdit;
    DBnome1: TDBEdit;
    DBnome2: TDBEdit;
    DBnome3: TDBEdit;
    DBnome4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  FEdicaoProduto: TFEdicaoProduto;

implementation

uses uDM;

{$R *.lfm}

{ TFEdicaoProduto }

procedure TFEdicaoProduto.btnSalvarClick(Sender: TObject);
begin
  if (DBnome.Text <> '') then
  begin
    DM.TProdutos.Post;
    DM.TProdutos.ApplyUpdates;
    btnCancelar.Enabled:=False;
    Close;
  end
  else
  begin
    ShowMessage('Preencha o campo código de barras.');
    DBnome.SetFocus;
  end;
end;

procedure TFEdicaoProduto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if (btnCancelar.Enabled) then
  begin
    DM.TClientes.Cancel;
  end;
end;

procedure TFEdicaoProduto.btnCancelarClick(Sender: TObject);
begin
  DM.TProdutos.Cancel;
  btnCancelar.Enabled:=False;
  Close;
end;

end.

