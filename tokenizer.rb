require 'strscan'
require_relative './symbol'
class SimpTokenizer
    
   
    KEYS=Symbol::SYMBOLS.keys
    VAILD = Symbol::SYMBOLS.values
    HASH = Symbol::SYMBOLS
    @@tokenKind=KEYS[1]

    
    #constructor 
    def initialize(str)
    
        if str.empty?
                puts "Invalid String"
        else
             @@s = StringScanner.new(str)
             @@w = @@s
        end 
        
    end
    
    
    #is this a valid token
    def valid_token(token)
        
        #iterating over a hash map 
         for val in VALID
            if token.match?(val)
                puts token
                return true
            end
            
        end 
         false
    end
=begin
        limit = Hash.length
        for counter in 0..limit
            if token.match(Hash.values[counter])
                puts Hash.values[counter] 
                return true
            end 
        end
        return false
    end 
=end

    def consume(token)
        if @@s.eos?
            @@tokenKind="N/A"
            return
        end

        limit2 = VALID.length
        for counter in 0..limit2
            if @@s.match(VALID[counter])
                @@w=  @@s.matched
                @@tokenKind = KEYS[counter]
            end
        end

        
    end

    
    #returns token kind (Symbol) (does not show to console for some reason)
    def get_token_kind()
         @@tokenKind
    end
    
    #textual representation of next token
    def get_text()
         @@w.string
    end 
end


m = SimpTokenizer.new("the string")
m.valid_token("abcdffhj5 + 3783")
#m.consume("the string")
puts m.get_token_kind
puts m.get_text
