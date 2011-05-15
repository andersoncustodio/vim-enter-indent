Este plugin facilita a realocação e indentação de tags de única linha para um bloco de código, por exemplo.

	<?php | ?>

O traço vertical representa o cursor, com este plugin em funcionamento, ao apetar o enter o resultado será o seguinte.

	<?php
		|
	?>

Também é compatível com tags html, BBcode, smarty e algumas outras.

	<tr>
		|
	</tr>

	{if}
		|
	{/if}

	body {
		|
	}

Para um melhor aproveito do `enter-indent` recomendo que você use os seguintes plugins.

* http://github.com/Raimondi/delimitMate - Fecha automaticamente aspas, parentese, colchete e etc
* http://github.com/acustodioo/vim-ragtag - Atalho para criar tags como `<?php ?>`
* http://github.com/MarcWeber/snipmate.vim - Transforma palavras chaves com `TAB` em um trecho de código
