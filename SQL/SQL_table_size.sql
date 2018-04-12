create function public.calc_partition_table_all(v_schemaname varchar,v_tablename varchar)
returns bigint as 
$BODY$
declare
  v_calc bigint  :=0;
  v_total bigint :=0;
  v_tbname varchar(200);
  
  cur_tbname cursor for select schemaname||'.'||partitiontablename as tb from pg_partitions
                         where schemaname = v_schemaname and tablename = v_tablename;
begin
  open cur_tbname;
  loop
    fetch cur_tbname into v_tbname;
    if not found then
      exit;
    end if;
    execute 'select pg_relation_size('''||v_tbname||''')' into v_calc;
    v_total:=v_total + v_calc;
  end loop;
  close cur_tbname;
  return v_total;
end;
$BODY$
language plpgsql;