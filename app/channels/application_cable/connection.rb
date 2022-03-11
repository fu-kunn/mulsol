# module ApplicationCable
#   class Connection < ActionCable::Connection::Base
#     identified_by :current_customer

#     def connect
#       self.current_customer = find_verified_customer
#     end

#     protected
#     def find_verified_customer
#       verified_customer = Customer.find_by(id: env['warden'].customer.id)
#       return reject_unauthorized_connection unless verified_customer
#       verified_customer
#     end

#     def session
#       cookies.encrypted[Rails.application.config.session_options[:key]]
#     end
#   end
# end
