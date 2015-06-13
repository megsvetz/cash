module MembersHelper
  def total_amount(member)
    sum = 0
    member.receipts.each do |r|
      sum += r.amount
    end
    return sum
  end
end
