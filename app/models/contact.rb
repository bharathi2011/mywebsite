class Contact < ActiveRecord::Base

   attr_accessible :name, :address, :phone

   validates_presence_of :name
   validates_uniqueness_of :name

    def self.contactsearch(contactsearch)
      if contactsearch
        where('name LIKE ?', "%#{contactsearch}%")
      else
        scoped
      end
    end
end
