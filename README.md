Exámenes
===========================================================

Exámenes es una nueva funcionalidad mediante la cual, el administrador de la misma pueda crear exámenes para ser completados por los usuarios.

Diagrama UML 
===========================================================

<img width="1200" alt="Screenshot 2024-09-18 at 6 23 56 PM" src="https://github.com/user-attachments/assets/1422722b-2bd6-4773-9e84-ec2ff4e38f56">

Ir a http://localhost:3000/erd

Explicación del Diagrama
===========================================================

Se crean tres modelos adicionales a User (Usuarios): Exam(Exámenes), Question(Preguntas) y Answer(Respuestas). 

Un(1) Exam puede tener muchas(N) Question
Un(1) Question puede tener muchas(N) Answer

Después se crean dos modelos para relacionar User(Usuarios) con Exam(Examen) y User(Usuarios) con Answer(Respuestas). Esto para se relacionen Muchos(N) a Muchas(N)

Nota: Cuando el User(Usuarios) defina la Answer(Respuestas) no rellena el campo is_correct(boolean). Esto hace corroborar cual respuesta es correcto. Esta esquema sirve para los 3 tipos de preguntas: texto libro, multiples respuestas o una respuesta.


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



