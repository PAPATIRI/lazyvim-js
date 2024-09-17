;; extends
[
  ; prevent double indent for `return new class ...`
  (return_statement
    (object_creation_expression))
  ; prevent double indent for any function-like structure in a return statement
  (return_statement
    (_ ((_) @_func
       (#match? @_func "^(function|=>)")))) @indent.dedent
] @indent.dedent
