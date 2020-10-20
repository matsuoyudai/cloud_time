class Apply < ApplicationRecord
	belongs_to :user
	has_one :attendance
	has_one :vacation
	enum status: {承認待ち: 0, 非承認: 1, 承認済み: 2}
end
