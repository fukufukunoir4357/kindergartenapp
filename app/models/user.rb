class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :firstchild,presence: true, on: :create
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_many :buys
  has_many :bought_pictures, through: :buys, source: :pictures
  
  
  #CSVファイル読み込み一括登録の処理
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      user = find_by(id: row['Id']) || new
      # CSVからデータを取得し、設定する
      user.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      user.save!
    end
  end
  #登録するカラム許可      
  def self.updatable_attributes
    [ 'name', 'firstchild','password', 'password_confirmation']
  end
  
  
  #ユーザー検索
  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
  
  
end
