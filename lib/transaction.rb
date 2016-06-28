# lib/transaction.rb

class Transaction
  @@transactions = []
  
  attr_reader :id, :product, :customer

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = (@@transactions.size > 0) ? @@transactions.map { |transaction| transaction.id }.sort.last + 1 : 1
    product.do_purchase
    @@transactions << self
  end

  def self.find(id)
    @@transactions.find { |t| t.id == id }
  end

  def self.all
    @@transactions
  end

end
