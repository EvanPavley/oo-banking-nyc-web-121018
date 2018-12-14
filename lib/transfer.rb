class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    #adds the amount to the receiver's account
    #subtracts the amount from the sender's balance

    if sender.balance > amount && @status == "pending"
      receiver.deposit(@amount)
      sender.withdrawal(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance > amount && @status == "complete"
      receiver.withdrawal(@amount)
      sender.deposit(@amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
