# jf_desafio

- Relatório do desenvolvimento, constando, pelo menos: dificuldades encontradas, justificativas dos métodos utilizados, fontes de pesquisa acessadas;
- Versionamento em git de todo o código desenvolvido: o código deve estar em um repositório privado (apenas durante o processo) e observando as boas práticas de versionamento;
- Documentação: deve conter no mínimo uma explicação básica do projeto e como executá-lo;
- O sistema desenvolvido deve estar funcionando conforme o esperado, com uma boa estrutura e observando as boas práticas de desenvolvimento.

## passos

- VS code abrir o projeto.
- \$flutter doctor (checar todos os requisitos para rodar flutter).
- Caso não selecione um emulator, o projeto vai ser rodado web (Chrome).
- \$flutter run
- no Chrome o app reinicia com reflesh
- no emulador ou celular reiniciar o app.
- para rodar no celular precisa estar no modo dev ativado e ligado ao computador por usb.

## Desafios

### Entender a api e as chamadas.

- Como as UFs e as cidades trazem informações valiosas para o marketing (fazer ação para clientes em determinadas microregiões),
  resolvi criá-las como classe para que no futuro, se necessário, mais informações possam ser adicionadas facilmente.

https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome
[{"id":12,"sigla":"AC","nome":"Acre","regiao":{"id":1,"sigla":"N","nome":"Norte"}}]

GET https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios
https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios?orderBy=nome
[{"id":3300100,"nome":"Angra dos Reis","microrregiao":{"id":33013,"nome":"Baía da Ilha Grande","mesorregiao":{"id":3305,"nome":"Sul Fluminense","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}},"regiao-imediata":{"id":330002,"nome":"Angra dos Reis","regiao-intermediaria":{"id":3301,"nome":"Rio de Janeiro","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}}}]

### Arquitetura

- Como é um projeto pequeno, um MVC seria mais adequado e rápido.
  Porém, usando a Clean Arch fica mais fácil de escalar e dar manutenção.

### State Management

- Como a segunda chamada de api depende do resultado da primeira, tive muita dificuldade com os streams.
  Usei BLoC (flutter_bloc) mas o dropdown menu as vezes funcionava para os dois campos (estado e cidade) e as vezes funmcionava apenas para o estado.
  Então resolvi fazer apenas com o dart streams e colocar broadcast, mas tb não obtive.
  No bloc os States estão genéricos devido a essa tentativa.
  Por fim, criei 2 blocs (estado e cidade) usando streams.

  ### Apresentação

  - No animated counter tem uma animação usando flare, river antigo. No atual eu precisarei de um tempo para aprender como usar, sendo assim não sonsegui colocar um fundo claro no canva e o Splashscreen ficou escuro. O problema é que dá um shock na transição para as páginas claras. Não mudei todos para escuro porque no final eu uso um rive que tem canva clara.
  - icon launcher modifiquei apenas o do Android, não alterei o ios e nem web.

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
