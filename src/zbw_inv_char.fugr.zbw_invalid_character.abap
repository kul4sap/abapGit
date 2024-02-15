FUNCTION zbw_invalid_character.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  CHANGING
*"     REFERENCE(ZZresult) TYPE  ANY
*"  EXCEPTIONS
*"      INVALID_DATA_TYPE
*"----------------------------------------------------------------------

  DATA: str1 TYPE string VALUE '0123456789'.
  DATA: length TYPE i.
  DATA: temp_Zresult(100).
  DATA: char(1).

  length = strlen( Zresult ).

  CLEAR temp_Zresult.

  TRANSLATE Zresult TO UPPER CASE.

  DO length TIMES.

    length = length - 1.
    char = Zresult+length(1).

    IF ( char CO sy-abcde ) OR ( char CO str1 ) OR ( char CO space ).

      IF ( char CO space ).
        CONCATENATE ` ` temp_Zresult INTO temp_Zresult.
      ELSE.
        CONCATENATE char temp_Zresult INTO temp_Zresult.
      ENDIF.
    ENDIF.

  ENDDO.

  SHIFT temp_Zresult LEFT DELETING LEADING space.


  Zresult = temp_Zresult.

ENDFUNCTION.
