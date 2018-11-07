module Bitfinex
  module V2::SymbolsClient

    # Get a list of valid symbol IDs.
    #
    # @return [Array]
    # @example:
    # client.symbols
    def symbols
      get('symbols', version: 1).body
    end

    # Get detailed list of symbols
    #
    # @return [Array]
    # @example:
    # client.symbols_details
    def symbols_details
      get('symbols_details', version: 1).body
    end
  end
end
