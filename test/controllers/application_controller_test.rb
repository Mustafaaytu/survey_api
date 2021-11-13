require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'Get Wrong Routes From Api' do
    get '/surveys/wrong'
    assert_equal 404, response.status
  end
end
