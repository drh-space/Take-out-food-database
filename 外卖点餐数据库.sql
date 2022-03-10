create database 外卖点餐数据库
on(
name=外卖点餐数据库_data,
filename='D:\DATA\外卖点餐数据库_data.mdf',
size=5mb,
maxsize=100mb,
filegrowth=1mb
)

log on(
name=外卖点餐数据库_log,
filename='D:\DATA\外卖点餐数据库_log.ldf',
size=5mb,
maxsize=50mb,
filegrowth=1%
)

use 外卖点餐数据库
go
create table 菜谱信息表(   --建立菜谱信息表
菜谱编号 int  not null primary key ,
菜名 char(10) not null,
原价 float null,
优惠价 float null,
菜名介绍 char(50) null,
创建时间 datetime
)

use 外卖点餐数据库
go
create table 用户信息表(   --建立用户信息表
用户编号 int  not null primary key ,
姓名 char(10) null,
地址 char(50) null,
手机号 char(15) null,
注册时间 datetime null
)

use 外卖点餐数据库
go
create table 管理员信息表(   --建立管理员信息表
管理员编号 int  not null primary key ,
姓名 char(10) null,
管理员密码 char(10) null,
登录IP char(20) null,
最后登录时间 datetime null
)

use 外卖点餐数据库
go
create table 订单信息表(   --建立订单信息表
订单编号 char(15)  not null primary key ,
手机号 char(15) null,
地址 char(50) null,
总金额  float null,
下单时间 datetime null,
订单状态 char(10) null,
订单改变时间 datetime null,
备注 char(50) null,
会员编号 int not null foreign key references 用户信息表(用户编号)
)

use 外卖点餐数据库
go
create table 订单项信息表(   --建立订单项信息表
订单项编号 char(10) not null primary key,
订单编号 char(15) not null foreign key references 订单信息表(订单编号) 
on delete cascade on update cascade,
姓名 char(10) null,
状态 char(10) null
)

use 外卖点餐数据库
go
insert into 菜谱信息表 values
(001,'番茄炒蛋',10.5,8.8,'红黄搭配，美味又好看！','2021-01-04'),
(002,'鱼香肉丝',13.5,9.8,'条条分明，香飘几十里！','2021-01-04'),
(003,'土豆焖鸡',45.5,38.8,'土豆的松香味加上鸡肉的清香！','2021-01-04'),
(004,'深井烧鸭',68.5,58.8,'深井烧鸭，一口香脆满口香！','2021-01-04'),
(005,'清蒸排骨',25.5,18.8,'豆是下的排骨，简直香喷喷！','2021-01-04')

use 外卖点餐数据库
go
insert into 用户信息表 values
(2021001, '闲忆秋','广东广州','1122334455','2021-01-04'),
(2021002, '微芷瑶','广东肇庆','2233445566','2021-01-04'),
(2021003, '向  北','广东佛山','3344556677','2021-01-04'),
(2021004, 'Andeng','云南大理','4455667788','2021-01-04'),
(2021005, '阿里宝','浙江杭州','5566778899','2021-01-04')

use 外卖点餐数据库
go
insert into 管理员信息表 values
(101, '闲忆秋_ad','admin101','10.3.5.101','2021-01-08'),
(102, '微芷瑶_ad','admin102','10.3.5.102','2021-01-08'),
(103, '向  北_ad','admin103','10.3.5.103','2021-01-08'),
(104, 'Andeng_ad','admin104','10.3.5.104','2021-01-08'),
(105, '阿里宝_ad','admin105','10.3.5.105','2021-01-08')

alter table 订单信息表
drop constraint FK__订单信息表__会员编号__164452B1

use 外卖点餐数据库
go
insert into 订单信息表 values
('20210104001','1122334455','广东广州',18.6,'11:30:20','等待付款','','2021001',''),
('20210104002','2233445566','广东肇庆',38.8,'11:31:21','已付款','','2021001',''),
('20210104003','3344556677','广东佛山',58.8,'11:32:22','已付款','','2021003',''),
('20210104004','4455667788','云南大理',57.6,'11:33:23','到店自取','','2021004',''),
('20210104005','5566778899','浙江杭州',97.6,'11:34:24','已付款','','2021005','')

