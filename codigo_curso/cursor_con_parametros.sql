/* Definir un cursor con parametros */
-- Calcular el total facturado de un pais en la tabla de pedidos
set serveroutput on;
declare
    -- Definir un cursor con parametros:
    cursor c1(pais varchar2, min_cargo float) is 
    select sum(cargo) as total
    from tbpedidos 
    where cargo > min_cargo and PAISDESTINATARIO = pais;
        
    -- Recuperar toda la información de un empleado:
    pedido c1%rowtype;    
    
    nombrePais varchar2(30);
    cargo float;
    
begin
    -- Pedir datos por teclado:
    nombrePais := '&Dame_pais';
    cargo := &Cargo_minimo;
    
    open c1(nombrePais, cargo);
    fetch c1 into pedido;
    close c1;
    
    dbms_output.put_line('Facturación: ' || nombrePais || ' ' || pedido.total);
 
exception
    when no_data_found then
        dbms_output.put_line('error no existe el pais: ' || nombrePais);

end;
/