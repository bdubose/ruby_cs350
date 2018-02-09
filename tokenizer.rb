require 'strscan'
require_relative './symbol'
class SimpTokenizer
    
   
    Keys=Symbol::SYMBOLS.keys
    Valid = Symbol::SYMBOLS.values
    Hash = Symbol::SYMBOLS
    @tokenkind = Keys[1]
    puts @tokenkind


    
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
        
#        iterating over a hash map 
#         limit = Hash.length
#        for counter in 0..limit
#            if(token.match(Hash.values[counter]))
#                puts Hash.values[counter]  
#            end 
#        end 
        
        for val in Valid
            if(token.match(val))
                return true
            end
            
        end 
        return false
    end 
    
=begin
    def consume()
        if(s.eos?)
            return true
        end
         for val in Valid
            if(s.scan(val))
                tokenKind = Keys[1]
            else 
                return false
            end
            
        
    end
=end
    
    #returns token kind (Symbol) (does not show to console for some reason)
    def getKind()
        return @tokenKind
    end
    
    #textual representation of next token
    def getText()
        return @s.string
    end 
end


m = SimpTokenizer.new("the string")
puts m.getKind()
puts m.isValidToken("abcd")
puts m.getText()
