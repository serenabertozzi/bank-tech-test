require_relative "transaction"

class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log_transaction(transaction = Transaction.new)
    @transactions.push(transaction.current_transaction)
  end
end
