require 'rails_helper'

RSpec.describe ItemTaxesController, :type => :feature do
	describe "GET item_taxes#index" do
	  context "when user request for item taxes listing" do
	    it "should list all item taxes details" do
	      @item_taxes = ItemTax.all
	      visit item_taxes_path
	      @item_taxes.each do |item_tax|
	      	expect(page).to have_content(item_tax.item.name)
	        expect(page).to have_content(item_tax.tax_type)
	        expect(page).to have_content(item_tax.tax)
	      end
	    end
	  end
	end
	describe "GET item_taxes#show" do
	  it "should render item_taxes#show template" do
	   	item_tax = ItemTax.first
	    visit item_tax_path(item_tax.id)
	    expect(page).to have_content(item_tax.item.name)
	    expect(page).to have_content(item_tax.tax_type)
	    expect(page).to have_content(item_tax.tax)
	  end
	end

	describe "POST item_taxes#create" do
	  it "should create a new item_tax" do
	    visit new_item_tax_path
	    select "Book 3", :from => "item_tax[item_id]"
	    select "PERCENTAGE", :from => "item_tax[tax_type]"
	    fill_in "item_tax[tax]", with: "10"
	    expect { click_button "Save Item Tax" }.to change(ItemTax, :count).by(1)
	  end
	end

	describe "PUT item_taxes#update" do
	  it "should update an existing item_tax" do
	  	item_tax = ItemTax.first
	    visit edit_item_tax_path(item_tax)
	    select "Book 3", :from => "item_tax[item_id]"
	    fill_in "item_tax[tax]", with: "15"
	    click_button "Save Item Tax"
	    expect(item_tax.reload.tax).to eq 15
	  end
	end


	describe "DELETE item_taxes#destroy" do
	  it "should delete a item_tax" do
	    item_tax = ItemTax.first
	    visit item_tax_path(item_tax.id)
	    expect(page).to have_link("Destroy")
	    expect { click_link "Destroy" }.to change(ItemTax, :count).by(-1)
	  end
	end
end