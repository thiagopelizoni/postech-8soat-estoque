# Lanches
Categoria.find_or_create_by!(nome: 'Lanches').tap do |categoria|
  categoria.produtos.find_or_create_by!(nome: 'Big Mac', descricao: 'Dois hambúrgueres, alface, queijo, molho especial, cebola e picles, em um pão com gergelim', preco: 20.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Cheeseburger', descricao: 'Hambúrguer de carne com queijo, ketchup, mostarda, cebola e picles', preco: 10.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'McChicken', descricao: 'Hambúrguer de frango empanado com alface e maionese no pão com gergelim', preco: 15.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Quarterão com Queijo', descricao: 'Hambúrguer de carne com queijo, ketchup, mostarda, cebola e picles', preco: 18.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Cachorro Quente', descricao: 'Cachorro quente com molho especial', preco: 10.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Taco', descricao: 'Taco mexicano com carne moída', preco: 18.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Wrap', descricao: 'Wrap de frango com legumes', preco: 14.0, status: 'inativo')
end

# Acompanhamentos
Categoria.find_or_create_by!(nome: 'Acompanhamentos').tap do |categoria|
  categoria.produtos.find_or_create_by!(nome: 'Batata Frita', descricao: 'Batata frita crocante e salgada', preco: 8.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'McNuggets', descricao: 'Pedaços de frango empanados e fritos', preco: 12.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Salada', descricao: 'Salada fresca com alface, tomate e cenoura', preco: 10.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Salada Caesar', descricao: 'Salada Caesar com frango', preco: 12.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Mozzarella Sticks', descricao: 'Palitos de queijo empanados', preco: 11.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Sopa do Dia', descricao: 'Sopa do dia', preco: 7.0, status: 'inativo')
end

# Bebidas
Categoria.find_or_create_by!(nome: 'Bebidas').tap do |categoria|
  categoria.produtos.find_or_create_by!(nome: 'Coca-Cola', descricao: 'Refrigerante gelado', preco: 6.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Suco de Laranja', descricao: 'Suco de laranja natural', preco: 7.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Milkshake de Morango', descricao: 'Milkshake cremoso de morango', preco: 10.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Suco Natural', descricao: 'Suco de laranja natural', preco: 6.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Chá Gelado', descricao: 'Chá gelado de limão', preco: 5.0, status: 'inativo')
end

# Sobremesas
Categoria.find_or_create_by!(nome: 'Sobremesas').tap do |categoria|
  categoria.produtos.find_or_create_by!(nome: 'McFlurry', descricao: 'Sorvete de baunilha com cobertura e pedaços de chocolate', preco: 12.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Torta de Maçã', descricao: 'Torta quente de maçã', preco: 7.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Sundae de Chocolate', descricao: 'Sorvete de baunilha com cobertura de chocolate', preco: 9.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Brownie', descricao: 'Brownie de chocolate com nozes', preco: 9.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Cheesecake', descricao: 'Cheesecake com calda de frutas vermelhas', preco: 10.0, status: 'ativo')
  categoria.produtos.find_or_create_by!(nome: 'Pudim', descricao: 'Pudim de leite condensado', preco: 7.0, status: 'inativo')
end