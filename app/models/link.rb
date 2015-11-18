require 'uri'

class Link < ActiveRecord::Base
  validate :location_must_be_valid_url

  belongs_to :user

  private

  def location_must_be_valid_url
    URI.parse(location)
    rescue URI::InvalidURIError
      errors.add(:location, "must be a valid URL")
  end
end
