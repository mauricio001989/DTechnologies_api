module Api
  module V1
    class BinarysController < ApiController
      # GET /api/v1/binarys/N
      def show
        render json: json
      end

      private

      def json
        {
          integer: param,
          binary: binary,
          more_long: more_long,
          split_for_0: split_for
        }
      end

      def param
        @param ||= params[:id]
      end

      def binary
        @binary ||= (param.to_i).to_s(2)
      end

      def split_for
        @split_for ||= binary.split('1')
      end

      def more_long
        long = 0
        split_for.each { |array| long = array.length if array.length > long }
        long
      end
    end
  end
end
