  function searching_for_a_string_within_string(s:string; f:string):integer;
  begin
    var t, d, c: integer;
    t:=length(s);
    d:=length(f);
    for var x:=1 to d do 
    begin
      for var i:=1 to t do
      begin
        if s[i] = f[x] then 
          begin
            c:=c+1;
            searching_for_a_string_within_string:=i-d;
          end;
        if d=c then break
      end
    end;
    if  c<>d then searching_for_a_string_within_string:= -1
  end;
  
  function gg(s:string; f:string):integer;
  begin
    var t, d: integer;
    t:=length(s);
    d:=length(f);
    var str : string;
    for var i:=1 to t do
    begin
      delete(str, 1, d);
      for var j:=1 to d do str:=str + s[j+i-1];
      if str = f then 
      begin
        gg:=i-1;
        break
      end
      else gg:=-1;
      if i = (t-(t mod d)) then break;
    end;
  end;
  
  begin
    var s, f: string;
    readln(s);
    readln(f);
    writeln(searching_for_a_string_within_string(s, f));
    writeln(gg(s, f))
  end.