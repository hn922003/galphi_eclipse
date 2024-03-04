
select * from book where pdate < '20-01-01';

select sysdate from dual;

select * from book where pdate > sysdate -90;

select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss') from dual;

select *
from book
where pdate between to_date(add_months(sysdate, -3)) and sysdate;


select pdate from book where pdate < '20-01-01';

select * from book where TO_DATE(pDate) > sysdate - 90;