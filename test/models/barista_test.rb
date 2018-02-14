require 'test_helper'
barista = Barista.new(first: "Jaimi", last: "Mostellar")
class BaristaTest < ActiveSupport::TestCase
  test "barista with pictures" do
    barista = Barista.new(first: "Jaimi", last: "Mostellar")
    barista.save
    image = Image.new(image: File.open(file_fixture('Jaimi.jpg')))
    image.update_attribute(:picturable, barista)
    barista = Barista.where(first: "Jaimi", last: "Mostellar")[0]
    assert_not_nil(barista, "Could not find barista Jaimi")
    image = barista.images[0]
    assert_not_nil(barista, "Could not find image for barista Jaimi")

    image = Image.new(image: File.open(file_fixture('Jaimi2.jpg')))
    image.update_attribute(:picturable, barista)
    barista = Barista.where(first: "Jaimi", last: "Mostellar")[0]
    assert_not_nil(barista, "Could not find barista Jaimi")
    assert_equal(2, barista.images.size, "Expected 2 barista images, got #{barista.images.size.to_s}")
  end
end
