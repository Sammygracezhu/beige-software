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

import org.beigesoft.model.IOwned;
import org.beigesoft.persistable.AHasIdLong;
import org.beigesoft.accounting.persistable.AccSettings;

/**
 * <pre>
 * Draw Item Source Line for AccSettings that describe
 * source include SQL query to get it.
 * </pre>
 *
 * @author Yury Demidenko
 */
public abstract class ADrawItemSourcesLine extends AHasIdLong
  implements IOwned<AccSettings> {

  /**
   * <p>Version, changed time algorithm cause check dirty of
   * calculated from it (derived) records.</p>
   **/
  private Long itsVersion;

  /**
   * <p>Owner AccSettings, not Null.</p>
   **/
  private AccSettings itsOwner;

  /**
   * <p>Not Null, source type code e.g. 1001 - PurchaseInvoiceLine.</p>
   **/
  private Integer sourceType;

  /**
   * <p>SQL file name without extension "sql", unchangeable, not Null.</p>
   **/
  private String fileName;

  /**
   * <p>Description.</p>
   **/
  private String description;

  /**
   * <p>Not null, unchangeable, comma delimited
   * array of CogsMethod ID e.g. "1, 2, 3".</p>
   **/
  private String useInMethods;

  /**
   * <p>Is used in current method, not Null.</p>
   **/
  private Boolean isUsed;

  /**
   * <p>Geter for itsOwner.</p>
   * @return AccSettings
   **/
  @Override
  public final AccSettings getItsOwner() {
    return this.itsOwner;
  }

  /**
   * <p>Setter for itsOwner.</p>
   * @param pItsOwner reference
   **/
  @Override
  public final void setItsOwner(final AccSettings pItsOwner) {
    this.itsOwner = pItsOwner;
  }

  //Simple getters and setters:
  /**
   * <p>Geter for itsVersion.</p>
   * @return Long
   **/
  public final Long getItsVersion() {
    return this.itsVersion;
  }

  /**
   * <p>Setter for itsVersion.</p>
   * @param pItsVersion reference
   **/
  public final void setItsVersion(final Long pItsVersion) {
    this.itsVersion = pItsVersion;
  }

  /**
   * <p>Geter for sourceType.</p>
   * @return Integer
   **/
  public final Integer getSourceType() {
    return this.sourceType;
  }

  /**
   * <p>Setter for sourceType.</p>
   * @param pSourceType reference
   **/
  public final void setSourceType(final Integer pSourceType) {
    this.sourceType = pSourceType;
  }

  /**
   * <p>Geter for fileName.</p>
   * @return String
   **/
  public final String getFileName() {
    return this.fileName;
  }

  /**
   * <p>Setter for fileName.</p>
   * @param pFileName reference
   **/
  public final void setFileName(final String pFileName) {
    this.fileName = pFileName;
  }

  /**
   * <p>Geter for description.</p>
   * @return String
   **/
  public final String getDescription() {
    return this.description;
  }

  /**
   * <p>Setter for description.</p>
   * @param pDescription reference
   **/
  public final void setDescription(final String pDescription) {
    this.description = pDescription;
  }

  /**
   * <p>Geter for useInMethods.</p>
   * @return String
   **/
  public final String getUseInMethods() {
    return this.useInMethods;
  }

  /**
   * <p>Setter for useInMethods.</p>
   * @param pUseInMethods reference
   **/
  public final void setUseInMethods(final String pUseInMethods) {
    this.useInMethods = pUseInMethods;
  }

  /**
   * <p>Geter for isUsed.</p>
   * @return Boolean
   **/
  public final Boolean getIsUsed() {
    return this.isUsed;
  }

  /**
   * <p>Setter for isUsed.</p>
   * @param pIsUsed reference
   **/
  public final void setIsUsed(final Boolean pIsUsed) {
    this.isUsed = pIsUsed;
  }
}