require 'spec_helper'




RSpec.describe "Sign up" do

let (:first) {"Ime"}
let(:last) {"Prezime"}
let(:email) {"nekimailcicov@gmail.com"}
let(:password) {"password"}
let(:confirm) {"password"}

	before(:all){
		
  			@browser= Watir::Browser.new :firefox
  			@browser.goto "http://ah-test.abhapp.com/login" 
  		
  		}


  	context "Click on Sign up" do

  		it "Sign up Page" do
  			@browser.b(:text=>"Sign up").click 
  			expect(@browser.text).to include("SIGN UP")
  		end
  	end

  	context "Add information" do
  		it "First name added"do
  		@browser.text_field(:placeholder=>"First name").set(first)
  	end

  	it "Last name added" do
  		@browser.text_field(:placeholder=>"Last name").set(last)
  	end

  	it "Email added" do
  		@browser.text_field(:placeholder=>"Email").set(email)
  	end

  	it "Password" do
  		@browser.text_field(:placeholder=>"Password").set(password)
  	end

  	it "Confirm Password" do
  		@browser.text_field(:placeholder=>"Confirm Password").set(confirm)
  	end



  	end

  	context "Click on button Sign up" do
  		it "List of companies" do
  			@browser.button(:text=>"Sign up").click
  		end

  	end


  	context "Click on Create one" do
  		it "New window" do

  		
  			@browser.link(:text=>"Create one").click
  		end


  	end





end
