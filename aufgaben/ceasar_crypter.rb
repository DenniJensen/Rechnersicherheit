class CeasarCrypter
  ALPHABET = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}

  def initialize(crypto_key)
    @crypto_key = crypto_key
  end

  def decrypt(text)
    text.split(' ').map {|word| decrypt_single_word(word) }.join ' '
  end

  private

  def decrypt_single_word(word)
    word.chars.map {|char| decrypt_single_char char }.join
  end

  def decrypt_single_char(char)
    crypto_index = ALPHABET.index(char) + @crypto_key
    crypto_index -= ALPHABET.size if crypto_index > ALPHABET.size - 1
    ALPHABET[crypto_index]
  end
end
