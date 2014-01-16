require './bank_ocr'
require 'pry'

describe "something" do

  before do
    @raw_account_number = <<EOS
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
                           
EOS
  end

  it "should be bar" do
    expect(BankOCR.parse_account_number(@raw_account_number)).to eq("123456789")
  end

  it "should split lines" do
    expect(BankOCR.raw_account_number_lines(@raw_account_number).size).to eq(4)
  end

  it "should group numbers" do
    lines = BankOCR.raw_account_number_lines(@raw_account_number)
    groups = BankOCR.group_account_numbers(lines)
    binding.pry
    expect(groups.size).to eq(9)
    groups.each do |group|
      expect(group.size).to eq(3)
      expect(group[0].size).to eq(3)
    end
  end
end