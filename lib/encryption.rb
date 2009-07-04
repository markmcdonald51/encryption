require 'openssl'
require 'digest/sha1'

module Encrypt
  @@encryption_key = configatron.encryption_key   
 
  def encrypt_aes(string)
    c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
    c.encrypt
    # your pass is what is used to encrypt/decrypt
    c.key = Digest::SHA1.hexdigest(@@encryption_key)
    e = c.update(string.to_s)
    e << c.final
    e.unpack('H*').first
  end

  def decrypt_aes(cipher_text)
    begin
      c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
      c.decrypt
      c.key =  Digest::SHA1.hexdigest(@@encryption_key)
      d = c.update(Array[cipher_text].pack('H*'))
      d << c.final
    rescue Exception => e
      return nil
    end
    return d
  end
    
  def encryption_key=(key)
    @encryption_key = key
  end
  
  
  def random_alphanumeric(size=16)
    (1..size).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join
  end
  
end



class Encryption
  include Encrypt
  extend Encrypt
end
