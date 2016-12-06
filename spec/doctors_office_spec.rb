require('rspec')
require('doctor')
require('patient')
require('specialty')
require('pg')
require('pry')
#
DB = PG.connect({:dbname => 'doctors_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialties *;")
  end
end

test_patient = Patient.new({:name => "Tom", :birthdate => "1899-05-12"})
test_doctor = Doctor.new({:name => "Tim"})
test_specialty = Specialty.new({:name => "Backrubiatry"})
test_specialty.save

describe(Specialty) do
  describe('#initialize') do
    it('creates a new Specialty with name and array of doctor ids') do
      expect(test_specialty.name()).to(eq("Backrubiatry"))
      expect(test_specialty.id()).to(eq(nil))
    end
  end
  describe('.all') do
    it('returns an array of all entries in the specialties table of doctors_office_test') do
      expect(Specialty.all).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the targeted specialty to the specialties table in doctors_office_test') do
    test_specialty.save
    expect(Specialty.all).to(eq([test_specialty]))
    end
  end
  describe('#==') do
    it('compares two specialty objects and returns true if they are identical') do
      test_specialty2 = Specialty.new({:name => "Backrubiatry"})
      expect(test_specialty2).to(eq(test_specialty))
    end
  end
end

describe(Doctor) do
  describe('#initialize') do
    it('creates a new Doctor with name and specialty') do
      expect(test_doctor.name()).to(eq("Tim"))
      expect(test_doctor.id()).to(eq(nil))
    end
  end

  describe(".all") do
    it('will return an empty array at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('will save the doctor to the database')do
    test_doctor.save()
    expect(Doctor.all()).to(eq([test_doctor]))
    end
  end
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

  describe("#assign_to_doctor") do
    it('adds a patients id to the doctors patient_ids array') do
      test_patient.assign_to_doctor(test_doctor)
      expect(test_patient.doctor_id()).to(eq(test_doctor.id()))
    end
  end

end
