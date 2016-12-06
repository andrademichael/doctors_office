class Doctor
  attr_reader(:name, :specialty, :id, :patient_ids)

  define_method(:initialize) do |attributes|
        @name = attributes.fetch(:name)
        @specialty = attributes.fetch(:specialty)
        @id = attributes.fetch(:id)
        @patient_ids = []
  end

end
