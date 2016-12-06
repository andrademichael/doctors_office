class Patient
  attr_reader(:name, :birthdate, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      id = patient.fetch("id")
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :id => id}))
    end
    patients
  end
  define_method(:save)do
    DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}','#{@birthdate}');")
  end

  define_method(:==) do |another_patient|
  self.name().==(another_patient.name())
  self.birthdate().==(another_patient.birthdate())
  end
end
