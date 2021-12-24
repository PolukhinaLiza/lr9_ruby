require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get root_url
    assert_response :success
  end

  test "should get output with error message if no param supplaid" do
    get output_path
    assert_response :success
    assert_nil assigns[:input_line] 
    assert_equal assigns[:error], 'Некорректный ввод' 
  end

   test "should get output with error message if not only digits supplied" do
    get output_url, params: { num: '5678bd'}
    assert_response :success
    assert_equal assigns[:error], 'Некорректный ввод'
  end

  test "should get output with error message if empty string" do
    get output_url, params: { num: ''}
    assert_response :success
    assert_equal assigns[:error], 'Некорректный ввод'
  end

  test "should get output with error message if empty string" do
    get output_url, params: { num: ''}
    assert_response :success
    assert_equal assigns[:error], 'Некорректный ввод'
  end

end
