namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Gerando Migrações...") { %x(rails db:migrate) }
      %x(rails dev:add_authors)
      %x(rails dev:add_books)
    else
      puts "Você não está em desenvolvimento"
    end
  end

  desc "Cadastro de Livros"
  task add_books: :environment do
    show_spinner("Cadastrando Livros...") do
      books = [
        {description: "Berserk", year: 1996, pages: 244, author: Author.find_by(description:'Kentarou')},
        {description: "Generic Book 1", year: 1996, pages: 104, author: Author.all.sample},
        {description: "Generic Book 2", year: 1996, pages: 364, author: Author.all.sample},
      ]

      books.each do |book|
        Book.find_or_create_by(book)
      end
    end
  end

  desc "Cadastro de Autores"
  task add_authors: :environment do
    show_spinner("Cadastrando Autores...") do
      authors = [
        {description: "Kentarou", age: 50, country: "Japan"},
        {description: "Gabriel", age: 26, country: "Brazil"},
        {description: "Guilherme", age: 45, country: "Brazil"}
      ]

      authors.each do |author|
        Author.find_or_create_by(author)
      end
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    #yield que simboliza bloco de notas pode usado tanto "do" quando "{}", mas apenas se for código de uma linha só caso não usa o "do"  mesmo.
    yield
    spinner.success("(#{msg_end})")
  end
end
