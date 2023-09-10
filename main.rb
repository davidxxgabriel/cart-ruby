class Produto
  attr_reader :nome, :preco

  def initialize(nome, preco)
    @nome = nome
    @preco = preco
  end
end

class Carrinho
  def initialize
    @itens = []
  end

  def adicionar_produto(produto, quantidade = 1)
    @itens << { produto: produto, quantidade: quantidade }
  end

  def remover_produto(produto)
    @itens.delete_if { |item| item[:produto] == produto }
  end

  def total
    @itens.reduce(0) { |sum, item| sum + item[:produto].preco * item[:quantidade] }
  end

  def listar_itens
    @itens.each do |item|
      puts "#{item[:produto].nome} - #{item[:quantidade]} x R$#{item[:produto].preco}"
    end
  end
end

# Exemplo para voces colacarem os produtos ai

produto1 = Produto.new("Chocolate fit", 15.00)
produto2 = Produto.new("barrinha de whey", 10.00)

carrinho = Carrinho.new
carrinho.adicionar_produto(produto1, 2)
carrinho.adicionar_produto(produto2)

carrinho.listar_itens
puts "Total: R$#{carrinho.total}"
