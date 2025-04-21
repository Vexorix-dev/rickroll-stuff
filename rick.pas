program Rickroll;

uses
  SysUtils, Process;

procedure OpenRickroll;
var
  url: string;
begin
  url := 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
  if Pos('Win', {$IFDEF MSWINDOWS} 'Windows' {$ELSE} '' {$ENDIF}) > 0 then
    SysUtils.ShellExecute(0, 'open', PChar(url), nil, nil, SW_SHOWNORMAL)
  else if Pos('Mac', {$IFDEF MACOS} 'Mac' {$ELSE} '' {$ENDIF}) > 0 then
    SysUtils.ShellExecute(0, 'open', PChar(url), nil, nil, SW_SHOWNORMAL)
  else
    SysUtils.ShellExecute(0, 'open', PChar(url), nil, nil, SW_SHOWNORMAL);  // Assume Linux
end;

var
  output: string;
  return_code: Integer;
begin
  output := RunCommand('curl ascii.live/rick', return_code);

  if return_code = 0 then
    Writeln(output)  // Print command output
  else
  begin
    Writeln('Command failed.');
    OpenRickroll();
  end;
end.