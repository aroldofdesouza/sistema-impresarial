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
    Panel1: TPanel;
    btnBuscar: TSpeedButton;
    procedure btnBuscarClick(Sender: TObject);
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
begin
  DM.TVenda.Filter := 'DATA >= '+QuotedStr(DateTimeToStr(DateTimePicker1.Date))+' AND DATA <= '+QuotedStr(DateTimeToStr(DateTimePicker2.Date));
  DM.TVenda.Filtered := true;
end;

end.

