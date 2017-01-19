require_relative '../test_helper'

class ValidatorTest < Minitest::Test
  def setup
    @validator = NHSNumbers::Validator.new('178 072 4519')
  end

  def test_validator_is_of_correct_type
    assert_equal NHSNumbers::Validator, @validator.class
  end

  def test_validator_should_validate_nhs_number_in_XXX_XXX_XXXX_format
    assert_equal true, @validator.valid?
  end

  def test_validator_should_validate_nhs_number_in_XXXXXXXXXX_format
    @validator = NHSNumbers::Validator.new('1780724519')
    assert_equal true, @validator.valid?
  end

  def test_validator_should_reject_nhs_numbers_with_not_10_digits
    @validator = NHSNumbers::Validator.new('17807245191')
    assert_equal false, @validator.valid?
  end

  def test_validator_should_reject_nhs_numbers_with_not_10_digits_with_spaces
    @validator = NHSNumbers::Validator.new('178 072 45191')
    assert_equal false, @validator.valid?
  end

  def test_validator_should_access_nhs_numbers_entered_as_integers_but_store_as_strings
    @validator = NHSNumbers::Validator.new(1_780_724_519)
    assert_equal '178 072 4519', @validator.nhs_number
    assert_equal true, @validator.valid?
  end

  def test_validator_with_an_incorrect_checking_digit_should_be_invalid
    @validator = NHSNumbers::Validator.new(1_780_724_513)
    assert_equal false, @validator.valid?
  end

  def test_validator_with_a_checking_digit_of_10_is_automatically_invalid
    @validator = NHSNumbers::Validator.new('17807245110')
    assert_equal false, @validator.valid?
  end

end
