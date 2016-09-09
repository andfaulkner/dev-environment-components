# 
# Clever little logging methods
# 
# def star_line(length=100)
# 	"#{Array.new(length, '*').join('')}"
# end

# def log_hash_map(name = "LETTER_NUM_MAP", map=LETTER_NUM_MAP)
# 		star_line(107) + "\n" + name + ": " + map.to_a.to_s
# end
# # puts log_hash_map("LETTER_NUM_MAP", LETTER_NUM_MAP)

# def determine_names
# 	IDS.map { |id|
# 		id_string = id.to_s.sub("0", "")
# 		LETTER_NUM_MAP.each{ |key, val|
# 			id_string = id_string.gsub(/#{val}/, key)
# 			yield(id_string) unless id_string.match(/[0-9]/)
# 		}
# 		id_string
# 	}
# end

# def determine_names
# 	IDS.map { |id|
# 		id_string = id.to_s
# 		puts "id_string: " + id_string
# 		puts "#{Array.new(100, '*').join('')} \nLETTER_NUM_MAP.to_a: " + LETTER_NUM_MAP.to_a.to_s
# 		letter_num_map_iterator = LETTER_NUM_MAP.each
# 		while id_string.match(/[0-9]/) && letter_num_map_iterator
# 			letter_num_map_iterator.next
# 			puts "LETTER_NUM_MAP.each:: id::::  " + id.to_s
# 			puts "LETTER_NUM_MAP.each:: key:::: " + key.to_s
# 			puts "LETTER_NUM_MAP.each:: val:::: " + val.to_s
# 			id_string = id_string.gsub(/#{val}/, key)
# 			puts "SUBBED!!!::: #{id_string}"
# 			yield(id_string)
# 		}
# 		id_string
# 	}
# end


# def translate_ids
# 	sub_arr = []
# 	determine_names {|subbed|
# 		sub_arr.push(subbed)
# 		puts "sub_arr: #{sub_arr}"
# 		sub_arr
# 	}
# end

# puts translate_ids