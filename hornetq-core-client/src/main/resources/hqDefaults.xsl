<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:hq="urn:org.hornetq"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">

  <!-- This XSLT creates the class HornetQDefaultsConfiguration.java.

  It makes use of a text file with the first part of the class' body, and creates fields and methods
  using information encoded in the hornetq-configuration.xsd.

  Any element in the hornetq-configuration.xsd with an attribute 'hq:field_name' will trigger the
  creation of a field using also its 'type' to determine the correct Java type. -->

  <xsl:output method="text" indent="yes"/>
  <!-- 16.2 Reading Text Files -->
  <xsl:template match="/">
    <xsl:text>/*
    * THIS IS A GENERATED FILE! DO NOT EDIT IT DIRECTLY!

      To see how this file is generated, please refer to
      hornetq-core-client/src/main/resources/hqDefaults.xsl

      To add new entries either document them in the hornetq-configuration.xsd by adding:

      1. a default value to the schema element (using the standard way of adding a default)
      2. adding a hq:field_name attribute to a xsd:annotation element of the element in question.

      It is probably easier to just go to the hornetq-configuration.xsd and see how this is done for
      other values, and then copy it.

      The advantage of adding the default to the schema is that:

      a. the schema will inform users of it (for users that check such things through the schema,
      think of XML editors as users...);

      b. the manual gets an entry for it automatically;

      c. the Java code gets the same value;

      d. all 3 sources of defaults will match since they take the value from the same place
      (i.e. the schema).

    */
</xsl:text>
/*
      XSLT Version = <xsl:copy-of select="system-property('xsl:version')"/>
      XSLT Vendor = <xsl:copy-of select="system-property('xsl:vendor')"/>
      XSLT Vendor URL = <xsl:copy-of select="system-property('xsl:vendor-url')"/>
*/
<xsl:text>
package org.hornetq.api.config;

import org.hornetq.api.core.SimpleString;
import org.hornetq.core.journal.impl.JournalConstants;

/**
 * Default values of HornetQ configuration parameters.
 */
public final class HornetQDefaultConfiguration
{
   /*
    * In order to avoid compile time in-lining of constants, all access is done through methods
    * and all fields are PRIVATE STATIC but not FINAL. This is done following the recommendation at
    * &lt;a href="http://docs.oracle.com/javase/specs/jls/se7/html/jls-13.html#jls-13.4.9">13.4.9.
    * final Fields and Constants&lt;/a>
    * @see http://docs.oracle.com/javase/specs/jls/se7/html/jls-13.html#jls-13.4.9
    */

   private HornetQDefaultConfiguration()
   {
      // Utility class
   }

   public static long getDefaultClientFailureCheckPeriod()
   {
      return DEFAULT_CLIENT_FAILURE_CHECK_PERIOD;
   }

   public static long getDefaultFileDeployerScanPeriod()
   {
      return DEFAULT_FILE_DEPLOYER_SCAN_PERIOD;
   }

   public static int getDefaultJournalMaxIoAio()
   {
      return DEFAULT_JOURNAL_MAX_IO_AIO;
   }

   public static int getDefaultJournalBufferTimeoutAio()
   {
      return DEFAULT_JOURNAL_BUFFER_TIMEOUT_AIO;
   }

   public static int getDefaultJournalBufferSizeAio()
   {
      return DEFAULT_JOURNAL_BUFFER_SIZE_AIO;
   }

   public static int getDefaultJournalMaxIoNio()
   {
      return DEFAULT_JOURNAL_MAX_IO_NIO;
   }

   public static int getDefaultJournalBufferTimeoutNio()
   {
      return DEFAULT_JOURNAL_BUFFER_TIMEOUT_NIO;
   }

   public static int getDefaultJournalBufferSizeNio()
   {
      return DEFAULT_JOURNAL_BUFFER_SIZE_NIO;
   }

   public static String getPropMaskPassword()
   {
      return PROP_MASK_PASSWORD;
   }

   public static String getPropPasswordCodec()
   {
      return PROP_PASSWORD_CODEC;
   }

   //shared by client and core/server
   // XXX not on schema?
   private static long DEFAULT_CLIENT_FAILURE_CHECK_PERIOD = 30000;

