
with base as (

    select * 
    from {{ ref('stg_netsuite__entity_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__entity_tmp')),
                staging_columns=get_entity_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        id as entity_id,
        parent as parent_id,
        entitytitle as entity_name,
        type as entity_type,
        isperson as is_person,
        contact as contact_id,
        customer as customer_id,
        employee as employee_id,
        project as job_id,
        vendor as vendor_id
        
    from fields
)

select *
from final
