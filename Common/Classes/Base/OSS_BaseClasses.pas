unit OSS_BaseClasses;

interface

uses
  Classes, DB;

type
  TBaseOssPersistenObject = class(TInterfacedPersistent)
  private
    FOwner: TObject;
  public
    constructor Create(aOwner: TObject = nil); virtual;
  public
    property Owner: TObject read FOwner write FOwner;
  end;

  TBaseOssDbObject = class(TBaseOssPersistenObject)
  private
    FIsActive: Boolean;
  protected
    procedure DoSaveToDB; virtual; abstract;
  public
    constructor Create(aOwner: TObject = nil); override;  
    destructor Destroy; override;
    procedure Initialize; virtual;
    procedure LoadFromDataset(aDS: TDataSet); virtual;

    procedure LoadFromDB(const aID: Integer); virtual;
    procedure CheckData; virtual;
    procedure SaveToDB; virtual;
    procedure DeleteFromDB; virtual; abstract;
  published
    property IsActive: Boolean read FIsActive write FIsActive;
  end;

implementation

uses
  SysUtils;

{ TOssPersistenObject }

constructor TBaseOssPersistenObject.Create(aOwner: TObject);
begin
  inherited Create;
  FOwner := aOwner;
end;

{ TOssDbObject }

constructor TBaseOssDbObject.Create(aOwner: TObject);
begin
  inherited Create(aOwner);
  Initialize;
end;

destructor TBaseOssDbObject.Destroy;
begin
  //
  inherited;
end;

procedure TBaseOssDbObject.Initialize;
begin
  FIsActive := True;
end;

procedure TBaseOssDbObject.LoadFromDataset(aDS: TDataSet);
begin
  FIsActive := aDS.FieldByName('is_active').AsInteger = 1;
end;

procedure TBaseOssDbObject.CheckData;
begin
  // Nothig to do here for now.
end;

procedure TBaseOssDbObject.SaveToDB;
begin
  CheckData;
  try
    //DBTools.Transaction_Start;
    DoSaveToDB;
    //DBTools.Transaction_Commit;
  except
    on E: Exception do
    begin
      //DBTools.Transaction_Rollback;
      raise;
    end;
  end;
end;

procedure TBaseOssDbObject.LoadFromDB(const aID: Integer);
begin
  Initialize;
end;

end.

