require './symbol'
class SimpTokenizer

    ELEMENTS = Symbol::SYMBOLS

    $index = 0
    $array = []
    $array2 = []

    $line= 1

    # constructor
    def initialize(str)

        if str.empty?
                print 'Invalid String'
        else
          # Will change to loop to include all SYMBOLS
          string = str.gsub(/\s+/, ' ').split(/(=)/).join(' ').split(/(\/)/).join(' ').split(/(\\n)/).join(' ').split(/(<)/).join(' ').split(/(;)/).join(' ').split(/(\+)/).join(' ').
                 split(/(-)/).join(' ').split(/(<)/).join(' ').split(/(\+)/).join(' ').split(/(:)/).join(' ').split(/(\()/).join(' ').split(/(\))/).join(' ').split(/(\*)/).join(' ').split(/\s+/)
          $array = string
          $array << 'EOF'

          for i in 0..$array.length
            if (/:/).match?($array[i]) && (/=/).match?($array[i+1]) then
              $array.insert(i , ":=")
              $array.delete_at(i+1)
              $array.delete_at(i+1)
            end
            if (/\//).match?($array[i]) && (/\//).match?($array[i+1]) then
              $array.insert(i , "//")
              $array.delete_at(i+1)
              $array.delete_at(i+1)
            end
            if (/</).match?($array[i]) && (/=/).match?($array[i+1]) then
              $array.insert(i , "<=")
              $array.delete_at(i+1)
              $array.delete_at(i+1)
            end
          end
           $array
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
        $index+=1
        $line+=1
      end

      if(/(\/\/)(.| )*/).match?($array[$index]) then
        $index+=1
        kind = ELEMENTS.keys[25].to_sym
        while (!(/(\\n)/).match?($array[$index]))
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
