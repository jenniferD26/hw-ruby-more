module FunWithStrings
  def palindrome?
    original = self.gsub(/(\W|\s)/, '')
    original = original.downcase
    reverseStr = original.reverse
    if original == reverseStr
      return true
    else
      return false
    end
  end
  def count_words
    wordArray = self.split(/\s/)
    wordHash = Hash.new
    wordArray.each{ |word| 
      word = word.gsub(/(\W|\s)/, '') 
      word = word.downcase
      
      # check if the word is in the hash already
      if !word.empty?
        if !wordHash.has_key?(word)
          wordHash.store(word, 1)
        else
          wordHash[word] += 1
        end
      end
    }
    return wordHash
  end
  
  def anagram_groups
    anagrams = Hash.new
    
    self.split(/\s/).each { |word|
      sortedWord = word.chars.sort.join
      
      if (!anagrams.has_key?(sortedWord))
        anagrams.store(sortedWord, [word])
      else
        anagrams.keys.each{ |key|
        
          if (sortedWord == key and !anagrams[key].include?(word))
            anagrams[key] << word
          end
        }
      end
    }
    
    # add each anagram group into a list, because that's what's expected
    anagramGroups = Array.new
    anagrams.values.each{ |group|
      anagramGroups << group
    }
    return anagramGroups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
