unit uConsultaVendas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, DBGrids, DBDateTimePicker, DateTimePicker;

type

  { TFConsultaVendas }

  TFConsultaVendas = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    txtValorTotalListado: TLabel;
    Panel1: TPanel;
    btnBuscar: TSpeedButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FConsultaVendas: TFConsultaVendas;

implementation

uses uDM;

{$R *.lfm}

{ TFConsultaVendas }

procedure TFConsultaVendas.btnBuscarClick(Sender: TObject);
var
  valor_total_listado : Double;
begin
  DM.TVenda.Filter := 'DATA >= '+QuotedStr(DateTimeToStr(DateTimePicker1.Date))+' AND DATA <= '+QuotedStr(DateTimeToStr(DateTimePicker2.Date));
  DM.TVenda.Filtered := true;

  valor_total_listado := 0;
  DM.TVenda.First;
  while not(DM.TVenda.EOF)do
  begin
    valor_total_listado:= valor_total_listado + DM.TVendaVALOR_TOTAL.Value;
    DM.TVenda.Next;
  end;
  txtValorTotalListado.Caption := 'Valor Total Listado: '+FormatFloat('R$###,###,##0.00', valor_total_listado);
end;

procedure TFConsultaVendas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DM.TVenda.Filtered := false;
end;

procedure TFConsultaVendas.FormShow(Sender: TObject);
begin
  btnBuscar.Click;
end;

end.

