class BankAccount
  attr_reader :balance, :client_name, :initial_deposit
  # attr_reader is a method that creates methods
  # attr_reader methods only used to return values


  @@minimum_balance = 200

  def initialize(balance, client_name)
    @balance = balance
    @client_name = client_name
    if balance <= 200 # this is for "raises an error if opening balance is too low"
      raise ArgumentError
    end

  end


  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def withdraw(withdrawal_amount)
    @balance -= withdrawal_amount
  end

  def transfer_to(funds)
    @balance -= funds
  end

  def transfer_from(funds)
    @balance += funds
  end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# First line is for BankAccount.minimum_balance==..... to write a new balance
# Second line is to confirm that minimum balance is set
  def self.minimum_balance=(num)
    @@minimum_balance = num
  end
  def self.minimum_balance
    @@minimum_balance

  end
end
