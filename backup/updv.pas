unit uPDV;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DBGrids, DBCtrls;

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
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  FPDV: TFPDV;

implementation

uses uDM;

{$R *.lfm}

{ TFPDV }

procedure TFPDV.Label3Click(Sender: TObject);
begin

end;

end.

