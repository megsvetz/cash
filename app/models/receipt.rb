class Receipt < ActiveRecord::Base
  belongs_to :member
  validates_presence_of :name, :date, :amount
  # necessary stuff for paperclip
  has_attached_file :receipt_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :receipt_pic, :content_type => /\Aimage\/.*\Z/

  def self.by_date
    order(:date)
  end

  def self.by_name
    order(:name)
  end

  def self.by_amount
    order(:amount)
  end
end
