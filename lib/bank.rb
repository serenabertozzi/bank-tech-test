require_relative "transaction"

class Bank
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log_transaction(transaction = Transaction.new)
    @transactions.push(transaction.current_transaction)
  end

  def print_transactions
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      if transaction[:credit] == true
        puts "#{transaction[:date]} || #{transaction[:amount]}.00 ||  || #{transaction[:balance]}.00"
      else
        puts "#{transaction[:date]} ||  || #{transaction[:amount]}.00 || #{transaction[:balance]}.00"
      end
    end
  end
end
