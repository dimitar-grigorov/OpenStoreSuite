unit OSS_BaseClasses;

interface

uses
  Classes, DB;

type
  TOssPersistenObject = class(TInterfacedPersistent)
  private
    FOwner: TObject;
  public
    constructor Create(aOwner: TObject = nil); virtual;
  public
    property Owner: TObject read FOwner write FOwner;
  end;

  TOssDbObject = class(TOssPersistenObject)
  private
    FIsActive: Boolean;
  protected
    procedure DoSaveToDB; virtual; abstract;
  public
    constructor Create(aOwner: TObject = nil); override;  
    destructor Destroy; override;
    procedure Initialize; virtual;
    procedure LoadFromDataset(aDS: TDataSet); virtual; abstract;

    procedure LoadFromDB(const aID: string); virtual; abstract;
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

constructor TOssPersistenObject.Create(aOwner: TObject);
begin
  inherited Create;
  FOwner := aOwner;
end;

{ TOssDbObject }

constructor TOssDbObject.Create(aOwner: TObject);
begin
  inherited Create(aOwner);
  Initialize;
end;

destructor TOssDbObject.Destroy;
begin
  //
  inherited;
end;

procedure TOssDbObject.Initialize;
begin
  FIsActive := True;
end;

procedure TOssDbObject.CheckData;
begin
  // Nothig to do here for now.
end;

procedure TOssDbObject.SaveToDB;
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

end.

