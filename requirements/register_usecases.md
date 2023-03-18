# Register Usecases
 - GetStateUsecase
 - GetCityUsecases

## Caso de Sucesso

1. Sistema faz a requisição para a URL da API https://brasilapi.com.br/docs#tag/IBGE
2. Sistema processa os dados recebidos.
3. Sistema entrega os dados para o usuário.

## Exceção - URL inválida

1. retorna mensagem de erro na url 404

## Exceção - dados inválidos

1. retorna mensagem de erro inesperado 400

## Exceção - resposta inválida

1. retorna mensagem de erro inesperado

## Exceção - falha no servidor

1. retorna mensagem de erro inesperado 500
