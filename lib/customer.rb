# lib/cutomer.rb

class Customer
  @@customers = []

  attr_reader :name

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def add_to_customers
    duplicate = @@customers.find { |customer| customer.name == self.name }
    unless duplicate
      @@customers << self
    else
      # raise DuplicateCustomerError
    end
  end

  def self.all
    @@cusomters
  end

  def self.find_by_name(name)
    @@customers.find { |customer| customer.name == name }
  end

end
