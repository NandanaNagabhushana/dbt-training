select 
o.orderid, o.orderdate,o.shipdate,o.shipmode, o.ordercostprice, o.ordersellingprice,
o.ordersellingprice-o.ordercostprice as orderprofit,
c.customername, c.segment, c.country,
p.productname,p.category,p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on o.productid = p.productid
