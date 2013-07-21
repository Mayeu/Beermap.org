Cuba.define do
  on get do
    on root do
      res.write render("views/index.slim", best_beer: Beer.cheaper)
    end
  end

  on post do
    on "beers", param('bar'), param('beer') do |p_bar, p_beer|
      bar        = Bar.new(p_bar)
      bar.beers << Beer.new(p_beer) 
      bar.save
    end
  end
end