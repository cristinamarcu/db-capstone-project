create view littlelemondb.ordersviews as select OrderID,Quantity,BillAmount as Cost from littlelemondb.orders where Quantity>2;

select * from littlelemondb.ordersviews;

select a.CustomerID, a.FullName,a.OrderID,Cost, menus.ManuName, menuitems.CourseName from (
select customers.CustomerID, FullName,OrderID, BillAmount as Cost, MenuID from littlelemondb.customers                          #ManuName, CourseName #customers.CustomerID, FullName,OrderID, BillAmount as Cost
inner join littlelemondb.orders
on customers.CustomerID=orders.CustomerID
where BillAmount>150)a
join littlelemondb.menus
on menus.MenuID=a.MenuID
join littlelemondb.menuitems
on menuitems.MenuItemID=menus.MenuItemID;


select ManuName from littlelemondb.menus
where MenuID=any (select MenuID from littlelemondb.orders where Quantity>2)




