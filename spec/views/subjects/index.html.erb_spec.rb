require 'spec_helper'

describe "subjects/index.html.erb" do
  before(:each) do
    assign(:subjects, [
      stub_model(Subject,
        :subject_name => "Subject Name"
      ),
      stub_model(Subject,
        :subject_name => "Subject Name"
      )
    ])
  end

  it "renders a list of subjects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject Name".to_s, :count => 2
  end
end
