def encrypt(plaintext)
  a = 'a'.ord
  z = 'z'.ord
  
  ciphertext = ""
  shift = 0
  
  plaintext.downcase.each_byte do |c|
    if c.ord >= a and c.ord <= z
      add = c.ord + shift
      if add > z
        add -= 26
      end
      ciphertext += add.chr
      shift = c.ord - a + 1
    end
  end
  return ciphertext
end

def decrypt(ciphertext) 
  a = 'a'.ord
  z = 'z'.ord
  
  plaintext = ""
  shift = 0
  
  ciphertext.downcase.each_byte do |c|
    if c.ord >= a and c.ord <= z
      add = c.ord - shift
      if add < a
        add += 26
      end
      plaintext += add.chr
      shift = add - a + 1
    end
  end
  return plaintext
end

def theatrics(length)
  length.times do
    sleep 1
    print "."
  end
end
prompt = "> "
puts "Would you like to encrypt or decrypt?"
print prompt
response = STDIN.gets.chomp
puts "What text would you like to #{response}?"
print prompt
text = STDIN.gets.chomp

if response.eql? "encrypt"
  print "Encrypting"
  theatrics 5
  puts "\nYour ciphertext is:"
  puts encrypt text
elsif response.eql? "decrypt"
  print "Decrypting"
  theatrics 5
  puts "\nYour plaintext is:"
  puts decrypt text
else
  puts "You may have made a spelling error when you typed #{response}. Reload the program to try again"
end

