<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="html" encoding="UTF-8"/>

<!--
Nombre: Aritz Lourido de Castro
Fecha: 08 de marzo de 2023 
Módulo: FP II - DAM
Asignatura: LMSGI
Unidad: 4
Ejercicio: Tarea Evaluación 02. XSLT
Autoevaluación: https://docs.google.com/document/d/1UG9A2LjRcVgieyV-qeto2yV3-KAE-FzOJzyGthREC5k/edit?usp=sharing
Página web en GitHub: https://aritzlourido.github.io/LMGSI04_TE02/index.html
-->
    <xsl:template match="/">

        <html>

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="teatro.xml">Teatro</a>
                    <a href="restaurante.xml">Restaurante</a>
                    <a href="festival.xml">Festival</a>
                </header>
                
                <section class="festival">
                    <h1>Festivales de rock</h1>
                    <table>
                        <tr>
                            <th>FESTIVAL</th>
                            <th>CONCIERTO</th>
                            <th>FECHA</th>
                            <th>HORA</th>
                            <th>LUGAR</th>
                        </tr>
                        <xsl:apply-templates select="reservaeventos/festival/conciertos/concierto[grupo/@tipomusica='rock']"/>
                       </table>                   			
                </section>
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="concierto">
        <tr>
            <td><xsl:value-of select="../../nombrefesti"/></td>
            <td><xsl:value-of select="grupo"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <td><xsl:value-of select="hora"/></td>
            <td><xsl:value-of select="../../lugar"/></td>
        </tr>
</xsl:template>

</xsl:stylesheet>
