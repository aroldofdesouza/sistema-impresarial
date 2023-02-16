unit uContasAReceber;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids, Buttons, Menus, ZDataset, DateTimePicker;

type

  { TFContasAReceber }

  TFContasAReceber = class(TForm)
    btnBuscar: TSpeedButton;
    ComboBox1: TComboBox;
    DSContasAReceber: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    TContasAReceberCHAVE: TLongintField;
    TContasAReceberCHAVE_CLIENTE: TLongintField;
    TContasAReceberCHAVE_VENDA: TLongintField;
    TContasAReceberDATA_PAGAMEMTO: TDateField;
    TContasAReceberDATA_VENCIMENTO: TDateField;
    TContasAReceberSTATUS: TStringField;
    TContasAReceberVALOR: TFloatField;
    txtValorTotalListado: TLabel;
    TContasAReceber: TZTable;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private

  public

  end;

var
  FContasAReceber: TFContasAReceber;

implementation

uses uDM;

{$R *.lfm}

{ TFContasAReceber }

procedure TFContasAReceber.FormCreate(Sender: TObject);
begin

end;

procedure TFContasAReceber.FormShow(Sender: TObject);
begin
  btnBuscar.Click;
end;

procedure TFContasAReceber.MenuItem1Click(Sender: TObject);
begin
  TContasAReceber.Edit;
  TContasAReceberSTATUS.Value:= 'PAGO';
  TContasAReceber.Post;
  TContasAReceber.ApplyUpdates;

  DM.TContaAReceber.Close;
  DM.TContaAReceber.Open;
end;

procedure TFContasAReceber.btnBuscarClick(Sender: TObject);
var
  valor_total: Double;
begin
  TContasAReceber.Open;
  TContasAReceber.Filter := 'DATA_VENCIMENTO >= '+QuotedStr(DateTimeToStr(DateTimePicker1.Date))+' AND DATA_VENCIMENTO <= '+QuotedStr(DateTimeToStr(DateTimePicker2.Date));
  if (ComboBox1.ItemIndex = 1) then
  begin
    TContasAReceber.Filter := TContasAReceber.Filter + 'AND STATUS = '+QuotedStr('PAGO');
  end else
    if (ComboBox1.ItemIndex = 2) then
  begin
    TContasAReceber.Filter := TContasAReceber.Filter + 'AND STATUS = '+QuotedStr('PENDENTE');
  end;

    TContasAReceber.Filtered := true;

    valor_total:=0;
    TContasAReceber.First;
    while not(TContasAReceber.EOF) do
    begin
      valor_total := valor_total + TContasAReceberVALOR.Value;
      TContasAReceber.Next;
    end;

    txtValorTotalListado.Caption := 'Valor Total Listado: '+FormatFloat('R$###,###,##0.00',valor_total);

end;

procedure TFContasAReceber.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DM.TContaAReceber.Filtered := false;
end;

end.