   // XXX not on schema?
   private static long DEFAULT_FILE_DEPLOYER_SCAN_PERIOD = 5000;

   // These defaults are applied depending on whether the journal type
   // is NIO or AIO.
   private static int DEFAULT_JOURNAL_MAX_IO_AIO = 500;
   private static int DEFAULT_JOURNAL_BUFFER_TIMEOUT_AIO = JournalConstants.DEFAULT_JOURNAL_BUFFER_TIMEOUT_AIO;
   private static int DEFAULT_JOURNAL_BUFFER_SIZE_AIO = JournalConstants.DEFAULT_JOURNAL_BUFFER_SIZE_AIO;
   private static int DEFAULT_JOURNAL_MAX_IO_NIO = 1;
   private static int DEFAULT_JOURNAL_BUFFER_TIMEOUT_NIO = JournalConstants.DEFAULT_JOURNAL_BUFFER_TIMEOUT_NIO;
   private static int DEFAULT_JOURNAL_BUFFER_SIZE_NIO = JournalConstants.DEFAULT_JOURNAL_BUFFER_SIZE_NIO;

   // XXX not on schema.
   //properties passed to acceptor/connectors.
   private static String PROP_MASK_PASSWORD = "hornetq.usemaskedpassword";
   private static String PROP_PASSWORD_CODEC = "hornetq.passwordcodec";

&#xa;    // -------------------------------------------------------------------
    // Following fields are generated from the hornetq-schema.xsd annotations
    // -------------------------------------------------------------------&#xa;</xsl:text>

        <xsl:for-each select="xsd:schema//xsd:complexType//xsd:element[ xsd:annotation/@hq:field_name ]">
   // <xsl:value-of select="normalize-space(xsd:annotation/xsd:documentation)"/>
   private static <xsl:call-template name="determine-type"/><xsl:text> </xsl:text><xsl:value-of select="xsd:annotation/@hq:field_name"/> = <xsl:call-template name="quote-default-value"/>;
</xsl:for-each>

<xsl:text>&#xa;&#xa;</xsl:text>

        <xsl:for-each select="xsd:schema//xsd:complexType//xsd:element[ xsd:annotation/@hq:field_name ]">

<xsl:text>   /**&#xa;    * </xsl:text>
<xsl:value-of select="normalize-space(xsd:annotation/xsd:documentation)"/>
<xsl:text>&#xa;    */</xsl:text>
   public static <xsl:call-template name="determine-type"/> <xsl:call-template name="method-prefix-verb"/><xsl:for-each select="fn:tokenize(xsd:annotation/@hq:field_name,'_')">
  <xsl:value-of select=
                "concat(upper-case(substring(.,1,1)),
                 lower-case(substring(., 2)),
                 ' '[not(last())]
                 )
                 "/>
</xsl:for-each>()
   <xsl:text>&#123;&#xa;     return </xsl:text>
  <xsl:value-of select="xsd:annotation/@hq:field_name" />
    <xsl:text>;
   &#125;&#xa;</xsl:text>
        </xsl:for-each>
    <xsl:text>
&#125;&#xa;</xsl:text>
  </xsl:template>

<xsl:template name="method-prefix-verb">
  <xsl:choose>
    <xsl:when test="@type='xsd:boolean'">
      <xsl:text> is</xsl:text>
    </xsl:when>
    <xsl:otherwise>      <xsl:text> get</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="quote-default-value">
  <xsl:choose>
    <xsl:when test="xsd:annotation/@hq:type='SimpleString'">
      <xsl:value-of select="concat( 'new SimpleString(&#34;', @default, '&#34;)')"/>
    </xsl:when>
    <xsl:when test="@type='xsd:string'">
      <xsl:value-of select="concat( '&#34;', @default, '&#34;')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="@default"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="determine-type">
  <xsl:choose>
    <xsl:when test="xsd:annotation/@hq:type">
      <xsl:value-of select="xsd:annotation/@hq:type"/>
    </xsl:when>
    <xsl:when test="@type = 'xsd:string'">
      <xsl:text>String</xsl:text>
    </xsl:when>
    <xsl:when test="fn:starts-with(@type,'xsd:')">
      <xsl:value-of select="fn:substring-after(@type,':')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="@type"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>
