-- Subir un 5% el importe de los pedidos de la tabla de Brasil con los idclientes que empiecen por H
DECLARE 
    CURSOR cpedidos IS
    select idcliente, cargo
    from tbpedidosbrasil
    where idcliente like 'H%'
    FOR UPDATE;
    idcliente VARCHAR2(5);
    cargo float;
    
BEGIN
  /*
    OPEN cpedidos;
    FETCH cpedidos INTO idcliente, cargo;
    WHILE cpedidos%found
    LOOP 
	UPDATE tbpedidosbrasil 
        SET cargo = cargo * 1.05
        WHERE CURRENT OF cpedidos;

        FETCH cpedidos INTO idcliente, cargo;
    END LOOP; 
    CLOSE cpedidos;
    COMMIT;*/
    
    for cur1 in ( select idcliente, cargo from tbpedidosbrasil  where idcliente like 'H%' for update of cargo) loop
      	UPDATE tbpedidosbrasil  SET cargo = cargo * 1.05  WHERE CURRENT OF cur1;   
        --dbms_output.put_line('idcliente: ' || cur1.idcliente);
    end loop;
    commit;

END;