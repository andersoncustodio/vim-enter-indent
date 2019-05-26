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

Agora é possível desativar o mapeamento padrão para criar um personalizado

    let g:enter_indent_default_keymap = 0

    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-r>=EnterIndent()\<cr>"

Para um melhor aproveito do `enter-indent` recomendo que você use os seguintes plugins.

* http://github.com/Raimondi/delimitMate - Fecha automaticamente aspas, parentese, colchete e etc
* http://github.com/tpope/vim-ragtag - Atalho para criar tags como `<?php ?>`
* https://github.com/SirVer/ultisnips - Transforma palavras chaves com `TAB` em um trecho de código
