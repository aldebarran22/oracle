-- Declaración de un tipo registro:
set serveroutput on

declare 
  type tCliente is record (
      id varchar2(10),
      nombre varchar2(60),
      descripcion varchar2(100)
    );
    
  type tPedido is record (
    id number,
    cargo float,
    clientePedido tCliente
  );
 
  un_pedido tPedido;
  un_cliente tCliente;
  cliente tCliente;
  
  
  procedure grabarCliente(cliente tCliente) as
  begin
    -- insertar un nuevo registro:
    insert into tbclientes values cliente;
    COMMIT;
  
  end;
  
  function recuperarCliente(id_cliente in VARCHAR2) return tCliente as
   fcliente tCliente;
  begin
   -- Recuperar un cliente:
    select id, nombre, descripcion INTO fcliente from tbclientes where id=id_cliente;
    return fcliente;
    
  end;
  
begin
    -- Cargar los campos del registro por teclado:
    un_cliente.id := '&id_cliente';
    un_cliente.nombre := '&nombre_del_cliente';
    un_cliente.descripcion := '&descripcion_cliente';
    
    un_pedido.id := 99999;
    un_pedido.clientePedido := un_cliente;
    un_pedido.cargo := 30;
    
    dbms_output.put_line('Nombre cliente dentro del pedido: ' || un_pedido.clientePedido.nombre);
    grabarCliente(un_cliente);
    
   cliente:=recuperarCliente(un_cliente.id);
    
    dbms_output.put_line('id: ' || cliente.id || ' nombre: ' || cliente.nombre || ' desc: ' || cliente.descripcion);
    
     
end;
/
      

