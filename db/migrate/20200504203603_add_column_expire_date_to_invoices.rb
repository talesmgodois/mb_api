class AddColumnExpireDateToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :expiration_date, :date
  end
end
