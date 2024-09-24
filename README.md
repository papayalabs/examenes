Exámenes
===========================================================

Exámenes es una nueva funcionalidad mediante la cual, el administrador de la misma pueda crear exámenes para ser completados por los usuarios.

Diagrama UML 
===========================================================

<img width="1200" alt="Screenshot 2024-09-18 at 6 23 56 PM" src="https://github.com/user-attachments/assets/ce653c5a-9e72-47fd-bec6-c6a3c31f0104">



Ir a http://localhost:3000/erd

Explicación del Diagrama
===========================================================

Se crean tres modelos adicionales a User (Usuarios): Exam(Exámenes), Question(Preguntas) y Answer(Respuestas). 

Un(1) Exam puede tener muchas(N) Question
Un(1) Question puede tener muchas(N) Answer

Después se relaciona Examen con Usuario(UserExam) y Examen con Respuesta(UserAnswer) de forma muchos a muchos. Es decir que un Usuario puede tener asignado muchos Exámenes y Respuestas y viceversa. Un Examen puede tener muchos Usuarios y una Respuesta puede tener muchos Usuarios. De esta manera podemos saber y guardar todos las Respuestas del Usuario incluyendo las erróneas.  Con el campo "is_correct" sabremos si la Respuesta es la correcta. El campo "value" en (UserAnswer) se utiliza para las respuestas de texto libre así como si se decide utilizar otro tipos de campos como rellenar la respuesta correcta en un texto.

En la clase Examen están las fechas(start/end) para definir cuándo se puede hacer el examen en general. Sin embargo también pueden ir en la clase UserExam y así definirlas a nivel de cada Usuario.

Por último en la clase Pregunta(Question) están definidos el tipo de pregunta(type_of_question), si el Manager le va a asignar puntos(has_points) y cuántos puntos valdrá la Pregunta(points).


Validaciones
===========================================================

En Question validamos que el tipo de pregunta este dentro de las especificacionese:

  TYPE_OF_QUESTION = ["free_text","multiple_options","unique_option"]

  validates :type_of_question, inclusion: { in: TYPE_OF_QUESTION, allow_nil: true }

En UserAnswer validamos que la respuesta este dentro de las fechas que se puede hacer el examen:

  validate :validate_dates

  private

  def validate_dates
    unless Date.today > answer.question.exam.start && Date.today < answer.question.exam.end
      errors.add(:answer, 'answer has to be inside the start and end date of Exam')
    end
  end

Código
===========================================================

Para este código se uso rails g scaffold para generar todos los modelos, controladores y vistas. Se utiliza la gema "devise" para autentificar. La gema "cancan" para determinar roles aunque en este código no se llega a utilizar y la gema "erd" para generar el diagram UML.

Instalación Local
------------------

  1. Instalar Rails

  2. Clonar Repositorio

    git clone https://github.com/papayalabs/examenes.git

  3. Configurar base de datos.

    edit config/database.yml

  4. Instalar gemas

    bundle

  5. Migrar base de datos

    rake db:migrate

  6. Migrar semilla

    rake db:seed

  7. Iniciar el Servidor

    rails s -u puma



