package org.beigesoft.accounting.model;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

/**
 * <pre>
 * Tax Type INCOME_TAX/SALES_TAX_INITEM/SALES_TAX_OUTITEM/
 * EMPLOYMENT_TAX_EMPLOYEE/EMPLOYMENT_TAX_EMPLOYER/OTHER_TAX.
 * </pre>
 *
 * @author Yury Demidenko
 */
 public enum ETaxType {

  /**
   * <p>0 Income taxes.</p>
   **/
  INCOME_TAX,

  /**
   * <p>1 Sales taxes included into inventory
   * e.g. US state sales tax.</p>
   **/
  SALES_TAX_INITEM,

  /**
   * <p>2 Sales taxes self-deductible excluded from inventory
   * e.g. VAT tax.</p>
   **/
  SALES_TAX_OUTITEM,

  /**
   * <p>3 Employment taxes from employee,
   * e.g. US Federal Income Tax, Medicare.</p>
   **/
  EMPLOYMENT_TAX_EMPLOYEE,

  /**
   * <p>4 Employment taxes from employer,
   * e.g. US FUTA.</p>
   **/
  EMPLOYMENT_TAX_EMPLOYER,

  /**
   * <p>5 Other taxes.</p>
   **/
  OTHER_TAX;
}
