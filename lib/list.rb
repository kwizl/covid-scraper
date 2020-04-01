# Module that contains class use to clean parsed data
module Listing
  def remove_dup
    name = []
    if self.class == String
      each_char do |n|
        name << n
      end
      size = (name.length - 1)
      size_one = (name.length - 1) / 2
      part_one_name = name[0..size_one]
      size_two = (size_one + 1)
      part_two_name = name[size_two..size]

      name = if part_one_name == part_two_name
               part_one_name.join('')
             else
               name.join('')
             end
    end
    name
  end
end
