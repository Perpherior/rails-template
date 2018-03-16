class V1::GiftCards::Endpoints < Grape::API
  resource :gift_cards do
    helpers do
      def current_user
      end

      def collection
      end

      def resource
      end
    end

    before do
      if current_user.nil?
        error!('Unauthorized Request', 401)
      end
    end

    get do
      list = {
        foo: bar
      }

      present list
    end

    route_param :id do
      before do
        if resource.nil?
          error!('Record not found', 404)
        end
      end
      get do
      end
    end
  end
end
