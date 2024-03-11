unit MainFUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, LogFrameUnit, OSS_CommonInterfaces, ExtCtrls, Menus,
  UserListFrameUnit, ActnList;

type
  TMainF = class(TForm, IAppLog)
    SB1: TStatusBar;
    pnlLog: TPanel;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    pnlActions: TPanel;
    tcMain: TTabControl;
    miFile: TMenuItem;
    Actions1: TMenuItem;
    ActionList1: TActionList;
    actRefreshFromDb: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actRefreshFromDbExecute(Sender: TObject);
  private
    FLogFrame: TLogFrame;
    FUserListFrame: TUserListFrame;
  public
    procedure RefreshFromDb;
    procedure AddLog(const aMsg: string);
    procedure AddLogFmt(const aMsg: string; const aArgs: array of const);
  end;

var
  MainF: TMainF;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TMainF.FormCreate(Sender: TObject);
begin
  // Log
  FLogFrame := TLogFrame.Create(Self);
  FLogFrame.Parent := pnlLog;
  FLogFrame.Align := alClient;
  // User List
  FUserListFrame := TUserListFrame.Create(Self);
  FUserListFrame.Parent := tcMain;
  FUserListFrame.Align := alClient;

  AddLog('Application started!');
end;

procedure TMainF.FormDestroy(Sender: TObject);
begin
  DM.MainConnection.Connected := False;

  FUserListFrame.Free;
  AddLog('Application stopped!');
  FLogFrame.Free;
end;

procedure TMainF.FormShow(Sender: TObject);
begin
  AddLog('Starting to setup the DB connection.');
  DM.SetupDataBaseConnection;
  AddLog('Connecting to the Database');
  try
    DM.GetDatabaseComponent.Connected := True;
  except
    on E: Exception do
      FLogFrame.AddLogFmt('%s: %s', [E.ClassName, E.Message]);
  end;
  RefreshFromDb;
end;

procedure TMainF.AddLog(const aMsg: string);
begin
  if Assigned(FLogFrame) then
    FLogFrame.AddLog(aMsg);
end;

procedure TMainF.AddLogFmt(const aMsg: string; const aArgs: array of const);
begin
  if Assigned(FLogFrame) then
    FLogFrame.AddLogFmt(aMsg, aArgs);
end;

procedure TMainF.RefreshFromDb;
begin
  FUserListFrame.RefreshData;
end;

procedure TMainF.actRefreshFromDbExecute(Sender: TObject);
begin
  Self.RefreshFromDb
end;

end.

