require 'rails_helper'

RSpec.describe ItemsController, :type => :feature do
	describe "GET items#index" do
	  context "when user request for items listing" do
	    it "should list all items details" do
	      items = Item.all
	      visit items_path
	      items.each do |item|
	        expect(page).to have_content(item.name)
	        expect(page).to have_content(item.item_category.name)
	        expect(page).to have_content(item.item_category_id)
	        expect(page).to have_content(item.rate)
	      end
	    end
	  end
	end
	describe "GET items#show" do
	  it "should render items#show template" do
	   	item = Item.first
	    visit item_path(item.id)
	    expect(page).to have_content(item.name)
	    expect(page).to have_content(item.item_category.name)
	    expect(page).to have_content(item.item_category_id)
	    expect(page).to have_content(item.rate)
	  end
	end

	describe "POST items#create" do
	  it "should create a new item" do
	    visit new_item_path
	    select "Category 1", :from => "item[item_category_id]"
	    fill_in "item[name]", with: "Test Item"
	    fill_in "item[rate]", with: "15"
	    expect { click_button "Save Item" }.to change(Item, :count).by(1)
	  end
	end

	describe "PUT items#update" do
	  it "should update an existing item" do
	    item = Item.first
	    visit edit_item_path(item)
	    select "Category 1", :from => "item[item_category_id]"
	    fill_in "item[name]", with: "Edit Item"
	    fill_in "item[rate]", with: "15"
	    click_button "Save Item"
	    expect(item.reload.name).to eq "Edit Item"
	    expect(item.rate).to eq 15
	  end
	end


	describe "DELETE items#destroy" do
	  it "should delete a item" do
	    item = Item.first
	    visit item_path(item.id)
	    expect(page).to have_link("Destroy")
	    expect { click_link "Destroy" }.to change(Item, :count).by(-1)
	  end
	end

	describe "GET items#get_selected_items" do
	  it "should get selected item total values" do
	    item = Item.first
	    items = Item.joins(:item_tax).select("items.name as item_name,items.id as item_id,rate,tax_type,tax").where(:id =>item.id)
	    visit get_selected_items_items_path(item_ids: [item.id])
	    
	    items.each do |item|
	        expect(page).to have_content(item.item_name)
	        expect(page).to have_content(item.rate)
	        expect(page).to have_content(item.tax)
	    end
	  end
	end
end