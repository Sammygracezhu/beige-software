select TAX as TAXID,  sum(SUBTOTAL * ITSPERCENTAGE / 100) as TOTALTAX
from PURCHASEINVOICELINE 
join INVITEM on INVITEM.ITSID = PURCHASEINVOICELINE.INVITEM
join INVITEMTAXCATEGORY on INVITEMTAXCATEGORY.ITSID = INVITEM.TAXCATEGORY
join INVITEMTAXCATEGORYLINE on INVITEMTAXCATEGORYLINE.ITSOWNER = INVITEMTAXCATEGORY.ITSID
where PURCHASEINVOICELINE.REVERSEDID is null and PURCHASEINVOICELINE.ITSOWNER = :ITSOWNER
group by TAX;