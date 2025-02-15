Feature: Gerenciamento de Produtos via Model
  Para garantir a integridade dos dados e relacionamentos
  Como desenvolvedor
  Quero validar as regras de negócio e associações do Produto

  Background:
    Given o banco de dados está limpo
    And eu crio uma categoria com nome "Informática"

  Scenario: Criar produto com dados válidos
    When eu crio um produto com nome "Notebook", preco 2500, status "ativo" na categoria "Informática"
    Then o produto deve ser salvo com slug "notebook"
    And o status do produto deve ser "ativo"

  Scenario: Tentar criar um produto sem nome
    When eu tento criar um produto sem nome na categoria "Informática"
    Then o produto não deve ser salvo
    And deve aparecer o erro "can't be blank" no campo "nome"

  Scenario: Tentar criar um produto com preço negativo
    When eu tento criar um produto com nome "Mouse", preco -50, status "ativo" na categoria "Informática"
    Then o produto não deve ser salvo
    And deve aparecer o erro "must be greater than or equal to 0" no campo "preco"

  Scenario: Validar relacionamento entre categoria e produto
    When eu crio um produto com nome "Teclado", preco 100, status "ativo" na categoria "Informática"
    Then a categoria "Informática" deve ter 1 produto associado
