require './symbol'
class SimpTokenizer
    
   
    KEYS = Symbol::SYMBOLS.keys
    VALID = Symbol::SYMBOLS.values
    $kind
    $position = 0
    $Array = []

    # constructor
    def initialize(str)

        if str.empty?
                print 'Invalid String'
        else
          $Array = str.split
          $Array << 'EOF'
          print $Array
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
        if $position == ($Array.length)-1
            $kind='N/A'
             true
        end
    end

    # returns the kind of the next sequential token (SYMBOL)
    def next_token_kind
      for val in VALID
        if val.match?($Array[$position+1])
          $kind = KEYS[VALID.find_index(val)]
        end
      end
       $kind
    end


    # returns current token kind (Symbol)
    def get_token_kind
      for val in VALID
        if val.match?($Array[$position])
          $kind = KEYS[VALID.find_index(val)]
        end
      end
       $kind
    end

    # textual representation of current token
    def get_text
      $Array[$position]
    end
end

m = SimpTokenizer.new('the + )')

print "\n The next token is: "
puts  m.next_token_kind
print "\n The text of current token is: "
puts m.get_text

m.next_token
print "\n The next token is: "
puts  m.next_token_kind
print "\n The text of current token is: "
puts m.get_text

m.next_token
print "\n The next token is: "
puts  m.next_token_kind
print "\n The text of current token is: "
puts m.get_text

m.next_token
print "\n The next token is: "
puts  m.next_token_kind
print "\n The text of current token is: "
puts m.get_text