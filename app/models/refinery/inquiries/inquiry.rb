require 'refinery/core/base_model'
require 'filters_spam'

module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam message_field:    :message,
                   email_field:      :email,
                   author_field:     :name,
                   other_fields:     [:phone],
                   extra_spam_words: %w()

	ROOMS = ['Einzelzimmer 47,50 Euro bis 59 Euro', 'Doppelzimmer 67,50 Euro bis 79 Euro', '1. Familien-Zimmer mit 2 Einzelzimmern, 1 Doppelzimmer 160 € ']

      validates :name, presence: true, length: { maximum: 255 }
      validates :email, format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      }, length: { maximum: 255 }
      validates :message, presence: true
     # validates :company, :street, :city, :zip, :country, :fax, :room, :arrival, :departure,  allow_blank: true

      default_scope { order('created_at DESC') }

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end

    end
  end
end
