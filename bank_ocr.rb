class BankOCR
  def self.parse_account_number(raw_acct_number)
  end

  def self.raw_account_number_lines(raw_acct_number)
    raw_acct_number.split("\n")
  end

  def self.group_account_numbers(account_number_lines)
    numbers = (0..8).to_a.map { [] }
    account_number_lines = account_number_lines.map { |line| line.split("") }
    account_number_lines[0].zip(*account_number_lines[1..2]).each_with_index do |item, index|
      numbers[index / 3] << item
    end
    numbers
  end
end