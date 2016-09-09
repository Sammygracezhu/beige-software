package org.beigesoft.log;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import java.util.Map;
import java.util.HashMap;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * <p>Implementation of Logger adapter with java.util.logging.
 * This logger used in already preconfigured container e.g. Tomcat.</p>
 *
 * @author Yury Demidenko
 */
public class LoggerStandard implements ILogger {

  /**
   * <p>logger.</p>
   **/
  private Logger logger = Logger.getAnonymousLogger();

  /**
   * <p>Is show debug messages.</p>
   **/
  private boolean isShowDebugMessage;

  /**
   * <p>Is show debug messages for class map.</p>
   **/
  private final Map<Class<?>, Boolean> mapShowDebugMsgForClass =
    new HashMap<Class<?>, Boolean>();

  /**
   * <p>Make debug log.</p>
   * @param pClazz of debudgged bean
   * @param pMsg message
   **/
  @Override
  public final void debug(final Class<?> pClazz,
    final String pMsg) {
    if (this.isShowDebugMessage && getIsShowDebugMessages(pClazz)) {
      logger.log(Level.INFO, pClazz.getSimpleName() + ": " + pMsg);
    }
  }

  /**
   * <p>Make info log.</p>
   * @param pClazz of bean
   * @param pMsg message
   **/
  @Override
  public final void info(final Class<?> pClazz,
    final String pMsg) {
    logger.log(Level.INFO, pClazz.getSimpleName() + ": " + pMsg);
  }

  /**
   * <p>Make error log.</p>
   * @param pClazz of bean
   * @param pMsg message
   **/
  @Override
  public final void error(final Class<?> pClazz,
    final String pMsg) {
    logger.log(Level.SEVERE, pClazz.getSimpleName() + ": " + pMsg);
  }

  /**
   * <p>Make warn log.</p>
   * @param pClazz of bean
   * @param pMsg message
   **/
  @Override
  public final void warn(final Class<?> pClazz,
    final String pMsg) {
    logger.log(Level.WARNING, pClazz.getSimpleName() + ": " + pMsg);
  }

  /**
   * <p>Set is show debug messages.</p>
   * @param pIsShowDebugMessage is show debug messages?
   **/
  @Override
  public final void setIsShowDebugMessages(
    final  boolean pIsShowDebugMessage) {
    this.isShowDebugMessage = pIsShowDebugMessage;
  }

  /**
   * <p>Get is show debug messages.</p>
   * @return is show debug messages?
   **/
  @Override
  public final boolean getIsShowDebugMessages() {
    return this.isShowDebugMessage;
  }

  /**
   * <p>Set is show debug messages for this class.</p>
   * @param pClazz of bean
   * @param pIsShowDebugMessage is show debug messages?
   **/
  @Override
  public final void setIsShowDebugMessages(final Class<?> pClazz,
    final boolean pIsShowDebugMessage) {
    synchronized (this.mapShowDebugMsgForClass) {
      if (this.mapShowDebugMsgForClass.get(pClazz) == null
        || this.mapShowDebugMsgForClass.get(pClazz) != pIsShowDebugMessage) {
        this.mapShowDebugMsgForClass.put(pClazz, pIsShowDebugMessage);
      }
    }
  }

  /**
   * <p>Get is show debug messages for this class.</p>
   * @param pClazz of bean
   * @return is show debug messages?
   **/
  @Override
  public final boolean getIsShowDebugMessages(final Class<?> pClazz) {
    synchronized (this.mapShowDebugMsgForClass) {
      if (this.mapShowDebugMsgForClass.get(pClazz) == null) {
        this.mapShowDebugMsgForClass.put(pClazz, true);
      }
      return this.mapShowDebugMsgForClass.get(pClazz);
    }
  }

  //Simple getters and setters:
  /**
   * <p>Geter for logger.</p>
   * @return Logger
   **/
  public final Logger getLogger() {
    return this.logger;
  }

  /**
   * <p>Setter for logger.</p>
   * @param pLogger reference
   **/
  public final void setLogger(final Logger pLogger) {
    this.logger = pLogger;
  }
}
