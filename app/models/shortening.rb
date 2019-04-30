class Shortening < ApplicationRecord
  CODE_LENGTH_IN_CHARS = 8

  validates :long_url,
    presence: true,
    uniqueness: true,
    format: {
      with: URI.regexp,
      message: 'must be a valid url',
      if: -> (record) { record.long_url.present? }
    }

  validates :short_link_code, presence: true, uniqueness: true

  validates_presence_of :long_url, :short_link_code

  before_validation(on: :create) do
    build_short_link_code
  end

  private

  def build_short_link_code
    code = nil

    loop do
      code = SecureRandom.hex(CODE_LENGTH_IN_CHARS / 2)

      unless existing = self.class.find_by(short_link_code: code)
        break
      end
    end

    self.short_link_code = code
  end
end
