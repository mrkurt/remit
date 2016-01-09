require 'remit/common'

module Remit
  module WriteOffDebt
    class Request < Remit::Request
      action :WriteOffDebt
      parameter :credit_instrument_id, :required => true
      parameter :adjustment_amount, :required => true
      parameter :transaction_date
      parameter :sender_reference
      parameter :caller_reference, :required => true
      parameter :recipient_reference
      parameter :sender_description
      parameter :caller_description
    end

    class Response < Remit::Response
      parameter :write_off_debt_result, :type => Remit::TransactionResponse
      parameter :response_metadata, :type=>ResponseMetadata
    end

    def write_off_debt(request = Request.new)
      call(request, Response)
    end
  end
end
