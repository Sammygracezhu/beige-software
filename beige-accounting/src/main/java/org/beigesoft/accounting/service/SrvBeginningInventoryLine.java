package org.beigesoft.accounting.service;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

import org.beigesoft.exception.ExceptionWithCode;
import org.beigesoft.accounting.persistable.BeginningInventory;
import org.beigesoft.accounting.persistable.BeginningInventoryLine;
import org.beigesoft.service.ISrvEntityOwned;
import org.beigesoft.orm.service.ISrvOrm;
import org.beigesoft.orm.service.ISrvDatabase;

/**
 * <p>Business service for Beginning Inventory Line.</p>
 *
 * @param <RS> platform dependent record set type
 * @author Yury Demidenko
 */
public class SrvBeginningInventoryLine<RS>
  extends ASrvAccEntityImmutable<RS, BeginningInventoryLine>
    implements ISrvEntityOwned<BeginningInventoryLine, BeginningInventory> {

  /**
   * <p>Database service.</p>
   **/
  private ISrvDatabase<RS> srvDatabase;

  /**
   * <p>Business service for warehouse.</p>
   **/
  private ISrvWarehouseEntry srvWarehouseEntry;

  /**
   * <p>minimum constructor.</p>
   **/
  public SrvBeginningInventoryLine() {
    super(BeginningInventoryLine.class);
  }

  /**
   * <p>Useful constructor.</p>
   * @param pSrvOrm ORM service
   * @param pSrvDatabase Database service
   * @param pSrvWarehouseEntry Warehouse service
   * @param pSrvAccSettings AccSettings service
   **/
  public SrvBeginningInventoryLine(final ISrvOrm<RS> pSrvOrm,
    final ISrvDatabase<RS> pSrvDatabase, final ISrvAccSettings pSrvAccSettings,
      final ISrvWarehouseEntry pSrvWarehouseEntry) {
    super(BeginningInventoryLine.class, pSrvOrm, pSrvAccSettings);
    this.srvDatabase = pSrvDatabase;
    this.srvWarehouseEntry = pSrvWarehouseEntry;
  }

  /**
   * <p>Create entity.</p>
   * @param pAddParam additional param
   * @return entity instance
   * @throws Exception - an exception
   **/
  @Override
  public final BeginningInventoryLine createEntity(
    final Map<String, Object> pAddParam) throws Exception {
    BeginningInventoryLine entity = new BeginningInventoryLine();
    entity.setIdDatabaseBirth(getSrvOrm().getIdDatabase());
    entity.setIsNew(true);
    BeginningInventory itsOwner = new BeginningInventory();
    entity.setItsOwner(itsOwner);
    addAccSettingsIntoAttrs(pAddParam);
    return entity;
  }

  /**
   * <p>Retrieve copy of entity from DB by given ID.</p>
   * @param pAddParam additional param
   * @param pId ID
   * @return entity or null
   * @throws Exception - an exception
   **/
  @Override
  public final BeginningInventoryLine retrieveCopyEntity(
    final Map<String, Object> pAddParam,
      final Object pId) throws Exception {
    BeginningInventoryLine entity = getSrvOrm().retrieveCopyEntity(
      BeginningInventoryLine.class, pId);
    @SuppressWarnings("unchecked")
    Map<String, String[]> parameterMap = (Map<String, String[]>) pAddParam.
      get("parameterMap");
    if (parameterMap.get("actionAdd") != null
      && "reverse".equals(parameterMap.get("actionAdd")[0])) {
      if (entity.getReversedId() != null) {
        throw new ExceptionWithCode(ExceptionWithCode.FORBIDDEN,
          "attempt_to_reverse_reversed::" + pAddParam.get("user"));
      }
      entity.setReversedId(Long.valueOf(pId.toString()));
      entity.setItsQuantity(entity.getItsQuantity().negate());
      entity.setItsTotal(entity.getItsTotal().negate());
    } else {
      entity.setItsQuantity(BigDecimal.ZERO);
      entity.setItsCost(BigDecimal.ZERO);
      entity.setItsTotal(BigDecimal.ZERO);
    }
    entity.setIsNew(true);
    addAccSettingsIntoAttrs(pAddParam);
    return entity;
  }

  /**
   * <p>Insert immutable line into DB.</p>
   * @param pAddParam additional param
   * @param pEntity entity
   * @param isEntityDetached ignored
   * @throws Exception - an exception
   **/
  @Override
  public final void saveEntity(final Map<String, Object> pAddParam,
    final BeginningInventoryLine pEntity,
      final boolean isEntityDetached) throws Exception {
    if (pEntity.getIsNew()) {
      if (pEntity.getItsQuantity().doubleValue() <= 0
        && pEntity.getReversedId() == null) {
        throw new ExceptionWithCode(ExceptionWithCode.WRONG_PARAMETER,
          "quantity_less_or_equal_zero::" + pAddParam.get("user"));
      }
      if (pEntity.getItsCost().doubleValue() <= 0) {
        throw new ExceptionWithCode(ExceptionWithCode.WRONG_PARAMETER,
          "cost_less_or_eq_zero::" + pAddParam.get("user"));
      }
      //SQL refresh:
      pEntity.setInvItem(getSrvOrm().retrieveEntity(pEntity.getInvItem()));
      BeginningInventory itsOwner = getSrvOrm().retrieveEntityById(
        BeginningInventory.class, pEntity.getItsOwner().getItsId());
      pEntity.setItsOwner(itsOwner);
      //rounding:
      pEntity.setItsQuantity(pEntity.getItsQuantity().setScale(
        getSrvAccSettings().lazyGetAccSettings().getQuantityPrecision(),
          getSrvAccSettings().lazyGetAccSettings().getRoundingMode()));
      pEntity.setItsCost(pEntity.getItsCost().setScale(getSrvAccSettings()
          .lazyGetAccSettings().getCostPrecision(), getSrvAccSettings()
            .lazyGetAccSettings().getRoundingMode()));
      pEntity.setTheRest(pEntity.getItsQuantity());
      pEntity.setItsTotal(pEntity.getItsTotal().setScale(getSrvAccSettings()
          .lazyGetAccSettings().getCostPrecision(), getSrvAccSettings()
            .lazyGetAccSettings().getRoundingMode()));
      if (pEntity.getReversedId() != null) {
        pEntity.setTheRest(BigDecimal.ZERO);
      }
      getSrvOrm().insertEntity(pEntity);
      if (pEntity.getReversedId() != null) {
        BeginningInventoryLine reversed = getSrvOrm().retrieveEntityById(
          BeginningInventoryLine.class, pEntity.getReversedId());
        if (reversed.getReversedId() != null) {
          throw new ExceptionWithCode(ExceptionWithCode.FORBIDDEN,
            "attempt_to_reverse_reversed");
        }
        if (!reversed.getItsQuantity().equals(reversed.getTheRest())) {
          throw new ExceptionWithCode(ExceptionWithCode
            .WRONG_PARAMETER, "where_is_withdrawals_from_this_source");
        }
        reversed.setTheRest(BigDecimal.ZERO);
        reversed.setReversedId(pEntity.getItsId());
        getSrvOrm().updateEntity(reversed);
      }
      srvWarehouseEntry.load(pAddParam, pEntity, pEntity.getWarehouseSite());
      String query =
        "select sum(ITSTOTAL) as ITSTOTAL from"
        + " BEGINNINGINVENTORYLINE where ITSOWNER=" + itsOwner.getItsId();
      Double total = getSrvDatabase().evalDoubleResult(query, "ITSTOTAL");
      BigDecimal totalBdcm = BigDecimal.valueOf(total);
      itsOwner.setItsTotal(totalBdcm.setScale(
        getSrvAccSettings().lazyGetAccSettings().getCostPrecision()));
      getSrvOrm().updateEntity(itsOwner);
    } else {
      throw new ExceptionWithCode(ExceptionWithCode.FORBIDDEN,
        "edit_not_allowed::" + pAddParam.get("user"));
    }
  }

  /**
   * <p>Create entity with its itsOwner e.g. invoice line
   * for invoice.</p>
   * @param pAddParam additional param
   * @param pIdEntityItsOwner entity itsOwner ID
   * @return entity instance
   * @throws Exception - an exception
   **/
  @Override
  public final BeginningInventoryLine createEntityWithOwnerById(
    final Map<String, Object> pAddParam,
      final Object pIdEntityItsOwner) throws Exception {
    BeginningInventoryLine entity = new BeginningInventoryLine();
    entity.setIdDatabaseBirth(getSrvOrm().getIdDatabase());
    entity.setIsNew(true);
    BeginningInventory itsOwner = new BeginningInventory();
    itsOwner.setItsId(Long.valueOf(pIdEntityItsOwner.toString()));
    entity.setItsOwner(itsOwner);
    addAccSettingsIntoAttrs(pAddParam);
    return entity;
  }

  /**
   * <p>Create entity with its itsOwner e.g. invoice line
   * for invoice.</p>
   * @param pAddParam additional param
   * @param pEntityItsOwner itsOwner
   * @return entity instance
   * @throws Exception - an exception
   **/
  @Override
  public final BeginningInventoryLine createEntityWithOwner(
    final Map<String, Object> pAddParam,
      final BeginningInventory pEntityItsOwner) throws Exception {
    BeginningInventoryLine entity = new BeginningInventoryLine();
    entity.setIsNew(true);
    entity.setIdDatabaseBirth(getSrvOrm().getIdDatabase());
    entity.setItsOwner(pEntityItsOwner);
    addAccSettingsIntoAttrs(pAddParam);
    return entity;
  }

  /**
   * <p>Retrieve owned list of entities for itsOwner.
   * E.g. invoices lines for invoice</p>
   * @param pAddParam additional param
   * @param pIdEntityItsOwner ID itsOwner
   * @return owned list of business objects
   * @throws Exception - an exception
   */
  @Override
  public final List<BeginningInventoryLine> retrieveOwnedListById(
    final Map<String, Object> pAddParam,
      final Object pIdEntityItsOwner) throws Exception {
    return getSrvOrm().retrieveEntityOwnedlist(BeginningInventoryLine.class,
      BeginningInventory.class, pIdEntityItsOwner);
  }

  /**
   * <p>Retrieve owned list of entities for itsOwner.
   * E.g. invoices lines for invoice</p>
   * @param pAddParam additional param
   * @param pEntityItsOwner itsOwner
   * @return owned list of business objects
   * @throws Exception - an exception
   */
  @Override
  public final List<BeginningInventoryLine> retrieveOwnedList(
    final Map<String, Object> pAddParam,
      final BeginningInventory pEntityItsOwner) throws Exception {
    addAccSettingsIntoAttrs(pAddParam);
    return getSrvOrm().retrieveEntityOwnedlist(BeginningInventoryLine.class,
      BeginningInventory.class, pEntityItsOwner.getItsId());
  }

  //Simple getters and setters:
  /**
   * <p>Geter for srvWarehouseEntry.</p>
   * @return ISrvWarehouseEntry
   **/
  public final ISrvWarehouseEntry getSrvWarehouseEntry() {
    return this.srvWarehouseEntry;
  }

  /**
   * <p>Setter for srvWarehouseEntry.</p>
   * @param pSrvWarehouseEntry reference
   **/
  public final void setSrvWarehouseEntry(
    final ISrvWarehouseEntry pSrvWarehouseEntry) {
    this.srvWarehouseEntry = pSrvWarehouseEntry;
  }
  /**
   * <p>Geter for srvDatabase.</p>
   * @return ISrvDatabase
   **/
  public final ISrvDatabase<RS> getSrvDatabase() {
    return this.srvDatabase;
  }

  /**
   * <p>Setter for srvDatabase.</p>
   * @param pSrvDatabase reference
   **/
  public final void setSrvDatabase(final ISrvDatabase<RS> pSrvDatabase) {
    this.srvDatabase = pSrvDatabase;
  }
}
