module FamiliesHelper
    def family_total_amount(family)
    sum = 0
    family.members.each do |m|
      m.receipts.each do |r|
        sum += r.amount
      end
    end
    return sum
  end
end
