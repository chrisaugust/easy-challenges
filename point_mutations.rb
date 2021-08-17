class DNA
  attr_reader :sequence

  def initialize(seq)
    @sequence = seq
  end

  def hamming_distance(other_sequence)
    shorter_strand = sequence.size > other_sequence.size ? other_sequence : sequence
    hamming_distance = 0
    shorter_strand.size.times do |idx|
      hamming_distance += 1 if sequence[idx] != other_sequence[idx]
    end
    hamming_distance
  end
end
