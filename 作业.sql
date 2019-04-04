��ϰһ

httpswww.cnblogs.comH2921306656p5741106.html
use Mobile20009
create table student
(
--ѧ��
sno varchar(3) not null primary key,
--����
sname varchar(4) not null,
--�Ա�
ssex varchar(2) not null,
--��������
sbirthday datetime,
--���ڰ༶
class varchar(5)
)
create table teacher
(
--�̹����
tno varchar(3) not null primary key,
--�̹�����
tname varchar(4) not null,
--�̹��Ա�
tsex varchar(2) not null,
--�̹���������
tbirthday datetime,
--ְ��
prof varchar(6),
--���ڲ���
depart varchar(10)
)

create table course
(
--�γ̺�
cno varchar(5) not null primary key,
--�γ�����
cname varchar(10) not null,
--�̹����
tno varchar(3) references teacher(tno)
)

create table score
(
--ѧ��
sno varchar(3) not null references student(sno),
--�γ̺�
cno varchar(5) not null references course(cno),
--�ɼ�
degree decimal(4,1)
)


insert into student
values('108','����','��','1977-09-01','95033')

insert into student
values('105','����','��','1975-10-02','95031')

insert into student
values('107','����','Ů','1976-01-23','95033')

insert into student
values('101','���','��','1976-02-20','95033')

insert into student
values('109','����','Ů','1975-02-10','95031')

insert into student
values('103','½��','��','1974-06-03','95031')

insert into teacher
values('804','���','��','1958-12-02','������','�����ϵ')
insert into teacher
values('856','����','��','1969-03-12','��ʦ','���ӹ���ϵ')
insert into teacher
values('825','��Ƽ','Ů','1972-05-05','����','�����ϵ')
insert into teacher
values('831','����','Ů','1958-08-14','����','���ӹ���ϵ')

insert into course
values('3-105','���������','825')
insert into course
values('3-245','����ϵͳ','804')
insert into course
values('6-166','���ֵ�·','856')
insert into course
values('9-888','�ߵ���ѧ','831')


insert into score
values('103','3-245','86')
insert into score
values('105','3-245','75')
insert into score
values('109','3-245','68')
insert into score
values('103','3-105','92')
insert into score
values('105','3-105','88')
insert into score
values('109','3-105','76')
insert into score
values('101','3-105','64')
insert into score
values('107','3-105','91')
insert into score
values('108','3-105','78')
insert into score
values('101','6-166','85')
insert into score
values('107','6-166','79')
insert into score
values('108','6-166','81')

select * from student
select * from teacher
select * from course
select * from score

--1�� ��ѯStudent���е����м�¼��Sname��Ssex��Class�С�
select Sname,Ssex,class  from Student
--2�� ��ѯ��ʦ���еĵ�λ�����ظ���Depart�С�(distinct)
select depart from  teacher group by(depart)
--3�� ��ѯStudent������м�¼��
select * from student
--4�� ��ѯScore���гɼ���60��80֮������м�¼��
select * from score where degree between 60 and 80 
--5�� ��ѯScore���гɼ�Ϊ85��86��88�ļ�¼��


--6�� ��ѯStudent���С�95031������Ա�Ϊ��Ů����ͬѧ��¼��
--7�� ��Class�����ѯStudent������м�¼��
--8�� ��Cno����Degree�����ѯScore������м�¼��
select * from score order by cno  asc,degree desc

