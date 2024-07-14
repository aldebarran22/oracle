CREATE OR REPLACE
FUNCTION COMPROBAR_SOCIO
( plogin IN VARCHAR2
, ppass IN VARCHAR2
) RETURN NUMBER AS
  cuenta integer;
BEGIN
  cuenta := 0;
  
  select count(*) into cuenta from aux_socios where login=plogin and pass= ppass;
  if cuenta = 1 then
    RETURN 0;
  else  
    select count(*) into cuenta from aux_socios  where login=plogin;
    
    if cuenta = 1 then
      return 1;
    else
      return 2;
    end if;
  end if;
END COMPROBAR_SOCIO;
/