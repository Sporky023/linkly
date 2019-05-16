class PasswordValidator
  RULES = [
    :contains_at_least_one_digit,
    :contains_at_least_one_uppercase_character
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
end
