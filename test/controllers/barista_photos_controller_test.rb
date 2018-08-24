require 'test_helper'

class BaristaPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barista_photo = barista_photos(:one)
  end

  test "should get index" do
    get barista_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_barista_photo_url
    assert_response :success
  end

  test "should create barista_photo" do
    assert_difference('BaristaPhoto.count') do
      post barista_photos_url, params: { barista_photo: { can_display: @barista_photo.can_display, image: @barista_photo.image, note: @barista_photo.note, title: @barista_photo.title } }
    end

    assert_redirected_to barista_photo_url(BaristaPhoto.last)
  end

  test "should show barista_photo" do
    get barista_photo_url(@barista_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_barista_photo_url(@barista_photo)
    assert_response :success
  end

  test "should update barista_photo" do
    patch barista_photo_url(@barista_photo), params: { barista_photo: { can_display: @barista_photo.can_display, image: @barista_photo.image, note: @barista_photo.note, title: @barista_photo.title } }
    assert_redirected_to barista_photo_url(@barista_photo)
  end

  test "should destroy barista_photo" do
    assert_difference('BaristaPhoto.count', -1) do
      delete barista_photo_url(@barista_photo)
    end

    assert_redirected_to barista_photos_url
  end
end
