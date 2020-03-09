{{ config(tags =  "AP"  )}}
with Vendor_Duedate as (
select 
    lifnr as Vendor,
    sum(case when netdt<CURRENT_DATE() then dmshb else 0.0 end) as Due,
    sum(case when netdt>=CURRENT_DATE() then dmshb else 0.0 end) as Not_Due,
    Due + Not_Due as Balance
from {{ source('ARRAY_TECHNOLOGIES','BODS_FI_AP_4') }} group by 1
),

Vendor_desc as (
select 
    vdue.Vendor,
    vt.TXTMD as Vendor_Name,
    vdue.Due,
    vdue.Not_Due,
    vdue.Balance
    from Vendor_Duedate vdue
    inner join  {{ source('ARRAY_TECHNOLOGIES', "BODS_Vendor_Txt1") }} vt
    on vdue.Vendor = vt.LIFNR 
)

select * from Vendor_desc