insert into 订单项信息表 values
('0104001','20210104001','闲忆秋','等待付款'),
('0104002','20210104002','微芷瑶','已付款'),
('0104003','20210104003','向  北','已付款'),
('0104004','20210104004','Andeng','到店自取'),
('0104005','20210104005','阿里宝','已付款')

--a.查看外卖点餐数据库中菜谱信息表的菜名、优惠价、菜名介绍
		use 外卖点餐数据库
		go
		select 菜名,优惠价,菜名介绍 from 菜谱信息表

--b.查询外卖点餐数据库中订单信息表的所有信息
		use 外卖点餐数据库
		go
		select * from 订单信息表

--c.查询外卖点餐数据库中管理员信息表的前三行信息
		use 外卖点餐数据库
		go
		select top 3 * from 管理员信息表

--查看外卖点餐数据库订单信息表中总金额大于等于50.0的订单编号、手机号、地址、订单状态。
		use 外卖点餐数据库
		go
		select 订单编号,手机号,地址,订单状态 from 订单信息表
		where 总金额>=50.0

--查看外卖点餐数据库用户信息表中注册时间是2021-01-04且地址是广东广州的用户信息。
		use 外卖点餐数据库
		go
		select * from 用户信息表
		where 注册时间='2021-01-04' and 地址='广东广州'

--查询外卖点餐数据库菜谱信息表中优惠价在10.0-40.0之间的菜谱编号,菜名,原价,优惠价。
		  use 外卖点餐数据库
		  go
		  select 菜谱编号,菜名,原价,优惠价 from 菜谱信息表
		  where 优惠价 between 10.0 and 40.0

 --a.查看外卖点餐数据库订单信息表中订单状态包含“付款”的所有订单信息_视图
		  use 外卖点餐数据库
		  go
		  create view 已付款或等待付款订单
		  as
		  select * from 订单信息表
		  where 订单状态 like '%付款%'
		  --select * from 已付款或等待付款订单 

--b.查看外卖点餐数据库用户信息表中手机以“2”开头的用户信息
	     use 外卖点餐数据库
		  go
		  select * from 用户信息表
		  where 手机号 like '2%'

 --查看外卖点餐数据库订单信息表中所有地址是广东和浙江并已付款的用户信息
		  use 外卖点餐数据库
		  go
		  select * from 订单信息表
		where 地址 like '%广东%' and 订单状态='已付款' 
		or 地址 like '%浙江%' and 订单状态='已付款'

--查看外卖点餐数据库订单信息表中全部营业额。_视图
  		  use 外卖点餐数据库
 		  go
  		  create view 营业额
  		  as
  		  select sum(总金额) 全部营业额 from 订单信息表
  		  --select * from 营业额

--看外卖点餐数据库订单信息表中平均每单的金额。_视图
		  use 外卖点餐数据库
		  go
         create view 平均每单营业额
  		  as
		  select avg(总金额) 平均每单的金额 from 订单信息表
		--select * from 平均每单营业额

--看外卖点餐数据库用户信息表中用户总数。
		  use 外卖点餐数据库
		  go
		  select count(姓名) 用户总数 from 用户信息表

--查看外卖点餐数据库每个订单的订单编号,总金额,订单状态,用户编号,姓名,手机号,地址 
		  use 外卖点餐数据库
		  go
		  select 订单编号,总金额,订单状态,用户编号,姓名,b.手机号,b.地址 
		  from 订单信息表 a inner join 用户信息表 b
		  on a.手机号=b.手机号

--查看外卖点餐数据库中每个用户及其下单的订单状态(含未下单的用户)
		  use 外卖点餐数据库
		  go
		  select a.*,b.订单编号,b.总金额,b.订单状态 
		  from 用户信息表 a left join 订单信息表 b
		  on a.手机号=b.手机号

--在这里开始插入以下信息
	use 外卖点餐数据库
	go
	insert into 用户信息表 values
	(2021006, '闲秋瑶','广东肇庆','6677889911','2021-01-05'),
	(2021007, '微可可','广东广州','7788991122','2021-01-05')

--查看外卖点餐数据库中每个订单及下单用户的注册时间情况(含未下单的用户)
		  use 外卖点餐数据库
		  go
		  select b.*,a.用户编号,a.姓名,a.注册时间
		  from 订单信息表 b right join 用户信息表 a
		  on a.手机号=b.手机号

