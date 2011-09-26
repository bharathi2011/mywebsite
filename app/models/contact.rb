class Contact < ActiveRecord::Base

   attr_accessible :name, :address, :phone

   validates_presence_of :name
   validates_uniqueness_of :name


   def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
end
