require 'test_helper'

class ArtPieceTest < ActiveSupport::TestCase
  test 'initializer' do
    artist = Artist.new(name: 'bob', email: 'bob@bar.com')
    artist.save;
    art_piece = ArtPiece.new(title: 'MySky', artist: artist, needs_label: true, momo_percent: 50)
    art_piece.save
    artist = Artist.where(name: 'bob')[0]
    assert_not_nil(artist, "Could not find artist Bob")
    art_piece = artist.art_pieces[0]
    assert_not_nil(art_piece, "Could not find Bob's art piece.")
    assert_equal(50, art_piece.momo_percent, "Wrong momo_percent.")
    assert_equal(true, art_piece.needs_label, "Should need label.")
  end

  test 'withImage' do
    artist = Artist.new(name: 'bob', email: 'bob@bar.com')
    artist.save;
    art_piece = ArtPiece.new(title: 'MySky', artist: artist)
    art_piece.save
    # open_file = File.open(file_fixture('NeighborhoodSky.jpg'))
    open_file = File.open(Rails.root.join('test/fixtures/files/NeighborhoodSky.jpg'))
    art_piece.image = Image.new(image: open_file)
    art_piece.save

    artist = Artist.where(name: 'bob')[0]
    assert_not_nil(artist, "Could not find artist Bob")
    art_piece = artist.art_pieces[0]
    assert_not_nil(art_piece, "Could not find Bob's art piece.")
    image = art_piece.image
    assert_not_nil(art_piece, "Could not find the image for Bob's art piece.")
  end
end

