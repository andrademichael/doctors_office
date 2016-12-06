class Specialty
  attr_reader(:name, :id, :doctor_ids)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @doctor_ids = []
  end

  define_method(:add_doctor) do |doctor_id|
    @doctor_ids.push(doctor_id)

  end
end
