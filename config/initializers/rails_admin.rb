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
    configure :name do
      label 'Nome'
    end
    configure :surname do
      label 'Cognome:'
    end
    configure :office do
      label 'Ufficio:'
    end
    configure :user_type do
      label 'Tipologia utente:'
    end
    configure :category do
      label 'Categoria:'
    end
    configure :province do
      label 'Provincia:'
    end
    configure :created_at do
      label 'Creato il:'
    end
    configure :updated_at do
      label 'Aggiornato il:'
    end
  end

  config.model 'MeetingRoom' do
    visible true
    label 'Sala Prenotabile'
    label_plural 'Sale Prenotabili'
    configure :code do
      label 'Codice'
    end
    configure :name do
      label 'Nome:'
    end
    configure :description do
      label 'Descrizione:'
    end
    configure :created_at do
      label 'Creato il:'
    end
    configure :updated_at do
      label 'Aggiornato il:'
    end
  end

  config.model 'BigRoom' do
    visible true
    label 'Prenotazione SC'
    label_plural 'Prenotazioni Salone Conferenze'
    configure :name do
      label 'Codice'
    end
    configure :start_time do
      label 'Data e ora inizio:'
    end
    configure :end_time do
      label 'Data e ora fine:'
    end
    configure :bookable do
      label 'Prenotabile:'
    end
    configure :booked do
      label 'Prenotata:'
    end
    configure :category do
      label 'Categoria:'
    end
    configure :created_at do
      label 'Creato il:'
    end
    configure :updated_at do
      label 'Aggiornato il:'
    end
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
