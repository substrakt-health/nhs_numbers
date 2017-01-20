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

### TODO
- [ ] Create class to generate valid and invalid NHS numbers
- [ ] Include a native Rails validator to validate Rails models


### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

### Licence

This code is distributed and licensed under the terms in [LICENCE.md](LICENCE.md).
