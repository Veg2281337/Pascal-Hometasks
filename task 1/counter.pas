// класс пары элементов - (символ, число)
type
  pair = class
    public
      key: char;
      val: integer;
      
      constructor create(key: char; val: integer);
      begin
        self.key := key;
        self.val := val;
      end;
  end;

type
  counter = class
    private
      arr: array of pair;
      len: integer;
      maxlen: integer;
      str: string;
      
      function find_index_from_char(a: char): integer;
      begin
        find_index_from_char:= ord(a) mod maxlen;
      end;
      
    public
      constructor create(maxsize: integer; str: string);
      begin
        maxlen := max(500, maxsize);
        self.str:= str;
        setlength(arr, maxsize);
        len:=0;
        update(str);
      end;
      
      constructor create(str: string);
      begin
        maxlen := 500;
        self.str:= str;
        setlength(arr, 500);
        len:=0;
        update(str);
      end;
      
      function get_pairs(): array of pair;
      begin
        var res: array of pair;
        setlength(res, len);
        var c:=0;
        for var i:= 0 to maxlen-1 do 
          if arr[i]<>nil then
          begin
            res[c] := arr[i];
            c+=1;
          end;
        get_pairs:=res;
      end;
      
      procedure update(str: string);
      begin
        for var i:= 1 to length(str) do
        begin
          var ind := find_index_from_char(str[i]);
          if arr[ind]=nil then
          begin
            arr[ind]:=new pair(str[i], 1);
            len+=1
          end else begin
            arr[ind].val+=1
          end;
        end;
      end;
      
      function get_number(a: char): integer;
      begin
        var ind := find_index_from_char(a);
        if arr[ind]<>nil then get_number := arr[ind].val
        else get_number := 0
      end;
      
  end;
  
  function get_dublicate(str:string): array of char;
  begin
    var c := new counter(1000, str);
    var e := c.get_pairs();
    var sc := 0;
    var mas : array of char;
    setlength(mas, c.len);
    for var i:= 0 to c.len-1 do
        begin
          if e[i].val > 1 then 
          begin
            mas[sc]:=e[i].key;
            sc+=1
          end;
        end;
    var mas2 : array of char;
    setlength(mas2, sc);
    for var i:= 0 to sc-1 do
      mas2[i]:= mas[i];
    get_dublicate := mas2;
  end;
  
  function has_dublicate(str:string):boolean;
  begin
    var c := new counter(1000, str);
    has_dublicate:=false;
    var e := c.get_pairs();
    for var i:= 0 to c.len-1 do
        begin
          if e[i].val > 1 then 
          begin
            has_dublicate:=true;
            break;
          end;
        end;
  end;
  
  function searching_for_a_string_within_string(s:string; f:string):integer;
  begin
    var c := new counter(1000, s);
    var t : integer;
    for var i:=0 to c.len do 
    begin
      if s = f then
        begin
          t:= i;
          searching_for_a_string_within_string:=t;
        end
    end;
    if t<1 then searching_for_a_string_within_string:= -1 
  end;
  
  begin
    var s, f: string;
    readln(s, f);
    writeln(get_dublicate(s))
    //writeln(searching_for_a_string_within_string(s, f))
  end.