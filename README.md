# Take-out-food-database
基于SQL Server的外卖点餐数据库系统

![image](https://user-images.githubusercontent.com/64953476/157594713-0ae9bde3-1968-4a53-bfcf-994f11ef3ef8.png)
	
![image](https://user-images.githubusercontent.com/64953476/157594965-1850001c-a342-4e2d-98b1-992c6f390c7b.png)

![image](https://user-images.githubusercontent.com/64953476/157595044-dacd8f0d-c872-4364-9a61-f55a595d9d25.png)

![image](https://user-images.githubusercontent.com/64953476/157595085-8781b09a-c9d8-4c53-bd58-020abbd6acb3.png)

![image](https://user-images.githubusercontent.com/64953476/157595212-3b4ccc6e-5a56-41af-a898-202906e3e300.png)

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

insert into 订单信息表 values(20212021,198898999,'湖南长沙',

8.8,2021-01-06,'已付款',2021-01-06,'无',0001)

--查看更新的信息

select * from 订单信息表

select * from 订单项信息表

![image](https://user-images.githubusercontent.com/64953476/157595310-14c7091f-4fc9-457b-a8f5-b4966ce9b7f1.png)

![image](https://user-images.githubusercontent.com/64953476/157595321-e95e63f0-1cfb-453d-8573-b1759f43600c.png)

大致介绍到此结束




