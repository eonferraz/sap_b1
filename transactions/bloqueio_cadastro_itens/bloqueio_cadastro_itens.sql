-- Paulo Ferraz - 01/07/2025 - Bloqueia o usuário qualidade realizar modificação de cadastro
-- Essa transaction bloqueia um determinado usuário de cadastrar ou modificar itens no SAP B1

-- @object_type = 4 é o tipo de documento Cadastro de Itens


IF (@object_type = '4' AND (@transaction_type = 'U' OR @transaction_type = 'A'))

BEGIN
	IF (
		SELECT COUNT(*)
		FROM OITM T0
		INNER JOIN OUSR T1 ON T0.UserSign2 = T1.USERID
		WHERE T0.ItemCode = @list_of_cols_val_tab_del
		  AND T1.USERID = 47
	) > 0
	BEGIN
		SET @error = 133
		SET @error_message = 'Usuário da Qualidade não tem permissão para alterar o cadastro de produtos.';
	END
END
