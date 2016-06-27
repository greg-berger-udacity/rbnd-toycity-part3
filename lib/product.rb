# lib/product.rb

class Product
  @@products = []

  attr_accessor :title

  def initialize(options={})
    @title = options[:title]
    add_to_products
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
end
