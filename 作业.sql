练习一

use Mobile20009
create table student
(
--学号
sno varchar(3) not null primary key,
--姓名
sname varchar(4) not null,
--性别
ssex varchar(2) not null,
--出生年月
sbirthday datetime,
--所在班级
class varchar(5)
)
create table teacher
(
--教工编号
tno varchar(3) not null primary key,
--教工姓名
tname varchar(4) not null,
--教工性别
tsex varchar(2) not null,
--教工出生日期
tbirthday datetime,
--职称
prof varchar(6),
--所在部门
depart varchar(10)
)

create table course
(
--课程号
cno varchar(5) not null primary key,
--课程名称
cname varchar(10) not null,
--教工编号
tno varchar(3) references teacher(tno)
)

create table score
(
--学号
sno varchar(3) not null references student(sno),
--课程号
cno varchar(5) not null references course(cno),
--成绩
degree decimal(4,1)
)


insert into student
values('108','曾华','男','1977-09-01','95033')

insert into student
values('105','匡明','男','1975-10-02','95031')

insert into student
values('107','王丽','女','1976-01-23','95033')

insert into student
values('101','李军','男','1976-02-20','95033')

insert into student
values('109','王芳','女','1975-02-10','95031')

insert into student
values('103','陆君','男','1974-06-03','95031')

insert into teacher
values('804','李诚','男','1958-12-02','副教授','计算机系')
insert into teacher
values('856','张旭','男','1969-03-12','讲师','电子工程系')
insert into teacher
values('825','王萍','女','1972-05-05','助教','计算机系')
insert into teacher
values('831','刘冰','女','1958-08-14','助教','电子工程系')

insert into course
values('3-105','计算机导论','825')
insert into course
values('3-245','操作系统','804')
insert into course
values('6-166','数字电路','856')
insert into course
values('9-888','高等数学','831')


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

--1、 查询Student表中的所有记录的Sname、Ssex和Class列。
select Sname,Ssex,class  from Student
--2、 查询教师所有的单位即不重复的Depart列。(distinct)
select depart from  teacher group by(depart)
--3、 查询Student表的所有记录。
select * from student
--4、 查询Score表中成绩在60到80之间的所有记录。
select * from score where degree between 60 and 80
--5、 查询Score表中成绩为85，86或88的记录。
--6、 查询Student表中“95031”班或性别为“女”的同学记录。
--7、 以Class降序查询Student表的所有记录。
--8、 以Cno升序、Degree降序查询Score表的所有记录。
--9、 查询“95031”班的学生人数。
--10、查询Score表中的最高分的学生学号和课程号。
--11、查询‘3-105’号课程的平均分。
--12、查询Score表中至少有5名学生选修的并以3开头的课程的平均分数。
--13、查询最低分大于70，最高分小于90的Sno列。
--14、查询所有学生的Sname、Cno和Degree列。
--15、查询所有学生的Sno、Cname和Degree列。
--16、查询所有学生的Sname、Cname和Degree列。
--17、查询“95033”班所选课程的平均分。(avg)
--18、假设使用如下命令建立了一个grade表：
--create table grade(low int,upp int,rank varchar(1))
--insert into grade values(90,100,'A')
--insert into grade values(80,89,'B')
--insert into grade values(70,79,'C')
--insert into grade values(60,69,'D')
--insert into grade values(0,59,'E')
--现查询所有同学的Sno、Cno和rank列。
--19、查询选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录。//无关子查询

