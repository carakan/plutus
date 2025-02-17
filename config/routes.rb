Plutus::Engine.routes.draw do
  get 'reports/balance_sheet' => 'reports#balance_sheet'
  get 'reports/income_statement' => 'reports#income_statement'

  resources :accounts, only: [:index]
  resources :entries, only: [:index]
end
