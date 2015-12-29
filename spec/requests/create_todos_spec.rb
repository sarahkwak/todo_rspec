require 'rails_helper'

RSpec.describe "CreateTodos", type: :feature do
  it "renders all existing tasks" do 
    todo = FactoryGirl.create(:todo)
    visit root_path
    expect(page).to have_content "Tea"
  end

  it "creates new todo" do 
    visit root_path
    fill_in "contents", with: "Make a coffee"
    click_button "New Task"
    expect(page).to have_content "coffee"
    expect(page).to have_link "Edit"
  end 

  it "has edit and delete button for each task" do 
    todo = FactoryGirl.create(:todo)
    visit root_path
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
  end 

   it "allows users to edit the task" do 
    todo = FactoryGirl.create(:todo)
    visit root_path
    click_link "Edit"
    fill_in "contents", with: "Need to buy more tea"
    click_button "Done"
    expect(page).to have_content "buy more"
  end 

  it "allows users to delete the task" do 
    todo = FactoryGirl.create(:todo)
    visit root_path
    click_link "Delete"
    expect(page).to have_content "Awesome"
    expect(Todo.count).to eql_to 0
  end 

end