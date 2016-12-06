require('rspec')
require('doctor')
require('patient')

describe(Doctor) do
  describe(:initialize) do
    it('creates a new Doctor with name and specialty') do
      test_doctor = Doctor.new({:name => "Tim", :specialty => "backrubs", :id => nil})
      expect(test_doctor.name()).to(eq("Tim"))
      expect(test_doctor.specialty()).to(eq("backrubs"))
      expect(test_doctor.id()).to(eq(nil))
    end
  end
end

describe(Patient) do
  describe(:initialize) do
    it('creates a new Patient with name and birthdate') do
      test_patient = Patient.new({:name => "Tom", :birthdate => "1899-05-12", :id=> nil})
      expect(test_patient.name()).to(eq("Tom"))
      expect(test_patient.birthdate()).to(eq("1899-05-12"))
      expect(test_patient.id()).to(eq(nil))
    end
  end
end
