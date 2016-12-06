class Patient
  attr_reader(:name, :birthdate, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @id = attributes.fetch(:id)
  end
end
