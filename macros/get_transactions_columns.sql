{% macro get_transactions_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "accounting_period_id", "datatype": dbt_utils.type_float()},
    {"name": "currency_id", "datatype": dbt_utils.type_float()},
    {"name": "due_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_advanced_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "is_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "trandate", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_id", "datatype": dbt_utils.type_float()},
    {"name": "transaction_type", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('transactions_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_transactions_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "abbrevtype", "datatype": dbt_utils.type_string()},
    {"name": "accountbasednumber", "datatype": dbt_utils.type_string()},
    {"name": "actualproductionenddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "actualproductionstartdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "actualshipdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "altsalestotal", "datatype": dbt_utils.type_float()},
    {"name": "approvalstatus", "datatype": dbt_utils.type_int()},
    {"name": "asofdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "balsegstatus", "datatype": dbt_utils.type_int()},
    {"name": "billingaddress", "datatype": dbt_utils.type_int()},
    {"name": "billingstatus", "datatype": dbt_utils.type_string()},
    {"name": "billofmaterials", "datatype": dbt_utils.type_int()},
    {"name": "billofmaterialsrevision", "datatype": dbt_utils.type_int()},
    {"name": "bulkprocsubmission", "datatype": dbt_utils.type_int()},
    {"name": "closedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "committed", "datatype": dbt_utils.type_float()},
    {"name": "createdby", "datatype": dbt_utils.type_int()},
    {"name": "createddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency", "datatype": dbt_utils.type_int()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "daysopen", "datatype": dbt_utils.type_int()},
    {"name": "daysoverduesearch", "datatype": dbt_utils.type_int()},
    {"name": "duedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "employee", "datatype": dbt_utils.type_int()},
    {"name": "enddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "entity", "datatype": dbt_utils.type_int()},
    {"name": "entitystatus", "datatype": dbt_utils.type_int()},
    {"name": "estgrossprofit", "datatype": dbt_utils.type_float()},
    {"name": "estgrossprofitpercent", "datatype": dbt_utils.type_float()},
    {"name": "exchangerate", "datatype": dbt_utils.type_float()},
    {"name": "expectedclosedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fax", "datatype": dbt_utils.type_string()},
    {"name": "firmed", "datatype": dbt_utils.type_string()},
    {"name": "foreignamountpaid", "datatype": dbt_utils.type_float()},
    {"name": "foreignamountunpaid", "datatype": dbt_utils.type_float()},
    {"name": "foreignpaymentamountunused", "datatype": dbt_utils.type_float()},
    {"name": "foreignpaymentamountused", "datatype": dbt_utils.type_float()},
    {"name": "foreigntotal", "datatype": dbt_utils.type_float()},
    {"name": "fulfillmenttype", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "includeinforecast", "datatype": dbt_utils.type_string()},
    {"name": "incoterm", "datatype": dbt_utils.type_int()},
    {"name": "intercoadj", "datatype": dbt_utils.type_string()},
    {"name": "intercostatus", "datatype": dbt_utils.type_int()},
    {"name": "intercotransaction", "datatype": dbt_utils.type_int()},
    {"name": "isactualprodenddateenteredmanually", "datatype": dbt_utils.type_string()},
    {"name": "isactualprodstartdateenteredmanually", "datatype": dbt_utils.type_string()},
    {"name": "isfinchrg", "datatype": dbt_utils.type_string()},
    {"name": "isreversal", "datatype": dbt_utils.type_string()},
    {"name": "journaltype", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifiedby", "datatype": dbt_utils.type_int()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "linkedtrackingnumberlist", "datatype": dbt_utils.type_string()},
    {"name": "memdoc", "datatype": dbt_utils.type_int()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "message", "datatype": dbt_utils.type_string()},
    {"name": "nextapprover", "datatype": dbt_utils.type_int()},
    {"name": "nextbilldate", "datatype": dbt_utils.type_timestamp()},
    {"name": "nexus", "datatype": dbt_utils.type_int()},
    {"name": "number", "datatype": dbt_utils.type_int()},
    {"name": "ordpicked", "datatype": dbt_utils.type_string()},
    {"name": "ordreceived", "datatype": dbt_utils.type_string()},
    {"name": "otherrefnum", "datatype": dbt_utils.type_string()},
    {"name": "paymenthold", "datatype": dbt_utils.type_string()},
    {"name": "paymentmethod", "datatype": dbt_utils.type_int()},
    {"name": "paymentoption", "datatype": dbt_utils.type_int()},
    {"name": "posting", "datatype": dbt_utils.type_string()},
    {"name": "postingperiod", "datatype": dbt_utils.type_int()},
    {"name": "printedpickingticket", "datatype": dbt_utils.type_string()},
    {"name": "probability", "datatype": dbt_utils.type_float()},
    {"name": "recordtype", "datatype": dbt_utils.type_string()},
    {"name": "reversal", "datatype": dbt_utils.type_int()},
    {"name": "reversaldate", "datatype": dbt_utils.type_timestamp()},
    {"name": "shipcarrier", "datatype": dbt_utils.type_string()},
    {"name": "shipcomplete", "datatype": dbt_utils.type_string()},
    {"name": "shipdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "shippingaddress", "datatype": dbt_utils.type_int()},
    {"name": "source", "datatype": dbt_utils.type_string()},
    {"name": "sourcetransaction", "datatype": dbt_utils.type_int()},
    {"name": "startdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "terms", "datatype": dbt_utils.type_int()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "tosubsidiary", "datatype": dbt_utils.type_int()},
    {"name": "totalcostestimate", "datatype": dbt_utils.type_float()},
    {"name": "trackingnumberlist", "datatype": dbt_utils.type_string()},
    {"name": "trandate", "datatype": dbt_utils.type_timestamp()},
    {"name": "trandisplayname", "datatype": dbt_utils.type_string()},
    {"name": "tranid", "datatype": dbt_utils.type_string()},
    {"name": "transactionnumber", "datatype": dbt_utils.type_string()},
    {"name": "transferlocation", "datatype": dbt_utils.type_int()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "typebaseddocumentnumber", "datatype": dbt_utils.type_string()},
    {"name": "useitemcostastransfercost", "datatype": dbt_utils.type_string()},
    {"name": "userevenuearrangement", "datatype": dbt_utils.type_string()},
    {"name": "visibletocustomer", "datatype": dbt_utils.type_string()},
    {"name": "void", "datatype": dbt_utils.type_string()},
    {"name": "voided", "datatype": dbt_utils.type_string()},
    {"name": "website", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('transactions_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}