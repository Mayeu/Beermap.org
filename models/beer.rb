class Beer
  include DataMapper::Resource

  property :id,     Serial
  property :price,  Float

  belongs_to :bar

  def self.cheapest
    all(order: [:price.asc]).first
  end
end
