package org.beigesoft.replicator.service;

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
import java.io.Reader;

/**
 * <p>Service that Read entities from stream (by given reader)
 * and insert/update them into DB.</p>
 *
 * @author Yury Demidenko
 */
public interface IDatabaseReader {

  /**
   * <p>
   * Read entities from stream (by given reader) and insert/update them
   * into DB.
   * </p>
   * @param pReader Reader
   * @param pAddParam additional params
   * @throws Exception - an exception
   **/
  void readAndStoreEntities(Reader pReader,
    Map<String, Object> pAddParam) throws Exception;
}