--9�� ��ѯ��95031�����ѧ��������
--10����ѯScore���е���߷ֵ�ѧ��ѧ�źͿγ̺š�
--11����ѯ��3-105���ſγ̵�ƽ���֡�
select avg(degree) from score where cno='3-105'
--12����ѯScore����������5��ѧ��ѡ�޵Ĳ���3��ͷ�Ŀγ̵�ƽ��������
select avg(degree) from score where cno like '3%' having count(*)>5
--13����ѯ��ͷִ���70����߷�С��90��Sno�С�
--14����ѯ����ѧ����Sname��Cno��Degree�С�
--15����ѯ����ѧ����Sno��Cname��Degree�С�
--16����ѯ����ѧ����Sname��Cname��Degree�С�
--17����ѯ��95033������ѡ�γ̵�ƽ���֡�(avg)
select avg(degree) from score where cno in(select cno from student where class='95033')
--18������ʹ�������������һ��grade��
--create table grade(low int,upp int,rank varchar(1))
--insert into grade values(90,100,'A')
--insert into grade values(80,89,'B')
--insert into grade values(70,79,'C')
--insert into grade values(60,69,'D')
--insert into grade values(0,59,'E')
--�ֲ�ѯ����ͬѧ��Sno��Cno��rank�С�
--19����ѯѡ�ޡ�3-105���γ̵ĳɼ����ڡ�109����ͬѧ�ɼ�������ͬѧ�ļ�¼��//�޹��Ӳ�ѯ
select * from score where cno='3-105' and degree>(select degree from score  where sno='109' and cno='3-105')

select s1.*,c.* from student as s1,student as s2,score as c where s1.sno=s2.sno and s1.sno = c.sno and c.cno='3-105';


--20����ѯscore��ѡѧ���ſγ̵�ͬѧ�з���Ϊ����߷ֳɼ��ļ�¼��
--21����ѯ�ɼ�����ѧ��Ϊ��109�����γ̺�Ϊ��3-105���ĳɼ������м�¼��
--22����ѯ��ѧ��Ϊ108��ͬѧͬ�����������ѧ����Sno��Sname��Sbirthday�С�
--23����ѯ�����񡰽�ʦ�οε�ѧ���ɼ���
--24����ѯѡ��ĳ�γ̵�ͬѧ��������5�˵Ľ�ʦ������
--25����ѯ95033���95031��ȫ��ѧ���ļ�¼��
--26����ѯ������85�����ϳɼ��Ŀγ�Cno.
--27����ѯ���������ϵ����ʦ���̿γ̵ĳɼ���
--28����ѯ�������ϵ���롰���ӹ���ϵ����ְͬ�ƵĽ�ʦ��Tname��Prof��
--29����ѯѡ�ޱ��Ϊ��3-105���γ��ҳɼ����ٸ���ѡ�ޱ��Ϊ��3-245����ͬѧ��Cno��Sno��Degree,����Degree�Ӹߵ��ʹ�������
--30����ѯѡ�ޱ��Ϊ��3-105���ҳɼ�����ѡ�ޱ��Ϊ��3-245���γ̵�ͬѧ��Cno��Sno��Degree.
--31����ѯ���н�ʦ��ͬѧ��name��sex��birthday.
--32����ѯ���С�Ů����ʦ�͡�Ů��ͬѧ��name��sex��birthday.
--33����ѯ�ɼ��ȸÿγ�ƽ���ɼ��͵�ͬѧ�ĳɼ���
--34����ѯ�����ον�ʦ��Tname��Depart.
--35 ��ѯ����δ���εĽ�ʦ��Tname��Depart. 
--36����ѯ������2�������İ�š�
--37����ѯStudent���в��ա�������ͬѧ��¼��
--38����ѯStudent����ÿ��ѧ�������������䡣
--39����ѯStudent����������С��Sbirthday����ֵ��
--40���԰�ź�����Ӵ�С��˳���ѯStudent���е�ȫ����¼��
--41����ѯ���С���ʦ�������ϵĿγ̡�
--42����ѯ��߷�ͬѧ��Sno��Cno��Degree�С�
--43����ѯ�͡������ͬ�Ա������ͬѧ��Sname.
--44����ѯ�͡������ͬ�Ա�ͬ���ͬѧSname.
--45����ѯ����ѡ�ޡ���������ۡ��γ̵ġ��С�ͬѧ�ĳɼ���
--46����ѯscore���з�����ߵ�ѧ������Ϣ��//���Ƕ��
--47����ѯscore���е�ƽ������80�����ϵ�ѧ����Ϣ��//��ز�ѯ���޹ز�ѯ
--48.ɾ������ظ���¼������
   ID   NANME  BIRTHDAY
   1    AA     1999/09/09 
   1    AA     1999/09/09
   2    BB     1999/09/09
   2    BB     1999/09/09
   3    CC     1999/09/09 
   ɾ��������ظ���¼�������ٱ���һ����




