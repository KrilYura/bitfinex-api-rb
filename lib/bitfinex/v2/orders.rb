module Bitfinex
  module V2::OrdersClient

    def new_order(params = {})
      ws_send([
        0,
        'on',
        'null',
        params
        # {
        #   'gid': 1,
        #   'cid': 12345,
        #   'type': 'LIMIT',
        #   'symbol': 'tBTCUSD',
        #   'amount': '0.002',
        #   'price': '500'
        # }
      ])
    end

    def new_orders(params = [])
      ws_send([
        0,
        'ox_multi',
        'null',
        params.map{|o| ['on', o]}
      ])
    end

    def cancel_orders(ids = [])
      ws_send([
        0,
        'oc_multi',
        'null',
        {
          'id': ids
        }
      ])
    end

    def orders pair = nil
      resp = authenticated_post('auth/r/orders').body
      resp.select!{|ord| ord[0] == pair} if pair
      resp.map do |ord|
        OpenStruct.new({
          id: ord[0],
          gid: ord[1],
          cid: ord[2],
          symbol: ord[3],
          mts_create: ord[4],
          mts_update: ord[5],
          amount: ord[6],
          amount_orig: ord[7],
          type: ord[8],
          type_prev: ord[9],
          # _placeholder: ord[10],
          # _placeholder: ord[11],
          flags: ord[12],
          status: ord[13],
          # _placeholder: ord[14],
          # _placeholder: ord[15],
          price: ord[16],
          price_avg: ord[17],
          price_trailing: ord[18],
          price_aux_limit: ord[19],
          # _placeholder: ord[20],
          # _placeholder: ord[21],
          # _placeholder: ord[22],
          hidden: ord[23],
          placed_id: ord[24],
        })
      end

    end

  end
end
