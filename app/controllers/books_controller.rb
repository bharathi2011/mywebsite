class BooksController < ApplicationController
 helper_method :sort_column, :sort_direction

  def index
     @books = Book.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
   end


   def show
     @book = Book.find(params[:id])
     @subject = Subject.find(@book.subject_id)
   end


   def new
     @book = Book.new
     @subjects = Subject.find(:all, :order => 'subject_name')
   end


   def edit
     @book = Book.find(params[:id])
     @subjects = Subject.find(:all, :order => 'subject_name')
   end


   def create
     @book = Book.new(params[:book])
     @subjects = Subject.find(:all, :order => 'subject_name')

     if @book.save
        flash[:notice] = "Book was successfully added."
        redirect_to @book
     else
         render :action => 'new'
     end

   end


   def update
     @book = Book.find(params[:id])

     if @book.update_attributes(params[:book])
         flash[:notice] = "Book was successfully added."
         redirect_to @book
     else
         render :action => 'edit'
     end

   end


   def destroy
     @book = Book.find(params[:id])
     @book.destroy

     flash[:notice] = "Successfully removed the book from the list."
     redirect_to book_url

   end

  private

   def sort_column
      Book.column_names.include?(params[:sort]) ? params[:sort] : "book_name"
   end

   def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end

end
