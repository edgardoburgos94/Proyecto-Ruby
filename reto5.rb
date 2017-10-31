class Reto5
  #attr_accessor :preguntas_y_respuestas, :p_y_r, :n_preguntas, :pregunta, :num, :respuesta
  def initialize

    puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
    puts ""
    @preguntas_y_respuestas = "preguntas_y_respuestas.txt"
    @p_y_r = self.arreglo_con_PyR
    @n_preguntas = @p_y_r.length
    @i = 0
  end

  def ciclo
    while @i < @n_preguntas
      @resultado = false
      self.escoger_pregunta
      while @resultado == false
        self.responder
        @resultado = self.validar_respuesta
      end
      @i = @i + 1
    end

    puts "FELICITACIONES, LO LOGRASTE"

  end

  def arreglo_con_PyR
    if File.file?(@preguntas_y_respuestas)
      content = File.read(@preguntas_y_respuestas)

      lines = content.split("\n") # divide el contenido en líneas
      #puts lines.class
      #puts lines[0]
      n_lineas = lines.length

      #puts "el número de lineas es #{n_lineas} "
      array =[]
      n_lineas.times do |n|
        hash ={}
        line = lines[n]
        line_array = line.split(":")
        hash[:pregunta]= line_array[0]
        hash[:respuesta]= line_array[1]

        array.push(hash)
      end
      #puts array[5]
      return array
    else
      array = []
      return array
    end
  end

  def escoger_pregunta
    @pregunta = @p_y_r[@i][:pregunta]
    @respuesta = @p_y_r[@i][:respuesta]
    puts "Definición:"
    puts "#{@pregunta}..."
  end

  def responder
    print "Adivinar: "
    @respuesta_usuario = gets.chomp
  end

  def validar_respuesta
    if @respuesta == @respuesta_usuario
      puts "Correcto!"
      puts ""


      return @resultado =true
    else
      puts "Incorrecto!, Trata de nuevo"
      return @resultado = false
      # print "Desea continuar (s/n)"
      # @continuar = gets.chomp
    end
  end

end

p1 = Reto5.new
p1.ciclo
