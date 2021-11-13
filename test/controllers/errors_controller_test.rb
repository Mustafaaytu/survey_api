require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test 'should Route Error' do
    error = assert_raises(ActionController::RoutingError) do
      raise ActionController::RoutingError, 'This is really bad'
    end
    assert_equal 'This is really bad', error.message
  end
end