--20、查询score中选学多门课程的同学中分数为非最高分成绩的记录。
--21、查询成绩高于学号为“109”、课程号为“3-105”的成绩的所有记录。
--22、查询和学号为108的同学同年出生的所有学生的Sno、Sname和Sbirthday列。
--23、查询“张旭“教师任课的学生成绩。
--24、查询选修某课程的同学人数多于5人的教师姓名。
--25、查询95033班和95031班全体学生的记录。
--26、查询存在有85分以上成绩的课程Cno.
--27、查询出“计算机系“教师所教课程的成绩表。
--28、查询“计算机系”与“电子工程系“不同职称的教师的Tname和Prof。
--29、查询选修编号为“3-105“课程且成绩至少高于选修编号为“3-245”的同学的Cno、Sno和Degree,并按Degree从高到低次序排序。
--30、查询选修编号为“3-105”且成绩高于选修编号为“3-245”课程的同学的Cno、Sno和Degree.
--31、查询所有教师和同学的name、sex和birthday.
--32、查询所有“女”教师和“女”同学的name、sex和birthday.
--33、查询成绩比该课程平均成绩低的同学的成绩表。
--34、查询所有任课教师的Tname和Depart.
--35 查询所有未讲课的教师的Tname和Depart. 
--36、查询至少有2名男生的班号。
--37、查询Student表中不姓“王”的同学记录。
--38、查询Student表中每个学生的姓名和年龄。
--39、查询Student表中最大和最小的Sbirthday日期值。
--40、以班号和年龄从大到小的顺序查询Student表中的全部记录。
--41、查询“男”教师及其所上的课程。
--42、查询最高分同学的Sno、Cno和Degree列。
--43、查询和“李军”同性别的所有同学的Sname.
--44、查询和“李军”同性别并同班的同学Sname.
--45、查询所有选修“计算机导论”课程的“男”同学的成绩表。
--46、查询score表中分数最高的学生的信息。//多层嵌套
--47、查询score表中的平均分在80分以上的学生信息。//相关查询。无关查询
--48.删除表的重复记录，比如
   ID   NANME  BIRTHDAY
   1    AA     1999/09/09 
   1    AA     1999/09/09
   2    BB     1999/09/09
   2    BB     1999/09/09
   3    CC     1999/09/09 
   删除上面的重复记录，但至少保留一条。




练习题二

创建以下三个表：

    学生表: Student(Sno,Sname,Ssex,Sbirthday,Sage,Sdept)
            Student 由学号 (Sno)、姓名 (Sname)、性别 (Ssex)、出生日期 (Sbirthday)、年龄 (Sage), 
            所在系 (Sdept) 五个属性组成,其中 Sno 为主键.

    课程表: Coures(Cno,Cname,Cpno,Ccredit)
            Coures 由课程号 (Cno)、课程名 (Cname)、选修课号 (Cpno)、学分 (Ccredit) 四个属性组成, 
            其中 Cno 为主键.

    学生选课表: SC(Sno,Cno,Grade)
                SC 由学号 (Sno)、 课程号 (Cno)、 成绩 (Grade) 三个属性组成, 主键为 (Sno,Cno).

按照以上三个表来做如下的习题:

1.查找全体学生的学号与姓名

2.查找全体学生的姓名、学号与所在系

3.查找全体学生的详细纪录

4.查找全体学生的姓名和其出生日期 

5.查找全体学生的姓名、出生日期和所有系，要求用小写字母表示所有系名

6.查找全体学生的姓名、出生日期和所有系，要求给这几列起别名

7.查找选修了课程的学生学号（不能重复）

8.查找计算系全体学生的名单

9.查找所有年龄在20岁以下的学生姓名和其年龄（2种做法）

10.查找考试成绩有不及格的学生的学号（不能重复）

11.查找年龄在20--30岁（包括20岁和23岁）之间的学生的姓名、系别和年龄

12.查找年龄不在20--30岁（包括20岁和23岁）之间的学生的姓名、系别和年龄

13.查找信息系、数学系和计算机系学生的姓名与性别（用in做）

14.查找不是信息系、数学系,也不是计算机系的学生的姓名与性别（用not in做）

15.查找学号以为95001开头的学生的详细情况（用2种方法做）

16.查找所有以“刘”开头的学生的姓名、学号和性别

17.查找以“欧阳”开头的且三个汉字的学生的姓名

18.查找名字中第2个字为“阳”字的学生的姓名和学号

19.查找所有不以“刘”开头的学生姓名

20.查找以“C”开头的课程的课程号和学分

