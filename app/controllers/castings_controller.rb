class CastingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
end
