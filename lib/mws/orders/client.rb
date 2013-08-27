module MWS
  module Orders
    class Client < ::Peddler::Orders
      extend Forwardable

      # Public: Get one or more orders.
      #
      # amazon_order_ids - One or more String Amazon order ids.
      #
      # Examples
      #
      #   client.get_order('123-1234567-1234567')
      #
      # Returns an enumerable list of Orders.
      def_delegator :orders, :get, :get_order

      # Public: List orders created or updated during a specified time frame.
      #
      # params - The Hash request parameters used to narrow the orders list.
      #          Refer to the MWS Orders API for available parameters.
      #
      # Examples
      #
      #   client.list_orders(created_after: 1.week.ago)
      #
      # Returns an enumerable list of Orders.
      def_delegator :orders, :list, :list_orders

      # Public: List the next page of orders using the NextToken parameter.
      #
      # Examples
      #
      #   client.list_orders_by_next_token
      #
      # Returns an enumerable list of Orders.
      def_delegator :orders, :list_by_next_token, :list_orders_by_next_token

      # Public: List order items for an amazon order.
      #
      # amazon_order_id - The String Amazon order id.
      #
      # Examples
      #
      #   client.list_order_items('123-1234567-1234567')
      #
      # Returns an enaumerable list of Order Items.
      def_delegator :order_items, :list, :list_order_items

      # Public: List the next page of order items using the NextToken
      # parameter.
      #
      # Examples
      #
      #   client.list_order_items_by_next_token
      #
      # Returns an enaumerable list of Order Items.
      def_delegator :order_items, :list_by_next_token, :list_order_items_by_next_token

      # Public: Get the service status of the API.
      #
      # Examples
      #
      #   client.get_service_status
      #
      # Returns the Service Status.
      def_delegator :service_status, :get, :get_service_status

      # Internal: Returns the String home marketplace id of the client.
      def home_marketplace_id
        marketplace_id(country)
      end

      private

      def orders
        @orders ||= Request::Orders.new(self)
      end

      def order_items
        @order_items ||= Request::OrderItems.new(self)
      end

      def service_status
        @service_status ||= Request::ServiceStatus.new(self)
      end
    end
  end
end
