  function searching_for_a_string_within_string(s:string; f:string):integer;
  begin
    var t, d: integer;
    setlength(s, t);
    for var i:=0 to t do 
    begin
      if s[i] = f[1] then searching_for_a_string_within_string:=i
      else searching_for_a_string_within_string:= -1
    end
  end;
  // объясни, почему он игнорирует условие
  
  begin
    var s, f: string;
    readln(s);
    readln(f);
    writeln(searching_for_a_string_within_string(s, f))
  end.