<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Find all Pokemon that fit particular attack/defense/speed values -->

<!-- This generates a comma-separated list for the Pokemon types; 'grass, poison' or 'normal' -->
<xsl:template match="type[position() != last()]"><xsl:value-of select="text()"/>, </xsl:template>
<xsl:template match="type[position() = last()]">
  <xsl:value-of select="text()"/>
</xsl:template>

<!--
  These rules will generate text output rather than text; these are useful for more easily
  figuring out if you got the "select" queries correct. Once you have that figured out,
  then update the HTML version of these rules below (and comment these out!) to see a nicely-
  formatted HTML file.
  -->
<!-- For each of these three sets of data, write the query that selects the
     pokemon with "attack", "defense" or "speed" values greater than 150.
     HINT: you may need to select the text nodes *under* the node you're
     looking at in order to use the greater-than operator on the value.
     Use that same query with the XPath count() function to return the
     number of nodes that are returned by that query. -->
      <!--
<xsl:template match="/pokedex">
    Strong attackers: <xsl:value-of select="count(pokemon[attack/text() > 150])" />
    <xsl:apply-templates select="pokemon[attack/text() > 150]" />
    Strong defenders: <xsl:value-of select="count(pokemon[defense/text() > 150])" />
    <xsl:apply-templates select="pokemon[defense/text() > 150]" />
    Fast: <xsl:value-of select="count(pokemon[speed/text() > 150])" />
    <xsl:apply-templates select="pokemon[speed/text() > 150]" />
</xsl:template>
-->
<!-- In this template, select the name, pokedexNumber, and type in each of the value-of
     statements, respectively. -->
     <!--
<xsl:template match="pokemon">
    <td><xsl:value-of select="name" />(<xsl:value-of select="@pokedexNumber" />)</td>
    <td><xsl:value-of select="type" /></td>
</xsl:template>
-->
<!--
  These rules will generate HTML output rather than text. This is to demonstrate
  the power of using XSLT to create pretty output from XML sources.
  -->
<!-- For each of these three sets of data, write the query that selects the
     pokemon with "attack", "defense" or "speed" values greater than 150.
     HINT: you may need to select the text nodes *under* the node you're
     looking at in order to use the greater-than operator on the value.
     Use that same query with the XPath count() function to return the
     number of nodes that are returned by that query. -->

<xsl:template match="/pokedex">
  <html>
  <body>
  <h2>Strong Attackers: <xsl:value-of select="count(pokemon[attack/text() > 150])" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[attack/text() > 150]" />
  </table>
  <h2>Strong Defenders: <xsl:value-of select="count(pokemon[defense/text() > 150])" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[defense/text() > 150]" />
  </table>
  <h2>Fast: <xsl:value-of select="count(pokemon[speed/text() > 150])" /></h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type</th>
    </tr>
    <xsl:apply-templates select="pokemon[speed/text() > 150]" />
  </table>
  </body>
  </html>
</xsl:template>

<!-- In this template, select the name, pokedexNumber, and type in each of the value-of
     statements, respectively. -->

<xsl:template match="pokemon">
    <tr>
      <td><xsl:value-of select="name" />(<xsl:value-of select="@pokedexNumber" />)</td>
      <td><xsl:value-of select="type" /></td>
    </tr>
</xsl:template>


</xsl:stylesheet>