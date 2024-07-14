set serveroutput on

begin
  --gestion_paises.borrarTbPaises;
  gestion_paises.borrartbpaises;
  
  if gestion_paises.existeTablaPaises('TBPEDIDOSBRASIL') then
    dbms_output.put_line('Existe');
  else
      dbms_output.put_line('NO Existe');
  end if;
  
  --gestion_paises.creartbpaises;
end;
/