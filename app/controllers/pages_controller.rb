class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout 'application', only: :home

  def home
  end

  def profil
  end
end
