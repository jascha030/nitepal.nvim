; extends

[
 (wildcard_chars)
 (wildcard_chars_allow_slash)
] @keyword 

(negation) @constant
(pattern) @variable
(directory_separator) @punctuation.delimiter

(comment) @commment
((comment) @title (#match? @title "^### "))
