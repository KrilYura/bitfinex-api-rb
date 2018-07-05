module Bitfinex
  module V2::PositionsClient
    def positions
      resp = authenticated_post("auth/r/positions").body

      resp.map do |pos|
        OpenStruct.new({
          symbol: pos[0],
          status: pos[1],
          amount: pos[2],
          base_price: pos[3],
          margin_funding: pos[4],
          margin_funding_type: pos[5],
          pl: pos[6],
          pl_perc: pos[7],
          price_liq: pos[8],
          leverage: pos[9]
        })
      end
    rescue Exception => ex
      p ex.inspect
      p resp
      raise
    end
  end
end
