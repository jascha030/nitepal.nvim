; extends

(string (string_value) @sql
    (#lua-match? @sql "^%s*SELECT")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*UPDATE")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*DELETE")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*CREATE")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*INSERT")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*REPLACE")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*DROP")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*ALTER")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*EXPLAIN")
    (#exclude_children! @sql))

(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*SELECT")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*UPDATE")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*DELETE"))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*CREATE")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*INSERT")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*REPLACE")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*DROP")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*ALTER")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*EXPLAIN")
    (#exclude_children! @sql))

((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*SELECT")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*UPDATE")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*DELETE")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*CREATE")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*INSERT")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*REPLACE")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*DROP")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*ALTER")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*EXPLAIN")
    (#exclude_children! @sql))

((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*SELECT")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*UPDATE")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*DELETE")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*CREATE")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*INSERT")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*REPLACE")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*DROP")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*ALTER")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*EXPLAIN")
    (#exclude_children! @sql))

(string (string_value) @sql
    (#lua-match? @sql "^%s*select")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*update")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*delete")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*create")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*insert")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*replace")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*drop")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*alter")
    (#exclude_children! @sql))
(string (string_value) @sql
    (#lua-match? @sql "^%s*explain")
    (#exclude_children! @sql))

(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*select")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*update")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*delete"))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*create")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*insert")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*replace")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*drop")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*alter")
    (#exclude_children! @sql))
(encapsed_string (string_value) @sql
    (#lua-match? @sql "^%s*explain")
    (#exclude_children! @sql))

((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*select")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*update")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*delete")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*create")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*insert")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*replace")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*drop")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*alter")
    (#exclude_children! @sql))
((nowdoc value: (nowdoc_body) @sql)
    (#lua-match? @sql "^%s*explain")
    (#exclude_children! @sql))

((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*select")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*update")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*delete")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*create")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*insert")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*replace")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*drop")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*alter")
    (#exclude_children! @sql))
((heredoc value: (heredoc_body) @sql)
    (#lua-match? @sql "^%s*explain")
    (#exclude_children! @sql))

((text) @injection.content
 (#set! injection.language "html")
 (#set! injection.combined))

