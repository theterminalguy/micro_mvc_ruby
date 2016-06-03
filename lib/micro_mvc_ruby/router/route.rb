module MicroMvcRuby
  module Routing
    class Route
      attr_reader :controller, :request, :action

      def initialize(request, controller_and_action)
        @controller, @action = controller_and_action
        @request = request
      end

      def dispatch
        controller.new(request).send(action)
        controller.render(action) unless controller.server_response
        controller.server_response
      end
    end
  end
end