--假如未知用户的手机号及地址，查看外卖点餐数据库中所有用户可能的下单情况
		  use 外卖点餐数据库
		  go
		  select a.*,b.用户编号,b.姓名,b.注册时间
		  from 订单信息表 a cross join 用户信息表 b

--查看外卖点餐数据库用户信息表中与姓名为微芷瑶同时注册的用户编号,姓名,手机号,注册时间
		use 外卖点餐数据库
		go
		select 用户编号,姓名,手机号,注册时间 from 用户信息表
			where 注册时间=(select 注册时间 from 用户信息表 where 姓名='微芷瑶')

--查看外卖点餐数据库中订单状态是已付款的用户编号,姓名,手机号
		 use 外卖点餐数据库
		 go
		 select 用户编号,姓名,手机号 from 用户信息表
		 where 手机号 in(select 手机号 from 订单信息表 
		where 订单状态='已付款')

--查看外卖点餐数据库订单信息表中每单的总金额比平均每单的金额低的订单信息。
		 use 外卖点餐数据库
		 go
		 select * from 订单信息表
		 where 总金额<(select avg(总金额) from 订单信息表 
		where 订单信息表.手机号=订单信息表.手机号)

--查看外卖点餐数据库用户信息表中注册时间是2021-01-04的用户的订单信息
		 use 外卖点餐数据库
		 go
		 select * from 订单信息表
		 where exists
		(select * from 用户信息表 where 用户编号=用户信息表.用户编号 
		and 注册时间='2021-01-04')

--查看外卖点餐数据库订单信息表中订单状态是已付款和等待付款的用户编号,姓名,地址,手机号
		 use 外卖点餐数据库
		 go
		 select 用户编号,姓名,用户信息表.地址,用户信息表.手机号,
         订单编号,订单状态 from 用户信息表,订单信息表
		 where 订单状态='已付款' and 用户信息表.手机号=订单信息表.手机号
		 union
		 select 用户编号,姓名,用户信息表.地址,用户信息表.手机号,
         订单编号,订单状态 from 用户信息表,订单信息表
		 where 订单状态='等待付款' and 用户信息表.手机号=订单信息表.手机号

--查看外卖点餐数据库菜谱信息表中的菜谱编号,菜名,优惠价,菜名介绍，并按优惠价升序排列。
		 use 外卖点餐数据库
		 go
		 select 菜谱编号,菜名,优惠价,菜名介绍 from 菜谱信息表
		 order by 优惠价 asc

--在外卖点餐数据库中创建带参数的存储过程，修改某个用户的手机号和地址
		use 外卖点餐数据库
		go
		create procedure 修改用户信息 @用户编号 int,
		@手机号 char(15),@地址 char(50)
		as
		update 用户信息表 set 手机号=@手机号,地址=@地址
		where 用户编号=@用户编号
		--exec 修改用户信息 '2021007','9988776655','广西桂林'
		--select * from 用户信息表

		
--查看外卖点餐数据库订单信息表中某个订单状态所有订单的订单编号,用户编号,手机号,地址,总金额,订单状态。
		use 外卖点餐数据库
		go
		create function 查看某个状态的订单(@状态 char(10)) returns table
		as return
		(select 订单编号,用户编号,订单信息表.手机号,订单信息表.地址,总金额,订单状态 from 订单信息表,用户信息表
			where 订单状态=@状态 and 订单信息表.手机号=用户信息表.手机号)
		--select * from 查看某个状态的订单('等待付款')


--a.创建触发器,若修改了用户信息表，则修改订单信息表。
	go
	create trigger 更新用户信息
	on 用户信息表
	for update
	as
	begin
	declare @新姓名 char(10),@新地址 char(50), @新手机号 char(15)
	declare @旧姓名 char(10),@旧地址 char(50), @旧手机号 char(15)
	select @旧姓名=姓名,@旧地址=地址,@旧手机号=手机号 
	from deleted  --旧的用户信息
	select @新姓名=姓名,@新地址=地址,@新手机号=手机号 
	from inserted  --新的用户信息
	update 订单信息表 set 地址=@新地址
	where @旧地址=地址
	update 订单信息表 set 手机号=@新手机号
	where @旧手机号=手机号
	end

--触发触发器
	update 用户信息表
	set 姓名='无名氏',地址='上海浦东',手机号='11110000'
	where 姓名='阿里宝'

--查看新的用户信息
	select * from 用户信息表
	select * from 订单信息表


