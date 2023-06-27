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
  "from"
  "as"
] @keyword

(binary_expression 
  [
    "??"
    "?"
  ] @conditional.operator)

(optional_type ["?"] @operator)
(arguments (argument name: (name) @parameter.name))

(declare_statement 
  (declare_directive (integer) @number
                     ) @variable)


[
  (class_declaration 
    (name) @class.declaration)
  (trait_declaration 
    name: (name) @class.declaration)
  (class_constant_access_expression 
    (qualified_name 
      (namespace_name_as_prefix) @reference.scope))
  (scoped_call_expression 
    scope: (relative_scope) @scope.relative)
  (scoped_call_expression 
    scope: (name) @class.declaration)
  (member_call_expression 
    object: (variable_name) @object.var)
  (class_constant_access_expression 
    . 
    [(name) (qualified_name)] @class.declaration
    (name) @constant.class)
  (interface_declaration 
    name: (name) @interface.declaration)
  (method_declaration (visibility_modifier) @scope.relative)
  (property_declaration (visibility_modifier) @keyword)
] (set! "priority" 105)

((name) @keyword (#match? @keyword "^self$"))
((name) @keyword (#match? @keyword "^(exit|die)$"))

(variable_name ("$") @variable.operator)
(simple_parameter 
  name: (variable_name 
          ("$") @parameter.operator
          (name) @parameter) 
  (set! "priority" 105))

(object_creation_expression (name) @object.var)
(variadic_parameter name: (variable_name) @parameter) @variable
(text) @text

