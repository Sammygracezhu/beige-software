insert into USERTOMCAT values ('admin', 'admin');
insert into USERTOMCAT values ('user', 'user');
insert into USERROLETOMCAT  values ('admin', 'admin');
insert into USERROLETOMCAT  values ('user', 'user');

insert into DATABASEINFO (DATABASEID, DATABASEVERSION, DESCRIPTION) values (1, 1, 'BeigeAccounting standard database');

insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'CashOnHand', '1020', 'Cash On Hand', 0, 0, null, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'CashInBanks', '1030', 'Cash In Banks', 1, 0, 2002, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'OwnerDraws', '1045', 'Owner''s Withdrawals', 1, 0, null, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'BadDebts', '1090', 'Bad Debts', 1, 0, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'AccReceivable', '1105', 'Accounts Receivable', 1, 0, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'ReturnsReceivable', '1110', 'Purchase Returns Receivable', 1, 0, 2004, 0, 'Due perchases returns to vendor(supplier)');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'Inventory', '1200', 'Inventory', 1, 0, 2001, 0, 'It holds inventory uncapitalized cost exactly for a goods which reduce your income tax when you sell it by FIFO/LIFO/Average method');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'InventoryDirectCostTmp', '1205', 'Inventory direct cost temporary', 1, 0, 2009, 0, 'For manufacturing it temporary hold direct labor cost that will be included into inventory item cost (goods)');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'InventoryCapitalizedCost', '1210', 'Inventory capitalized cost', 1, 0, 2009, 0, 'For example Inventory additional capitalized cost US IRS 263A.');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'SalesTaxFromPurchase', '1310', 'Sales Tax From Purchase', 1, 0, 2003, 0, 'For methods where payed tax from purchase should be extracted from inventory e.g. VAT or sales taxes that should be capitalized');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'SalesTaxFromSalReturns', '1315', 'Sales Tax From Sales Returns', 1, 0, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'Prepayments', '1320', 'Prepayments', 1, 0, 2009, 0, 'prepayments for rent, electricity etc.');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'PrepaymentsTo', '1400', 'Prepayments to vendors', 1, 0, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'Property', '1520', 'Property', 1, 0, 2010, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'AccumulatedDeprecation', '1560', 'Accumulated Deprecation', 0, 0, 2010, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'Amortization', '1695', 'Amortization', 0, 0, 2010, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'AccPayable', '2050', 'Accounts Payable', 1, 1, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'ReturnsPayable', '2080', 'Sales Returns Payable', 1, 1, 2004, 0, 'For USA this is Notes Payable');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'AccruedPayableFor', '2110', 'Accrued Payable for', 1, 1, 2009, 0, 'Accrued Payable for unpaid rent, electricity etc');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'NetWagesPay', '2220', 'Net Wages Payable', 1, 1, 2007, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'EmploymentTaxesPay', '2240', 'Employment Taxes Payable', 1, 1, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'SalesTaxPay', '2310', 'Sales Taxes Payable', 1, 1, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'SalesTaxFromPurchReturns', '2315', 'Sales Taxes From Purchase Returns', 1, 1, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'IncomeTaxPay', '2320', 'Taxes Payable based on owner income due to owner', 1, 1, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'PrepaymentsFrom', '2400', 'Prepayments from customers', 1, 1, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'StartedCapital', '3005', 'Started Capital', 1, 2, null, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'CommonStock', '3010', 'Common Stock', 0, 2, null, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'RetainedEarnings', '3200', 'Retained Earnings', 1, 2, null, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (1, 'Sales', '4010', 'Sales Revenue', 1, 3, 2001, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'SalesReturns', '5010', 'Sales Returns', 1, 4, 2001, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'BadDebtsExpense', '5020', 'Bad Debts Expense', 1, 4, 2004, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'COGS', '5100', 'Cost Of Goods Sold', 1, 4, 2001, 0, 'It is made automatically from goods uncapitilized cost by FIFO/LIFO/Everage');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'COGSAdditional', '5105', 'Cost Of Goods Sold capitalized', 1, 4, 2009, 0, 'COGS from capitalized expenses e.g. rent, indirect labor for producing business');
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'COGL', '5110', 'Cost Of Goods Loss/Stole/Broken', 1, 4, 2001, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'Expenses', '5150', 'Expenses', 0, 4, 2009, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'TaxExpense', '5395', 'Tax Expense', 0, 4, 2003, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'DeprecationExppense', '5410', 'Property Deprecation Expense', 0, 4, 2010, 0, null);
insert into ACCOUNT (NORMALBALANCETYPE, ITSID, ITSNUMBER, ITSNAME, ISUSED, ITSTYPE, SUBACCTYPE, ISCREATEDBYUSER, DESCRIPTION) values (0, 'AmortizationExppense', '5420', 'Property Amortization Expense', 0, 4, 2010, 0, null);

insert into CURRENCY (ITSID, ITSNAME) values (840, 'USD');
insert into CURRENCY (ITSID, ITSNAME) values (978, 'EUR');
insert into CURRENCY (ITSID, ITSNAME) values (643, 'RUB');

