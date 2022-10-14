[
  "use"
  "namespace"
  "static"
  "final"
] @keyword.scope

[
  (class_declaration 
    (name) @class.declaration)
  (trait_declaration 
    name: (name) @class.declaration)
  (scoped_call_expression 
    scope: (relative_scope) @scope.relative)
  (member_call_expression 
    object: (variable_name) @object.var)
  (class_constant_access_expression . 
                                    [(name) (qualified_name)] @class.name
                                    (name) @constant)
] (set! "priority" 105)
