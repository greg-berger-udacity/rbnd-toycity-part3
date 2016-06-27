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

  def self.all
    @@products
  end

  def find_by_title(title)
    @@products.find { |product| product.title == title }
  end
end
