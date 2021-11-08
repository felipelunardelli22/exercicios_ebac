#language: pt

Funcionalidade: Configurar produto   
Como cliente da EBAC-SHOP
Quero configurar meu produto de acordo com meu tamanho e gosto
Escolher a quantidade
Para depois inserir no carrinho

Contexto:
Dado que sou cliente da EBAC-SHOP

Cenario: Inserir produto no carrinho com sucesso

Quando configuro o produto escolhido com o tamanho 
E quantidade desejada 
Entao posso inserir no carrinho

Cenario: Inserir mais de 10 itens 

Quando seleciono a quantidade de um determinado produto
E a <quantidade>
Entao o sistema deve apresentar uma mensagem de alerta <mensagem> ""

| Quantidade | Mensagem                                |
| "1"        | " Adicionado ao carrinho com sucesso "  |
| "5"        | " Adicionado ao carrinho com sucesso "  |
| "11"       | " Venda limitada a 10 itens por pedido" |
| "12"       | " Venda limitada a 10 itens por pedido" |

Cenario: Não preencher campos obrigatorios

Quando seleciono o produto 
E nao seleciono o tamanho ou a cor 
Entao o sistema deve apresentar uma mensagem de alerta "Por gentileza selecione o tamnho e cor desejados"

Cenario: Limpar cor e tamanhos selecionados 

Quando Clicar no botão limpar 
Entao os campos selecionados irão ser desselecionados 

Funcionalidade: Login na plataforma 
Como cliente da EBAC-SHOP
Quero fazer o login (autenticação) na plataforma  
Para visualizar meus pedidos

Cenario: Autenticação Válida
Dado que eu acesse a página da plataforma
Quando eu digitar o usuário "felipe@ebac.com.br"
E a senha "senha@123"
Entao deve exibir uma mensagem de boas vindas "Olá Felipe"

Cenário: Usuario Inexistente
Dado que eu acesse a página da plataforma
Quando eu digitar o usuário "jorge@gmail.com.br"
E a senha "senha@@12"
Entao deve exibir uma mensagem de alerta "Usuário inexistente"

Cenário: Usuario com senha invalida 
Dado que eu acesse a página da plataforma
Quando eu digitar o usuário "felipe@ebac.com.br"
E a senha "senha@124"
Entao deve exibir uma mensagem de alerta "Usuário ou senha invalidos"

Cenário: Autenticar multiplos usuários
Quando eu digitar o <usuario>
E a <senha>
Entao deve exibir a <mensagem> de sucesso
Exemplos :

| usuario                | senha       | mensagem                       |
| "joao@ebac.com.br"     | "teste@123" | "Seja bem vindo, Olá João"     |
| "Gabriel@ebac.com.br"  | "teste@123" | "Seja bem vindo, Olá Gabriel"  |
| "Fernando@ebac.com.br" | "teste@123" | "Seja bem vindo, Olá Fernando" |
| "Caio@ebac.com.br"     | "teste@123" | "Seja bem vindo, Olá Caio"     |

Funcionalidade: Tela de cadastro - Checkout
Como cliente da EBAC-SHOP
Quero fazer concluir meu cadastro   
Para finalizar minha compra

Contexto: 
Dado que eu realize o cadastro no checkout

Cenario: Cadastro com sucesso 
Quando eu preencher os campos obrigatorios
E clicar em finalizar compra
Entao o sistema deve exibir a mensagem de "compra conluida com sucesso"

Cenario: campos obrigatorios incompletos   
Quando preencher os campos obrigatorios
E um <campo obrgatorio> estiver em branco
Entao o sistema deve exibir uma <mensagem>

| Campo obrigatorio  | Mensagem                                             |
| Nome Completo      | "Por gentileza preencher o campo Nome Obrigatorio"   |
| Data de nascimento | "Por gentileza preencher o campo Data de nascimento" |
| Endereço           | "Por gentileza preencher o campo Endereço"           |
| CPF                | "Por gentileza preencher o campo CPF"                |
| CEP                | "Por gentileza preencher o campo CEP"                |

Cenario: campo e-mail com formato invalido 
Quando preencher o campo email no formato diferente de "teste@teste.com"
E clicar em finalizar compra
Entao o sistem deve exibir uma mensagem "Formato de e-mail incorreto , por gentileza verifique novamente o campo"