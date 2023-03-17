Feature: Cliente
Como cliente quero ter acesso a uma lista de UF.
Então quero ter acesso a uma lista de municípios.

Cenário: retorno de uma lista de UF
Dado que o Cliente clicou no campo buscar UF.
Quando solicitar a busca
Então o sistema deve retornar a lista com todos UFs válidos
E a busca por municípios deve estar desativada/invisível.

Cenário: retorno de uma lista de municípios
Dado que o Cliente selecionou uma UF.
Quando a lista de UFs ficar disponível
Então o sistema deve retornar a lista com todos municipios válidos p a UF selecionada.

Cenário: não retorno
Dado o cliente está sem acesso a internet
Quando solicitar a busca
Então o sistema deve retornar uma mensagem de erro
E sugerir conectar