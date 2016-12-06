require('rspec')
require('doctor')
require('patient')
require('specialty')

test_patient = Patient.new({:name => "Tom", :birthdate => "1899-05-12", :id=> nil})
test_doctor = Doctor.new({:name => "Tim", :id => nil})
test_specialty = Specialty.new({:name => "Backrubiatry", :id => nil})

describe(Doctor) do
  describe(:initialize) do
    it('creates a new Doctor with name and specialty') do
      expect(test_doctor.name()).to(eq("Tim"))
      expect(test_doctor.id()).to(eq(nil))
    end
  end
  describe(:assign_patient) do
    it('adds a patients id to the doctors patient_ids array') do
      test_doctor.assign_patient(test_patient)
      expect(test_doctor.patient_ids()).to(eq([test_patient]))
    end
  end
end

describe(Patient) do
  describe(:initialize) do
    it('creates a new Patient with name and birthdate') do
      expect(test_patient.name()).to(eq("Tom"))
      expect(test_patient.birthdate()).to(eq("1899-05-12"))
      expect(test_patient.id()).to(eq(nil))
    end
  end
end

describe(Specialty) do
  describe(:initialize) do
    it('creates a new Specialty with name and array of doctor ids') do
      expect(test_specialty.name()).to(eq("Backrubiatry"))
      expect(test_specialty.id()).to(eq(nil))
    end
  end
  describe("#add_doctor") do
    it('will add a doctor into the doctor_ids array of the Specilaty ') do
      test_specialty.add_doctor(test_doctor)
      expect(test_specialty.doctor_ids()).to(eq([test_doctor]))
    end
  end
end
