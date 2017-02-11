require 'test_helper'

class FinanceControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get finance_show_url
    assert_response :success
  end

end
