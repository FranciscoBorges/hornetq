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


/*
      XSLT Version = <xsl:copy-of select="system-property('xsl:version')"/>
      XSLT Vendor = <xsl:copy-of select="system-property('xsl:vendor')"/>
      XSLT Vendor URL = <xsl:copy-of select="system-property('xsl:vendor-url')"/>
*/
</xsl:template>
</xsl:stylesheet>