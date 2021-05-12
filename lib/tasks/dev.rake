namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD"){ %x(rails db:drop) }
      show_spinner("Criando o BD") { %x(rails db:create) }
      show_spinner("Migrando o BD"){ %x(rails db:migrate) }
      show_spinner("Inserindo Elemento no BD"){ %x(rails db:seed) }
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(Concluído!)")
  end
end
