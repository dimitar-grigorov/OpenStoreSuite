unit OSS_CommonInterfaces;

interface

type
  IAppLog = interface
     ['{EF6FEF3D-6FD1-4D7A-AA82-56EB53DF1B68}']
    procedure AddLog(const aMsg: string);
    procedure AddLogFmt(const aMsg: string; const aArgs: array of const); 
  end;

implementation

end.