��ϰ���

��������������

    ѧ����: Student(Sno,Sname,Ssex,Sbirthday,Sage,Sdept)
            Student ��ѧ�� (Sno)������ (Sname)���Ա� (Ssex)���������� (Sbirthday)������ (Sage), 
            ����ϵ (Sdept) ����������,���� Sno Ϊ����.

    �γ̱�: Coures(Cno,Cname,Cpno,Ccredit)
            Coures �ɿγ̺� (Cno)���γ��� (Cname)��ѡ�޿κ� (Cpno)��ѧ�� (Ccredit) �ĸ��������, 
            ���� Cno Ϊ����.

    ѧ��ѡ�α�: SC(Sno,Cno,Grade)
                SC ��ѧ�� (Sno)�� �γ̺� (Cno)�� �ɼ� (Grade) �����������, ����Ϊ (Sno,Cno).

���������������������µ�ϰ��:

1.����ȫ��ѧ����ѧ��������

2.����ȫ��ѧ����������ѧ��������ϵ

3.����ȫ��ѧ������ϸ��¼

4.����ȫ��ѧ������������������� 

5.����ȫ��ѧ�����������������ں�����ϵ��Ҫ����Сд��ĸ��ʾ����ϵ��

6.����ȫ��ѧ�����������������ں�����ϵ��Ҫ����⼸�������

7.����ѡ���˿γ̵�ѧ��ѧ�ţ������ظ���

8.���Ҽ���ϵȫ��ѧ��������

9.��������������20�����µ�ѧ�������������䣨2��������

10.���ҿ��Գɼ��в������ѧ����ѧ�ţ������ظ���

11.����������20--30�꣨����20���23�֮꣩���ѧ����������ϵ�������

12.�������䲻��20--30�꣨����20���23�֮꣩���ѧ����������ϵ�������

13.������Ϣϵ����ѧϵ�ͼ����ϵѧ�����������Ա���in����

14.���Ҳ�����Ϣϵ����ѧϵ,Ҳ���Ǽ����ϵ��ѧ�����������Ա���not in����

15.����ѧ����Ϊ95001��ͷ��ѧ������ϸ�������2�ַ�������

16.���������ԡ�������ͷ��ѧ����������ѧ�ź��Ա�

17.�����ԡ�ŷ������ͷ�����������ֵ�ѧ��������

18.���������е�2����Ϊ�������ֵ�ѧ����������ѧ��

19.�������в��ԡ�������ͷ��ѧ������

20.�����ԡ�C����ͷ�Ŀγ̵Ŀγ̺ź�ѧ��

21.�����ԡ�H����ͷ���ҵ����������ַ�Ϊ��T���Ŀγ̵Ŀγ̺ź�ѧ��

22.ĳЩѧ��ѡ�޿γ̺�û�вμӿ��ԣ�������ѡ�μ�¼����û�п��Գɼ�������ȱ�ٳɼ���ѧ����ѧ�ź���Ӧ
   �Ŀγ̺�

23.���ҳ����޳ɼ���ѧ����ѧ�źͿγ̺�

24.���Ҽ����ϵ������20�����µ�ѧ������

25.�����Ǽ����ϵ ������ ��ѧϵ ������ ��Ϣϵ��ѧ���������Ա�

26.����ѡ����3�ſγ̵�ѧ����ѧ������ɼ�������ҽ���������Ľ�������

