require 'spec_helper'

describe Product do
  before do
    properties = Property.create([{ name: 'Name', value: 'Foo' }, { name: 'ExternalID', value: 'ABC123'}, { name: 'Other', value: 'Bar' }])
    @product = Product.new
    @product.properties << properties
    @product.save
  end

  specify "external id doesn't change when retrieved from scope" do
    Product.scoped.first.external_id.should eq @product.external_id
  end  

  specify "external id doesn't change when retrieved from scope w different include" do
    Product.scoped.includes(:name_values).first.external_id.should eq @product.external_id
  end  

  specify "external id doesn't change when retrieved from scope w same include" do
    Product.scoped.includes(:external_id_values).first.external_id.should eq @product.external_id
  end  

  specify "external id doesn't change when retrieved from scope w both includes" do
    Product.scoped.includes(:name_values, :external_id_values).first.external_id.should eq @product.external_id
  end

  specify "including properties includes all properties" do
    Product.scoped.includes(:name_values, :properties).first.properties.to_a.count.should eq @product.properties.to_a.count
  end
end
