(module
  [
    ; =========================================================
    ; TOP-LEVEL CONSTRUCTS
    ; Classes, functions, and imports at the root of the file
    ; =========================================================
    (class_definition) @fold
    (decorated_definition (class_definition) @fold)

    (function_definition) @fold
    (decorated_definition (function_definition) @fold)

    (import_statement) @fold
    (import_from_statement) @fold


    ; =========================================================
    ; NESTED CONSTRUCTS (Inside a STANDARD class)
    ; Methods and 1st-level nested classes
    ; =========================================================
    (class_definition
      body: (block
        [
          (class_definition) @fold
          (decorated_definition (class_definition) @fold)

          (function_definition) @fold
          (decorated_definition (function_definition) @fold)
        ]))


    ; =========================================================
    ; NESTED CONSTRUCTS (Inside a DECORATED class)
    ; Methods and 1st-level nested classes
    ; =========================================================
    (decorated_definition
      (class_definition
        body: (block
          [
            (class_definition) @fold
            (decorated_definition (class_definition) @fold)

            (function_definition) @fold
            (decorated_definition (function_definition) @fold)
          ])))
  ])
