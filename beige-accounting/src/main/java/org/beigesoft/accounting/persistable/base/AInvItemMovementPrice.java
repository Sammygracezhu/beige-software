package org.beigesoft.accounting.persistable.base;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import java.math.BigDecimal;

/**
 * <pre>
 * Abstract model of sales document Line.
 * </pre>
 *
 * @author Yury Demidenko
 */
public abstract class AInvItemMovementPrice extends AInvItemMovement {

  /**
   * <p>Price.</p>
   **/
  private BigDecimal itsPrice = BigDecimal.ZERO;

  /**
   * <p>Total.</p>
   **/
  private BigDecimal itsTotal = BigDecimal.ZERO;

  //Simple getters and setters:
  /**
   * <p>Geter for itsPrice.</p>
   * @return BigDecimal
   **/
  public final BigDecimal getItsPrice() {
    return this.itsPrice;
  }

  /**
   * <p>Setter for itsPrice.</p>
   * @param pItsPrice reference
   **/
  public final void setItsPrice(final BigDecimal pItsPrice) {
    this.itsPrice = pItsPrice;
  }

  /**
   * <p>Geter for itsTotal.</p>
   * @return BigDecimal
   **/
  public final BigDecimal getItsTotal() {
    return this.itsTotal;
  }

  /**
   * <p>Setter for itsTotal.</p>
   * @param pItsTotal reference
   **/
  public final void setItsTotal(final BigDecimal pItsTotal) {
    this.itsTotal = pItsTotal;
  }
}
