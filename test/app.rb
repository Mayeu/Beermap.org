require_relative 'helper'
require "cuba/capybara"

scope do
  setup do
    @bar  = Bar.create(name: 'foo', lat: "43.2936", long: "5.39583")
    @beer = Beer.create(price: 3.0, bar: @bar) 

    visit "/"
  end

  test "home rendering" do
    assert has_content?(@beer.price)
  end

  test "beer submission" do
    fill_in "bar[name]", with: "bar"
    find(:xpath, "//input[@name='bar[lat]']").set "43.2936"  # because it's an hidden field we can't just use fill_in
    find(:xpath, "//input[@name='bar[long]']").set "5.39583" 
    fill_in "beer[price]", with: "1.5"
    click_on 'GNOLE !'
    
    assert Beer.last.price == 1.5
  end
end