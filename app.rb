Cuba.define do
  on get do
    on root do
      res.write render("views/index.slim", best_beer: Beer.cheaper)
    end

    on "bars" do |params|
      bars = Bar.closer(43.2934, 5.39583)
      res.write bars.to_json
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