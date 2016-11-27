<?xml version = '1.0' encoding = "UTF-8"?>   
<xsl:stylesheet version = '1.0' 
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="/">  
    <html>
        <title>Book catalog</title>

    	<body>
            <h1>Book catalog</h1>

    		<table border="1">
    			<tr style="background-color:gray">
    				<th>Nr.</th>
    				<th>Book ID</th>
                    <th>Language</th>
    				<th>Author</th>
    				<th>Title</th>
    				<th>Genre</th>
    				<th>Price</th>
    				<th>Publish date</th>
    				<th>Dectription</th>
    				<th>Previous versions</th>
    			</tr>
    			<xsl:for-each select="catalog/book">
    				<xsl:sort select = "title"/> 
    				<xsl:if test = "price > 3">
    				<tr>                      
    					<td><xsl:number value="position()" format="1."/></td>
    					<td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="title/@lang"/></td>
                        <xsl:apply-templates/>
    				</tr> 
    				</xsl:if>   			
    			</xsl:for-each>
    		</table>
            <tp>Nera brangesne nei uz viena kita knyga: <xsl:value-of select="//book[not(price > //book/price)]/title"/></tp>

    	</body>
    </html>
</xsl:template>

<xsl:template match="book">
    <td><xsl:apply-templates select="author"/></td>
    <td><xsl:apply-templates select="title"/></td>
    <td><xsl:apply-templates select="genre"/></td>
    <td><xsl:apply-templates select="price"/></td>
    <td><xsl:apply-templates select="publish_date"/></td>
    <td><xsl:apply-templates select="description"/></td>
    <td><xsl:apply-templates select="issued"/></td>
</xsl:template>


<xsl:template match="author">
    <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="title">
    <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="genre">
    <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="price">
    <td><xsl:value-of select="."/>€</td>
</xsl:template>
<xsl:template match="publish_date">
    <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="description">
    <td><xsl:value-of select="."/></td>
</xsl:template>
<xsl:template match="issued">
      <td><xsl:value-of select="."/></td>
</xsl:template>




</xsl:stylesheet>