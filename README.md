# jf_desafio

- Relatório do desenvolvimento, constando, pelo menos: dificuldades encontradas, justificativas dos métodos utilizados, fontes de pesquisa acessadas;
- Versionamento em git de todo o código desenvolvido: o código deve estar em um repositório privado (apenas durante o processo) e observando as boas práticas de versionamento;
- Documentação: deve conter no mínimo uma explicação básica do projeto e como executá-lo;
- O sistema desenvolvido deve estar funcionando conforme o esperado, com uma boa estrutura e observando as boas práticas de desenvolvimento.

## passos

- VS code abrir o projeto.
- $flutter doctor (checar todos os requisitos para rodar flutter).
- Caso não selecione um emulator, o projeto vai ser rodado web (Chrome).
- $flutter run


- entender como api funciona: tenho que descobrir o codigo da UF para depois pegar a lista de municipios
- como fazer as entities: decidi fazer 3 classes pq a api tem muita informação e pode ser que no futuro haja a decisão de acrescentar mais info sobre as cidades e estados.
- Domain feito testado.
- Data feito e testado
- adaptar pq quando cheguei na chamada de api que caiu a ficha que é uma lista o retorno.

https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome
[{"id":12,"sigla":"AC","nome":"Acre","regiao":{"id":1,"sigla":"N","nome":"Norte"}}]

GET https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios
https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios?orderBy=nome
[{"id":3300100,"nome":"Angra dos Reis","microrregiao":{"id":33013,"nome":"Baía da Ilha Grande","mesorregiao":{"id":3305,"nome":"Sul Fluminense","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}},"regiao-imediata":{"id":330002,"nome":"Angra dos Reis","regiao-intermediaria":{"id":3301,"nome":"Rio de Janeiro","UF":{"id":33,"sigla":"RJ","nome":"Rio de Janeiro","regiao":{"id":3,"sigla":"SE","nome":"Sudeste"}}}}}]

## Desafios

### Entender a api e as chamadas.
  - Como as UFs e as cidades trazem informações valiosas para o marketing (fazer ação para clientes em determinadas microregiões),
  resolvi criá-las como classe para que no futuro, se necessário, mais informações possam ser adicionadas facilmente.
### Arquitetura
  - Como é um projeto pequeno, um MVC seria mais adequado e rápido.
  Porém, usando a Clean Arch fica mais fácil de escalar e dar manutenção.
### State Management
  - Como a segunda chamada de api depende do resultado da primeira, tive muita dificuldade com os streams.
  Usei BLoC (flutter_bloc) mas o dropdown menu as vezes funcionava para os dois campos (estado e cidade) e as vezes funmcionava apenas para o estado.
  Então resolvi fazer apenas com o dart streams e colocar broadcast, mas tb não obtive.
  No bloc os States estão genéricos devido a essa tentativa.
  Por fim, criei 2 blocs (estado e cidade) usando streams.

### Referências
  - Usei como referência os meus projetos de estudo, como são mais antigos, identifiquei algumas melhorias neles nessas consultas.

  - A minha base de estudo é o Reso Coder, Fluttery e mais recente o Deived Willyam (aprendendo dart backend).
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