insert into UNITOFMEASURE (ITSID, ITSNAME) values (1, 'each');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (2, 'box');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (3, 'dozen');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (4, 'gramme');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (5, 'pound');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (6, 'kilogram');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (7, 'cubic centimeters');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (8, 'liter');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (9, 'cubic inches');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (10, 'cubic feet');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (11, 'minute');
insert into UNITOFMEASURE (ITSID, ITSNAME) values (12, 'hour');

insert into INVITEMTYPE (ITSID, ITSNAME) values (1, 'Merchandise or stock in trade');
insert into INVITEMTYPE (ITSID, ITSNAME) values (2, 'Raw materials');
insert into INVITEMTYPE (ITSID, ITSNAME) values (3, 'Work in process');
insert into INVITEMTYPE (ITSID, ITSNAME) values (4, 'Finished products');
insert into INVITEMTYPE (ITSID, ITSNAME) values (5, 'Supplies that physically become a part of the item intended for sale');

insert into COGSMETHOD (ITSNAME, ISPERIODIC, ITSID, ITSVERSION, FILENAME) values ('FIFO standard perpetual', 0, 1, 1462867931627, 'drawItemFifoSourceM1S');
insert into COGSMETHOD (ITSNAME, ISPERIODIC, ITSID, ITSVERSION, FILENAME) values ('LIFO standard perpetual', 0, 2, 1462867931627, 'drawItemLifoSourceM1S');

insert into WAGETAXESMETHOD (ITSNAME, ITSID, ITSVERSION, SERVICENAME) values ('Standard wage tax percentage table', 1, 1462867931627, 'SrvWageTaxPercentageTable');

insert into ACCSETTINGS (ORGANIZATION, ITSID, ITSVERSION, ISEXTRACTSALESTAXFROMPURCHASE, ISEXTRACTSALESTAXFROMSALES, COGSMETHOD, CURRENCY, COSTPRECISION, PRICEPRECISION, BALANCEPRECISION, QUANTITYPRECISION, ROUNDINGMODE, WAGETAXESMETHOD, CURRENTACCYEAR, BALANCESTOREPERIOD) values ('organization', 1, 1462867931627, 1, 1, 1, 840, 4, 2, 0, 2, 4, 1, 1451606400000, 3);

insert into COGSITEMSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (1, 1, 'drawPurchaseLineM1', 1462867931627, 1001, '1, 2', 1, 'Purchase invoice lines where rest > 0');
insert into COGSITEMSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (2, 1, 'drawItemManufactureM1', 1462867931627, 5, '1, 2', 1, 'Manufactures where rest > 0');
insert into COGSITEMSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (3, 1, 'drawSalesReturnLineM1', 1462867931627, 1006, '1, 2', 1, 'Sales Return Lines where rest > 0');

insert into DRAWMATERIALSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (1, 1, 'drawPurchaseLineM1', 1462867931627, 1001, '1, 2', 1, 'Purchase invoice lines where rest > 0');
insert into DRAWMATERIALSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (2, 1, 'drawItemManufactureM1', 1462867931627, 5, '1, 2', 1, 'Manufactures where rest > 0');
insert into DRAWMATERIALSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, USEINMETHODS, ISUSED, DESCRIPTION) values (3, 1, 'drawSalesReturnLineM1', 1462867931627, 5, '1, 2', 1, 'Sales Return Lines where rest > 0');

insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (1, 1, 'PurInvInvCatPayDbtCrdt', 1462867931627, 1, 'InvItemCategory,DebtorCreditor', 1, 0, 1, 'PURCHASEINVOICE.ITSID', 'PurchaseInvoice, Debit Inventory per InvItemCategory, Credit AccPayable per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (2, 1, 'ManufacturingUsedMaterialProductInvCat', 1462867931627, 4, 'InvItemCategory', 1, 0, 1, 'MANUFACTURINGPROCESS.ITSID', 'ManufacturingProcess , Used material, Debit Inventory per InvItemCategory (from head), Credit Inventory per InvItemCategory (from lines).');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (3, 1, 'ManufacturingAdditionCostInvCat', 1462867931627, 4, 'InvItemCategory', 1, 0, 1, 'MANUFACTURINGPROCESS.ITSID', 'ManufacturingProcess , addition cost, Debit Inventory per InvItemCategory (from head), Credit accExpense per subAccccExpense (from lines).');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (4, 1, 'ManufactureProductInvCat', 1462867931627, 5, 'InvItemCategory', 1, 0, 1, 'MANUFACTURE.ITSID', 'Manufacture, Debit Inventory per InvItemCategory (from manufacture), Credit Inventory per InvItemCategory (from manufacturing process).');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (5, 1, 'SalInvInvCatRecDbtCrdt', 1462867931627, 2, 'InvItemCategory,DebtorCreditor', 1, 0, 1, 'SALESINVOICE.ITSID', 'SalesInvoice, AccReceivable.DebtorCreditor Credit Sales.InvItemCategory.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (6, 1, 'SalesInvCogsFifoLifoInvCat', 1462867931627, 2, 'InvItemCategory', 1, 0, 1, 'DRAWINGOWNERID', 'SalesInvoice, COGS FIFO/LIFO, Debit COGS.InvItemCategory Credit Inventory.InvItemCategory.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (7, 1, 'WageEmplCatTaxesExpense', 1462867931627, 6, 'EmployeeCategory', 1, 0, 1, 'WAGE.ITSID', 'Wage, EmployeeCategory, Expense, Debit Expenses.Expense Credit NetWages.EmployeeCategory, and for each tax: Debit Expenses.Expense Credit EmploymentTaxes.Tax');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (8, 1, 'PurInvAccPayDbtPrepayToCrdt', 1462867931627, 1, 'DebtorCreditor', 1, 0, 1, 'PURCHASEINVOICE.ITSID', 'PurchaseInvoice , If prepaid Debit AccPayable per DebtorCreditor, Credit PrepaymentsTo per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (9, 1, 'PrepaymentToDbtAccCashCrdt', 1462867931627, 7, 'DebtorCreditor', 1, 0, 1, 'PREPAYMENTTO.ITSID', 'PrepaymentTo, Debit PrepaymentsTo per DebtorCreditor, Credit [AccCash].');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (10, 1, 'PaymentToAccPayDbtAccCashCrdt', 1462867931627, 8, 'DebtorCreditor', 1, 0, 1, 'PAYMENTTO.ITSID', 'PaymentTo, Debit AccPayable per DebtorCreditor, Credit [AccCash].');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (11, 1, 'PurInvSalTaxSelfDeductingDbtAccrual', 1462867931627, 1, 'Tax', 1, 0, 1, 'PURCHASEINVOICE.ITSID', 'PurchaseInvoice, Debit SalesTaxFromPurchase per Tax.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (12, 1, 'PrepaymentFromCrtAccCashDbt', 1462867931627, 9, 'DebtorCreditor', 1, 0, 1, 'PREPAYMENTFROM.ITSID', 'PrepaymentFrom, Debit [AccCash], Credit PrepaymentsFrom per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (13, 1, 'SalInvPrepayFromDbtAccRecievCrdt', 1462867931627, 2, 'DebtorCreditor', 1, 0, 1, 'SALESINVOICE.ITSID', 'SalesInvoice , If prepaid Debit PrepaymentsFrom per DebtorCreditor, Credit AccReceivable per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (14, 1, 'PaymentFromCashDbtAccRecievCrdt', 1462867931627, 10, 'DebtorCreditor', 1, 0, 1, 'PAYMENTFROM.ITSID', 'PaymentFrom, Debit [AccCash], Credit AccReceivable per DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (15, 1, 'SalInvSalTaxPayCrdtAccrual', 1462867931627, 2, 'Tax', 1, 0, 1, 'SALESINVOICE.ITSID', 'SalesInvoice, Credit SalesTaxPay per Tax.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (16, 1, 'GdLossCoglFifoLifoInvCat', 1462867931627, 11, 'InvItemCategory', 1, 0, 1, 'DRAWINGOWNERID', 'GoodsLoss, COGL FIFO/LIFO, Debit COGL.InvItemCategory Credit Inventory.InvItemCategory');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (17, 1, 'SalesReturnsDbtReturnPayCrdt', 1462867931627, 12, 'InvItemCategory,DebtorCreditor', 1, 0, 1, 'SALESRETURN.ITSID', 'SalesReturn, Debit SalesReturns.InvItemCategory Credit ReturnsPayable.DebtorCreditor.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (18, 1, 'SalesRetInvCatDbtCogsCrdt', 1462867931627, 12, 'InvItemCategory', 1, 0, 1, 'SALESRETURN.ITSID', 'SalesReturn, Debit Inventory.InvItemCategory Credit COGS.InvItemCategory.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (19, 1, 'SalReturnSalesTaxFromSalReturnsDebitAccrual', 1462867931627, 12, 'Tax', 1, 0, 1, 'SALESRETURN.ITSID', 'SalesReturn, Debit SalesTaxFromSalReturns per Tax.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (20, 1, 'PurchRetRecievDbtInvCatCrdt', 1462867931627, 13, 'InvItemCategory,DebtorCreditor', 1, 0, 1, 'PURCHASERETURN.ITSID', 'PurchaseReturn, Debit ReturnsReceivable.DebtorCreditor Credit Inventory.InvItemCategory.');
insert into ACCENTRIESSOURCESLINE (ITSID, ITSOWNER, FILENAME, ITSVERSION, SOURCETYPE, SETCODE, ISUSED, ENTRIESSOURCETYPE, ENTRIESACCOUNTINGTYPE, SOURCEIDNAME, DESCRIPTION) values (21, 1, 'PurchReturnSalesTaxFromPurchReturnsCreditAccrual', 1462867931627, 13, 'Tax', 1, 0, 1, 'PURCHASERETURN.ITSID', 'PurchaseReturn, Credit SalesTaxFromPurchReturns per Tax.');