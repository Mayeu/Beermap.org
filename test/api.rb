require_relative 'helper'
require "cuba/test"

scope do
  setup do
    @bar  = Bar.create(name: 'foo', lat: "43.2936", long: "5.39583")
    @beer = Beer.create(price: 3.0, bar: @bar) 
  end

  test "return json with bars" do
    post "bars", lat: "43.2936", long: "5.39583" 
    #page.driver.browser.post('/bars', data: {})

    assert_equal "[{\"id\":1,\"name\":\"foo\",\"lat\":43.2936,\"long\":5.39583}]", last_response.body
  end
end