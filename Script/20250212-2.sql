SQL> 
SQL> 
SQL> create table bb
  2  (bb1 number(2),
  3  bb3 varchar2(10) contraint bb_bb2_pk primary key);
bb3 varchar2(10) contraint bb_bb2_pk primary key)
                 *
ERROR at line 3:
ORA-00907: missing right parenthesis 


SQL> edit
Wrote file afiedt.buf

  1  create table bb
  2  (bb1 number(2),
  3* bb2 varchar2(10) contraint bb_bb2_pk primary key)
SQL> /
bb2 varchar2(10) contraint bb_bb2_pk primary key)
                 *
ERROR at line 3:
ORA-00907: missing right parenthesis 


SQL> select * from bb;
select * from bb
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> create table bb
  2  (bb1 number(2),
  3  bb2 varchar2(10) contraint bb_bb2_pk primary key);
bb2 varchar2(10) contraint bb_bb2_pk primary key)
                 *
ERROR at line 3:
ORA-00907: missing right parenthesis 


SQL> edit
Wrote file afiedt.buf

  1  create table bb
  2  (bb1 number(2),
  3* bb2 varchar2(10))
SQL> desc bb
ERROR:
ORA-04043: object bb does not exist 


SQL> desc bb;
ERROR:
ORA-04043: object bb does not exist 


SQL> select * from bb;
select * from bb
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> /
select * from bb
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> create table bb
  2  (bb1 number(2),
  3  bb2 varchar2(10));

Table created.

SQL> desc bb;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BB1                                                NUMBER(2)
 BB2                                                VARCHAR2(10)

SQL> alter table bb
  2  add constraint bb_bb2_pk primary key (bb2);

Table altered.

SQL> 
SQL> 
SQL> desc bb;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 BB1                                                NUMBER(2)
 BB2                                       NOT NULL VARCHAR2(10)

SQL> alter table bb disable constraint bb_bb2_pk
  2  ;

Table altered.

SQL> select * from bb;

no rows selected

SQL> insert into bb values (2,'A');

1 row created.

SQL> select * from bb;

       BB1 BB2                                                                  
---------- ----------                                                           
         2 A                                                                    

SQL> insert into bb values (1,'A');

1 row created.

SQL> select * from bb;

       BB1 BB2                                                                  
---------- ----------                                                           
         2 A                                                                    
         1 A                                                                    

SQL> create table cc
  2  (cc1 number(2) contraint cc_cc1_pk primary key disable novalidate,
  3  cc2 varchar2(10));
