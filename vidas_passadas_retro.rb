require 'date' 

# Sistema de Vidas Passadas - Versão Retrô 80s/90s
def limpar_tela
  system("cls") || system("clear")
end

def efeito_typing(texto)
  texto.each_char do |char|
    print char
    sleep(0.05) 
  end
  puts
end

VERDE = "\e[32m"
RESET = "\e[0m"

vidas = [
  "UM FAMOSO PIRATA DOS SETE MARES!",
  "UM NOBRE CAVALEIRO MEDIEVAL!",  
  "UM GRANDE FARAÓ DO ANTIGO EGITO!",
  "UM HABILIDOSO ARTISTA RENASCENTISTA!",
  "UM VALENTE GUERREIRO VIKING!",
  "UM MISTERIOSO ALQUIMISTA!",
  "UM ASTUTO DETETIVE VICTORIANO!",
  "UM INOVADOR INVENTOR STEAMPUNK!",
  "UM DESTEMIDO EXPLORADOR DO SÉCULO XIX!",
  "UM ENIGMÁTICO MESTRE DO SAMURAI!",
  "UM MÉDICO DA ETIOPIA ANTIGA!",
  "UM GRANDE FILÓSOFO GREGO ANTIGO!",
  "UM PODEROSO XAMÃ DAS TRIBOS NORTE-AMERICANAS!",
  "UM HABILIDOSO ARQUEIRO MEDIEVAL!",
  "UMA BRUXA, CURANDEIRA DA INDIA!",
  "UMA RAINHA DO EGITO ANTIGO!",
  "UMA DANCARINA DE CABARÉ EM PARIS NOS ANOS 20!",
  "UM PILOTO DE AVIÃO DURANTE A SEGUNDA GUERRA MUNDIAL!",
  "UM HABILIDOSO ARTESÃO DA IDADE MÉDIA!"
]

limpar_tela
puts "#{VERDE}============================================================================"
puts "BEM-VINDO AO ORÁCULO DAS VIDAS PASSADAS".center(80)
puts  "VERSÃO 1.0 - (C) 1989 MS-DOS".center(80)
puts "============================================================================#{RESET}"

nome = ""
loop do
  print "DIGITE SEU NOME: "
  nome = gets.chomp.strip

  # Ajuste: Garantimos que não seja apenas espaço e tenha letras
  if nome.length > 1 && nome.match?(/^[A-Za-zÀ-ÿ\s]+$/)
    nome = nome.upcase
    break
  else
    puts "#{VERDE}>> ERRO CRITICO: O NOME DEVE CONTER APENAS LETRAS.#{RESET}\n\n"
  end
end

data_nascimento = nil
loop do
  print "DIGITE SUA DATA DE NASCIMENTO (DD/MM/AAAA): "
  entrada = gets.chomp

  if entrada.match?(/^\d{2}\/\d{2}\/\d{4}$/)
    begin
      data_nascimento = Date.strptime(entrada, '%d/%m/%Y')
      if data_nascimento > Date.today
        puts "#{VERDE}>> ERRO: VOCÊ AINDA NÃO NASCEU! TENTE NOVAMENTE.#{RESET}\n\n"
      else
        break 
      end
    rescue ArgumentError
      puts "#{VERDE}>> ERRO: DATA INVÁLIDA! VERIFIQUE O CALENDÁRIO.#{RESET}\n\n"
    end
  else 
    puts "#{VERDE}>> ERRO CRÍTICO: USE O FORMATO PADRÃO DD/MM/AAAA!#{RESET}\n\n"
  end
end

puts "\nPROCESSANDO INFORMAÇÕES NOS CIRCUITOS..."
sleep(2)

# Lógica de cálculo (Aritmética Modular)
indice_vida = (data_nascimento.day + data_nascimento.month + data_nascimento.year) % vidas.size
resultado = vidas[indice_vida]

efeito_typing("\n#{nome}, OS ASTROS REVELAM QUE...")
sleep(2) 
puts "NA SUA VIDA PASSADA, VOCÊ FOI:"
puts "#{VERDE}>>> #{resultado} <<<#{RESET}" # Adicionei cor no resultado também!
puts "\n[FIM DO ORÁCULO - (C) MS-DOS 1989]"
