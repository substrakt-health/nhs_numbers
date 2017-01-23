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

    def base_number
      @nhs_number.gsub(' ', '')[0..-2].to_i
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
      message = 'is not in the valid range.'
      valid_ranges = [[400_000_000, 499_000_000], [600_000_000, 708_800_001]]
      is_valid = false
      valid_ranges.each do |range|
        is_valid = true if base_number.between?(range[0], range[1])
      end
      errors.add(:base, message) unless is_valid
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
