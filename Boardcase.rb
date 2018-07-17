class BoardCase
  attr_accessor :value, :case_number

  def initialize(case_number) # associe chaque case à son nombre (voir plus bas)
    @value = case_number
    @case_number = case_number
  end

  def to_s # Mise en place des value
    value.to_s
  end
end
