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

end.

