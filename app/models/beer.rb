class Beer
  include DataMapper::Resource

  property :id,     Serial
  property :price,  Float

  belongs_to :bar

  def self.cheaper
    all(order: [:price.asc]).first
  end
end