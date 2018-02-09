class Analyzer
  def initialize tokenizer
    @tokenizer = tokenizer
  end

  def valid_program?
    valid_statements?
  end

  # TODO: not sure if this is going to be right
  def valid_stmts?
      and_all?(valid_stmt?, semicolon?) \
      or \
      and_all?(valid_stmt?, semicolon?, valid_stmt?)
  end

  def valid_stmt?

  end

  def semi_colon?
    @tokenizer.get_token_kind = Symbol::SYMBOLS[:SEMI_COL]
  end

  # and_all? takes variable number of boolean expressions and aggregates them into
  # a final answer
  def and_all? *exprs
    ret = true
    for exp in exprs
      ret = (ret and exp)
    end
    ret
  end
end