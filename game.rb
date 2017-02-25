require "rubygems"
require "artii"



def start
  archivo1=File.open("./preguntas.txt", "r") do |file|
    text= file.readlines()
    questions=[]
    answers=[]
    text.each do |text1|
      if text.rindex(text1)%3==0
        questions<<text1.delete("\n")
      elsif ((text.rindex(text1)-1)%3==0)
        answers<<text1.delete("\n")
      end
    end
    return questions, answers
  end
end

def game(quest, points)
	counter = 0
	while counter < 3
	user = gets.chomp.downcase
		if quest[1] == user
			points+=1
			puts "¡felicitaciones! ¡es correcto!"
			puts
			break
		else
			counter += 1
			puts "Lo siento :(, vuelve a intentar"
			puts
		end
	end
	if counter==3
		puts "Ya usaste tus tres oportunidades :'( "
		puts
	end
	counter = 0
	return points
end


def print_question(a)
	puts a[0]
end



def run
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('RUBY 5!!!!')
  puts "Bienvenido a Ruby-trivia, donde demuestras tus conocimientos en Ruby! por cada pregunta tienes 3 oportunidades para responder. No hay límite de tiempo. Cada respuesta correcta te da 1 punto ¿Cuántos puntos crees que puedes lograr?"
  puts
  questions,answers = start
	index1 = 0
	points = 0
	while  index1 < questions.length
		quest = questions[index1],answers[index1]
		print_question(quest)
		points = game(quest, points)
		index1 +=1
	end
	puts "felicitaciones, has completado la prueba, tu resultado es..."
  puts a.asciify(" #{points}")

end

run
