unit uMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, StdCtrls, ZDataset;

type

  { TFMenu }

  TFMenu = class(TForm)
    btnPDV: TSpeedButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    btnCadastroClientes: TSpeedButton;
    btnCadastroProduto: TSpeedButton;
    QUltimaChaveVenda: TZQuery;
    QUltimaChaveVendaADD: TLargeintField;
    procedure Abrir_Tela_CadastroCliente();
    procedure Abrir_Tela_CadastroProduto();
    procedure Abrir_Tela_PDV();
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnPDVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnCadastroProdutoClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  FMenu: TFMenu;

implementation

uses uDM, uCadastroCliente, uCadastroProduto, uPDV;

{$R *.lfm}

{ TFMenu }

procedure TFMenu.Abrir_Tela_CadastroCliente;
begin
  FCadastroCliente := TFCadastroCliente.Create(Self);
  FCadastroCliente.ShowModal;
end;

procedure TFMenu.Abrir_Tela_CadastroProduto;
begin
  FCadastroProduto := TFCadastroProduto.Create(Self);
  FCadastroProduto.ShowModal;
end;

procedure TFMenu.Abrir_Tela_PDV;
begin
  FPDV := TFPDV.Create(Self);
  FPDV.ShowModal;
end;

procedure TFMenu.btnCadastroClientesClick(Sender: TObject);
begin
  Abrir_Tela_CadastroCliente();
end;

procedure TFMenu.btnPDVClick(Sender: TObject);
begin
  QUltimaChaveVenda.Close;
  QUltimaChaveVenda.Open;
  DM.TVenda.Insert;
  DM.TVendaCHAVE.Value := QUltimaChaveVendaADD.Value;
  DM.TVendaDATA.Value := Date;
  DM.TVendaHORARIO.Value := Time;
  DM.TVendaNUMERO.Value := QUltimaChaveVendaADD.Value;
  Abrir_Tela_PDV();
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
  DM.TClientes.Open;
  DM.TProdutos.Open;
  DM.TVenda.Open;
  DM.TItemVenda.Open;
  DM.TContaAReceber.Open;
end;

procedure TFMenu.MenuItem2Click(Sender: TObject);
begin
  Abrir_Tela_CadastroCliente();
end;

procedure TFMenu.btnCadastroProdutoClick(Sender: TObject);
begin
  Abrir_Tela_CadastroProduto();
end;

procedure TFMenu.MenuItem3Click(Sender: TObject);
begin
  Abrir_Tela_CadastroProduto();
end;

end.

