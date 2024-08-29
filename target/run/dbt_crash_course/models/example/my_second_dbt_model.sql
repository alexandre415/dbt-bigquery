
  
    

    create or replace table `dbt-crash-course-433921`.`dbt_crash_course`.`my_second_dbt_model`
      
    
    

    OPTIONS()
    as (
      -- Use the `ref` function to select from other models

select *
from `dbt-crash-course-433921`.`dbt_crash_course`.`my_first_dbt_model`
where id = 1
    );
  