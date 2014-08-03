class Loan < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	def self.n_requests_to_user(user_id)
		Loan.joins(:book).where('books.user_id' => user_id, 'loans.status' => 0).count
	end

	def self.requests_to_user(user_id)
		@loans = Loan.joins(:book).where('books.user_id' => user_id, 'loans.status' => 0)
	end

	def self.n_books_loaned(user_id)
		Loan.joins(:book).where('books.user_id' => user_id, 'loans.status' => 1).count
	end

	def self.books_loaned(user_id)
		@loans = Loan.joins(:book).where('books.user_id' => user_id, 'loans.status' => 1)
	end
end
