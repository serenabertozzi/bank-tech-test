require "transaction"

describe Transaction do
  describe "#deposit" do
    it { is_expected.to respond_to :deposit }

    it "adds the deposited amount to the current balance" do
      subject.deposit(1000, nil)
      expect(subject.current_balance).to eq 1000
    end

    it "is a credit transaction" do
      subject.deposit(1000, nil)
      expect(subject.is_credit).to be true
    end

    it "saves the current deposit transaction" do
      subject.deposit(1000, "16/08/2021")
      expect(subject.current_transaction).to eq({ credit: true, amount: 1000, date: "16/08/2021", balance: 1000 })
    end
  end

  describe "#withdraw" do
    it { is_expected.to respond_to :withdraw }

    it "subtracts the withdrawed amount to the current balance" do
      subject.current_balance = 1000
      subject.withdraw(500, nil)
      expect(subject.current_balance).to eq 500
    end
  end
end