--b.创建触发器，若插入新的订单，则订单项信息表中增加相应订单(inserted表)。
	go
	create trigger 新的订单
	on 订单信息表
	for insert
	as
	begin
	declare @订单编号 char(15),@订单项编号 char(10),
	@姓名 char(10),@状态 char(10)
	select @订单编号=订单编号,@状态=订单状态 from inserted
	insert into 订单项信息表 values('',@订单编号,'',@状态)
	end

--触发触发器
	insert into 订单信息表 values('20212021','198898999','湖南长沙',
	8.8,'2021-01-06','已付款','2021-01-06','无',0001)

--查看更新的信息
	select * from 订单信息表
	select * from 订单项信息表


--c.创建触发器,若删除了订单，则修改全部营业额。
	go
	create trigger 取消订单
	on 订单信息表
	for update
	as
	begin
	declare @更新营业额 float
	select @更新营业额=总金额 from deleted
	update 营业额 set 全部营业额=@更新营业额
	end

--触发触发器 
	delete 订单信息表 where 订单编号=20210104001

--查看更新的信息
	select * from 订单信息表
	select * from 订单项信息表
	select * from 营业额
	select 总金额 from 订单信息表
 

--d.创建触发器,若修改了菜谱信息表中的原价，则修改菜谱信息表中的优惠价。
	go
	create trigger 修改菜谱信息
	on 菜谱信息表
	for update
	as
	begin
	declare @原价 float,@菜名 char(10)  
	select @原价=原价,@菜名=菜名 from inserted  --更新原价
	update 菜谱信息表 set 优惠价=@原价*0.7 where 菜名=@菜名
	end

--触发触发器
	update 菜谱信息表 set 原价=50.0 where 菜名='土豆焖鸡'

--查看更新的信息
	select * from 菜谱信息表
 
--e.创建触发器,为外卖点餐数据库中的任一表创建一个DDL触发器limited来防止该表被修改或删除
		use 外卖点餐数据库
		go
		create trigger 限制修改删除表 on database
		for drop_table,alter_table
		as
		print '名为限制修改删除表的触发器不允许执行对该表的修改删除操作。'
		rollback
		--drop table 用户信息表
		--alter table 菜谱信息表

--f.创建触发器,为外卖点餐数据库中的菜谱信息表创建一个DML触发器，在插入和修改数据时，都会自动显示所有菜名的信息
		use 外卖点餐数据库
		go
		create trigger 自动显示菜名 on 菜谱信息表
		for insert,update
		as
		select * from 菜谱信息表
		update 菜谱信息表
		set 菜名='番茄炒鸭蛋' where 菜名='番茄炒蛋'

--创建管理员角色
	begin transaction
	use 外卖点餐数据库
	go
	create login 闲忆秋admin with password='admin102', 
	default_database=外卖点餐数据库
	create user 闲忆秋admin1 for login 闲忆秋admin
	create role 忆秋
	if @@Error=0
	begin
		grant select,alter,update on 菜谱信息表 to 忆秋 with grant option
		grant select,alter,update on 用户信息表 to 忆秋 with grant option
		grant select,alter,update on 订单信息表 to 忆秋 with grant option
		grant select,alter,update on 订单项信息表 to 忆秋 with grant option
		grant create view, create table to 忆秋1 with grant option
		exec sp_addrolemember'忆秋','闲忆秋admin'
		print '创建管理员角色成功。'
		commit
	end
	else
	begin
		print '创建管理员角色失败。'
		rollback
	end

--创建用户角色
	begin transaction
	use 外卖点餐数据库
	go
	create login 薇芷瑶admin with password='2233445566', 
	default_database=外卖点餐数据库
	create user 薇芷瑶admin for login 薇芷瑶admin
	create role 芷瑶
	if @@Error=0
	begin
		grant select on 菜谱信息表 to 芷瑶1 with grant option
		exec sp_addrolemember '芷瑶','薇芷瑶admin'
		print '创建用户角色成功。'
		commit
	end
	else
	begin
		print '创建用户角色失败。'
		rollback
	end

--数据库的完整备份
	backup database 外卖点餐数据库
	to disk='D:\DATA\外卖点餐数据库.bak'
			with format,
			name= '外卖点餐数据库的完整备份'


--数据库的差异备份
	backup database 外卖点餐数据库
	to disk='D:\DATA\外卖点餐数据库差异备份.bak'
		with differential

