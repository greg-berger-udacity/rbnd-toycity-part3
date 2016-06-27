# lib/product.rb

class Product
  @@products = []

  attr_reader :title, :price, :stock

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def in_stock?
    @stock > 0
  end

  def add_to_products
    duplicate = @@products.find { |product| product.title == self.title }
    unless duplicate
      @@products << self
    else
      # raise DuplicateProductError
    end
  end

  def do_purchase
    @stock = @stock - 1
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find { |product| product.title == title }
  end

  # I know there's a better way to do this, but not sure what it is
  def self.in_stock
    products_in_stock = []
    @@products.each do |product|
      if product.in_stock?
        products_in_stock.push product
      end
    end
    products_in_stock
  end  

end
