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

<xsl:template match="//reservaeventos">

	<html lang="es">

		<head>
			<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
			<meta charset="utf-8"/>
			<meta name="description" content="Página principal" />
			<title>titulo de la web</title>
		</head>

		<body>
			<header>
				<img src="../img/logotipo.png" alt= "Reservas" />
				<a href="teatro.xml">Teatro</a>
				<a href="restaurante.xml">Restaurante</a>
				<a href="festival.xml">Festival</a>
			</header>
			
			<main class="principal">
				<section class="teatro">
					<h1>PROXIMAS OBRAS DE TEATRO</h1>
					<ul>
							<xsl:apply-templates select="//teatro">
							<xsl:sort select="fechahora/@dia" order="descending" />
							</xsl:apply-templates>
						
					<!-- He intentado también ponerlo de esta forma para 
					que solo saque las obras de enero, pero no lo he conseguido:

						<xsl:apply-templates select="teatro[starts-with(obra/fechahora/@dia, '2023-01')]"> 
						<xsl:apply-templates select="teatro[substring(obra/fechahora/@dia, 6, 2) = '01']"> 
						<xsl:sort select="fechahora/@dia" order="descending" />
						</xsl:apply-templates>
					-->

							<xsl:apply-templates select="//teatro[obra/fechahora/@dia = '2023-01']">
							<xsl:sort select="obra/fechahora/@dia" order="descending" />
							</xsl:apply-templates>						
					</ul>
				</section>
			</main>

			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
</xsl:template>

	<xsl:template match="teatro">
		<head>
			<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		</head>
		<html>
			<li>
			<xsl:choose>
				<xsl:when test="precio &lt; 20">
				<span class="subrayado"><xsl:value-of select="concat(fechahora/@dia, ': ', obra)" /></span>
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="concat(fechahora/@dia, ': ', obra)" />
				</xsl:otherwise>
			</xsl:choose>
			</li>
		</html>
	</xsl:template>

</xsl:stylesheet>