27.����ȫ��ѧ����������ҽ��������ϵ��ϵ���������У�ͬһϵ�е�ѧ�������併������

28.����ѧ��������

29.����ѡ���˿γ̵�ѧ������

30.����1�ſγ̵�ѧ��ƽ���ɼ�



��ϰ����javaȫ����.NETͬѧѡ����


1.������

2.�޸�����������

3.�����
 
4.�������Լ���ͷǿ�Լ��

5.ɾ������Լ��

6.ʧЧԼ��

7.��ЧԼ��

8.ɾ����

9.����ĳ�в����ã�Ȼ��ɾ��

 
10.�޸ı���


11.�ضϱ�
 
12.ɾ������ظ���¼������
   ID   NANME  BIRTHDAY
   1    AA     1999/09/09 
   1    AA     1999/09/09
   2    BB     1999/09/09
   2    BB     1999/09/09
   3    CC     1999/09/09 
   ɾ��������ظ���¼�������ٱ���һ����
13.�鿴��ṹ
 
14.ɾ����
 
15.�����¼
����insert into ���� values(����1,����2,����3,����4); 
16.�������Ի���ʽ������

17.����ĳ���м�¼

18.Ϊ�в����ֵ�����в���Ϊnot null��

19.����������������������ã�����һ

20.��ѯ������
select * from ����; 
21.��ѯĳ����
select ����1,����2 from ����; 
 
22.�ظ�������

23.where����ѯ

24.������,������

 
25.�޸� ��=������������

 
26.ɾ����

 
27.������(ѡ������)
--������
update ����
set ���������ڣ� = ''30-5��-98'' 
where ����; 
savepoint mark1; 
delete from ���� where ����; 
savepoint mark2; 
rollback to savepoint mark1; 
rollback; 
28.�����û�user1������Ϊpassword 
�����û�connect,resource��Ȩ��
connect��ɫ���ڵ�¼
resource��ɫ���ڽ����. 
connect system/manager 
create user user1 identified bypassword; 
grant connect,resource to password; 
29.���ݿ�������
connect scott/tiger 
30.�ѶԱ�1��ѯ���޸ĵ�Ȩ������user1 

31.�ѶԱ��1����1����2�޸ĵ�Ȩ������user1 

32.�ѶԱ��1��ѯ��Ȩ�������û�user1 

33.���û�user1�����Ա�1��ѯ���޸ĵ�Ȩ��


��������
1�����ұ���������������������������ͣ������У���

2�����ұ���������������ƣ������У���
 
3�����ұ��Ψһ��Լ�����������ƣ������У���

 
4��
  a)���ұ��������������ƣ����ñ�ı����Ͷ�Ӧ�ļ����������Ƿֳɶಽ��ѯ����
 
  b)��ѯ���Լ����������
 
  c)��ѯ���ñ�ļ���������
 
5����ѯ��������м�������

ȡOracle ���� �ֶ��� ע�͵�ʵ�����

-- �鿴ORACLE ���ݿ��б��û��µ����б�
select ...;
-- �鿴ORACLE ���ݿ��������û��µ����б�
select ...;
-- �鿴ORACLE ���ݿ��б��û��µ�������
select ...;
-- �鿴ORACLE ���ݿ��б��û��µ�������
select ...;
-- �鿴ORACLE ���ݿ��е����к�
select ...;
-- ��������ж��󣬶�����ͨ�������SQL����ѯ�õ�
-- ��ѯ���е��û����ɵ�ORACLE���� 
select ...;
-- �鿴ORACLE ���ݿ������б��ע��
select ...;
-- �鿴ORACLE ���ݿ��������е�ע��
select ...;
-- �����ORACLE��ע��

-- ���м�ORACLE��ע��

-- �鿴�����е����ԣ����� �������ͣ��Ƿ�ǿյ�

-- ͨ��ϵͳ���鿴�����е����ԣ����� �������ͣ��Ƿ�ǿյ� 
select ...;