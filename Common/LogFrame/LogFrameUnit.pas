unit LogFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TLogFrame = class(TFrame)
    memLog: TMemo;
  public
    procedure AddLog(const aMsg: string);
    procedure AddLogFmt(const aMsg: string; const aArgs: array of const);
  end;

implementation

uses
  OSS_CommonConstants;

{$R *.dfm}

procedure TLogFrame.AddLog(const aMsg: string);
begin
  memLog.Lines.Add(FormatDateTime(gcDateTimeAsStrSecFmt, Now()) + ': ' + aMsg);
end;

procedure TLogFrame.AddLogFmt(const aMsg: string; const aArgs: array of const);
begin
  AddLog(Format(aMsg, aArgs));
end;

end.

