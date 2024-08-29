
    
    

with dbt_test__target as (

  select id as unique_field
  from `dbt-crash-course-433921`.`dbt_crash_course`.`customers`
  where id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


