unit UserListFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrameUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids;

type
  TUserListFrame = class(TBaseFrame)
    grUsers: TDBGrid;
    qryUsers: TIBQuery;
    dsUsers: TDataSource;
  private
  public
    procedure RefreshData; override;  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;  
  end;

implementation

uses
  DataModule;

{$R *.dfm}

constructor TUserListFrame.Create(AOwner: TComponent);
begin
  inherited;
  qryUsers.Database := DM.GetDatabaseComponent;
  qryUsers.Transaction := DM.GetMainTransaction;
  dsUsers.DataSet := qryUsers;
  grUsers.DataSource := dsUsers;
end;

destructor TUserListFrame.Destroy;
begin

  inherited;
end;

procedure TUserListFrame.RefreshData;
const
  lcSQL = 'SELECT user_id, user_name, address FROM users;';
var
  lvCursor: TCursor;
begin
  lvCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    if (qryUsers.Active) then
      qryUsers.Close;
    qryUsers.SQL.Text := lcSQL;
    qryUsers.Open;
  finally
    Screen.Cursor := lvCursor;
  end;
end;

end.
