class Book < ActiveRecord::Base
  belongs_to :Subject

   attr_accessible :book_name, :author, :price, :comments, :subject_id

   validates_presence_of :book_name
   validates_uniqueness_of :book_name
   validates_presence_of :subject_id

    def self.search(search)
      if search
        where('book_name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end

end
