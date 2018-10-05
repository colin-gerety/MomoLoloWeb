require "application_system_test_case"

class EventImagesTest < ApplicationSystemTestCase
  setup do
    @event_image = event_images(:one)
  end

  test "visiting the index" do
    visit event_images_url
    assert_selector "h1", text: "Event Images"
  end

  test "creating a Event image" do
    visit event_images_url
    click_on "New Event Image"

    fill_in "Description", with: @event_image.description
    fill_in "Image", with: @event_image.image
    fill_in "Title", with: @event_image.title
    click_on "Create Event image"

    assert_text "Event image was successfully created"
    click_on "Back"
  end

  test "updating a Event image" do
    visit event_images_url
    click_on "Edit", match: :first

    fill_in "Description", with: @event_image.description
    fill_in "Image", with: @event_image.image
    fill_in "Title", with: @event_image.title
    click_on "Update Event image"

    assert_text "Event image was successfully updated"
    click_on "Back"
  end

  test "destroying a Event image" do
    visit event_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event image was successfully destroyed"
  end
end
