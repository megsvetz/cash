class AddAttachmentReceiptPicToReceipts < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t|
      t.attachment :receipt_pic
    end
  end

  def self.down
    remove_attachment :receipts, :receipt_pic
  end
end
