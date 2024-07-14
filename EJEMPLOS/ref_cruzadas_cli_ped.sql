-- Referencias cruzadas entre clientes y pedidos:

select * from 
(
  select idcliente, paisdestinatario, cargo
  from tbpedidos
)
pivot
(
  count(cargo) AS CUENTA_CARGO,
  sum(cargo) AS SUMA_CARGO
  for paisdestinatario in ('Alemania','Italia','Francia')
)
order by idcliente;


select * from 
(
  select idcliente, paisdestinatario, cargo
  from tbpedidos
)
pivot xml
(
  count(cargo) AS CUENTA_CARGO,
  sum(cargo) as SUMA_CARGO
  for paisdestinatario in (select distinct paisdestinatario from tbpedidos)
);
  
  
select distinct paisdestinatario from tbpedidos;
  
  