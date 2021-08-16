class DNA
  attr_reader :sequence

  def initialize(seq)
    @sequence = seq
  end

  def hamming_distance(other_seq)
    shorter_strand = sequence.size > other_seq.size ? other_seq : sequence
    other_sequence = other_seq.split('')
    hamming_distance = 0
    sequence.split('').each_with_index do |amino_acid, idx|
      hamming_distance += 1 if amino_acid != other_sequence[idx]
      break if idx >= shorter_strand.size - 1
    end
    hamming_distance
  end
end
