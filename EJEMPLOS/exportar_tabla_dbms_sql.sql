-- Exportar a un fichero CSV una consulta con los nombres de las cabeceras.
set serveroutput on
declare
        p_query         varchar2(2000):='select * from tbclientes';
        l_theCursor     integer default dbms_sql.open_cursor;
        l_columnValue   varchar2(4000);
        l_status        integer;
        l_descTbl       dbms_sql.desc_tab;
        l_colCnt        number;
        primeraVez      integer:=1;
        
        fichero utl_file.file_type; 
        linea varchar2(120);
    begin
        fichero := utl_file.fopen('DIR_TEMP', 'exportacion.txt', 'w');
        dbms_sql.parse(l_theCursor,p_query,dbms_sql.native);
  
       dbms_sql.describe_columns( l_theCursor, l_colCnt, l_descTbl);
 
       for i in 1 .. l_colCnt loop
           dbms_sql.define_column(l_theCursor, i, l_columnValue, 4000);
       end loop;
 
       l_status := dbms_sql.execute(l_theCursor);
 
       while ( dbms_sql.fetch_rows(l_theCursor) > 0 ) loop
            linea:='';
            if primeravez = 1 then
              -- Imprime cabeceras:
               for i in 1 .. l_colCnt loop 
                  linea:=linea || l_descTbl(i).col_name;
                  dbms_output.put( l_descTbl(i).col_name );
                  if i < l_colcnt then
                    dbms_output.put(';');
                    linea:=linea || ';';
                  end if;
                end loop;
                dbms_output.new_line;
                utl_file.put_line(fichero, linea); 
                primeravez:=0;
           end if;
           
           -- Las líneas de datos:
           linea:='';
           for i in 1 .. l_colCnt loop 
              dbms_sql.column_value( l_theCursor, i, l_columnValue ); 
              dbms_output.put(l_columnValue);
              linea:=linea || l_columnValue;
              
               if i < l_colcnt then
                    dbms_output.put(';');
                    linea:=linea || ';';
                end if;
           end loop;
           dbms_output.new_line;
           utl_file.put_line(fichero, linea); 
       end loop;
       utl_file.fclose(fichero); 
       
 exception
       when others then 
        dbms_output.put_line('ERROR:' || sqlerrm);
        dbms_sql.close_cursor( l_theCursor ); 
 end;
 / 
