unit uMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons;

type

  { TFMenu }

  TFMenu = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    btnCadastroClientes: TSpeedButton;
  private

  public

  end;

var
  FMenu: TFMenu;

implementation

{$R *.lfm}

end.

