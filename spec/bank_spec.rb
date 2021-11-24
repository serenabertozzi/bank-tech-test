require "bank"

STATEMENT = "date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00"

RESULT = "date || credit || debit || balance
10/01/2023 || 1000.00 ||  || 1000.00
13/01/2023 || 2000.00 ||  || 2000.00
14/01/2023 ||  || 500.00 || -500.00\n"

describe Bank do
  describe "#log_transaction" do
    before do
      @transaction = Transaction.new
      @transaction.deposit(1000, "16/08/2021")
    end

    it "logs a transaction in the transactions array" do
      subject.log_transaction(@transaction)
      expect(subject.transactions).to eq [{ credit: true, amount: 1000, date: "16/08/2021", balance: 1000 }]
    end
  end

  describe "#print_transactions" do
    before do
      @transaction = Transaction.new
      @transaction.deposit(1000, "10/01/2023")

      @transaction_2 = Transaction.new
      @transaction_2.deposit(2000, "13/01/2023")

      @transaction_3 = Transaction.new
      @transaction_3.withdraw(500, "14/01/2023")
    end

    it "prints the log of transactions" do
      subject.log_transaction(@transaction)
      subject.log_transaction(@transaction_2)
      subject.log_transaction(@transaction_3)
      expect { subject.print_transactions }.to output(RESULT).to_stdout
    end
  end
end
