require './symbol'
class SimpTokenizer
    
   
    KEYS = Symbol::SYMBOLS.keys
    VALID = Symbol::SYMBOLS.values
    $kind
    $position = 0
    $array = []
    $line=0

    # constructor
    def initialize(str)

        if str.empty?
                print 'Invalid String'
        else
          # Will change to loop to include all SYMBOLS
          string = str.gsub(/\s+/, ' ').split(/(\\n)/).join(' ').split(/(;)/).join(' ').split(/(\+)/).join(' ').
                 split(/(-)/).join(' ').split(/(:=)/).join(' ').split(/\s+/)
          $array = string
          $array << 'EOF'
          print $array
        end

    end

    # is this a valid token
    def valid_token(token)
         for val in VALID
            if val.match?(token)
                return true
            end

        end
         false
    end


    # consumes the current token
    def next_token
        $position += 1
        if $position == ($array.length)-1
            $kind='EOF'
             true
        end
    end

    # returns the kind of the next sequential token (SYMBOL)
    def next_token_kind
      for val in VALID
        if val.match?($array[$position+1])
          $kind = KEYS[VALID.find_index(val)].to_sym
        end
      end
       $kind
    end


    # returns current token kind (Symbol)
    def get_token_kind
      if (/\\n/).match?($array[$position]) then
        puts "found nl"
        $position+=1
        $line+=1
      end

      if(/(\/\/)(.| )*/).match?($array[$position]) then
        puts "im here"
        $position+=1
        puts get_token_kind
        $kind = KEYS[25].to_sym
        while (/^[a-zA-Z][a-zA-Z0-9_]*$/).match?($array[$position])
          $position+=1
        end
        $kind
      end

      for val in VALID
        if val.match?($array[$position])
          $kind = KEYS[VALID.find_index(val)].to_sym
          break
        end
      end
      puts get_text
      puts "current kind: #{$kind}"
       $kind
    end

    # textual representation of current token
    def get_text
      $array[$position]
    end
  def get_line_number
    $line
  end
end

#TESTING
=begin
m = SimpTokenizer.new('prev:=0;
curr := 1;

for iter from 0 to N-1 do  //iterative fibonachi
    tmp := prev+curr;
    prev = curr;
    curr := tmp;
end;'.dump)

  for i in 0...$array.length
    print "\n The text of current token is: "
    puts m.get_text
    print "\n The next token is: "
    puts  m.next_token_kind
    m.next_token
  end
=end