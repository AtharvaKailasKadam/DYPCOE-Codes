<?xml version="1.0" encoding="UTF-8"?>
<<<<<<< HEAD

<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>Employee Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 70%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: lightgray;
        }
    </style>
</head>

<body>

<h2>Employee Information</h2>

<table>
<tr>
    <th>Emp ID</th>
    <th>Name</th>
    <th>Department</th>
    <th>Designation</th>
    <th>Salary</th>
    <th>Email</th>
    <th>Phone</th>
</tr>

<xsl:for-each select="employees/employee">
<tr>
    <td><xsl:value-of select="@empID"/></td>
    <td><xsl:value-of select="name"/></td>
    <td><xsl:value-of select="department"/></td>
    <td><xsl:value-of select="designation"/></td>
    <td><xsl:value-of select="salary"/></td>
    <td><xsl:value-of select="email"/></td>
    <td><xsl:value-of select="phone"/></td>
</tr>
</xsl:for-each>

</table>

</body>
</html>

</xsl:template>
=======
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Employee Information</title>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Employee Information</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Designation</th>
            <th>Department</th>
            <th>Salary</th>
          </tr>
          <xsl:for-each select="employees/employee">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="designation"/></td>
              <td><xsl:value-of select="department"/></td>
              <td><xsl:value-of select="salary"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
>>>>>>> 2123fef93627083a20c13ada0e5f791eb68635ee
</xsl:stylesheet>