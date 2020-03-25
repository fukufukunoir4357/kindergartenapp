require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(user_name image_name how_many price)
  csv << csv_column_names
   @payments.each do |payment|
     csv_column_values = [
             payment.user.name,
             payment.image_name,
             payment.howmany,
             payment.price
            ]
    csv << csv_column_values
  end
end