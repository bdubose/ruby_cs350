class Analyzer
  def initialize tokenizer
    @tokenizer = tokenizer
  end

  def valid_program?
    valid_statements?
  end

  # TODO: not sure if this is going to be right
  def valid_stmts?
      (valid_stmt? and semi_colon?)                   \
      or                                              \
      (valid_stmt? and semi_colon? and valid_stmts?)
  end

  def valid_stmt?

  end


  #region SYMBOLS
  def add_op?
    @tokenizer.getKind = Symbol::SYMBOLS[:ADD_OP]
  end

  def mul_op?
    @tokenizer.getKind = Symbol::SYMBOLS[:MUL_OP]
  end

  def integer?
    @tokenizer.getKind = Symbol::SYMBOLS[:INTEGER]
  end

  def identifier?
    @tokenizer.getKind = Symbol::SYMBOLS[:IDENTIFIER]
  end

  def open_paren?
    @tokenizer.getKind = Symbol::SYMBOLS[:OPEN_PAREN]
  end

  def close_paren?
    @tokenizer.getKind = Symbol::SYMBOLS[:CLOSE_PAREN]
  end

  def lang_if?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_IF]
  end

  def lang_then?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_THEN]
  end

  def lang_end?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_END]
  end

  def lang_for?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_FOR]
  end

  def lang_to?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_TO]
  end

  def lang_from?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_FROM]
  end

  def lang_else?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_ELSE]
  end

  def lang_do?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_DO]
  end

  def lang_by?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_BY]
  end

  def lang_true?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_TRUE]
  end

  def lang_false?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_FALSE]
  end

  def lang_not?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_NOT]
  end

  def log_rel_op?
    @tokenizer.getKind = Symbol::SYMBOLS[:LOG_REL_OP]
  end

  def assign_op?
    @tokenizer.getKind = Symbol::SYMBOLS[:ASSIGN_OP]
  end

  def semi_colon?
    @tokenizer.getKind = Symbol::SYMBOLS[:SEMI_COL]
  end
  #endregion
end