; extends

[
  "use"
  "namespace"
  "static"
  "final"
] @keyword.scope

[
  "try"
  "catch"
  "throw"
  "instanceof"
  "as"
] @keyword

(binary_expression
  [
    "??"
    "?"
  ] @conditional.operator)

(arguments
  (argument
    (name) @parameter.name
    (#set! "priority" 150)))

([
  (class_declaration
    (name) @class.declaration)
  (trait_declaration
    name: (name) @class.declaration)
  (scoped_call_expression
    scope: (relative_scope) @scope.relative)
  (scoped_call_expression
    scope: (name) @class.declaration)
  (member_call_expression
    object: (variable_name) @object.var)
  (class_constant_access_expression
    .
    [
      (name)
      (qualified_name)
    ] @class.declaration
    (name) @constant.class)
  (interface_declaration
    name: (name) @interface.declaration)
  (method_declaration
    (visibility_modifier) @scope.relative)
  (property_declaration
    (visibility_modifier) @keyword)
]
  (#set! "priority" 105))

((name) @keyword
  (#match? @keyword "^(self|exit|die)$"))

(variable_name
  "$" @variable.operator)

(simple_parameter
  name: (variable_name
    "$" @parameter.operator
    (name) @parameter)
  (#set! "priority" 105))

(object_creation_expression
  (name) @object.var)

(variadic_parameter
  name: (variable_name) @parameter) @variable

(text) @text

(namespace_use_clause
  type: "function"
  [
    (name) @import.function
    (qualified_name
      (name) @import.function)
    alias: (name) @import.function
  ])

(namespace_use_clause
  type: "const"
  [
    (name) @import.constant
    (qualified_name
      (name) @import.constant)
    alias: (name) @import.constant
  ])

((member_call_expression
  object: (member_call_expression
    name: (name) @function.method.call.php)
  name: (name) @function.method.call.php)
  (#set! "priority" 150))

[
  (scoped_property_access_expression
    scope: (relative_scope) @keyword)
  (class_constant_access_expression
    (relative_scope) @keyword)
]

((name) @constant.magic.php
  (#lua-match? @constant.magic.php "^__.*__$")
  (#set! "priority" 160))

((name) @constant.name.php
  (#lua-match? @constant.name.php "^[A-Z_][A-Z0-9_]*$")
  (#set! "priority" 160))
