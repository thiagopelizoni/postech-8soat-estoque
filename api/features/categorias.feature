Feature: Gerenciamento de Categorias via Model
  Para garantir a integridade dos dados
  Como desenvolvedor
  Quero validar as regras de negócio e relacionamentos da Categoria

  Background:
    Given o banco de dados está limpo

  Scenario: Criar categoria com dados válidos
    When eu crio uma categoria com nome "Eletrônicos"
    Then a categoria deve ser salva com slug "eletronicos"

  Scenario: Tentar criar uma categoria sem nome
    When eu tento criar uma categoria sem nome
    Then a categoria não deve ser salva
    And deve aparecer o erro "can't be blank" no campo "nome"

  Scenario: Validar unicidade do nome
    Given eu crio uma categoria com nome "Móveis"
    When eu tento criar outra categoria com nome "Móveis"
    Then a nova categoria não deve ser salva
    And deve aparecer o erro "has already been taken" no campo "nome"
