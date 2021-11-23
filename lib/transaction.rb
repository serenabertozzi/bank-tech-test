class Transaction
  attr_reader :current_transaction, :is_credit
  attr_accessor :current_balance

  def initialize
    @current_transaction = {}
    @current_balance = 0
    @is_credit = false
  end
end
