insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'SalesServices', '4020', 'Services Sales Revenue', 1, 3, 2011, 0, null);
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (23, 1, 'PurInvExpenceDbtAccPayCredCrdt', 1462867931627, 1, 'Expense,DebtorCreditor', 1, 0, 1, 'PURCHASEINVOICE.ITSID', 'PurchaseInvoice , Debit AccExpense per ServicePurchasedCategory.Expense, Credit AccPayable per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (24, 1, 'SalInvAccRecDbtSalesServicesCatCrdt', 1462867931627, 2, 'AccReceivable,2004,SalesServices,2011', 1, 0, 1, 'SALESINVOICE.ITSID', 'SalesInvoiceServiceLine , Debit AccReievable per DebtorCreditor, Credit SalesServices per ServiceToSaleCategory.');
update DATABASEINFO set DATABASEVERSION=3, DESCRIPTION='Beige Accounting version 3';
