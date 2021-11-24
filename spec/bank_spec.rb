require "bank"

describe Bank do
  before do
    @transaction = Transaction.new
    @transaction.deposit(1000, "16/08/2021")
  end

  describe "#log_transaction" do
    it "logs a transaction in the transactions array" do
      print "==========="
      print @transaction.current_transaction
      print "==========="
      subject.log_transaction(@transaction)
      expect(subject.transactions).to eq [{ credit: true, amount: 1000, date: "16/08/2021" }]
    end
  end
end
