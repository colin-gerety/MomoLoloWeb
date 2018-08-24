require 'test_helper'

class PlacePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_photo = place_photos(:one)
  end

  test "should get index" do
    get place_photos_url
    assert_response :success
  end

  test "should get new" do
    get new_place_photo_url
    assert_response :success
  end

  test "should create place_photo" do
    assert_difference('PlacePhoto.count') do
      post place_photos_url, params: { place_photo: { can_display: @place_photo.can_display, image: @place_photo.image, note: @place_photo.note, title: @place_photo.title } }
    end

    assert_redirected_to place_photo_url(PlacePhoto.last)
  end

  test "should show place_photo" do
    get place_photo_url(@place_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_photo_url(@place_photo)
    assert_response :success
  end

  test "should update place_photo" do
    patch place_photo_url(@place_photo), params: { place_photo: { can_display: @place_photo.can_display, image: @place_photo.image, note: @place_photo.note, title: @place_photo.title } }
    assert_redirected_to place_photo_url(@place_photo)
  end

  test "should destroy place_photo" do
    assert_difference('PlacePhoto.count', -1) do
      delete place_photo_url(@place_photo)
    end

    assert_redirected_to place_photos_url
  end
end
