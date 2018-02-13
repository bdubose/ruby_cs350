class Analyzer
  def initialize tokenizer
    @tokenizer = tokenizer
  end

  def valid_program?
    valid_statements?
  end

  # TODO: not sure if this is going to be right
  def valid_stmts?
    ret = true
    until eof?
      ret = (ret and valid_stmt? and semi_colon?) # valid statements until eof, followed by semi_colon
    end
  end

  def valid_stmt?
    (identifier? and assign_op? and add_op?)                                                              \
    or                                                                                                    \
    (lang_if? and log_exp? and lang_then? and valid_stmts? and (lang_end? or (lang_else? and valid_stmts? and lang_end?)))                                \
    or                                                                                                    \
    (lang_for? and identifier? and lang_from? and add_op? and lang_to? and add_op? and lang_do? and valid_stmts? and lang_end?) \
    or                                                                                                    \
    (lang_for? and identifier? and lang_from? and add_op? and lang_to? and add_op? and lang_by? and add_op? and lang_do? and valid_stmts? and lang_end?)
  end

  def log_exp?
    (log_term? and lang_and? and log_exp?)  \
    or                                      \
    (log_factor?)
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
    (add_op? and lte? and add_op?) \
    or                             \
    (add_op? and lt? and add_op?)  \
    or                             \
    (add_op? and eq? and add_op?)
  end

  def add_op?
    (mul_op? and plus? and add_op?) \
    or                              \
    (mul_op? and minus? and add_op?)\
    or  mul_op?
  end

  def mul_op?
    (factor? and times? and mul_op?) \
    or                               \
    (factor? and div? and mul_op?)   \
    or factor?
  end

  def factor?
    integer? or identifier? or (open_paren? and add_op? and close_paren?)
  end

  #region SYMBOLS
  def plus?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:PLUS]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def times?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:TIMES]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def minus?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:MINUS]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def div?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:DIV]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def integer?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:INTEGER]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def identifier?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:IDENTIFIER]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def open_paren?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:OPEN_PAREN]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def close_paren?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:CLOSE_PAREN]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_if?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_IF]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_then?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_THEN]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_end?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_END]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_for?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_FOR]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_to?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_TO]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_from?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_FROM]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_else?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_ELSE]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_do?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_DO]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_by?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_BY]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_true?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_TRUE]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_false?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_FALSE]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_not?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_NOT]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lang_and?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LANG_AND]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lte?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LTE]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def lt?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:LT]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def eq?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:EQ]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def assign_op?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:ASSIGN_OP]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def semi_colon?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:SEMI_COL]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def comment?
    ret = @tokenizer.get_token_kind == Symbol::SYMBOLS[:COMMENT]
    if ret
      @tokenizer.next_token
    end
    ret
  end

  def eof?
    @tokenizer.get_token_kind == Symbol::SYMBOLS[:EOF]
    # shouldn't be a next token
  end
  #endregion
end