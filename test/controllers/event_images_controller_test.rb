require 'test_helper'

class EventImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_image = event_images(:one)
  end

  test "should get index" do
    get event_images_url
    assert_response :success
  end

  test "should get new" do
    get new_event_image_url
    assert_response :success
  end

  test "should create event_image" do
    assert_difference('EventImage.count') do
      post event_images_url, params: { event_image: { description: @event_image.description, image: @event_image.image, title: @event_image.title } }
    end

    assert_redirected_to event_image_url(EventImage.last)
  end

  test "should show event_image" do
    get event_image_url(@event_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_image_url(@event_image)
    assert_response :success
  end

  test "should update event_image" do
    patch event_image_url(@event_image), params: { event_image: { description: @event_image.description, image: @event_image.image, title: @event_image.title } }
    assert_redirected_to event_image_url(@event_image)
  end

  test "should destroy event_image" do
    assert_difference('EventImage.count', -1) do
      delete event_image_url(@event_image)
    end

    assert_redirected_to event_images_url
  end
end
