# Soul Building Inc

## Live at https://soulbuildinginc.com/

### Deployment
* Deploy: `cap production deploy`
* Roll back to specific release: `cap production deploy:rollback ROLLBACK_RELEASE=xxxxxxx`

### Docker

Docker Compose is the simplest way to run the app locally. It starts the Rails
development server and PostgreSQL, uses local disk storage for uploads, and
builds the JavaScript and CSS assets in watch mode:

```sh
docker compose up --build
```

Open <http://localhost:3000>. Stop with `Ctrl-C`; `docker compose down` keeps
the database and uploaded files. `docker compose down -v` also deletes them.

For production, install Docker Engine and the Docker Compose plugin on the
Debian 13 host. Copy `.env.production.example` to `.env.production` and fill in
the existing Rails master key and a strong PostgreSQL password using your
secret-management process. Keep `.env.production` private; it is git-ignored.
Production uses the existing encrypted Rails credentials for S3 and SMTP, so
the master key must match `config/credentials.yml.enc`.

Build and start the production services, then prepare the database:

```sh
docker compose -f compose.production.yaml --env-file .env.production build app
docker compose -f compose.production.yaml --env-file .env.production up -d db redis
docker compose -f compose.production.yaml --env-file .env.production run --rm app bin/rails db:prepare
docker compose -f compose.production.yaml --env-file .env.production up -d app
```

The app listens on `127.0.0.1:3000` for a TLS-terminating reverse proxy on the
host. Back up the PostgreSQL volume and use a durable S3 bucket for uploads.


### Start Postgres on Windows
* `sudo service postgresql start`


### To do
* ~~Navigation bar~~
  * ~~Logo, colors, fonts~~

* ~~Remove "sign up" page~~
* ~~Pull in info from linkedin for `About` page~~
* ~~Mobile friendly~~
* ~~`favicon` with company logo~~

* ~~Custom fonts~~
* Auto create database entries for new posts
* Move About Us to database column
* Move all stock photos to local active storage

* **Homepage:**
  * ~~Big image with text overlay~~
  * ~~Last 3 (can be changed) elements from Porfolio~~
  * ~~Contact~~
  * ~~About~~

* Photo Album attached to Posts, editable, on S3
  * ~~Add/remove album photos in UI instead of in S3~~
  * Make album drag + drop sortable
  * ~~First photo in album is the cover photo~~

* **Portfolio:**
  * Job start date, end date / present
  * Main photo of job
  * Change the card to something more... "tailwind-ey"
  * Check to see if newly uploaded image is a duplicate
  * Restrict file size to maybe 5 MB?
  * Restrict valid attachments to `%w(jpg jpeg gif png)`

- Look into removing sassc / bootstrap and using tailwind

`rails tailwindcss:watch`
