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

// класс,который считает сколько раз встретился каждый символ в строке, которая передана в конструкторе
// здесь есть массив пар, каждая пара которого имеет вид (символ, количество раз, которое оно встретилось в строке)
// в приватных методах будет метод, который ищет индекс массива arr, который будет отвечать паре, у которой key==a (задаваемому символу)
// если сивол не найдет - вернуть -1
// нaпример для если arr = [('a', 2), ('b', 43), ('x', 4)]
// find_index_from_char('b') -> 1
// find_index_from_char('x') -> 2
// find_index_from_char('a') -> 0
// find_index_from_char('e') -> -1
// дальше в конструкторе, аналогичну действия в стеке надо добавлять элементы и т.д
// get_pairs - выдает массив arr
// update - делает тоже самое, что и конструктор
// например если arr = [('a', 1), ('b', 2), ('x', 3)]
// update('aabbxxc') ->  arr = [('a', 3), ('b', 4), ('x', 5), ('c', 1)]
// get_number - находит пару у которой key=a и возвращает поле val

type
  counter = class
    private
      arr: array of pair;
      len: integer;
      maxlen: integer;
      str: string;
      
      function find_index_from_char(a: char): integer;
      begin
        var ind := -1;
        for var i:= 0 to len-1 do
        begin
          if arr[i].key = a then 
          begin
            ind := i;
            break
          end;
        end;
        find_index_from_char:=ind
      end;
      
    public
      constructor create(maxsize: integer; str: string);
      begin
        maxlen := maxsize;
        self.str:= str;
        setlength(arr, maxsize);
        len:=0;
        update(str);
      end;
      
      function get_pairs(): array of pair;
      begin
        var res: array of pair;
        setlength(res, len);
        for var i:= 0 to len-1 do res[i] := arr[i];
        get_pairs:=res;
      end;
      
      procedure update(str: string);
      begin
        for var i:= 1 to length(str) do
        begin
          var ind := find_index_from_char(str[i]);
          if (ind = -1) and (len<>maxlen) then 
          begin
            arr[len]:=new pair(str[i], 1);
            len+=1
          end else begin
            arr[ind].val+=1
          end;
        end;
      end;
      
      function get_number(a: char): integer;
      begin
        var ind := find_index_from_char(a);
        if ind <> -1 then get_number := arr[ind].val
        else get_number := 0
      end;
      
  end;
  
  function search_for_repetitions(str:string):boolean;
  begin
    var c := new counter(1000, str);
    search_for_repetitions:=false;
    for var i:= 1 to length(str) do
        begin
          if c.get_number(str[i]) >1 then 
          begin
            search_for_repetitions:=true;
            break
          end;
        end;
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
            writeln(e[i].key)
          end;
        end;
  end;
  
  begin
    var s: string;
    readln(s);
    writeln(search_for_repetitions(s));
    writeln(has_dublicate(s))
  end.