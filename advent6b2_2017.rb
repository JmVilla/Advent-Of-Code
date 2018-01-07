def convert_input_array
  file = File.open('/Users/Jeff/desktop/Ruby/bank_input.txt', 'r')
  memory_banks = file.first.split.map(&:to_i)
end

def run_cycle(memory_banks, max_bank_position, max_bank)
  memory_banks = memory_banks.dup
  memory_banks[max_bank_position] = 0
  while max_bank > 0
    max_bank_position = (max_bank_position + 1) % memory_banks.length
    memory_banks[max_bank_position] += 1
    max_bank -= 1
  end
  memory_banks
end

def main_method
  count_since_dupe = 0
  all_cycles = []
  memory_banks = convert_input_array()
  until all_cycles.length - 2 == all_cycles.uniq.length
    max_bank = memory_banks.max
    max_bank_position = memory_banks.find_index(max_bank)
    memory_banks = run_cycle(memory_banks, max_bank_position, max_bank)
    all_cycles << memory_banks
    if all_cycles.length - 1 == all_cycles.uniq.length
      count_since_dupe += 1
      p count_since_dupe
    end
  end
  p all_cycles.length
  p count_since_dupe
end

# [0, 2, 7, 0]
# [0, 2, 0, 0]
# [0, 2, 0, 1]
# [1, 2, 0, 1]
# [1, 3, 0, 1]
# [1, 3, 1, 1]
# [1, 3, 1, 2]
# [2, 3, 1, 2]
# [2, 4, 1, 2]
main_method
