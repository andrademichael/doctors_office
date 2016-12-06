class Doctor
  attr_reader(:name, :id, :patient_ids)

  define_method(:initialize) do |attributes|
        @name = attributes.fetch(:name)
        @id = attributes.fetch(:id)
        @patient_ids = []
  end

  define_method(:assign_patient) do |patient_id|
    @patient_ids.push(patient_id)
  end
end
