{{ config(tags =  "AP"  )}}
with vendor_details as 
(select 
    lifnr as Vendor,
    belnr as DocumentNo,
    buzei as Item, 
    bldat as DocumentDate, 
    sum(dmshb) as Amount 
from {{ source('ARRAY_TECHNOLOGIES','BODS_FI_AP_4') }} group by 1,2,3,4),

vendor_description as 
(select
    vd.Vendor, 
    vt.TXTMD as Vendor_Name,
    vd.DocumentNo as Document_No,
    vd.Item as Item ,
    vd.DocumentDate as Document_Date,
    vd.Amount 
    from vendor_details vd
    inner join  {{ source('ARRAY_TECHNOLOGIES', "BODS_Vendor_Txt1") }} vt
    on vd.Vendor = vt.LIFNR
)

select * from vendor_description