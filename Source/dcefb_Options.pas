unit dcefb_Options;

interface

uses
  System.Classes, System.StrUtils, System.SysUtils, Winapi.Windows;

type
  TDcefBrowserOptions = class(TPersistent)
  private
    FDefaultDownLoadPath: string; // ֵΪ APP·��\Download\
    FTerminateAppWhenAllPageClosed: Boolean; // ���б�ǩ�رպ��Ƿ���ֹAPP Ĭ��True
    FTerminateAppWhenDownloading: Boolean;
    // ����ִ������ʱ�Ƿ���ֹAPP���˳����� ֻ��FTerminateAppWhenAllPageClosedΪTrueʱ������ò���Ч Ĭ��ΪFalse
    FPopupNewWindow: Boolean;
    // �Ƿ񵯳��´��� �����ͺ�TChromiumû������ ����´��ڽ�����TDcefBrowser���� Ĭ��ΪFalse
    FDebugToolAvailable: Boolean;
    //�Ƿ�����ʹ��F12 DebugTool Ĭ��ΪTrue
    FMainFormWinHandle: HWND;
    // APP�������Handle ��������Ǳ�Ҫ�ģ� ������ĳЩ����½���������� Ĭ��Ϊ0

    // ---------------------------------------------------------------------------
    FAutoDown: Boolean; // �Ƿ��Զ�������� Ĭ��True
    FDownLoadPath: string; // ����·�� Ĭ��ΪFDefaultDownLoadPath
    procedure SetDownLoadPath(const value: string);
    procedure SetDebugToolAvailable(const Value: Boolean);
  public
    constructor Create;
  published
    property TerminateAppWhenAllPageClosed: Boolean
      read FTerminateAppWhenAllPageClosed write FTerminateAppWhenAllPageClosed;
    property TerminateAppWhenDownloading: Boolean
      read FTerminateAppWhenDownloading write FTerminateAppWhenDownloading;
    property PopupNewWindow: Boolean read FPopupNewWindow write FPopupNewWindow;
    property DebugToolAvailable: Boolean read FDebugToolAvailable write SetDebugToolAvailable;
    property MainFormWinHandle: HWND read FMainFormWinHandle
      write FMainFormWinHandle;
    property AutoDown: Boolean read FAutoDown write FAutoDown;
    property DownLoadPath: string read FDownLoadPath write SetDownLoadPath;
  end;

implementation

{ TDcefBrowserOptions }

constructor TDcefBrowserOptions.Create;
begin
  FTerminateAppWhenAllPageClosed := True;
  FTerminateAppWhenDownloading := False;
  FDebugToolAvailable := True;
  FPopupNewWindow := False;
  FMainFormWinHandle := 0;
  FAutoDown := True;
  FDefaultDownLoadPath := ExtractFilePath(Paramstr(0)) + 'Download\';
  FDownLoadPath := FDefaultDownLoadPath;
end;

procedure TDcefBrowserOptions.SetDebugToolAvailable(const Value: Boolean);
begin
  FDebugToolAvailable := Value;
end;

procedure TDcefBrowserOptions.SetDownLoadPath(const value: string);
begin
  if DirectoryExists(value) then
    FDownLoadPath := IfThen(SameText(Copy(value, Length(value), 1), '\'), value,
      value + '\')
  else
    FDownLoadPath := FDefaultDownLoadPath;
end;

end.
