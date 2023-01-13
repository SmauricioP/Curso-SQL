-- State with the largest amount of fruit supply
select state
from fruit_imports
group by state
order by sum(supply) desc
limit 1;

-- Most expensive cost per unit of every season
select season, max(cost_per_unit) higest_cost_per_unit
from fruit_imports
group by season;

-- More than one import of the same fruit
select state
from fruit_imports
group by state, name
having count(name) > 1;

-- Season that produces either 3 or 4 fruits
select season, count(name) as number_fruits
from fruit_imports
group by season
having count(name) in (3,4);

-- Supply and cost_per_unit columns to get total cost
select state, sum(supply * cost_per_unit) as total_cost
from fruit_imports
group by state
order by total_cost desc
limit 1;

-- Count on the column fruit_name without COUNT(*)
select count(coalesce(fruit_name, 'Null'))
from fruits;