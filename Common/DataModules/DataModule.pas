unit DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery;

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
    function CreateQuery(const aSQL: string; const aParamCheck: Boolean = True): TIBQuery;
    function CreateQueryFmt(const aSQL: string; const aArgs: array of const; const aParamCheck: Boolean = True): TIBQuery;
    function OpenSQL(const aSQL: string; const aParamCheck: Boolean = True): TDataSet;
    function OpenSQLFmt(const aSQL: string; const aArgs: array of const; const aParamCheck: Boolean = True): TDataSet;
    function ExecSQL(const aSQL: string): Integer;
    function ExecSQLFmt(const aSQL: string; const aArgs: array of const): Integer;
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

function TDM.CreateQuery(const aSQL: string; const aParamCheck: Boolean): TIBQuery;
begin
  Result := TIBQuery.Create(Self);
  try
    Result.Database := GetDatabaseComponent;
    Result.Transaction := GetMainTransaction;
    Result.ParamCheck := aParamCheck;
    Result.SQL.Text := aSQL;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TDM.CreateQueryFmt(const aSQL: string; const aArgs: array of const; const aParamCheck: Boolean): TIBQuery;
begin
  Result := CreateQuery(Format(aSQL, aArgs), aParamCheck);
end;

function TDM.OpenSQL(const aSQL: string; const aParamCheck: Boolean): TDataSet;
begin
  Result := CreateQuery(aSQL, aParamCheck);
  try
    Result.Open;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TDM.OpenSQLFmt(const aSQL: string; const aArgs: array of const; const aParamCheck: Boolean): TDataSet;
begin
  Result := OpenSQL(Format(aSQL, aArgs), aParamCheck);
end;

function TDM.ExecSQL(const aSQL: string): Integer;
var
  Q: TIBQuery;
begin
  Q := CreateQuery(aSQL);
  try
    Q.ExecSQL;
    Result := Q.RowsAffected;
  finally
    Q.Free;
  end;
end;

function TDM.ExecSQLFmt(const aSQL: string; const aArgs: array of const): Integer;
begin
  Result := ExecSQL(Format(aSQL, aArgs));
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

