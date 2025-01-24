prepare GetOrderDetail from 'select OrderID,Quantity,BillAmount as Cost from littlelemondb.orders where CustomerID=?';

set @CustomerID=1;
execute GetOrderDetail using @CustomerID;
