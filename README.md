# Soul Building Inc

### Deployment
* Deploy: `cap production deploy`
* Roll back to specific release: `cap production deploy:rollback ROLLBACK_RELEASE=xxxxxxx`

### Start Postgres
* `sudo service postgresql start`


### To do
* ~~Figure out the navigation bar~~
  * Logo, colors, fonts

* Remove "sign up"; only allow a manually created admin for production (which is then deleted)
* ~~Pull in info from linkedin for `About` page~~
* ~~Mobile friendly~~
* ~~`favicon` with company logo~~

* Hook up Google Drive
  * Add column in db for cover image
  * Allow folder to be selected and used per jobsite
* Fonts
* Auto create database entries for new posts
* Move About Us to database column
* Move all stock photos to db columns

* **Homepage:**
  * ~~Big image with text overlay~~
  * ~~Last 3 (can be changed) elements from Porfolio~~
  * Contact
  * ~~About~~

* Photo Album attached to Posts, editable, on S3
  * ~~Add/remove album photos in UI instead of in S3~~
  * Make album drag + drop sortable
  * First photo in album is the cover photo

* **Portfolio:**
  * Job start date, end date / present
  * Main photo of job
  * Change the card to something more... "tailwind-ey"
  * Check to see if newly uploaded image is a duplicate
  * Restrict file size to maybe 5 MB?
  * Restrict valid attachments to `%w(jpg jpeg gif png)`

Known good release:
  `cap production deploy:rollback ROLLBACK_RELEASE=20220126005954`

- Look into removing sassc / bootstrap and using tailwind

`rails tailwindcss:watch`
