# Setting up an RSpec project.
#
# gem install rspec
# rspec --init
#

# Phase 1
# A set of three cards of the same value, e.g. ['2C', '2S', '2H']
# represents a set of three Twos.
# Note that the set may include Wilds, but must include at least two
# "natural" cards (i.e. non-Wild cards),
# which define the value. Note also that the sequence of the cards is
# not significant for this group type.
#
# >> group = ['2S', '2S', '2H']
# => ["2S", "2S", "2H"]
# >> for card in group do
# ?>   puts card
# >> end
# 2S
# 2S
# 2H
# >> wilds = ['AH', 'AD', 'AC', 'AS']
# => ["AH", "AD", "AC", "AS"]
# >> card = 'AC'
# => "AC"
# >> wilds.include?(card)
# => true
# >> card
# => "AC"
# >> card[0]
# => "A"
# e.g. ["2S", "2S", "2H"]
def phasea_phase_one(group)
  wilds = ['AH', 'AD', 'AC', 'AS']
  wild_count = 0
  card_num_count = 0
  card_num = nil
  for card in group do
      if wilds.include?(card)
          wild_count += 1
      elsif card_num.nil?
          card_num = card[0]
          card_num_count += 1
      elsif card[0] == card_num
          card_num_count += 1
      end
  end

  if wild_count <= 1 and (card_num_count + wild_count) == 3 and group.count == 3
      return 1
  else
      return nil
  end
end


# Phase 2
# A set of 7 cards of the same suit,
# e.g. ['2C', '2C', '4C', 'KC', '9C', 'AH', 'JC'] represents a set of
#   seven Clubs.
# Note that the set may include Wilds
# (as we see in our example, with the Ace of Hearts),
# but must include at least two "natural" cards (i.e. non-Wild card),
# which define the suit.
# Note also that the sequence of the cards is not significant for this group type.
def phasea_phase_two(group)
  #TODO implement for phase 2 in like manner
  wilds = ['AH', 'AD', 'AC', 'AS']
  c_counter = 0
  wilds_counter = 0
  card_num = nil

  group.each do |x|
    if wilds.include?(x)
      wilds_counter += 1
    elsif card_num.nil?
      card_num = x[1]
      c_counter += 1
    elsif x[1] == card_num
      c_counter += 1
    end
  end

  if group.length == 7 && c_counter >= 2 && (c_counter + wilds_counter == 7)
   2
  else
   nil
  end
end


# Phase 3
# A set of four cards of the same value,
# e.g. ['4H', '4S', 'AC', '4C'] represents a set of four Fours.
# Note that the set may include Wilds (as we see in our example,
# with the Ace of Clubs), but must
# include at least two "natural" cards (i.e. non-Wild cards),
# which define the value. Note also that
# the sequence of the cards is not significant for this group type.
def phasea_phase_three(group)
  #TODO implement for phase 3 in like manner
  wilds = ['AH', 'AD', 'AC', 'AS']
  c_counter = 0
  wilds_counter = 0
  card_num = nil

  group.each do |x|
    if wilds.include?(x)
      wilds_counter += 1
    elsif card_num.nil?
      card_num = x[0]
      c_counter += 1
    elsif x[0] == card_num
      c_counter += 1
    end
  end

  group.length == 4 && c_counter >= 2 && (c_counter + wilds_counter == 4) ? 3 : nil
  
end