(cc1 number(2) contraint cc_cc1_pk primary key disable novalidate,
               *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> /
(cc1 number(2) contraint cc_cc1_pk primary key disable novalidate,
               *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> edit
Wrote file afiedt.buf

  1  create table cc
  2  (cc1 number(2) constraint cc_cc1_pk primary key disable novalidate,
  3* cc2 varchar2(10))
SQL> /
create table cc
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> select * from cc;

CC1                                                                             
---------------------------------------------------------------------------     
CC2                                                                             
---------------------------------------------------------------------------     
CC3                                                                             
---------------------------------------------------------------------------     
08-FEB-25 02.07.27.000 PM                                                       
+02-09                                                                          
+00 00:41:40.000000                                                             
                                                                                
08-FEB-25 02.10.38.000 PM                                                       
+27-06                                                                          
+25 02:00:00.000000                                                             

CC1                                                                             
---------------------------------------------------------------------------     
CC2                                                                             
---------------------------------------------------------------------------     
CC3                                                                             
---------------------------------------------------------------------------     
                                                                                

SQL> create table ccc
  2  (cc1 number(2) constraint cc_cc1_pk primary key disable novalidate,
  3  cc2 varchar2(10));

Table created.

SQL> create table dd
  2  (dd1 number(2) constraint dd_dd1_pk disable validate,
  3  dd2 varchar2(10));
(dd1 number(2) constraint dd_dd1_pk disable validate,
               *
ERROR at line 2:
ORA-02253: constraint specification not allowed here 


SQL> edit
Wrote file afiedt.buf

  1  create table dd
  2  (dd1 number(2) constraint dd_dd1_pk primary key disable validate,
  3* dd2 varchar2(10))
SQL> /
create table dd
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> edit
Wrote file afiedt.buf

  1  create table ddd
  2  (dd1 number(2) constraint dd_dd1_pk primary key disable validate,
  3* dd2 varchar2(10))
SQL> /

Table created.

SQL> insert into ddd values (1,'A');
insert into ddd values (1,'A')
*
ERROR at line 1:
ORA-25128: No insert/update/delete on table with constraint (OSQLN01.DD_DD1_PK) 
disabled and validated 


SQL> desc ee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EE1                                                NUMBER(5)
 EE2                                                NUMBER(5)

SQL> create table eee
  2  (ee1 number(2),
  3  ee2 varchar2(10),
  4  ee3 varchar2(10),
  5  constraint ee_ee23_uk unique(ee2, ee3));

Table created.

SQL> insert into eee values (1,'A','C');

1 row created.

SQL> insert into eee values (1,'A','B');

1 row created.

SQL> select * from eee;

       EE1 EE2        EE3                                                       
---------- ---------- ----------                                                
         1 A          C                                                         
         1 A          B                                                         

SQL> insert into ee values (2,'A','C');
insert into ee values (2,'A','C')
            *
ERROR at line 1:
ORA-00913: too many values 


SQL> insert into eee values (2,'A','C');
insert into eee values (2,'A','C')
*
ERROR at line 1:
ORA-00001: unique constraint (OSQLN01.EE_EE23_UK) violated 


SQL> alter table eee modify
  2  (ee2 varchar2(10),
  3  ee3 varchar2(10),
  4  constraint ee_ee23_uk unique(ee2, ee3) deferrable initially deferred)
  5  ;
constraint ee_ee23_uk unique(ee2, ee3) deferrable initially deferred)
                      *
ERROR at line 4:
ORA-02261: such unique or primary key already exists in the table 


SQL> edit
Wrote file afiedt.buf

  1  alter table eee modify
  2  (ee2 varchar2(10),
  3  ee3 varchar2(10),
  4* constraint ee_ee23_uk unique(ee2, ee3) deferrable initially deferred)
SQL> select * from ff;

no rows selected

SQL> desc ff
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FF1                                                NUMBER(5)
 FF2                                                NUMBER(5)

SQL> create table fff
  2  (ff1 number(2),
  3  ff2 varchar2(10),
  4  ff3 varchar2(10),
  5  constraint ff_ff23_uk unique(ff2, ff3) deferrable initially deferred);

Table created.

SQL> insert into fff values (1,'A','B');

1 row created.

SQL> insert into fff values (2,'A','B');

1 row created.

SQL> select * from fff;

       FF1 FF2        FF3                                                       
---------- ---------- ----------                                                
         1 A          B                                                         
         2 A          B                                                         

SQL> insert into fff values (3,'A','C');

1 row created.

SQL> select * from fff;

       FF1 FF2        FF3                                                       
---------- ---------- ----------                                                
         1 A          B                                                         
         2 A          B                                                         
         3 A          C                                                         

SQL> commit;
commit
*
ERROR at line 1:
ORA-02091: transaction rolled back 
ORA-00001: unique constraint (OSQLN01.FF_FF23_UK) violated 


SQL> select * from fff;

no rows selected

SQL> alter table fff disable constraint ff_ff23_uk novalidate;
alter table fff disable constraint ff_ff23_uk novalidate
                                              *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> create global temporary table hh
  2  (hh1 number(5),
  3  hh2 number(5));

Table created.

SQL> insert into hh values(2,3);

1 row created.

SQL> insert into hh values(1,2);

1 row created.

SQL> select * from hh;

       HH1        HH2                                                           
---------- ----------                                                           
         2          3                                                           
         1          2                                                           

SQL> commit;

Commit complete.

SQL> select * from hh;

no rows selected

SQL> drop table hh;

Table dropped.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
A                              TABLE                                            
AA                             TABLE                                            
BB                             TABLE                                            
CC                             TABLE                                            
CCC                            TABLE                                            
COUNTRIES                      TABLE                                            
DD                             TABLE                                            
DDD                            TABLE                                            
DEPARTMENTS                    TABLE                                            
EE                             TABLE                                            
EEE                            TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
EMPLOYEES                      TABLE                                            
EMP_DETAILS_VIEW               VIEW                                             
FF                             TABLE                                            
FFF                            TABLE                                            
GG                             TABLE                                            
JOBS                           TABLE                                            
JOB_GRADES                     TABLE                                            
JOB_HISTORY                    TABLE                                            
LOCATIONS                      TABLE                                            
REGIONS                        TABLE                                            

21 rows selected.

SQL> select * from recyclebin;

no rows selected

SQL> flashback table hh to before drop;
flashback table hh to before drop
*
ERROR at line 1:
ORA-38305: object not in RECYCLE BIN 


SQL> drop table dd;

Table dropped.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
A                              TABLE                                            
AA                             TABLE                                            
BB                             TABLE                                            
BIN$ArNhKshFShyzAkZirBg0Pw==$0 TABLE                                            
CC                             TABLE                                            
CCC                            TABLE                                            
COUNTRIES                      TABLE                                            
DDD                            TABLE                                            
DEPARTMENTS                    TABLE                                            
EE                             TABLE                                            
EEE                            TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
EMPLOYEES                      TABLE                                            
EMP_DETAILS_VIEW               VIEW                                             
FF                             TABLE                                            
FFF                            TABLE                                            
GG                             TABLE                                            
JOBS                           TABLE                                            
JOB_GRADES                     TABLE                                            
JOB_HISTORY                    TABLE                                            
LOCATIONS                      TABLE                                            
REGIONS                        TABLE                                            

21 rows selected.

SQL> select * from recyclebin;

OBJECT_NAME                    ORIGINAL_NAME                    OPERATION       
------------------------------ -------------------------------- ---------       
TYPE                      TS_NAME                        CREATETIME             
------------------------- ------------------------------ -------------------    
DROPTIME               DROPSCN PARTITION_NAME                   CAN CAN         
------------------- ---------- -------------------------------- --- ---         
   RELATED BASE_OBJECT PURGE_OBJECT      SPACE                                  
---------- ----------- ------------ ----------                                  
BIN$ArNhKshFShyzAkZirBg0Pw==$0 DD                               DROP            
TABLE                     USERS                          2025-02-08:14:29:42    
2025-02-12:20:59:18    3493694                                  YES YES         
     76595       76595        76595          0                                  
                                                                                

SQL> drop table gg;

Table dropped.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
A                              TABLE                                            
AA                             TABLE                                            
BB                             TABLE                                            
BIN$ArNhKshFShyzAkZirBg0Pw==$0 TABLE                                            
BIN$cZelBhsNRz23kLlgHWyXMg==$0 TABLE                                            
CC                             TABLE                                            
CCC                            TABLE                                            
COUNTRIES                      TABLE                                            
DDD                            TABLE                                            
DEPARTMENTS                    TABLE                                            
EE                             TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
EEE                            TABLE                                            
EMPLOYEES                      TABLE                                            
EMP_DETAILS_VIEW               VIEW                                             
FF                             TABLE                                            
FFF                            TABLE                                            
JOBS                           TABLE                                            
JOB_GRADES                     TABLE                                            
JOB_HISTORY                    TABLE                                            
LOCATIONS                      TABLE                                            
REGIONS                        TABLE                                            

21 rows selected.

SQL> select * from recyclebin;

OBJECT_NAME                    ORIGINAL_NAME                    OPERATION       
------------------------------ -------------------------------- ---------       
TYPE                      TS_NAME                        CREATETIME             
------------------------- ------------------------------ -------------------    
DROPTIME               DROPSCN PARTITION_NAME                   CAN CAN         
------------------- ---------- -------------------------------- --- ---         
   RELATED BASE_OBJECT PURGE_OBJECT      SPACE                                  
---------- ----------- ------------ ----------                                  
BIN$ArNhKshFShyzAkZirBg0Pw==$0 DD                               DROP            
TABLE                     USERS                          2025-02-08:14:29:42    
2025-02-12:20:59:18    3493694                                  YES YES         
     76595       76595        76595          0                                  
                                                                                

OBJECT_NAME                    ORIGINAL_NAME                    OPERATION       
------------------------------ -------------------------------- ---------       
TYPE                      TS_NAME                        CREATETIME             
------------------------- ------------------------------ -------------------    
DROPTIME               DROPSCN PARTITION_NAME                   CAN CAN         
------------------- ---------- -------------------------------- --- ---         
   RELATED BASE_OBJECT PURGE_OBJECT      SPACE                                  
---------- ----------- ------------ ----------                                  
BIN$cZelBhsNRz23kLlgHWyXMg==$0 GG                               DROP            
TABLE                     USERS                          2025-02-12:20:15:58    
2025-02-12:21:02:48    3494343                                  YES YES         
     76927       76927        76927          0                                  
                                                                                

SQL> show linesize
linesize 80
SQL> set linesize 120
SQL> select * from recyclebin;

OBJECT_NAME                    ORIGINAL_NAME                    OPERATION TYPE                                          
------------------------------ -------------------------------- --------- -------------------------                     
TS_NAME                        CREATETIME          DROPTIME               DROPSCN PARTITION_NAME                   CAN  
------------------------------ ------------------- ------------------- ---------- -------------------------------- ---  
CAN    RELATED BASE_OBJECT PURGE_OBJECT      SPACE                                                                      
--- ---------- ----------- ------------ ----------                                                                      
BIN$ArNhKshFShyzAkZirBg0Pw==$0 DD                               DROP      TABLE                                         
USERS                          2025-02-08:14:29:42 2025-02-12:20:59:18    3493694                                  YES  
YES      76595       76595        76595          0                                                                      
                                                                                                                        
BIN$cZelBhsNRz23kLlgHWyXMg==$0 GG                               DROP      TABLE                                         
USERS                          2025-02-12:20:15:58 2025-02-12:21:02:48    3494343                                  YES  
YES      76927       76927        76927          0                                                                      

OBJECT_NAME                    ORIGINAL_NAME                    OPERATION TYPE                                          
------------------------------ -------------------------------- --------- -------------------------                     
TS_NAME                        CREATETIME          DROPTIME               DROPSCN PARTITION_NAME                   CAN  
------------------------------ ------------------- ------------------- ---------- -------------------------------- ---  
CAN    RELATED BASE_OBJECT PURGE_OBJECT      SPACE                                                                      
--- ---------- ----------- ------------ ----------                                                                      
                                                                                                                        

SQL> flashback table dd to before drop;

Flashback complete.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                                                                       
------------------------------ ------- ----------                                                                       
A                              TABLE                                                                                    
AA                             TABLE                                                                                    
BB                             TABLE                                                                                    
BIN$cZelBhsNRz23kLlgHWyXMg==$0 TABLE                                                                                    
CC                             TABLE                                                                                    
CCC                            TABLE                                                                                    
COUNTRIES                      TABLE                                                                                    
DD                             TABLE                                                                                    
DDD                            TABLE                                                                                    
DEPARTMENTS                    TABLE                                                                                    
EE                             TABLE                                                                                    

TNAME                          TABTYPE  CLUSTERID                                                                       
------------------------------ ------- ----------                                                                       
EEE                            TABLE                                                                                    
EMPLOYEES                      TABLE                                                                                    
EMP_DETAILS_VIEW               VIEW                                                                                     
FF                             TABLE                                                                                    
FFF                            TABLE                                                                                    
JOBS                           TABLE                                                                                    
JOB_GRADES                     TABLE                                                                                    
JOB_HISTORY                    TABLE                                                                                    
LOCATIONS                      TABLE                                                                                    
REGIONS                        TABLE                                                                                    

21 rows selected.

SQL> flashback table gg to before drop to gg1;
flashback table gg to before drop to gg1
                                  *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


SQL> flashback table gg to before drop rename to gg1;

Flashback complete.

SQL> spool off
