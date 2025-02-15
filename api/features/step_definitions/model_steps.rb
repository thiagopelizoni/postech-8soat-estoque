# features/step_definitions/model_steps.rb

Given('o banco de dados está limpo') do
  Categoria.destroy_all
  Produto.destroy_all
end

# ===== Steps para Categoria =====

When('eu crio uma categoria com nome {string}') do |nome|
  @categoria = Categoria.create(nome: nome)
end

When('eu tento criar uma categoria sem nome') do
  @categoria = Categoria.create(nome: "")
end

When('eu tento criar outra categoria com nome {string}') do |nome|
  @categoria2 = Categoria.create(nome: nome)
end

Then('a categoria deve ser salva com slug {string}') do |slug_esperado|
  expect(@categoria).to be_persisted
  expect(@categoria.slug).to eq(slug_esperado)
end

Then('a categoria não deve ser salva') do
  expect(@categoria.persisted?).to be false
end

Then('a nova categoria não deve ser salva') do
  expect(@categoria2.persisted?).to be false
end

Then('deve aparecer o erro {string} no campo {string}') do |mensagem, campo|
  # Seleciona o objeto que queremos verificar: prioriza @produto, depois @categoria2, depois @categoria.
  model = @produto || @categoria2 || @categoria
  model.validate  # Força a execução das validações
  erros = model.errors[campo.to_sym]
  expect(erros.join).to include(mensagem)
end

# ===== Steps para Produto =====

When('eu crio um produto com nome {string}, preco {float}, status {string} na categoria {string}') do |nome, preco, status, categoria_nome|
  categoria = Categoria.find_by!(nome: categoria_nome)
  @produto = Produto.create(nome: nome, preco: preco, status: status, categoria: categoria, descricao: "Teste")
end

When('eu tento criar um produto sem nome na categoria {string}') do |categoria_nome|
  categoria = Categoria.find_by!(nome: categoria_nome)
  @produto = Produto.create(nome: "", preco: 100, status: "ativo", categoria: categoria, descricao: "Teste")
end

When('eu tento criar um produto com nome {string}, preco {float}, status {string} na categoria {string}') do |nome, preco, status, categoria_nome|
  categoria = Categoria.find_by!(nome: categoria_nome)
  @produto = Produto.create(nome: nome, preco: preco, status: status, categoria: categoria, descricao: "Teste")
end

Then('o produto deve ser salvo com slug {string}') do |slug_esperado|
  expect(@produto).to be_persisted
  expect(@produto.slug).to eq(slug_esperado)
end

Then('o produto não deve ser salvo') do
  expect(@produto.persisted?).to be false
end

Then('o status do produto deve ser {string}') do |status_esperado|
  expect(@produto.status).to eq(status_esperado)
end

Then('a categoria {string} deve ter {int} produto(s) associado(s)') do |categoria_nome, quantidade|
  categoria = Categoria.find_by!(nome: categoria_nome)
  expect(categoria.produtos.count).to eq(quantidade)
end
