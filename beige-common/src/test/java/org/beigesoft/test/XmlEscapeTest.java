package org.beigesoft.test;

/*
 * Beigesoft ™
 *
 * Licensed under the Apache License, Version 2.0
 *
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import static org.junit.Assert.assertEquals;
import org.junit.Test;

import org.beigesoft.service.UtilXml;

/**
 * <p>Service XML Escape Test.
 * </p>
 *
 * @author Yury Demidenko
 */
public class XmlEscapeTest {
  
  UtilXml utilXml = new UtilXml();

  @Test
  public void test1() throws Exception {
    String strXmlUnescaped1 = "a=\"b-2\" & c > 1 and b<=5 'j' ";
    String strXmlEscaped1 = "a=&quot;b-2&quot; &amp; c &gt; 1 and b&lt;=5 &apos;j&apos; ";
    System.out.println(utilXml.escapeXml(strXmlUnescaped1));
    System.out.println(utilXml.unescapeXml(strXmlEscaped1));
    assertEquals(utilXml.escapeXml(strXmlUnescaped1), strXmlEscaped1); 
    assertEquals(utilXml.unescapeXml(strXmlEscaped1), strXmlUnescaped1); 
  }
}
