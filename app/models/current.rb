class Current


  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor 

  def self.current_artists
    Artist.joins(:art_pieces).where("art_pieces.currently_hanging = true")
  end

  def self.needs_labels
    ArtPiece.where(needs_label: true) 
  end

  def current_artists
    Artist.joins(:art_pieces).where("art_pieces.currently_hanging = true")
  end

  def needs_labels
    ArtPiece.where(needs_label: true) 
  end

  def self.attributes
    @attributes
  end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end

end