21.查找以“H”开头，且倒数第三个字符为“T”的课程的课程号和学分

22.某些学生选修课程后没有参加考试，所以有选课纪录，但没有考试成绩。查找缺少成绩的学生的学号和相应
   的课程号

23.查找除了无成绩的学生的学号和课程号

24.查找计算机系年龄在20岁以下的学生姓名

25.查找是计算机系 或者是 数学系 或者是 信息系的学生姓名和性别

26.查找选修了3号课程的学生的学号与其成绩，其查找结果按分数的降序排列

27.查找全体学生情况，查找结果按所在系的系号升序排列，同一系中的学生按年龄降序排列

28.查找学生总人数

29.查找选修了课程的学生人数

30.计算1号课程的学生平均成绩



练习三（java全做，.NET同学选做）


1.创建表

2.修改列数据类型

3.添加列
 
4.添加主键约束和非空约束

5.删除主键约束

6.失效约束

7.有效约束

8.删除列

9.设置某列不可用，然后删除

 
10.修改表名


11.截断表
 
12.删除表的重复记录，比如
   ID   NANME  BIRTHDAY
   1    AA     1999/09/09 
   1    AA     1999/09/09
   2    BB     1999/09/09
   2    BB     1999/09/09
   3    CC     1999/09/09 
   删除上面的重复记录，但至少保留一条。
13.查看表结构
 
14.删除表
 
15.插入记录
例：insert into 表名 values(内容1,内容2,内容3,内容4); 
16.带参数对话方式插入行

17.插入某几列记录

18.为列插入空值（其列不能为not null）

19.创建表（包括主键及外键设置）方法一

20.查询所有行
select * from 表名; 
21.查询某几列
select 列名1,列名2 from 表名; 
 
22.重复行消除

23.where语句查询

24.创建表,方法二

 
25.修改 列=‘？’的数据

 
26.删除行

 
27.事务处理(选做内容)
--事务处理
update 表名
set 列名（日期） = ''30-5月-98'' 
where 条件; 
savepoint mark1; 
delete from 表名 where 条件; 
savepoint mark2; 
rollback to savepoint mark1; 
rollback; 
28.建立用户user1，密码为password 
授予用户connect,resource的权限
connect角色用于登录
resource角色用于建表等. 
connect system/manager 
create user user1 identified bypassword; 
grant connect,resource to password; 
29.数据控制语言
connect scott/tiger 
30.把对表1查询和修改的权限授予user1 

31.把对表表1中列1和列2修改的权限授予user1 

32.把对表表1查询的权限授予用户user1 

33.从用户user1撤销对表1查询和修改的权限


补充内容
1、查找表的所有索引（包括索引名，类型，构成列）：

2、查找表的主键（包括名称，构成列）：
 
3、查找表的唯一性约束（包括名称，构成列）：

 
4、
  a)查找表的外键（包括名称，引用表的表名和对应的键名，下面是分成多步查询）：
 
  b)查询外键约束的列名：
 
  c)查询引用表的键的列名：
 
5、查询表的所有列及其属性

取Oracle 表名 字段名 注释等实用语句

-- 查看ORACLE 数据库中本用户下的所有表
select ...;
-- 查看ORACLE 数据库中所有用户下的所有表
select ...;
-- 查看ORACLE 数据库中本用户下的所有列
select ...;
-- 查看ORACLE 数据库中本用户下的所有列
select ...;
-- 查看ORACLE 数据库中的序列号
select ...;
-- 上面的所有对象，都可以通过下面的SQL语句查询得到
-- 查询所有的用户生成的ORACLE对象 
select ...;
-- 查看ORACLE 数据库中所有表的注释
select ...;
-- 查看ORACLE 数据库中所有列的注释
select ...;
-- 给表加ORACLE的注释

-- 给列加ORACLE的注释

-- 查看表中列的属性，包括 数据类型，是否非空等

-- 通过系统表，查看表中列的属性，包括 数据类型，是否非空等 
select ...;