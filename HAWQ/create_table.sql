CREATE [[GLOBAL | LOCAL] {TEMPORARY | TEMP}] TABLE <table_name> (
[ { <column_name> <data_type> [ DEFAULT <default_expr> ]
   [<column_constraint> [ ... ]
[ ENCODING ( <storage_directive> [,...] ) ]
]
   | <table_constraint>
   | LIKE <other_table> [{INCLUDING | EXCLUDING}
                      {DEFAULTS | CONSTRAINTS}] ...} ]
   [, ... ] ]
   [<column_reference_storage_directive> [, …] ]
   )
   [ INHERITS ( <parent_table> [, ... ] ) ]
   [ WITH ( <storage_parameter>=<value> [, ... ] )
   [ ON COMMIT {PRESERVE ROWS | DELETE ROWS | DROP} ]
   [ TABLESPACE <tablespace> ]
   [ DISTRIBUTED BY (<column>, [ ... ] ) | DISTRIBUTED RANDOMLY ]
   [ PARTITION BY <partition_type> (<column>)
       [ SUBPARTITION BY <partition_type> (<column>) ]
          [ SUBPARTITION TEMPLATE ( <template_spec> ) ]
       [...]
    ( <partition_spec> )
        | [ SUBPARTITION BY partition_type (<column>) ]
          [...]
    ( <partition_spec>
      [ ( <subpartition_spec>
           [(...)]
         ) ]
    )