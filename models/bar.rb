class Bar
  include DataMapper::Resource
  DISTANCE = 100

  property :id,   Serial 
  property :name, String
  property :lat,  Float
  property :long, Float

  has n, :beers

  def self.closer(lat, long)
    lon1 = long - DISTANCE / (Math::cos(lat * Math::PI / 180) * 69) 
    lon2 = long + DISTANCE / (Math::cos(lat * Math::PI / 180) * 69) 
    lat1 = lat  - DISTANCE / 69
    lat2 = lat  + DISTANCE / 69

    all(:lat.gte => lat1, :lat.lte => lat2, :long.gte => lon1, :long.lte => lon2)
  end
end