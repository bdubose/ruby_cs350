require 'strscan'
require_relative './symbol'
class SimpTokenizer
    
   
    KEYS=Symbol::SYMBOLS.keys
    VALID = Symbol::SYMBOLS.values
    @@tokenKind
    @@position=0
    @@Array

    #constructor 
    def initialize(str)
    
        if str.empty?
                print "Invalid String"
        else
          @@Array = str.split
          @@Array << "EOF"
          print @@Array
        end
        
    end
    
    
    #is this a valid token
    def valid_token(token)
         for val in VALID
            if val.match?(token)
                return true
            end
            
        end 
         false
    end


    def consume()

        if @@position == (@@Array.length)-1
            @@tokenKind="N/A"
            return true
        end

        res =@@Array[@@position+1]
        for val in VALID
          if val.match?(res)
            @@tokenKind= KEYS[VALID.find_index(val)]
            return true
          end

        end

    end

    
    #returns token kind (Symbol)
    def get_token_kind()
         @@tokenKind
    end
    
    #textual representation of next token
    def get_text()
      @@position += 1
      @@Array[@@position-1]
    end
end


m = SimpTokenizer.new("the + )")
m.consume
print "\n The next token is: "
puts  m.get_token_kind
print "\n The text of current token is: "
puts m.get_text

m.consume
print "\n The next token is: "
puts  m.get_token_kind
print "\n The text of current token is: "
puts m.get_text

m.consume
print "\n The next token is: "
puts  m.get_token_kind
print "\n The text of current token is: "
puts m.get_text

m.consume
print "\n The next token is: "
puts  m.get_token_kind
print "\n The text of current token is: "
puts m.get_text