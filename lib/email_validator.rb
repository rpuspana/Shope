class EmailValidator < ActiveRecord::Validations
  def validate()
    record.errors[:email] << "is not valid" unless
      record.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end
