class PasswordValidator
  MIN_CHARS = 8

  RULES = [
    :contains_at_least_one_digit,
    :contains_at_least_one_uppercase_character,
    :contains_at_least_min_characters
  ]

  def initialize(auth_service, rules)
    @auth_service = auth_service || default_auth_service
    @rules = rules
  end

  def self.valid?(password, num_rules_required = RULES.size)
    results = []

    RULES.each do |method_name|
      results.push self.send(method_name, password)
    end

    results.select(&:present?).count >= num_rules_required
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
