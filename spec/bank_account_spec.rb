require './bank_account' # links the spec and bank_account files
# DSL language, domain specific language, spec has tests
describe BankAccount do # describe is rpsec method
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  context 'has a balance' do # any english can be put here, :context is a method
    let(:account) do
      account = BankAccount.new(500, 'Sarah')
    end
    it 'is created with an opening balance and the name of the client' do
      account = BankAccount.new(500, 'Sarah')
      expect(account).to be_a(BankAccount)
    end
    it 'can report its balance' do
      account = BankAccount.new(500, 'Sarah')
      expect(account.balance).to eq(500)
    end
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  context 'making a deposit' do # every context is its own world/ test
    let(:account) do
      account = BankAccount.new(500, 'Sarah')
      account.deposit(500)
      account # returns something from account or let
    end
    it 'balance is increased' do
      expect(account.balance).to eq(1000)
    end
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  context 'making a withdrawal' do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.withdraw(200)
      account
    end
    it 'balance is descreased' do
      expect(account.balance).to eq(300)
    end
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  context 'transferring funds' do
    let(:account) do
    account = BankAccount.new(500, "Sarah")
    account.transfer_to(100)
    account
  end
  let(:other_account) do
    account = BankAccount.new(1000, "JOHHNY BRO")
    account.transfer_from(100)
    account
  end
    it 'account balance is descreased'do
      expect(account.balance).to eq(400)
    end
    it 'other account balance is increased' do
      expect(other_account.balance).to eq(1100)
    end
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  context 'minimun balance' do
    it 'raises an error if opening balance is too low' do
      expect{BankAccount.new(199, "College Kid")}.to raise_error(ArgumentError)
    end
    it 'does NOT raise an error if opening baance is over minimm balance' do
      expect{BankAccount.new(201, "College Graduate PHD")}.to_not raise_error
    end
    it 'allows the bank owner to change the minimum balance' do
      BankAccount.minimum_balance = 100
      expect(BankAccount.minimum_balance).to eq(100)
    end
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
end
