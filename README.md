# jf_desafio

- Relatório do desenvolvimento, constando, pelo menos: dificuldades encontradas, justificativas dos métodos utilizados, fontes de pesquisa acessadas;
- Versionamento em git de todo o código desenvolvido: o código deve estar em um repositório privado (apenas durante o processo) e observando as boas práticas de versionamento;
- Documentação: deve conter no mínimo uma explicação básica do projeto e como executá-lo;
- O sistema desenvolvido deve estar funcionando conforme o esperado, com uma boa estrutura e observando as boas práticas de desenvolvimento.


## passos
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

estado
[
 {
id:	
 number
Identificador da Unidade da Federação

nome:	
 string
Nome da Unidade da Federação

sigla:	
 string
Sigla da Unidade da Federação

regiao:	
 {
id:	
 number
nome:	
 string
sigla:	
 string
]


municipio
[
 {
id:	
 number
Identificador do município

nome:	
 string
Nome do município

microrregiao:	
 {
id:	
 number
nome:	
 string
mesorregiao:	
 { }
regiao-imediata:	
 {
id:	
 number
nome:	
 string
regiao-intermediara:	
 { }
]