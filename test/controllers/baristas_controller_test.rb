require 'test_helper'

class BaristasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barista = baristas(:one)
  end

  test "should get index" do
    get baristas_url
    assert_response :success
  end

  test "should get new" do
    get new_barista_url
    assert_response :success
  end

  test "should create barista" do
    assert_difference('Barista.count') do
      post baristas_url, params: { barista: { currently_working: @barista.currently_working, first: @barista.first, last: @barista.last } }
    end

    assert_redirected_to barista_url(Barista.last)
  end

  test "should show barista" do
    get barista_url(@barista)
    assert_response :success
  end

  test "should get edit" do
    get edit_barista_url(@barista)
    assert_response :success
  end

  test "should update barista" do
    patch barista_url(@barista), params: { barista: { currently_working: @barista.currently_working, first: @barista.first, last: @barista.last } }
    assert_redirected_to barista_url(@barista)
  end

  test "should destroy barista" do
    assert_difference('Barista.count', -1) do
      delete barista_url(@barista)
    end

    assert_redirected_to baristas_url
  end
end
