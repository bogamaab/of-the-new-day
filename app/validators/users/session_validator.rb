# frozen_string_literal: true

module Users::SessionValidator
  def validate
    source.new_record? ? add_error_identification_number : validate_password
  end

  def add_error_identification_number
    source.errors.add(:identification_number, :not_found)
  end

  def validate_password
    source.valid_password?(options['password']) ? nil : add_error_password
  end

  def add_error_password
    error = options['password'].blank? ? :blank : :invalid
    source.errors.add(:password, error)
  end
end
