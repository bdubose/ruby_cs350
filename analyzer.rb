class Analyzer
  def initialize tokenizer
    @tokenizer = tokenizer
  end

  def valid_program?
    valid_statements?
  end

  def valid_stmts?
    valid_stmt? or
        (valid_stmt? and semi_colon? and valid_stmt?)
  end

  def valid_stmt?

  end
end