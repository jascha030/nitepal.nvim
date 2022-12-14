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
] @keyword

(arguments (argument name: (name) @parameter.name))

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
] (set! "priority" 105)

((name) @keyword (#match? @keyword "^(exit|die)$"))
(variable_name ("$") @variable.operator)
(simple_parameter 
  name: (variable_name 
          ("$") @parameter.operator
          (name) @parameter) 
  (set! "priority" 105))

(object_creation_expression (name) @object.var)
(text) @text

