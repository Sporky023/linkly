describe PasswordValidator do
  describe '.validate' do
    it 'requires at least 1 digit' do
      okay_password = 'Password123'
      nokay_password = 'Password'

      expect( PasswordValidator.valid?(okay_password) ).to be(true)
      expect( PasswordValidator.valid?(nokay_password) ).to be(false)
    end

    it 'requires at least 1 uppdercase character' do
      okay_password = 'Password123'
      nokay_password = 'password123'

      expect( PasswordValidator.valid?(okay_password) ).to be(true)
      expect( PasswordValidator.valid?(nokay_password) ).to be(false)
    end

    it "has to be at least 8 characters" do
      okay_password = 'Password123'
      nokay_password = 'Pass123'

      expect( PasswordValidator.valid?(okay_password) ).to be(true)
      expect( PasswordValidator.valid?(nokay_password) ).to be(false)
    end
  end

  # idea:
  # pw_to_rules_passing = {
  #   'pass123' => [:digits],
  #   'password123' => [:digits, :length],
  #   'Password123' => [:digits, :length, :uppercase]
  # }

  describe '.validate with a minimum-passing-rules argument' do
    it 'requires the number of rules specified to pass' do
      num_rules_to_pw = {
        1 => 'pass123',
        2 => 'password123',
        3 => 'Password123',
      }

      num_rules_to_pw.each do |num_rules_passing, password|
        (1..3).to_a.each do |num_rules_required|
          expected_to_pass = num_rules_passing >= num_rules_required

          expect(
            PasswordValidator.valid?(password, num_rules_required) 
          ).to(
            be(expected_to_pass),
            "Expected #{password} "+
            "to #{expected_to_pass || 'NOT'} "+
            "be valid using #{num_rules_required} as num_rules_required"
          )
        end
      end
    end
  end

  describe 'foo' do
    it 'uses rules passed in' do
      using_temp_class(:foo) do

      end

      class DummyRule
        def self.validate(password)
          false
        end
      end
    end
  end

  describe '.validate in context of a previously-used password' do
    before(:example) do
      PasswordValidator.new(FakePasswordService.new)
    end
  end
end
