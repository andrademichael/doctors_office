class Doctor
  attr_reader(:name, :id, :specialty_id)

  define_method(:initialize) do |attributes|
        @name = attributes.fetch(:name)
        @id = attributes[:id]
        @specialty_id = 0
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id")
      specialty_id = doctor.fetch("specialty_id")
      doctors.push(Doctor.new({:name => name, :id => id, :specialty_id => specialty_id}))
    end
    doctors
  end

  define_method(:assign_to_specialty) do |specialty|
    @specialty_id = specialty.id()
  end

  define_method(:save) do
    DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', '#{@specialty_id}' );")
  end

  define_method(:==) do |another_doctor|
  self.name().==(another_doctor.name())
  self.specialty_id().==(another_doctor.specialty_id())
  end

end
