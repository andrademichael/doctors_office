require('rspec')
require('doctor')
require('patient')
require('specialty')
require('pg')
#
DB = PG.connect({:dbname => 'doctors_office_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialties *;")
  end
end

test_patient = Patient.new({:name => "Tom", :birthdate => "1899-05-12"})
test_doctor = Doctor.new({:name => "Tim"})
test_specialty = Specialty.new({:name => "Backrubiatry"})

describe(Doctor) do
  describe('#initialize') do
    it('creates a new Doctor with name and specialty') do
      expect(test_doctor.name()).to(eq("Tim"))
      expect(test_doctor.id()).to(eq(nil))
    end
  end
  describe("#assign_patient") do
    it('adds a patients id to the doctors patient_ids array') do
      test_doctor.assign_patient(test_patient)
      expect(test_doctor.patient_ids()).to(eq([test_patient]))
    end
  end

  describe(".all") do
    it('will return an empty array at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

#   describe("#save") do
#     it('will save the doctor to the database')do
#     test_doctor.save()
#     expect(Doctor.all()).to(eq([test_doctor]))
#     end
#   end
end

describe(Patient) do
  describe('#initialize') do
    it('creates a new Patient with name and birthdate') do
      expect(test_patient.name()).to(eq("Tom"))
      expect(test_patient.birthdate()).to(eq("1899-05-12"))
      expect(test_patient.id()).to(eq(nil))
    end
  end

  describe(".all") do
    it('will return an empty array at first') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('will save the patient to the database')do
    test_patient.save()
    expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe("#==") do
    it('returns whether two patients objects share the same name and birthdate') do
    test_patient2 = Patient.new({:name => "Tom", :birthdate => "1899-05-12"})
    expect(test_patient).to(eq(test_patient2))
    end
  end
end


describe(Specialty) do
  describe('#initialize') do
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
