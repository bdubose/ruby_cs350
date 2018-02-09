require 'strscan'
require_relative './symbol'
class SimpTokenizer
    
    @@tokenKind 
    @@tokenValue
    Keys=Symbol::SYMBOLS.keys
    Valid = Symbol::SYMBOLS.values
    tokenKind=Keys[1]
    puts tokenKind
    #puts Keys
    #puts Valid

    
    #constructor 
    def initialize(str)
    
        if (str.empty?)
                puts "Invalid String"
        else
             @s = StringScanner.new(str)
        end 
        
    end
    
    #is this a valid token
    def isValidToken(token)
        for val in Valid
            if(token.match(val))
                return true
            else 
                return false
            end
        end 
    end 
    
=begin
    def consume()
        if(s.eos?)
            return true
        end
         for val in Valid
            if(s.scan_until(val))
                tokenKind = Keys[?]  #will be same i'th position of val in Valid
            else 
                return false
            end
            
        
    end
=end
    
    #returns token kind (Symbol)
    def getKind()
        return tokenKind
    end
    
    #textual representation of next token 
    def getText()
        return @s.string
    end 
end


m = SimpTokenizer.new("the string")
puts m.isValidToken("hello")
puts m.getText()
