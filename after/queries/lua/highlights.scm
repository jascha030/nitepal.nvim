; extends

; Function names

[
  (if_statement 
    [
      "if"
      "else"
      "elseif"
      "then"
      "end"
    ] @conditional.keyword)
] (set! "priority" 105)

(function_declaration name: 
                        (identifier) @function)

