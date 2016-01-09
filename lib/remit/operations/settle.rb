require 'remit/common'

module Remit
  module Settle
    class Request < Remit::Request
      action :Settle
      parameter :reserve_transaction_id, :required => true
      parameter :transaction_amount, :type => Remit::RequestTypes::Amount
      parameter :transaction_date
    end

    class Response < Remit::Response
      parameter :settle_result, :type => Remit::TransactionResponse
      parameter :response_metadata, :type=>ResponseMetadata
    end

    def settle(request = Request.new)
      call(request, Response)
    end
  end
end
