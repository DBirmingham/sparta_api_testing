require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('tw106tf') #input a postcode
    end

    it "should respond with a status message of 200" do
        expect(@response["status"]).to eq 200
    end

    it "should have a results hash" do
        expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
        expect(@response["result"]["postcode"].delete(' ').length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
        expect(@response["result"]["quality"]).to be_between 1, 9
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@response["result"]["eastings"]).to be_a Integer
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@response["result"]["eastings"]).to be_a Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        expect(["England", "Scotland", "Wales", "Northern Ireland"]).to include(@response["result"]["country"])
    end

    it "should return a string value for NHS authority " do
        expect(@response["result"]["nhs_ha"]).to be_a String
    end

    it "should return a longitude float value" do
        expect(@response["result"]["longitude"]).to be_a Float
    end

    it "should return a latitude float value" do
        expect(@response["result"]["latitude"]).to be_a Float
    end

    it "should return a parliamentary constituency string" do
        expect(@response["result"]["parliamentary_constituency"]).to be_a String
    end

    it "should return a european_electoral_region string" do
        expect(@response["result"]["european_electoral_region"]).to be_a String
    end

    it "should return a primary_care_trust string" do
        expect(@response["result"]["primary_care_trust"]).to be_a String
    end

    it "should return a region string" do
        expect(@response["result"]["region"]).to be_a String
    end

    it "should return a parish string" do
        expect(@response["result"]["parish"]).to be_a String
    end

    it "should return a lsoa string" do
        expect(@response["result"]["lsoa"]).to be_a String
    end

    it "should return a msoa string" do
        expect(@response["result"]["msoa"]).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        expect(@response["result"]["admin_district"]).to be_a String
    end

    it "should return a incode string of three characters" do
        expect(@response["result"]["incode"]).to be_a String
        expect(@response["result"]["incode"].length).to eq 3
    end

    it "should return a msoa string" do
        expect(@response["result"]["msoa"]).to be_a String
    end

    it "should return a outcode string of 3-4 characters" do
        expect(@response["result"]["outcode"]).to be_a String
        expect(@response["result"]["outcode"].length).to be_between 3, 4
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['sw65bw', 'tw106tf'])
      @first_result = @response["result"][0]["result"]
      @second_result = @response["result"][1]["result"]
    end

    it "should respond with a status message of 200" do
        expect(@response["status"]).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
        expect(@response["result"][0]["query"]).to eq 'sw65bw'
    end

    it "should return the second query as the first postcode in the response" do
        expect(@response["result"][1]["query"]).to eq 'tw106tf'
    end

    it "should have a results hash" do
        expect(@first_result).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
        expect(@first_result["postcode"].delete(' ').length).to be_between 5, 7
    end

    it "should return an quality key integer between 1-9" do
        expect(@first_result["quality"]).to be_between 1,9
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@first_result["eastings"]).to be_a Integer
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@first_result["eastings"]).to be_a Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        expect(["England", "Scotland", "Wales", "Northern Ireland"]).to include(@first_result["country"])
    end

    it "should return a string value for NHS authority " do
        expect(@first_result["nhs_ha"]).to be_a String
    end

    it "should return a longitude float value" do
        expect(@first_result["longitude"]).to be_a Float
    end

    it "should return a latitude float value" do
        expect(@first_result["latitude"]).to be_a Float
    end

    it "should return a parliamentary constituency string" do
        expect(@first_result["parliamentary_constituency"]).to be_a String
    end

    it "should return a european_electoral_region string" do
        expect(@first_result["european_electoral_region"]).to be_a String
    end

    it "should return a primary_care_trust string" do
        expect(@first_result["primary_care_trust"]).to be_a String
    end

    it "should return a region string" do
        expect(@first_result["region"]).to be_a String
    end

    it "should return a parish string" do
        expect(@first_result["parish"]).to be_a String
    end

    it "should return a lsoa string" do
        expect(@first_result["lsoa"]).to be_a String
    end

    it "should return a msoa string" do
        expect(@first_result["msoa"]).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        expect(@first_result["admin_district"]).to be_a String
    end

    it "should return a incode string of three characters" do
        expect(@first_result["incode"].length).to eq 3
        
    end

    it "should return a msoa string" do
        expect(@first_result["msoa"]).to be_a String
        
    end

    it "should return a outcode string of 3-4 characters" do
        expect(@first_result["outcode"].length).to be_between 3, 4
    end

    it "should have a results hash" do
        expect(@second_result).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
        expect(@second_result["postcode"].delete(' ').length).to be_between 5, 7
    end

    it "should return an quality key integer between 1-9" do
        expect(@second_result["quality"]).to be_between 1,9
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@second_result["eastings"]).to be_a Integer
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@second_result["eastings"]).to be_a Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        expect(["England", "Scotland", "Wales", "Northern Ireland"]).to include(@second_result["country"])
    end

    it "should return a string value for NHS authority " do
        expect(@second_result["nhs_ha"]).to be_a String
    end

    it "should return a longitude float value" do
        expect(@second_result["longitude"]).to be_a Float
    end

    it "should return a latitude float value" do
        expect(@second_result["latitude"]).to be_a Float
    end

    it "should return a parliamentary constituency string" do
        expect(@second_result["parliamentary_constituency"]).to be_a String
    end

    it "should return a european_electoral_region string" do
        expect(@second_result["european_electoral_region"]).to be_a String
    end

    it "should return a primary_care_trust string" do
        expect(@second_result["primary_care_trust"]).to be_a String
    end

    it "should return a region string" do
        expect(@second_result["region"]).to be_a String
    end

    it "should return a parish string" do
        expect(@second_result["parish"]).to be_a String
    end

    it "should return a lsoa string" do
        expect(@second_result["lsoa"]).to be_a String
    end

    it "should return a msoa string" do
        expect(@second_result["msoa"]).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        expect(@second_result["admin_district"]).to be_a String
    end

    it "should return a incode string of three characters" do
        expect(@second_result["incode"].length).to eq 3
    end

    it "should return a msoa string" do
        expect(@second_result["msoa"]).to be_a String
    end

    it "should return a incode string of 3-4 characters" do
        expect(@second_result["outcode"].length).to be_between 3, 4
    end

  end


end
