-- Separar los pedidos por pais
set serveroutput on
declare 
   nombreTabla nvarchar2(80);
   paisO VARCHAR2(50);
   paisD VARCHAR2(50);
   sentenciaSQL varchar2(200);
     
begin
  for cursor_pais in (select distinct paisdestinatario from tbpedidos order by paisdestinatario) loop
    paisO := cursor_pais.paisdestinatario;
    
    if paisO like 'Espa%' then
      paisD := 'Espanya';
    else
      paisD := paisO;
    end if;
    
    --Montar el nombre de la tabla quitando blancos.
    nombreTabla := 'TbPedidos' || paisD;
    nombreTabla := replace(nombretabla, ' ', '');
    --dbms_output.put_line(nombretabla);
    
    -- Crear la tabla:
    sentenciaSQL := 'create table ' || nombretabla  || ' as select * from tbpedidos where paisdestinatario = ' || chr(39) || paisO || chr(39);
    --dbms_output.put_line(sentenciaSQL);
    execute immediate  sentenciaSQL;
    
     
    --Informar al user:
    dbms_output.put_line('Se ha creado la tabla ' || nombreTabla || ' con ' || SQL%ROWCOUNT  || ' registros');
    
  end loop;
end;
/

