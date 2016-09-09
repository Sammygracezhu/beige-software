select 4 as SOURCETYPE, MANUFACTURINGPROCESS.ITSID as SOURCEID, MANUFACTURINGPROCESS.ITSDATE,
'Inventory' as ACCDEBIT, 2001 as SUBACCDEBITTYPE, INVITEMCATEGORYPR.ITSID as SUBACCDEBITID, INVITEMCATEGORYPR.ITSNAME as SUBACCDEBIT, sum(USEDMATERIALLINE.ITSTOTAL) as DEBIT,
'Inventory' as ACCCREDIT, 2001 as SUBACCCREDITTYPE, INVITEMCATEGORYMAT.ITSID as SUBACCCREDITID, INVITEMCATEGORYMAT.ITSNAME as SUBACCCREDIT, sum(USEDMATERIALLINE.ITSTOTAL) as CREDIT
from USEDMATERIALLINE
join INVITEM as INVITEMMAT on INVITEMMAT.ITSID = USEDMATERIALLINE.INVITEM
join INVITEMCATEGORY as INVITEMCATEGORYMAT on INVITEMCATEGORYMAT.ITSID = INVITEMMAT.ITSCATEGORY
join MANUFACTURINGPROCESS on MANUFACTURINGPROCESS.ITSID = USEDMATERIALLINE.ITSOWNER
join INVITEM as INVITEMPR on INVITEMPR.ITSID = MANUFACTURINGPROCESS.INVITEM
join INVITEMCATEGORY as INVITEMCATEGORYPR on INVITEMCATEGORYPR.ITSID = INVITEMPR.ITSCATEGORY
where USEDMATERIALLINE.REVERSEDID is null and MANUFACTURINGPROCESS.REVERSEDID is null and HASMADEACCENTRIES = 0 :WHEREADD
group by SOURCETYPE, SOURCEID, MANUFACTURINGPROCESS.ITSDATE, ACCDEBIT, SUBACCDEBITTYPE, SUBACCDEBITID, SUBACCDEBIT, ACCCREDIT, SUBACCCREDITTYPE, SUBACCCREDITID, SUBACCCREDIT