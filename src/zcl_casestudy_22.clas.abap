class ZCL_CASESTUDY_22 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_UJ_CUSTOM_LOGIC .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CASESTUDY_22 IMPLEMENTATION.


  method IF_UJ_CUSTOM_LOGIC~CLEANUP.
  endmethod.


  method IF_UJ_CUSTOM_LOGIC~EXECUTE.
  FIELD-SYMBOLS : <fs_sd>  TYPE any,
                <fs_sd1>  TYPE any,
                <fs_data>  TYPE any.

LOOP AT ct_data ASSIGNING <fs_data>.
  ASSIGN COMPONENT 'SIGNEDDATA' OF STRUCTURE <fs_data> TO <fs_sd>.
  ASSIGN COMPONENT 'COSTCENTER' OF STRUCTURE <fs_data> TO <fs_sd1>.

  IF SY-SUBRC IS INITIAL.
    IF <fs_sd1> = 'DCC1' OR <fs_sd1> = 'DCC2'.
      <fs_sd> = <fs_sd> + ( <fs_sd> * '0.10').
    ELSE.
      <fs_sd> = <fs_sd> + ( <fs_sd> * '0.20').
    ENDIF.
  ENDIF.

ENDLOOP.
  endmethod.


  method IF_UJ_CUSTOM_LOGIC~INIT.
  endmethod.
ENDCLASS.
