
CREATE OR REPLACE FUNCTION isLeapYear(i_year NUMBER) RETURN boolean AS
BEGIN
  -- A year is a leap year if it is evenly divisible by 4 
  -- but not if it's evenly divisible by 100 
  -- unless it's also evenly divisible by 400 

   IF mod(i_year, 400) = 0 OR ( mod(i_year, 4) = 0 AND mod(i_year, 100) != 0) THEN
      return TRUE;
   ELSE 
      return FALSE;
   END IF;
END;
/
show errors

-- Let's test it
SET SERVEROUTPUT ON
BEGIN
  IF isLeapYear(2004) THEN
     dbms_output.put_line('Yes, it is a leap year');
  ELSE
     dbms_output.put_line('No, it is not a leap year');
  END IF;
END;
/