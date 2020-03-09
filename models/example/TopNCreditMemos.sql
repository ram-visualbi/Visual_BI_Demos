{{ config(tags =  "AR"  )}}
with customer_invoices as (
select 
    kunnr as Customer, 
    belnr as DocumentNo, 
    bldat as DocumentDate,
    sum(case when statusps='O' then dmhab else 0.0 end) as CreditMemoAmount 
from {{ source('ARRAY_TECHNOLOGIES', 'BODS_FI_AR4') }} group by 1,2,3
),
customer_texts as (
select 
    ci.Customer,
    ct.TXTMD as Customer_Name,
    ci.DocumentNo as Document_No,
    ci.DocumentDate as Document_Date,
    ci.CreditMemoAmount as Credit_Memo_Amount
    from  customer_invoices ci
    inner join  {{ source('ARRAY_TECHNOLOGIES', "BODS_Cust_Txt") }} ct
    on ci.Customer = ct.kunnr
)

select * from customer_texts