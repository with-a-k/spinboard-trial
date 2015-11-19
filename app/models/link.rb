require 'uri'
gem 'hurley'

class Link < ActiveRecord::Base
  validate :location_must_be_valid_url

  before_save :fetch_summary

  belongs_to :user

  private

  def fetch_summary
    target = Hurley.get(self.location)
    if target.body.include?("<h1>")
      header = extract_header_from(target)
    else
      header = "[No Header]"
    end
    if target.body.include?("<title>")
      title = extract_title_from(target)
    else
      title = "[No Title]"
    end
    self.summary = "#{title} / #{header}"
  end

  def extract_header_from(response)
    start  = response.body.index("<h1>")+4
    finish = response.body.index("</h1>")-1
    response.body[start..finish]
  end

  def extract_title_from(response)
    start  = response.body.index("<title>")+7
    finish = response.body.index("</title>")-1
    response.body[start..finish]
  end

  def location_must_be_valid_url
    URI.parse(location)
    rescue URI::InvalidURIError
      errors.add(:location, "must be a valid URL")
  end
end
