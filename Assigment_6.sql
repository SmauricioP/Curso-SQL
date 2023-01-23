-- Three columns, and display low, enough or full corresponding to each case
select fruit_name, total_supply,
case
when total_supply < 20000 then 'Low'
when total_supply >= 20000 and total_supply <=50000 then 'Enough'
when total_supply > 50000 then 'Full'
end as category
from (select name as fruit_name, sum(supply) as total_supply
	  from fruit_imports
	  group by name) a1;

-- Having the following table
select season, sum(cost_per_unit*supply) as total_cost
from fruit_imports
group by season;
--Transpose it
select
sum(case when season = 'Winter' then total_cost end) as total_winter,
sum(case when season = 'Summer' then total_cost end) as total_summer,
sum(case when season = 'All Year' then total_cost end) as total_all_year,
sum(case when season = 'Spring' then total_cost end) as total_spring,
sum(case when season = 'Fall' then total_cost end) as total_fall
from (select season, sum(cost_per_unit*supply) as total_cost
	  from fruit_imports
	  group by season) a2