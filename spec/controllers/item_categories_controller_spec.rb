require 'rails_helper'

RSpec.describe ItemCategoriesController , :type => :feature do
	describe "GET item_categories#index" do
	  context "when user request for category listing" do
	    it "should list all categories details" do
	      @item_categories = ItemCategory.all
	      visit item_categories_path
	      @item_categories.each do |category|
	        expect(page).to have_content(category.name)
	      end
	    end
	  end
	end
	describe "GET item_categories#show" do
	  it "should render item_categories#show template" do
	   	item_category = ItemCategory.first
	    visit item_category_path(item_category.id)
	    expect(page).to have_content(item_category.name)
	  end
	end

	describe "POST item_categories#create" do
	  it "should create a new item_category" do
	    visit new_item_category_path
	    fill_in "item_category[name]", with: "Test Category"
	    expect { click_button "Save Category" }.to change(ItemCategory, :count).by(1)
	  end
	end

	describe "PUT item_categories#update" do
	  it "should update an existing story" do
	  	item_category = ItemCategory.first
	    visit edit_item_category_path(item_category)
	    fill_in "item_category[name]", with: "Category Edit"
	    click_button "Save Category"
	    expect(item_category.reload.name).to eq "Category Edit"
	  end
	end


	describe "DELETE item_categories#destroy" do
	  it "should delete a item_category" do
	    item_category = ItemCategory.first
	    visit item_category_path(item_category.id)
	    expect(page).to have_link("Destroy")
	    expect { click_link "Destroy" }.to change(ItemCategory, :count).by(-1)
	  end
	end

	describe "GET item_categories#get_items" do
	  context "when user request for categorie's  items" do
	    it "should list all categorie's items details" do
	      item_categories = ItemCategory.includes(:items)
	      visit get_items_item_categories_path
	      item_categories.each do |item_category|
	        expect(page).to have_content(item_category.name)
	        expect(page).to have_content(item_category.items.name)
	      end
	    end
	  end
	end
end
