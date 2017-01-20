# nhs_numbers

> Tools to generate and validate UK National Health Service (NHS) unique identifiers.

Every citizen in the UK has an NHS number which identifies them to various healthcare providers. However, these IDs are not just incrementing numbers. These tools allow you to validate and generate valid NHS numbers.

## Installation

Add to your `Gemfile`

```
gem 'nhs_numbers'
```

and run `bundle install`.


## Usage

### Validation

```ruby
validator = NHSNumbers::Validator.new('178 072 4519')
validator.valid?
#=> true
```

### Generation (todo)
