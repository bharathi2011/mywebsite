require 'spec_helper'

describe "books/new.html.erb" do
  before(:each) do
    assign(:book, stub_model(Book,
      :book_name => "MyString",
      :author => "MyString",
      :price => 1.5,
      :comments => "MyString",
      :subject_id => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path, :method => "post" do
      assert_select "input#book_book_name", :name => "book[book_name]"
      assert_select "input#book_author", :name => "book[author]"
      assert_select "input#book_price", :name => "book[price]"
      assert_select "input#book_comments", :name => "book[comments]"
      assert_select "input#book_subject_id", :name => "book[subject_id]"
    end
  end
end
