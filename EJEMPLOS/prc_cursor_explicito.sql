-- Práctica cursor explícito;
set serveroutput on;
declare 
  -- Declarar el cursor:
  cursor c1(total number) is
  select pe.idcliente, 
  (sum(dt.preciounidad * dt.cantidad * (1- dt.descuento))) / total * 100 as porcentaje
  from tbpedidos pe left join tbdetallespedidos dt
  on pe.id = dt.idpedido
  group by pe.idcliente
  order by pe.idcliente;  
  
  vtotal_cliente number;
  v_idcliente VARCHAR2(20);
  v_total number;
  numClientes number:=0;
  
begin
  -- Calcular el total de la facturación:
  SELECT sum(preciounidad * cantidad * (1- descuento)) into v_total
  from tbdetallespedidos;
  
  -- Abrir el cursor pasando el total:
  open c1(v_total);
  fetch c1 into v_idcliente, vtotal_cliente;
  
  while c1%found loop
    dbms_output.put_line(v_idcliente || ':' || round(vtotal_cliente,2) || '%');
    numclientes:= numclientes+1;
    fetch c1 into v_idcliente, vtotal_cliente;
  end loop;
  close c1;
  
   dbms_output.put_line('Ganancia Total: ' || v_total);
   dbms_output.put_line('Número total de clientes: ' || numclientes);
  dbms_output.put_line('Media por Cliente: ' || round((v_total / numclientes),2)); 
exception
  when OTHERS THEN
    dbms_output.put_line('Se ha producido el error: ' || sqlerrm);
end;
/
  
