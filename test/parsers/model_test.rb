require_relative 'test_helper'

class ModelParserTest < ParserTest
  def test_parses_money
    xml = <<-EOF
    <Price xmlns="example">
      <CurrencyCode>USD</CurrencyCode>
      <Amount>10.00</Amount>
    </Price>
    EOF
    model = Parser::Model.new(Nokogiri(xml))
    money = model.money_at_xpath('Price')
    assert_equal '$10.00', money.format
  end

  def test_parses_japanese_yen
    xml = <<-EOF
    <Price xmlns="example">
      <CurrencyCode>JPY</CurrencyCode>
      <Amount>1000.00</Amount>
    </Price>
    EOF
    model = Parser::Model.new(Nokogiri(xml))
    money = model.money_at_xpath('Price')
    assert_equal '¥1,000', money.format
  end
end
