require('rspec')
require('doctor')

describe(Doctor) do
  describe(:initialize) do
    it('it will create the Doctor object') do
      test_doctor = Doctor.new({:name => "Tim", :specialty => "backrubs", :id => nil})
      expect(test_doctor.name()).to(eq("Tim"))
      expect(test_doctor.specialty()).to(eq("backrubs"))
      expect(test_doctor.id()).to(eq(nil))
    end
  end

end
