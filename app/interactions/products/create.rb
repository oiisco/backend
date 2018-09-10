module Products
  class Create < ActiveInteraction::Base
    string :name, :description
    integer :price

    def execute
      create_product
      @product
    end

    private

    def create_product
      @product ||= Product.create!(
        name: name,
        description: description,
        price: price,
      )
    end
  end
end
