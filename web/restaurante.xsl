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
-->

	<xsl:variable name="nombre_restaurante" select="'El clarete'"/>
	<xsl:template match="//reservaeventos">
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
            <main>
                <h1>
                    <a href="{restaurante[nombrerestaurante=$nombre_restaurante]/informacion}">
                        <xsl:value-of select="concat($nombre_restaurante, ' - ', restaurante/ciudad)"/>
                    </a>
                </h1>
				 <xsl:for-each select="restaurante[nombrerestaurante=$nombre_restaurante]/menu" >
                    <article class="restaurante">
                        <h3><xsl:value-of select="@tipo"/></h3>
                        <xsl:for-each select="plato">
                        <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <p></p>
                    </article>
                </xsl:for-each>
            </main>
            <footer>
                <address>&#169; 2020 desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
	</xsl:template>
</xsl:stylesheet>