require "application_system_test_case"

class BaristaPhotosTest < ApplicationSystemTestCase
  setup do
    @barista_photo = barista_photos(:one)
  end

  test "visiting the index" do
    visit barista_photos_url
    assert_selector "h1", text: "Barista Photos"
  end

  test "creating a Barista photo" do
    visit barista_photos_url
    click_on "New Barista Photo"

    fill_in "Can Display", with: @barista_photo.can_display
    fill_in "Image", with: @barista_photo.image
    fill_in "Note", with: @barista_photo.note
    fill_in "Title", with: @barista_photo.title
    click_on "Create Barista photo"

    assert_text "Barista photo was successfully created"
    click_on "Back"
  end

  test "updating a Barista photo" do
    visit barista_photos_url
    click_on "Edit", match: :first

    fill_in "Can Display", with: @barista_photo.can_display
    fill_in "Image", with: @barista_photo.image
    fill_in "Note", with: @barista_photo.note
    fill_in "Title", with: @barista_photo.title
    click_on "Update Barista photo"

    assert_text "Barista photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Barista photo" do
    visit barista_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barista photo was successfully destroyed"
  end
end
