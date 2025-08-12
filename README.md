# Canvas LMS on Render

Este repositorio incluye una configuración base para desplegar Canvas LMS en Render usando Docker, con PostgreSQL y Redis externos.

---

##  Contenido

- `Dockerfile`: Imagen con Ruby, Node.js, Yarn, PostgreSQL client; instala dependencias, compila assets y ejecuta Puma.
- `render.yaml`: Define dos servicios en Render: el servicio web y el worker (Sidekiq).
- `README.md`: Este archivo.

---

##  Pasos para desplegar

1. Clona este repo en GitHub (ej.: `canvas-lms-on-render`).
2. Empuja el contenido al repositorio remoto.
3. En Render.com:
   - Crea un nuevo servicio **Web** y selecciona este repo.
   - Crea un nuevo servicio **Worker** (Sidekiq) también desde el mismo repo.
4. En la sección de entorno, agrega:
   ```env
   RAILS_ENV=production
   DATABASE_URL=(tu Postgres externo)
   REDIS_URL=(tu Redis externo)
   CANVAS_LMS_DOMAIN=canvas.tudominio.com
   CANVAS_LMS_HOST=canvas.tudominio.com
   CANVAS_LMS_ADMIN_EMAIL=admin@tudominio.com
   CANVAS_LMS_ADMIN_PASSWORD=tuPasswordSuperFuerte
   CANVAS_LMS_STATS_COLLECTION=opt_out
   SMTP_ADDRESS=(ej.: smtp.mailgun.org)
   SMTP_PORT=587
   SMTP_USER=(usuario SMTP)
   SMTP_PASSWORD=(contraseña SMTP)
   SECRET_KEY_BASE=(genera con `bundle exec rake secret`)

