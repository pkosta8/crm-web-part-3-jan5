# this file was originall composed by Jeff as i did not have a working  contacts.rb file before the begining of this assignment
# and was approved by Daniel and Jeff. Thanks Jeff for the loaner.
# modified for this ex1,2,3
gem "activerecord", "=4.2.10"
require "mini_record"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email, as: :string
  field :note,     as: :text

def full_name
  "#{first_name} #{last_name}"
  end
end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end
