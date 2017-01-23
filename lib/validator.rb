require_relative 'nhs_numbers'

module NHSNumbers
  class Validator
    include ActiveModel::Model

    attr_accessor :nhs_number
    validates_format_of :nhs_number, with: /\A(\d{3}\s?\d{3}\s?\d{4})\z/
    validate :validate_within_range
    validate :validate_checking_digit

    def initialize(nhs_number)
      @nhs_number = normalize_nhs_number(nhs_number)
    end

    private

    def without_checking_digit
      @nhs_number.scan(/\d/).take(9)
    end

    def checking_digit
      sum = 0
      without_checking_digit.each_with_index do |digit, idx|
        position = idx + 1
        sum += (digit.to_i * (11 - position))
      end
      11 - (sum % 11)
    end

    def validate_within_range
      message_too_low = 'is below minimum allowed NHS number.'
      errors.add(:base, message_too_low) if @nhs_number.gsub(' ', '')[0..-2].to_i < 400_000_000
    end

    def validate_checking_digit
      message = "checking digit is incorrect (should be #{checking_digit})"
      errors.add(:base, message) unless @nhs_number.chars[-1].to_i.eql?(checking_digit)
    end

    def normalize_nhs_number(nhs_number)
      if nhs_number.is_a? Integer
        nhs_number.to_s.chars.insert(3, ' ').insert(7, ' ').join('')
      else
        nhs_number
      end
    end
  end
end
