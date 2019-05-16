class PasswordValidator
  MIN_CHARS = 8

  RULES = [
    :contains_at_least_one_digit,
    :contains_at_least_one_uppercase_character,
    :contains_at_least_min_characters
  ]

  def self.valid?(password)
    RULES.each do |method_name|
      unless self.send(method_name, password)
        return false
      end
    end

    true
  end

  private

  def self.contains_at_least_one_digit(password)
    password =~ /\d/
  end

  def self.contains_at_least_one_uppercase_character(password)
    password =~ /[A-Z]/
  end

  def self.contains_at_least_min_characters(password)
    password.size >= MIN_CHARS
  end
end
