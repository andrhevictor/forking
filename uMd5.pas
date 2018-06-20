unit uMd5;

  interface
    uses IdHashMessageDigest, Classes, SysUtils;

  function MD5String(const Value: string): string;

  implementation

  function MD5String(const Value: string): string;
  var
    xMD5: TIdHashMessageDigest5;
  begin
    xMD5 := TIdHashMessageDigest5.Create;
    try
      Result := xMD5.HashStringAsHex(Value);
    finally
      xMD5.Free;
    end;
  end;
end.
