class Analyzer
  def initialize tokenizer
    @tokenizer = tokenizer
  end

  def valid_program?
    valid_stmts? #and eof? TODO: need to read EOF
  end

  def valid_stmts?
    #ret = true
    #while ret and not eof? or lang_end? or lang_else?
    #  ret = (ret and valid_stmt? and semi_colon?) # make sure there is a semicolon
    #end
    #ret
    valid_stmt? and semi_colon? # TODO: read more statements
  end

  def valid_stmt?
    puts 'In valid_stmt?'
    (identifier? and assign_op? and add_op?)                                                              \
    or                                                                                                    \
    (lang_if? and log_exp? and lang_then? and valid_stmts? and (lang_end? or (lang_else? and valid_stmts? and lang_end?)))                                \
    or                                                                                                    \
    (lang_for? and identifier? and lang_from? and add_op? and lang_to? and add_op? and ((lang_do? and valid_stmts? and lang_end?) or lang_by? and add_op? and lang_do? and valid_stmts? and lang_end?))
  end

  def log_exp?
    puts 'in log_exp?'
    (log_factor?) \
    or                                      \
    (log_term? and lang_and? and log_exp?) #recursive!!
  end

  def log_term?
    puts 'in log_term?'
    (lang_not? and log_factor?) \
    or                          \
    (log_factor?)
  end

  def log_factor?
    lang_true? or lang_false? or log_rel_op?
  end

  def log_rel_op?
    puts 'in log_rel_op?'
    (add_op? and (lte? or lt? or eq?) and add_op?)
  end

  def add_op?
    puts 'in add_op'
    (mul_op? and ((plus? or minus?) and add_op?) or true) # the or true is because mul_op? alone is sufficient
  end

  def mul_op?
    puts 'in mul_op'
    (factor? and ((times? or div?) and mul_op?) or true) # the or true is because factor? alone is sufficient
  end

  def factor?
    puts 'in factor'
    integer? or identifier? or (open_paren? and add_op? and close_paren?)
  end

  #region SYMBOLS
  def plus?
    ret = @tokenizer.get_token_kind == :PLUS
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def times?
    ret = @tokenizer.get_token_kind == :TIMES
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def minus?
    ret = @tokenizer.get_token_kind == :MINUS
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def div?
    ret = @tokenizer.get_token_kind == :DIV
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def integer?
    ret = @tokenizer.get_token_kind == :INTEGER
    if ret
      puts 'int ack'
      @tokenizer.next_token
    end
    ret
  end

  def identifier?
    puts 'In identifier'
    ret = @tokenizer.get_token_kind == :IDENTIFIER
    if ret
      puts 'Identifier acknowledged'
      @tokenizer.next_token
    end
    ret
  end

  def open_paren?
    ret = @tokenizer.get_token_kind == :OPEN_PAREN
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def close_paren?
    ret = @tokenizer.get_token_kind == :CLOSE_PAREN
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_if?
    ret = @tokenizer.get_token_kind == :LANG_IF
    if ret
      @tokenizer.next_token
      puts 'if ack'
    end
    ret
  end

  def lang_then?
    puts 'in lang_then?'
    ret = @tokenizer.get_token_kind == :LANG_THEN
    if ret
      @tokenizer.next_token
      puts 'lang_then ack'
    end
    ret
  end

  def lang_end?
    ret = @tokenizer.get_token_kind == :LANG_END
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_for?
    ret = @tokenizer.get_token_kind == :LANG_FOR
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_to?
    ret = @tokenizer.get_token_kind == :LANG_TO
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_from?
    ret = @tokenizer.get_token_kind == :LANG_FROM
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_else?
    ret = @tokenizer.get_token_kind == :LANG_ELSE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_do?
    ret = @tokenizer.get_token_kind == :LANG_DO
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_by?
    ret = @tokenizer.get_token_kind == :LANG_BY
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_true?
    ret = @tokenizer.get_token_kind == :LANG_TRUE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_false?
    ret = @tokenizer.get_token_kind == :LANG_FALSE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_not?
    ret = @tokenizer.get_token_kind == :LANG_NOT
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_and?
    ret = @tokenizer.get_token_kind == :LANG_AND
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lte?
    ret = @tokenizer.get_token_kind == :LTE
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lt?
    puts 'in lt'
    ret = @tokenizer.get_token_kind == :LT
    if ret
      @tokenizer.next_token
      puts 'lt ack'
    end
    ret
  end

  def eq?
    ret = @tokenizer.get_token_kind == :EQ
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def assign_op?
    puts 'in aop'
    ret = @tokenizer.get_token_kind == :ASSIGN_OP
    if ret
      puts 'aop ack'
      @tokenizer.next_token
    end
    ret
  end

  def semi_colon?
    ret = @tokenizer.get_token_kind == :SEMI_COL
    if ret
      puts 'semicol ack'
      @tokenizer.next_token
    end
    ret
  end

  def comment?
    ret = @tokenizer.get_token_kind == :COMMENT
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def eof?
    @tokenizer.get_token_kind == 'N/A'
    # shouldn't be a next token
  end
  #endregion
end