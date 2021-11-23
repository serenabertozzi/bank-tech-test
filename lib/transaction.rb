class Transaction
  attr_reader :current_transaction, :is_credit
  attr_accessor :current_balance

  def initialize
    @current_transaction = {}
    @current_balance = 0
    @is_credit = false
  end

  def deposit(amount, date)
    @current_balance += amount
    @is_credit = true
    save_transaction(amount, date)
  end

  def withdraw(amount, date)
    @current_balance -= amount
  end

  private

  def save_transaction(amount, date)
    @current_transaction = { credit: @is_credit, amount: amount, date: date }
  end
end
