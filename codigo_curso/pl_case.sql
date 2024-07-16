set serveroutput on;

declare

 nombreemp tbcompañiasenvios.nombre%type;
 cuenta number;
 tipo varchar2(20);

begin
    
    select e.nombre, count(p.id) into nombreemp, cuenta 
    from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
    where e.id=2
    group by e.nombre;    
    
        
    case
    when cuenta between 150 and 250 then tipo := 'Simple';
    when cuenta  between 251 and 300 then tipo := 'Normal';
    else tipo := 'Super';
    end  case;
    
    dbms_output.put_line('La cuenta de pedidos de la empresa: ' || cuenta || ' tipo: ' || tipo);
end;
/