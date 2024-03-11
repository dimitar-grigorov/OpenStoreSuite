unit DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDM = class(TDataModule)
    MainConnection: TIBDatabase;
    MainTransaction: TIBTransaction;
    procedure MainConnectionAfterConnect(Sender: TObject);
    procedure MainConnectionAfterDisconnect(Sender: TObject);
    procedure MainConnectionBeforeConnect(Sender: TObject);
  protected
  public
    procedure SetupDataBaseConnection;
    function GetDatabaseComponent: TIBDatabase;
    function GetMainTransaction: TIBTransaction;
  end;

var
  DM: TDM;

implementation

uses
  OSS_CommonConstants, Forms, OSS_CommonInterfaces;

{$R *.dfm}

function TDM.GetDatabaseComponent: TIBDatabase;
begin
  Result := MainConnection;
end;

function TDM.GetMainTransaction: TIBTransaction;
begin
  Result := MainTransaction;
end;

procedure TDM.SetupDataBaseConnection;
begin
  MainConnection.DatabaseName := '192.168.2.80:oss4.fdb';
  MainConnection.Params.Add('user_name=SYSDBA' + CRLF + 'password=masterkey' + CRLF + 'lc_ctype=WIN1251');
  MainConnection.LoginPrompt := False;
end;

procedure TDM.MainConnectionAfterConnect(Sender: TObject);
begin
  (Application.MainForm as IApplog).AddLogFmt('Connected to: %s', [GetDatabaseComponent.DatabaseName]);
end;

procedure TDM.MainConnectionAfterDisconnect(Sender: TObject);
begin
  (Application.MainForm as IApplog).AddLogFmt('Disconnected from: %s', [GetDatabaseComponent.DatabaseName]);
end;

procedure TDM.MainConnectionBeforeConnect(Sender: TObject);
begin
  (Application.MainForm as IApplog).AddLogFmt('Trying to connect to: %s', [GetDatabaseComponent.DatabaseName]);
end;

end.

