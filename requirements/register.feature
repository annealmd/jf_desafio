Feature: Register

Como Usuário quero ter acesso a uma lista de UFs (oficiais).
Então quero poder selecionar uma UF.
Dado a UF quero ter acesso a uma lista de municípios(oficiais) da mesma.
Então quero poder selecionar um município.

Cenário: retorno de uma lista de UF
Dado que o Usuário inicializou o app.
Então o sistema deve retornar uma lista com todas UFs válidas
E o Usuário deve clicar em uma opção.

Cenário: caixa de diálogo da UF.
Dado que o Usuário clicou em uma opção da lista de UFs.
Então o sistema deve retornar uma caixa de diálogo para confirmação.
E o Usuário deve escolher ou cancelar para voltar ao cenário anterior ou confirmar o próximo cenário.

Cenário: retorno de uma lista de municípios
Dado que o Usuário clicou em confirmar na caixa de diálogo do cenário anterior.
Então o sistema deve retornar uma lista com todos os municípios da UF selecionada.
E o Usuário deve clicar em uma opção.

Cenário: caixa de diálogo da municípios.
Dado que o Usuário clicou em uma opção da lista de municípios.
Então o sistema deve retornar uma caixa de diálogo para confirmação.
E o Usuário deve escolher ou cancelar para voltar ao cenário anterior ou confirmar o próximo cenário.

Cenário: resultado.
Dado que o Usuário clicou em confirmar na caixa de diálogo do cenário anterior.
Então o sistema deve retornar um icon de confirmação e uma mensagem com os dados selecionados.
E assim o Usuário deve fechar o sistema ou reinicializá-lo.

Cenário: erro.
Dado não acesso a internet ou problema no servidor.
Quando o Usuário inicializar o sistema.
Então o sistema deve retornar uma mensagem de erro
E sugerir verificara conexão ou tentar mais tarde.