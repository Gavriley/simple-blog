class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :login, :uniqueness => 
  											{ message: 'Даний логін вже використовується.' },   
  									:format => 
  											{ with: /^[a-zA-Z0-9_\.]*$/, multiline: true, message: "В логіні присутні недопустимі символи." },
  									:length => 
  											{ within: 2..20, too_short: "Мінімум 6 символів повинен містити логін", too_long: "Максимальний розмір логіна 20 символів" } 

  validates :blog_name, :presence => 
                          { message: "Заповніть поле назва блогу"  }, 
                        :length => 
                          { maximum: 20, too_long: "Максимальний розмір назви блогу 20 символів" }
                                                  

  has_many :posts
  has_many :categories
  belongs_to :role
  before_create :set_role

  private
    def set_role
      self.role ||= Role.find_by_name('guest')
    end 
end