# Phase 4
# A run of eight cards, e.g. ['4H', '5S', 'AC', '7C', '8H', 'AH', '0S', 'JC']
# represents a run of eight cards.
# Note that the set may include Wilds (as we see in our example,
# with the Ace of Clubs standing in for a Six
# and the Ace of Hearts standing in for a Nine),
# but must include at least two "natural" cards
# (i.e. non-Wild cards). Note also that the sequence of the cards is
# significant for this group type,
# and that ['4H', '5S', 'AC', '8H', '7C', 'AH', '0S', 'JC'],
# e.g., is not a valid run of eight, as it is not in sequence.
def phasea_phase_four(group)
  #TODO implement for phase 4 in like manner
  set = {'2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '0': 10, 'J': 11, 'Q': 12, 'K': 13 }
  wilds = ['AH', 'AD', 'AC', 'AS']
  card_counter = 0
  wilds_counter = 0
  sequence = nil

  group.each do |card|
    if wilds.include?(card)
        wilds_counter += 1
        sequence += 1 unless sequence.nil?
    elsif sequence.nil?
      sequence = set[card[0].to_sym] + 1
      card_counter += 1
    elsif set[card[0].to_sym] == sequence
      sequence += 1
      card_counter += 1
    end
  end

  group.length == 8 && card_counter >= 2 && (card_counter + wilds_counter == 8) ? 4 : nil

end


# Phase 5_1
# A run of four cards of the same colour, e.g. ['4H', '5D', 'AC', '7H']
# represents a run of four Red cards.
# Note that the set may include Wilds (as we see in our example,
# with the Ace of Clubs standing in for a Red Six),
# but must include at least two "natural" cards (i.e. non-Wild cards),
# which define the colour. Note also that the
# sequence of the cards is significant for this group type,
# and that ['4H', '5D', '7H', 'AC'] is not a valid run of
# four cards of the same colour, as it is not in sequence.
def phasea_phase_five_1(group)
  #TODO implement for phase 5_1 in like manner
  set = {'2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '0': 10, 'J': 11, 'Q': 12, 'K': 13 }
colors = {
  'H': 'r',
  'D': 'r',
  'C': 'b',
  'S': 'b'
}
wilds = ['AH', 'AD', 'AC', 'AS']
card_counter = 0
wilds_counter = 0
deck_color = nil
sequence = nil

  group.each do |card|
    if wilds.include?(card)
        wilds_counter += 1
        sequence += 1 unless sequence.nil? 
    elsif sequence.nil? && deck_color.nil?
        sequence = set[card[0].to_sym] + 1
        deck_color = colors[card[1].to_sym]
        card_counter += 1
    elsif set[card[0].to_sym] == sequence && deck_color == colors[card[1].to_sym]
      sequence += 1
      card_counter += 1
    end
  end

  group.length == 4 && card_counter >= 2 && (card_counter + wilds_counter == 4) && wilds_counter != 0 ? 5.1 : nil
end

# Phase 5_2
# a “run” of N cards of the same colour: a run of N cards where all cards are of the same colour,
# as defined by the suit (Spades and Clubs are black,and Hearts and Diamonds are red; e.g.['2S', '3C', '4C', '5S']
# is a run of 4 black cards)
def phasea_phase_five_2(group)
  #TODO implement for phase 5_2 in like manner
  set = {'A': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '0': 10, 'J': 11, 'Q': 12, 'K': 13 }
  colors = {
    'H': 'r',
    'D': 'r',
    'C': 'b',
    'S': 'b'
  }
  
  card_counter = 0
  deck_color = nil
  sequence = nil
  number_array = []
  suit_array = []

  group.each do |card|
    if sequence.nil? && deck_color.nil?
      sequence = set[card[0].to_sym] + 1
      deck_color = colors[card[1].to_sym]
      card_counter += 1
      number_array << set[card[0].to_sym]
      suit_array << colors[card[1].to_sym]
    elsif set[card[0].to_sym] == sequence && deck_color == colors[card[1].to_sym]
      sequence += 1
      card_counter += 1
      number_array << set[card[0].to_sym]
      suit_array << colors[card[1].to_sym]
    else
      number_array << set[card[0].to_sym]
      suit_array << colors[card[1].to_sym]
    end
  end

  number_array.each_cons(2).all? {|a, b| b == a + 1 } && suit_array.uniq.size == 1 ? 5.2 : nil

end


def phasea_phase_type(group)

  phase_type = nil

  # Phase 1 check eg. [['2S', '2S', '2H'], ['7H', '7S', '7D']]
  if group.count == 2 and
    phasea_phase_one(group[0]) == 1 and
    phasea_phase_one(group[1]) == 1 and
    phase_type = 1
  elsif
    group.count == 1 and
    phasea_phase_two(group[0]) == 2
    phase_type = 2
  elsif
    group.count == 1 and
    phasea_phase_three(group[0]) == 3
    phase_type = 3
  elsif
    group.count == 1 and
    phasea_phase_four(group[0]) == 4
    phase_type = 4
  elsif
    group.count == 1 and
    phasea_phase_five_1(group[0]) == 5.1
    phase_type = 5.1
  elsif
    group.count == 1 and
    phasea_phase_five_2(group[0]) == 5.2
    phase_type = 5.2
  end




  # Phase 2 check e.g.[['2C', '7C', '7C', '8C', 'JC', 'QC', 'KC']]
  #TODO implement for phase 2 in like manner

  # Phase 3 check e.g.[['4H', '4S', 'AC', '4C']]
  #TODO implement for phase 3 in like manner

  # Phase 4 check e.g.[['4H', '5S', 'AC', '7C', '8H', 'AH', '0S', 'JC']]
  #TODO implement for phase 4 in like manner

  # Phase 5 check e.g.[['4H', '5D', 'AC', '7H'], ['2S', '3C', '4C', '5S']]
  #TODO implement for phase 5 in like manner

  return phase_type
end

# puts(phasea_phase_type([['2S', '2S', '2H'], ['7H', '7S', '7D']]))
# #Should return 1