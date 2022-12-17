unit uCadastroCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, ZDataset;

type

  { TFCadastroCliente }

  TFCadastroCliente = class(TForm)
    DBGrid1: TDBGrid;
    EdtBusca: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnInserir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    QUltimaChaveCliente: TZQuery;
    QUltimaChaveClienteADD: TLargeintField;
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EdtBuscaChange(Sender: TObject);
  private

  public

  end;

var
  FCadastroCliente: TFCadastroCliente;

implementation

uses uDM, uEdicaoCliente;

{$R *.lfm}

{ TFCadastroCliente }

procedure TFCadastroCliente.btnInserirClick(Sender: TObject);
begin
  DM.TClientes.Filtered:=False;
  QUltimaChaveCliente.Close;
  QUltimaChaveCliente.Open;
  DM.TClientes.Insert;
  DM.TClientesCHAVE.Value:=QUltimaChaveClienteADD.Value;
  FEdicaoCliente := TFEdicaoCliente.Create(Self);
  FEdicaoCliente.ShowModal;
end;

procedure TFCadastroCliente.EdtBuscaChange(Sender: TObject);
begin
  DM.TClientes.Filter:='NOME LIKE' + QuotedStr('*'+EdtBusca.Text+'*');
  DM.TClientes.Filtered:=True;
end;

procedure TFCadastroCliente.btnEditarClick(Sender: TObject);
begin
  DM.TClientes.Filtered:=False;
  DM.TClientes.Edit;
  FEdicaoCliente := TFEdicaoCliente.Create(Self);
  FEdicaoCliente.ShowModal;
end;

procedure TFCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  DM.TClientes.Delete;
  DM.TClientes.ApplyUpdates;
end;

end.

