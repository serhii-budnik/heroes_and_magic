class Account < ApplicationRecord
  has_and_belongs_to_many :lobbies
  belongs_to :user
  has_many :units, dependent: :destroy

  scope :accounts,     lambda {|lobby_accounts| where(id: lobby_accounts)}
  scope :current_account, lambda {|lobby_accounts,user| where(id: lobby_accounts,user_id: user)}
  scope :accounts_from_lobby, lambda {|lobby_accounts| where(id: lobby_accounts)}
  scope :accounts_with_step_true, lambda {|lobby_accounts| where(id: lobby_accounts, current_step: true)}
end
