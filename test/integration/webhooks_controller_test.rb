require 'test_helper'

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "post should respond 200" do
    post "/webhooks/1"

    assert_response :ok
    assert_equal "", response.body
  end
end