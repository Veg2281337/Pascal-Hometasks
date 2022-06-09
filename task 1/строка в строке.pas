  function searching_for_a_string_within_string(s:string; f:string):integer;
  begin
    var t, d: integer;
    t:=length(s);
    d:=length(f);
    for var i:=1 to t do 
    begin
      if s[i] = f[1] then 
      begin
        searching_for_a_string_within_string:=i-1;
        break
      end
      else searching_for_a_string_within_string:= -1
    end
  end;
  
  begin
    var s, f: string;
    readln(s);
    readln(f);
    writeln(searching_for_a_string_within_string(s, f))
  end.