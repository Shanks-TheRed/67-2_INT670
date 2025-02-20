CREATE TABLE AA (
A varchar2(10) CONSTRAINT aa_a_nn NOT NULL,
B number(5) CONSTRAINT aa_b_pk PRIMARY KEY,
C date CONSTRAINT aa_c_ck CHECK(
	C BETWEEN TO_DATE('01-01-2024', 'dd-mm-yy') 
	AND TO_DATE('31-12-2024', 'dd-mm-yy')),
D number(5) CONSTRAINT aa_d_fk REFERENCES AA(B),
E timestamp(8) CONSTRAINT aa_e_uk UNIQUE
);

desc aa

insert into aa values('row1', 1, '06-FEB-24', NULL, sysdate);
insert into aa values('row2', 2, '06-MAR-24', 1, sysdate);
insert into aa values('row3', 3, '06-DEC-24', 2, sysdate);

select * from aa;
