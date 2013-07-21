class Bar
  include DataMapper::Resource

  property :id,   Serial 
  property :name, String
  property :lat,  Float
  property :long, Float

  has n, :beers
end