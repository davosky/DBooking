# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.user_type == 'admin'
  end

  config.parent_controller = 'ApplicationController'

  config.main_app_name = ['booking.cgil']

  config.model 'User' do
    visible true
    label 'Utente'
    label_plural 'Utenti'
  end

  config.model 'Category' do
    visible true
    label 'Categoria'
    label_plural 'Categorie'
  end

  config.model 'MeetingRoom' do
    visible false
    label 'Sala Prenotabile'
    label_plural 'Sale Prenotabili'
  end

  config.model 'BigRoom' do
    visible true
    label 'Prenotazione SC'
    label_plural 'Prenotazioni SC'
  end

  config.model 'SmallRoom' do
    visible true
    label 'Prenotazione SR'
    label_plural 'Prenotazioni SR'
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
