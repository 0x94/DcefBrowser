unit dcefb_Options;

interface

uses
  System.Classes, System.StrUtils, System.SysUtils, Winapi.Windows;

type
  TDcefBrowserOptions = class(TPersistent)
  private
    FDftDownPath: string; // ֵΪ APP·��\Download\
    FExitPagesClosed: Boolean; // ���б�ǩ�رպ��Ƿ���ֹAPP Ĭ��True
    {
    FExitDownloading: Boolean;
    // ����ִ������ʱ�Ƿ���ֹAPP���˳����� ֻ��FTerminateAppWhenAllPageClosedΪTrueʱ������ò���Ч Ĭ��ΪFalse
    }
    FPopupNewWin: Boolean;
    // �Ƿ񵯳��´��� �����ͺ�TChromiumû������ ����´��ڽ�����TDcefBrowser���� Ĭ��ΪFalse
    FDevToolsEnable: Boolean;
    //�Ƿ�����ʹ��F12 DebugTool Ĭ��ΪTrue

    // ---------------------------------------------------------------------------
    FAutoDown: Boolean; // �Ƿ��Զ�������Ĭ���ļ��� Ĭ��False
    FDownLoadPath: string; // ����·�� Ĭ��ΪFDefaultDownLoadPath
    procedure SetDownLoadPath(const value: string);
    procedure SetDevToolsEnable(const Value: Boolean);
  public
    constructor Create;
  published
    property ExitPagesClosed: Boolean
      read FExitPagesClosed write FExitPagesClosed;
    {property ExitDownloading: Boolean
      read FExitDownloading write FExitDownloading; }
    property PopupNewWin: Boolean read FPopupNewWin write FPopupNewWin;
    property DevToolsEnable: Boolean read FDevToolsEnable write SetDevToolsEnable;
    property AutoDown: Boolean read FAutoDown write FAutoDown;
    property DownLoadPath: string read FDownLoadPath write SetDownLoadPath;
  end;

implementation

{ TDcefBrowserOptions }

constructor TDcefBrowserOptions.Create;
begin
  FExitPagesClosed := True;
  //FExitDownloading := False;
  FDevToolsEnable := True;
  FPopupNewWin := False;
  FAutoDown := False;
  FDftDownPath := ExtractFilePath(Paramstr(0)) + 'Download\';
  FDownLoadPath := FDftDownPath;
end;

procedure TDcefBrowserOptions.SetDevToolsEnable(const Value: Boolean);
begin
  FDevToolsEnable := Value;
end;

procedure TDcefBrowserOptions.SetDownLoadPath(const value: string);
begin
  if DirectoryExists(value) then
    FDownLoadPath := IfThen(SameText(Copy(value, Length(value), 1), '\'), value,
      value + '\')
  else
    FDownLoadPath := FDftDownPath;
end;

end.
