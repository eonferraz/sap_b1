**Comando para a função universal**
SELECT 
    A."AltItem" AS "Código Alternativo", 
    OI."ItemName" AS "Nome do Item"
FROM OALI A
JOIN OITM OI ON A."AltItem" = OI."ItemCode"
WHERE A."OrigItem" = $[$37.4.0.SELECTED]
