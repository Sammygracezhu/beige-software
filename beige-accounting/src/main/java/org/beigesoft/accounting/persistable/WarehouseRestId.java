package org.beigesoft.accounting.persistable;

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
 * Warehouse Rest ID.
 * </pre>
 *
 * @author Yury Demidenko
 */
public class WarehouseRestId {

  /**
   * <p>Warehouse Place part of complex ID.</p>
   **/
  private WarehouseSite warehouseSite;

  /**
   * <p>InvItem part of complex ID.</p>
   **/
  private InvItem invItem;

  /**
   * <p>UnitOfMeasure part of complex ID.</p>
   **/
  private UnitOfMeasure unitOfMeasure;

  /**
   * <p>Default constructor.</p>
   **/
  public WarehouseRestId() {

  }

  /**
   * <p>Useful constructor.</p>
   * @param pWarehouseSite reference
   * @param pInvItem reference
   * @param pUnitOfMeasure reference
   **/
  public WarehouseRestId(final WarehouseSite pWarehouseSite,
    final InvItem pInvItem, final UnitOfMeasure pUnitOfMeasure) {
    this.warehouseSite = pWarehouseSite;
    this.invItem = pInvItem;
    this.unitOfMeasure = pUnitOfMeasure;
  }

  //Simple getters and setters:
  /**
   * <p>Geter for warehouseSite.</p>
   * @return WarehouseSite
   **/
  public final WarehouseSite getWarehouseSite() {
    return this.warehouseSite;
  }

  /**
   * <p>Setter for warehouseSite.</p>
   * @param pWarehouseSite reference
   **/
  public final void setWarehouseSite(final WarehouseSite pWarehouseSite) {
    this.warehouseSite = pWarehouseSite;
  }

  /**
   * <p>Geter for invItem.</p>
   * @return InvItem
   **/
  public final InvItem getInvItem() {
    return this.invItem;
  }

  /**
   * <p>Setter for invItem.</p>
   * @param pInvItem reference
   **/
  public final void setInvItem(final InvItem pInvItem) {
    this.invItem = pInvItem;
  }

  /**
   * <p>Geter for unitOfMeasure.</p>
   * @return UnitOfMeasure
   **/
  public final UnitOfMeasure getUnitOfMeasure() {
    return this.unitOfMeasure;
  }

  /**
   * <p>Setter for unitOfMeasure.</p>
   * @param pUnitOfMeasure reference
   **/
  public final void setUnitOfMeasure(final UnitOfMeasure pUnitOfMeasure) {
    this.unitOfMeasure = pUnitOfMeasure;
  }
}
