create view OrdersView as
select OrderID, Quantity, TotalCost
from Orders
where Quantity > 2;

create view order_above_150 as
select c.CustomerID, c.FullName, o.OrderID, o.TotalCost, m.MenuName, mi.CourseName, mi.StarterName
from Bookings as b
inner join Orders as o
on b.OrderID = o.OrderID
inner join Customers as c
on b.CustomerID = c.CustomerID
inner join Menus as m
on o.MenuID = m.MenuID
inner join MenuItems as mi
on m.MenuItemID = mi.MenuItemID
where o.TotalCost > 150;

create view multiple_items as
select *
from Menus
where MenuID in 
(select MenuID
from Orders
where Quantity >2);