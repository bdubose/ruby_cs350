class Analyzer
  def initialize(tokenizer)
    @tokenizer = tokenizer
  end

  def error(wanted)
    puts "ERROR: Found #{@tokenizer.get_text}, expected #{wanted} at line #{@tokenizer.get_line_number}."
    exit
  end

  def valid_program?
    valid_stmts?
  end

  def valid_stmts?
    until eof? or @tokenizer.get_token_kind == :LANG_END or @tokenizer.get_token_kind == :LANG_ELSE
      if valid_stmt?
        if semi_colon?
          else # no semicolon found
            error('semicolon')
            return false
          end
          else # was not a valid statement
        puts "Invalid statement! (At line: #{@tokenizer.get_line_number})"
        return false
      end
    end
    true
  end

  def valid_stmt?
    (identifier? and assign_op? and add_op?)                                                              \
    or                                                                                                    \
    (lang_if? and log_exp? and lang_then? and valid_stmts? and (lang_end? or (lang_else? and valid_stmts? and lang_end?)))                                \
    or                                                                                                    \
    if lang_for? and identifier? and lang_from? and add_op? and lang_to? and add_op?
      if lang_do? and valid_stmts? and lang_end?
        true
      elsif lang_by? and add_op? and lang_do? and valid_stmts? and lang_end?
        true
      end
      true
    end
  end

  def log_exp?
    (log_factor?) \
    or                                      \
    (log_term? and lang_and? and log_exp?) #recursive!!
  end

  def log_term?
    (lang_not? and log_factor?) \
    or                          \
    (log_factor?)
  end

  def log_factor?
    lang_true? or lang_false? or log_rel_op?
  end

  def log_rel_op?
    (add_op? and (lte? or lt? or eq?) and add_op?)
  end

  def add_op?
    (mul_op? and ((plus? or minus?) and add_op?) or true) # the or true is because mul_op? alone is sufficient
  end

  def mul_op?
    (factor? and ((times? or div?) and mul_op?) or true) # the or true is because factor? alone is sufficient
  end

  def factor?
    if integer? or identifier?
      true
    elsif open_paren?
      if add_op?
        if close_paren?
          true
        else
          error('closing parenthesis')
          false
        end
      end
    else
      error('integer, identifier, or open parenthesis')
        false
    end
  end

  #region SYMBOLS
  def get_token
    while @tokenizer.get_token_kind == :COMMENT
      @tokenizer.next_token
    end
    @tokenizer.get_token_kind
  end
  def plus?
    ret = get_token == :PLUS
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def times?
    ret = get_token == :TIMES
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def minus?
    ret = get_token == :MINUS
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def div?
    ret = get_token == :DIV
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def integer?
    ret = get_token == :INTEGER
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def identifier?
    ret = get_token == :IDENTIFIER
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def open_paren?
    ret = get_token == :OPEN_PAREN
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def close_paren?
    ret = get_token == :CLOSE_PAREN
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_if?
    ret = get_token == :LANG_IF
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_then?
    ret = get_token == :LANG_THEN
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_end?
    ret = get_token == :LANG_END
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_for?
    ret = get_token == :LANG_FOR
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_to?
    ret = get_token == :LANG_TO
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_from?
    ret = get_token == :LANG_FROM
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_else?
    ret = get_token == :LANG_ELSE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_do?
    ret = get_token == :LANG_DO
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_by?
    ret = get_token == :LANG_BY
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_true?
    ret = get_token == :LANG_TRUE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_false?
    ret = get_token == :LANG_FALSE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_not?
    ret = get_token == :LANG_NOT
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_and?
    ret = get_token == :LANG_AND
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lte?
    ret = get_token == :LTE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lt?
    ret = get_token == :LT
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def eq?
    ret = get_token == :EQ
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def assign_op?
    ret = get_token == :ASSIGN_OP
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def semi_colon?
    ret = get_token == :SEMI_COL
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def comment?
    ret = get_token == :COMMENT
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def eof?
    get_token == 'EOF'
    # shouldn't be a next token
  end
  #endregion
end