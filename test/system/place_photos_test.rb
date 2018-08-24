require "application_system_test_case"

class PlacePhotosTest < ApplicationSystemTestCase
  setup do
    @place_photo = place_photos(:one)
  end

  test "visiting the index" do
    visit place_photos_url
    assert_selector "h1", text: "Place Photos"
  end

  test "creating a Place photo" do
    visit place_photos_url
    click_on "New Place Photo"

    fill_in "Can Display", with: @place_photo.can_display
    fill_in "Image", with: @place_photo.image
    fill_in "Note", with: @place_photo.note
    fill_in "Title", with: @place_photo.title
    click_on "Create Place photo"

    assert_text "Place photo was successfully created"
    click_on "Back"
  end

  test "updating a Place photo" do
    visit place_photos_url
    click_on "Edit", match: :first

    fill_in "Can Display", with: @place_photo.can_display
    fill_in "Image", with: @place_photo.image
    fill_in "Note", with: @place_photo.note
    fill_in "Title", with: @place_photo.title
    click_on "Update Place photo"

    assert_text "Place photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Place photo" do
    visit place_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place photo was successfully destroyed"
  end
end
