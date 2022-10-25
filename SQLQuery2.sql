select * from Asm3_Products;
select * from Asm3_Order;
select * from Asm3_Customers;
declare @x int;-- khai bao mot bien @x int
set @x = (select Id from Asm3_Customers where Name like N'Nguyễn Văn An');
select * from Asm3_Orders where CustomerId = @x;

-- subquery (truy van trong mot truy van khac hay la truy van con)
select * from Asm3_Orders where CustomerId in (select Id from Asm3_Customers
where Name like N'Nguyễn Văn An');
-- tang 10$ vao moi don hang cua ong Nguyen Van An
update Asm3_Orders set GrandTotal = GrandTotal + 10 where CustomerId in (select Id from Asm3_Customers
where Name like N'Nguyễn Văn An');
-- Them mot don hang cho ong Nguyen Van An
insert into Asm3_Orders(OrderDate,GrandTotal,CustomerId)
values(getdate(),2000,(select Id from Asm3_Customers where Name like N'Nguyễn Văn An'));
-- Liet ke cac san pham ma Nguyen Van An da mua
select * from Asm3_Products where Id in
(select ProductId from Asm3_OrderItems where OrderId in
(select Id from Asm3_Orders where CustomerId in
(select Id from Asm3_Customers where Name like N'Nguyễn Văn An')));
-- Tim khach hang da mua mot san pham T450

select * from Asm3_Customers where Id in
(select CustomerId from Asm3_Orders where Id in
(select OrderId from Asm4_OrderItems where Id in
(select Id from Asm3_Products where Name like N'May tinh T450')));

