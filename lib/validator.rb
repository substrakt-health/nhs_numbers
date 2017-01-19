require_relative 'nhs_numbers'

module NHSNumbers
  class Validator
    include ActiveModel::Model

    attr_accessor :nhs_number
    validates_format_of :nhs_number, with: /\A(\d{3}\s?\d{3}\s?\d{4})\z/
    validate :validate_checking_digit

    def initialize(nhs_number)
      @nhs_number = normalize_nhs_number(nhs_number)
    end

    private

    def validate_checking_digit
      sum = 0
      @nhs_number.scan(/\d/).tap(&:pop).each_with_index do |digit, idx|
        position = idx + 1
        sum += (digit.to_i * (11 - position))
      end
      checking_digit = 11 - (sum % 11)

      errors.add(:base, 'checking digit is incorrect') if checking_digit.to_s != @nhs_number.chars[-1]
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
