{{ config(enabled=var('data_model', 'netsuite') == 'netsuite') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__customers_tmp') }}

),

fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_salesforce_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_salesforce_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__customers_tmp')),
                staging_columns=get_customers_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        customer_id,
        companyname as company_name,
        customer_extid as customer_external_id,
        city,
        state,
        zipcode,
        country,
        date_first_order as date_first_order_at,
        _fivetran_deleted

        --The below macro adds the fields defined within your customers_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('customers_pass_through_columns') }}


    from fields
)

select * 
from final
where not coalesce(_fivetran_deleted, false)
