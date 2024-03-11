program OpenStoreSuite;

uses
  Forms,
  MainFUnit in 'MainFUnit.pas' {MainF},
  DataModule in 'Common\DataModules\DataModule.pas' {DM: TDataModule},
  OSS_CommonConstants in 'Common\OSS_CommonConstants.pas',
  LogFrameUnit in 'Common\LogFrame\LogFrameUnit.pas' {LogFrame: TFrame},
  OSS_CommonInterfaces in 'Common\Interfaces\OSS_CommonInterfaces.pas',
  BaseFrameUnit in 'Common\BaseForms\BaseFrameUnit.pas' {BaseFrame: TFrame},
  UserListFrameUnit in 'AppModules\Users\UserListFrameUnit.pas' {UserListFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainF, MainF);
  Application.Run;
end.
