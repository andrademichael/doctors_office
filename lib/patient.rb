class Patient
  attr_reader(:name, :birthdate, :id, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @id = attributes[:id]
    @doctor_id = 0
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      id = patient.fetch("id")
      doctor_id = patient.fetch("doctor_id")
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :id => id, :doctor_id => doctor_id}))
    end
    patients
  end

  define_method(:save)do
    DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}','#{@birthdate}',#{@doctor_id});")
  end

  define_method(:assign_to_doctor) do |assigned_doctor|
    @doctor_id = assigned_doctor.id()
  end

  define_method(:==) do |another_patient|
  self.name().==(another_patient.name())
  self.birthdate().==(another_patient.birthdate())
  self.doctor_id().==(another_patient.doctor_id())
  end
end
