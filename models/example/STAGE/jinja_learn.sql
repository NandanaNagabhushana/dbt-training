{%- set category = ["Furniture","Office","Technology"] -%}

select 
orderid,
{% for category in category %}
sum(case when category='{{category}}' then orderprofit end) as {{category}}_orderprofit
{% if not loop.last %}, {% endif %}
{% endfor %}
from {{ ref('stg_orders') }}
where orderid < 11
group by 1 
order by 1