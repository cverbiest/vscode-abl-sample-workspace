/*------------------------------------------------------------------------
    File        : start.p
    Purpose     : Sample start procedure
    Author(s)   : Carl Verbiest
    Created     : 2025-02-22 09:29:19    
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

define variable DatabaseList as character no-undo.
define variable Count as integer no-undo.

do Count = 1 to num-dbs:
    DatabaseList = substitute("&1~n&2 = -db &3 &4", DatabaseList, ldbname(Count), pdbname(Count), dbparam(Count)).
end.  

message program-name(1) skip
    num-dbs "database(s)" DatabaseList
    "propath"
    replace(propath, ",", "~n")
    view-as alert-box.
/* 2025-02-23 author :  */