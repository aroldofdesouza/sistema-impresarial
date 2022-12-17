unit uEdicaoCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  DBCtrls;

type

  { TFEdicaoCliente }

  TFEdicaoCliente = class(TForm)
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBchave: TDBEdit;
    DBCBoxSexo: TDBComboBox;
    DBcidade: TDBEdit;
    DBbairro: TDBEdit;
    DBComboBoxUF: TDBComboBox;
    DBMemo1: TDBMemo;
    DBtelefone1: TDBEdit;
    DBemail: TDBEdit;
    DBtelefone2: TDBEdit;
    DBlogradouro: TDBEdit;
    DBnumero: TDBEdit;
    DBcomplemento: TDBEdit;
    DBnome: TDBEdit;
    DBcpf_cnpj: TDBEdit;
    DBrg_ie: TDBEdit;
    DBcep: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBtelefone1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FEdicaoCliente: TFEdicaoCliente;

implementation

uses uDM, uCadastroCliente;

{$R *.lfm}

{ TFEdicaoCliente }

procedure TFEdicaoCliente.DBtelefone1Change(Sender: TObject);
begin

end;

procedure TFEdicaoCliente.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  if (btnCancelar.Enabled) then
  begin
    DM.TClientes.Cancel;
  end;
end;

procedure TFEdicaoCliente.FormShow(Sender: TObject);
begin
  DBnome.SetFocus;
end;

procedure TFEdicaoCliente.btnSalvarClick(Sender: TObject);
begin
  if (DBnome.Text <> '') then
  begin
    DM.TClientes.Post;
    DM.TClientes.ApplyUpdates;
    btnCancelar.Enabled:=False;
    Close;
  end
  esle
  begin
    ShowMessage('Preencha o campo nome.');
    DBnome.SetFocus;
  end;
end;

procedure TFEdicaoCliente.btnCancelarClick(Sender: TObject);
begin
  DM.TClientes.Cancel;
  btnCancelar.Enabled:=False;
  Close;
end;

end.

