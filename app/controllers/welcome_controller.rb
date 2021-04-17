class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @estudo= params[:estudo]
  end
end
