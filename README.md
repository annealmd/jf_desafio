# jf_desafio

### Aplicativo esperado

O candidato deve criar um App Flutter, simples, que consuma a API de municípios do BrasilAPI e exiba a lista de municípios na tela.

Pode e é recomendado usar recursos de visualização de listas e recursos do Flutter.
Use toda criatividade que há dentro de você, aqui a criatividade é livre.
A lista de municípios pode ser do estado de Minas Gerais.
Critérios Avaliados
Abaixo estão os critérios utilizados (por ordem de importância) para avaliar os candidatos:

### Relatório do desenvolvimento

Relatório do desenvolvimento, constando, pelo menos: dificuldades encontradas, justificativas dos métodos utilizados, fontes de pesquisa acessadas;
Versionamento em git de todo o código desenvolvido: o código deve estar em um repositório privado (apenas durante o processo) e observando as boas práticas de versionamento;
Documentação: deve conter no mínimo uma explicação básica do projeto e como executá-lo;
O sistema desenvolvido deve estar funcionando conforme o esperado, com uma boa estrutura e observando as boas práticas de desenvolvimento.
Mesmo que o candidato não consiga concluir o sistema em funcionamento, solicitamos que o resultado seja enviado.

### Extras

Os itens abaixo serão considerados como bônus:

Opção de o usuário selecionar uma UF para exibir a lista de municípios;
Paginação dos resultados;
O App ter uma boa interface, usabilidade e design;
Melhorias propostas pelo candidato.

## Execução do Projeto

- VS code abrir o projeto.
- \$flutter doctor (checar todos os requisitos para rodar flutter).
- Caso não selecione um emulator, o projeto vai ser rodado web (Chrome).
- \$flutter run
- no Chrome o app reinicia com reflesh
- no emulador ou celular reiniciar o app.
- para rodar no celular precisa estar no modo dev ativado e ligado ao computador por usb.

## Documentação

Para requirements do projeto:

1. register_usecases.md
2. register.feature

## Desafios

### Entender a api e as chamadas.

- Como as UFs e as cidades trazem informações valiosas para o marketing (fazer ação para clientes em determinadas microregiões), resolvi criá-las como classe para que no futuro, se necessário, mais informações possam ser adicionadas facilmente.
- A api retorna ou 200 (sucesso) ou 404 (código não encontrado).
  O 404 não será possível já que as listas de UFs e municipios são oficiais do próprio api e não há outra opção para o Usuário.

https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome
[{"id":12,"sigla":"AC","nome":"Acre","regiao":{"id":1,"sigla":"N","nome":"Norte"}}]

GET https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios
https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios?orderBy=nome
[{"id":3300100,"nome":"Angra dos Reis","microrregiao":{"id":33013,"nome":"Baía da Ilha Grande","mesorregiao":{"id":3305,"nome":"Sul Fluminense","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}},"regiao-imediata":{"id":330002,"nome":"Angra dos Reis","regiao-intermediaria":{"id":3301,"nome":"Rio de Janeiro","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}}}]

### Arquitetura

- Como é um projeto pequeno, um MVC seria mais adequado e rápido.
  Porém, usando a Clean Arch fica mais fácil de escalar e dar manutenção.
- Foram criadas 3 entidades (client, city, state), essa decisão tb teve como base escalabilidade.
- Injeção de dependência eu fiquei na dúvida de onde colocar, infra ou core, mas decidi pela infra porque acredito que mesmo adicionando outras features a classe será usada apenas para o feature register.
- Core, rotas e tema que são arquivos relacionados a todo o app, feature presente e futuras.

### State Management

1.  A princípio, usei BLoC (flutter_bloc) mas o dropdown menu as vezes funcionava para os dois campos (estado e cidade) e as vezes funcionava apenas para o campo estado.

- Nessa tentativa, criei o estado de sucesso genérico <T> para poder voltar lista de duas entidades diferentes (city e state).
- Acredito que o erro foi ter esquecido de ter usado o ( if GetStateEvent if else GetCityEvent ).

2. Então resolvi fazer apenas com o dart streams e colocar broadcast, mas tb não obtive sucesso.
   Por fim, criei 2 blocs (estado e cidade) usando streams puro e não a biblioteca pronta.

3. Nesse ponto a decisão de fazer 2 pages ao invés de 1 com dropdown menu foi tomada devido ao extra paginação do desafio.

### Apresentação

- No animated counter (projeto pessoal) tem uma animação usando flare, rive antigo. No atual eu precisarei de um tempo para aprender como usar, sendo assim não consegui colocar um fundo claro no canva e o Splashscreen ficou escuro. O problema é que dá um shock na transição para as páginas claras. Não mudei todos para escuro porque no final eu uso um rive que tem canva clara.
- icon launcher modifiquei apenas o do Android, não alterei o ios e nem web.

### melhorias

- Apesar das layers terem sido testadas, seria interessante colocar tratamentos de errors específicos.
- Nesse caso eu evitaria usar packages com either (fpdart e dartz) e tentaria fazer hardcore.
- Aos invés dos 2 blocs, criar apenas 1 RegisterBloc.

### Referências

- Documentação do Flutter https://api.flutter.dev/index.html
- Usei como referência os meus projetos de estudo, como são mais antigos, identifiquei algumas melhorias neles nessas consultas.

https://github.com/annealmd/tdd-medicamento
https://github.com/annealmd/animated_counter

- A minha base de estudo é o Reso Coder, Fluttery e mais recente o Deivid Willyan (aprendendo dart backend).

https://www.youtube.com/watch?v=xV22lglBnig&t=932s&ab_channel=ResoCoder
https://www.youtube.com/@Flutterly
https://www.youtube.com/@FlutterCursos

- Icon_launcher
  https://twitter.com/romannurik/status/1453737974491860999?s=20

### SOLID

As classes estão com apenas uma responsabilidade.
O model foi feito com herança (extends).
A injeção de dependência foi feita de acordo a aula de backend do Deived Willyam com uma pequena adaptação.

- BLoC
  Como gerência de estado, problemas no test e na chamada de multiplos eventos.
  https://www.youtube.com/watch?v=0QgJWdbcHOY&ab_channel=WilliamSilva

- Paginas
  Apesar de estar funcionando adequadamente, eu recebi esse erro no Debug Console:
  E/SurfaceSyncer(11402): Failed to find sync for id=0
  W/Parcel (11402): Expecting binder but got null!

https://stackoverflow.com/questions/73432326/failed-to-find-sync-for-id-0-in-flutter
