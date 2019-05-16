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
  end
end
