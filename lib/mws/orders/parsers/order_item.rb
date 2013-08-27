module MWS
  module Orders
    module Parser
      class OrderItem < Model
        value :asin do
          text_at_xpath('ASIN')
        end

        value :order_item_id do
          text_at_xpath('OrderItemId')
        end

        value :seller_sku do
          text_at_xpath('SellerSKU')
        end

        value :title do
          text_at_xpath('Title')
        end

        value :quantity_ordered do
          integer_at_xpath('QuantityOrdered')
        end

        value :quantity_shipped do
          integer_at_xpath('QuantityShipped')
        end

        value :item_price do
          money_at_xpath('ItemPrice')
        end

        value :shipping_price do
          money_at_xpath('ShippingPrice')
        end

        value :scheduled_delivery_ends_at do
          time_at_xpath('ScheduledDeliveryEndDate')
        end

        value :scheduled_delivery_starts_at do
          time_at_xpath('ScheduledDeliveryStartDate')
        end

        value :cod_fee do
          money_at_xpath('CODFee')
        end

        value :cod_fee_discount do
          money_at_xpath('CODFeeDiscount')
        end

        value :gift_message_text do
          text_at_xpath('GiftMessageText')
        end

        value :gift_wrap_price do
          money_at_xpath('GiftWrapPrice')
        end

        value :gift_wrap_level do
          text_at_xpath('GiftWrapLevel')
        end
      end
    end
  end
end
