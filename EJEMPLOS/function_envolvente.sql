create or replace function saludojava(nombre in varchar2)
return varchar2
as language java
name 'Saludo.saludar(java.lang.String) return java.lang.String';
/

select saludojava('pepe') from dual;


