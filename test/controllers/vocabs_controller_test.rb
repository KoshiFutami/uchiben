require 'test_helper'

class VocabsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vocabs_index_url
    assert_response :success
  end

  test "should get create" do
    get vocabs_create_url
    assert_response :success
  end

  test "should get show" do
    get vocabs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get vocabs_destroy_url
    assert_response :success
  end

end
