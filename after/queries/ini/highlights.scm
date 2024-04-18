; extends

(setting 
  (setting_name) @property
  (setting_value) @constant)

(setting 
  (setting_value) @string 
    (#match? @string "(\".*\")$"))

(section 
  (section_name (text) @function) 
  (#set! "priority" 105)) 
