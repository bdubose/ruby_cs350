require './symbol'
class SimpTokenizer

    ELEMENTS = Symbol::SYMBOLS

    $index = 0
    $array = []
    $line= 1

    # constructor
    def initialize(str)

        if str.empty?
                print 'Invalid String'
        else
          # Will change to loop to include all SYMBOLS
          string = str.gsub(/\s+/, ' ').split(/(\\n)/).join(' ').split(/(<=)/).join(' ').split(/(;)/).join(' ').split(/(\+)/).join(' ').
                 split(/(-)/).join(' ').split(/(:=)/).join(' ').split(/\s+/)
          $array = string
          $array << 'EOF'
          print $array
        end
    end

    # consumes the current token
    def next_token
        $index += 1
    end

    # returns current token kind (Symbol)
    def get_token_kind

      if $index == (($array.length)-1) then
        kind ='EOF'
        return  kind
      end

      if (/\\n/).match?($array[$index]) then
        puts "found nl"
        $index+=1
        $line+=1
      end

      if(/(\/\/)(.| )*/).match?($array[$index]) then
        puts "im here"
        $index+=1
        puts get_token_kind
        kind = ELEMENTS.keys[25].to_sym
        while (/^[a-zA-Z][a-zA-Z0-9_]*$/).match?($array[$index])
          $index+=1
        end
       return kind
      end

      for val in ELEMENTS.values
        if val.match?($array[$index]) then
          kind = ELEMENTS.invert[val]
          break
        end
      end
      puts get_text
      puts "current kind: #{kind}"
       kind
    end

    # textual representation of current token
    def get_text
      $array[$index]
    end
  def get_line_number
    $line
  end
end
