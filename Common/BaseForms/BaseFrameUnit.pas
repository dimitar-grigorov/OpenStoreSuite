unit BaseFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TBaseFrame = class(TFrame)
  private
  public
    procedure RefreshData; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TBaseFrame.Create(AOwner: TComponent);
begin
  inherited;
  //
end;

destructor TBaseFrame.Destroy;
begin
  //
  inherited;
end;

end.

