require File.dirname(__FILE__) + '/spec_helper'


describe Encryption do
  before(:each) do
    Encryption.encryption_key = 'this is a test' 
  end
  
  it 'should be accessible in object form' do
    e = Encryption.new
  end
  
  it 'should encrypt via class method' do
    test_string = 'yin-yang'
    Encryption.decrypt_aes(Encryption.encrypt_aes(test_string)).should \
       == test_string
       
    e = Encryption.new   
    e.decrypt_aes(Encryption.encrypt_aes(test_string)).should \
       == test_string
    e.decrypt_aes(e.encrypt_aes(test_string)).should \
       == test_string   
    Encryption.decrypt_aes(e.encrypt_aes(test_string)).should \
       == test_string    
  end
  
  it 'should create a random_alphanumeric(size=16)' do
    Encryption.random_alphanumeric(size=16).size.should == 16    
  end
end  
  
    
  
  
 
