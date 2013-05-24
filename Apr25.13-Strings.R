#R-club
#April 25, 2013
#grep

# for example: which state names have 'i' in them?
data(state)
state.name
# in its basic form, grep returns the position (index) of the items that
# match the pattern.
grep(pattern = "i", x = state.name, ignore.case = T)
# you can also ask grep to return the values that match
grep(pattern = "i", x = state.name, ignore.case = T, value = T)


grepl(pattern = "i", x = state.name, ignore.case = T)
# recalling that TRUE = 1 and FALSE = 0, when can use grepl to quickly
# determine the number of states that have 'i' in them.
sum(grepl(pattern = "i", x = state.name, ignore.case = T))


#Exercise 1: 
#Can you figure out how to count the number of states that do not have an 'i' 
#in their name (without changing the search pattern)? There are at least two easy ways.

sum(!grepl(pattern = "i", x = state.name, ignore.case = T))

# we have a list of favorite fruits and a list of citrus.  Which of the
# favorites are citrus?
favorites <- c("peach", "banana", "blueberry", "orange", "plum", "strawberry",
               "mandarin")
citrus <- c("kumquat", "grapefruit", "orange", "mandarin", "orange", "tangerine",
            "tangelo", "lemon", "lime")
match(favorites, citrus)  #what do the numbers returned refer to?

favorites[favorites %in% citrus] #this prints out which items in each vector matches.


#sub() performs text substitutions. Think of it as find and replace.

# lets say that we wanted to replace 'W' with the phrase '_DoubleU_'
sub("w", "_DoubleU_", state.name, ignore.case = T)

Excerise 2: Try replacing all of the is with ys. Are results what you expected? Why or why not?
sub("is", "ys", state.name,ignore.case=T)

#sub() only replaces the first occurrence of pattern. gsub() will replace all occurrences.

gsub("i", "y", state.name, ignore.case = T)

# compare to just using sub()

sub() only replaces the first occurrence of pattern. gsub() will replace all occurrences.

sub("i", "y", state.name, ignore.case = T) #Compred. 

grep("a.a", state.name, value = T, ignore.case = T)  # having a "." Matches any single character


#Exercise 3: Find state names that have a space in their names.

grep(". ", state.name, value=T, ignore.case=T)

#Exercise 4: Find state names that begin with M

grep("^M", state.name,value=T, ignore.case=T) # a "^" before a character returns the words matching the first character


#. Matches any single character
#\w Matches any character that would be found in a "word" including digits (excludes punctuation and white space)
#\W Is the opposite of \w and matches any non-word character
#\d Matches any digit character
#\D Matches any non-digit character
#\s Matches any white space character
#\S Matches any non space character

#^ Matches the beginning of a line
#$ Matches the end of a line
#\t tab character
#\n return character

grep("[aeiou]$", state.name, value = T)

#Exercise 5: Find state names that begin with non-vowels.

grep("^[^AEIOU]", state.name, value = T)

