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
    (identifier? and assign_op? and add_op?)                                                              \
    or                                                                                                    \
    (lang_if? and log_exp? and lang_then? and valid_stmts? and lang_end?)                                 \
    or                                                                                                    \
    (lang_if? and log_exp? and lang_then? and valid_stmts? and lang_else? and valid_stmts? and lang_end?) \
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
    @tokenizer.getKind = Symbol::SYMBOLS[:PLUS]
  end

  def times?
    @tokenizer.getKind = Symbol::SYMBOLS[:TIMES]
  end

  def minus?
    @tokenizer.getKind = Symbol::SYMBOLS[:MINUS]
  end

  def div?
    @tokeniser.getKind = Symbol::SYMBOLS[:DIV]
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

  def lang_and?
    @tokenizer.getKind = Symbol::SYMBOLS[:LANG_AND]
  end

  def lte?
    @tokenizer.getKind = Symbol::SYMBOLS[:LTE]
  end

  def lt?
    @tokenizer.getKind = Symbol::SYMBOLS[:LT]
  end

  def eq?
    @tokenizer.getKind = Symbol::SYMBOLS[:EQ]
  end

  def assign_op?
    @tokenizer.getKind = Symbol::SYMBOLS[:ASSIGN_OP]
  end

  def semi_colon?
    @tokenizer.getKind = Symbol::SYMBOLS[:SEMI_COL]
  end
  #endregion
end