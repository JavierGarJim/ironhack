
require_relative('lib/dictionary.rb')
require_relative('lib/wordChain.rb')


dictionary = Dictionary.new
# puts dictionary.get_similar_word("hello", 0)

# puts dictionary.compare_similar_word("hello", "qello", 4)

wordChain = WordChain.new(dictionary)

wordChain.resolve_puzzle("cat", "dog")
wordChain.resolve_puzzle("lead", "gold")
wordChain.resolve_puzzle("ruby", "code")

