;; extends

; Function names

(if_statement [
    "if"
    "else"
    "elseif"
    "then"
    "end"
] @conditional.keyword)

((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z_0-9]*$"))
