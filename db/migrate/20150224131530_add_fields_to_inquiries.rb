class AddFieldsToInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :company, :string
    add_column :refinery_inquiries_inquiries, :street, :string
add_column :refinery_inquiries_inquiries, :city, :string
add_column :refinery_inquiries_inquiries, :zip, :string
add_column :refinery_inquiries_inquiries, :country, :string
add_column :refinery_inquiries_inquiries, :fax, :string
add_column :refinery_inquiries_inquiries, :room, :string
add_column :refinery_inquiries_inquiries, :arrival, :datetime
add_column :refinery_inquiries_inquiries, :departure, :datetime
  end
end
