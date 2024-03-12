unit OSS_User;

interface

uses
  OSS_BaseClasses, DB;

type
  TUser = class(TBaseOssDbObject)
  private
    FUserId: Integer;
    FUserName: string;
    FAddress: string;
    FCreatedOn: TDateTime;
    FParentUserId: Integer;
  protected
    procedure DoSaveToDB; override;
  public
    procedure Initialize; override;
    procedure LoadFromDataset(aDS: TDataSet); override;
    procedure LoadFromDB(const aID: Integer); override;
  published
    property UserId: Integer read FUserId write FUserId;
    property UserName: string read FUserName write FUserName;
    property Address: string read FAddress write FAddress;
    property CreatedOn: TDateTime read FCreatedOn write FCreatedOn;
    property ParentUserId: Integer read FParentUserId write FParentUserId;
  end;

implementation

uses
  OSS_CommonConstants, SysUtils, DataModule, IBQuery;

procedure TUser.Initialize;
begin
  inherited;
  FUserId := gcUnknownId;
  FUserName := EmptyStr;
  FAddress := EmptyStr;
  FCreatedOn := 0;
  FParentUserId := gcUnknownId;
end;

procedure TUser.LoadFromDataset(aDS: TDataSet);
begin
  inherited;
  FUserId := aDS.FieldByName('user_id').AsInteger;
  FUserName := aDS.FieldByName('user_name').AsString;
  FAddress := aDS.FieldByName('address').AsString;
  FCreatedOn := aDS.FieldByName('created_on').AsDateTime;
  FParentUserId := aDS.FieldByName('parent_user_id').AsInteger;
end;

procedure TUser.LoadFromDB(const aID: Integer);
const
  lcSQL = 'SELECT * FROM users WHERE(user_id=%d)';
var
  DS: TDataSet;
begin
  inherited;
  if (aID <= 0) then
    EXIT;
  DS := DM.OpenSQLFmt(lcSQL, [aID]);
  try
    if (not DS.IsEmpty) then
      LoadFromDataset(DS)
    else
      raise Exception.CreateFmt('User with ID (%d) not found!', [aID]);
  finally
    DS.Free;
  end;
end;

procedure TUser.DoSaveToDB;
const
  lcSQL_Insert =
    'INSERT INTO USERS '+CRLF+
    '( USER_NAME, ADDRESS, CREATED_ON, IS_ACTIVE, PARENT_ID) '+CRLF+
    'VALUES(:UserName, :Address, :CreatedOn, :IsActive, :ParentUserId);';
  lcSQL_Update =
    'UPDATE USERS SET '+CRLF+
    ' USER_NAME=:UserName, ADDRESS=:Address, CREATED_ON=:CreatedOn, IS_ACTIVE=:IsActive, '+CRLF+
    ' PARENT_ID=:ParentUserId'+CRLF+
    'WHERE USER_ID=:UserId;';
var
  Q: TIBQuery;

  procedure _SetupParams;
  begin
    //TODO: Implement
  end;
  
begin
  Q := DM.CreateQuery(EmptyStr);
  try
    //New
    if (UserId <= 0) then
    begin
      Q.SQL.Text := lcSQL_Insert;
      _SetupParams;
      //TODO: Get UserId
    end
    else
    begin
      Q.SQL.Text := lcSQL_Update;
      _SetupParams;
    end;
  finally
    Q.Free;
  end;
end;

end.

