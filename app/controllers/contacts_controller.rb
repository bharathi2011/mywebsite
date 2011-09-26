class ContactsController < ApplicationController

  def index
    @contacts = Contact.search(params[:search])
  end



  def show
    @contact = Contact.find(params[:id])
  end


  def new
    @contact = Contact.new
  end


  def edit
    @contact = Contact.find(params[:id])
  end


  def create
    @contact = Contact.new(params[:contact])

      if @contact.save
        flash[:notice] = "Successfully created a contact."
        redirect_to @contact
      else
        render :action => 'new'
      end
  end


   def update
    @contact = Contact.find(params[:id])

      if @contact.update_attributes(params[:contact])
        flash[:notice] = "successfully updated a contact."
        redirect_to @contact
      else
        render :action => 'edit'
    end
  end


  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:notice] = "successfully deleted a contact"
    redirect_to contacts_url

  end

  end

