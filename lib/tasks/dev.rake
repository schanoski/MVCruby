namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando BD")
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success("(Apagado com sucesso!)")

      spinner = TTY::Spinner.new("[:spinner] Criando BD")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success("(Criado com sucesso!)")

      spinner = TTY::Spinner.new("[:spinner] Migrando o BD")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("(Migrado com sucesso!)")

      spinner = TTY::Spinner.new("[:spinner] Inserindos os elementos no BD")
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success("(Criado com sucesso!)")
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

end
