# lib/transaction.rb

class Transaction
  @@transactions = []
  
  attr_reader :id, :product, :customer

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@transactions.size + 1 # assumes no transactions are deleted
    add_to_transactions
    product.do_purchase
  end

  def add_to_transactions
    if self.product.in_stock?
      @@transactions << self
    else  
      # raise OutOfStockError
      puts "OutOfStockError"
    end
  end

  def self.find(id)
    @@transactions.find { |t| t.id == id }
  end

  def self.all
    @@transactions
  end

end
