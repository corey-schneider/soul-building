# Soul Building Inc

## Live at https://soulbuildinginc.com/

### Deployment
* Deploy: `cap production deploy`
* Roll back to specific release: `cap production deploy:rollback ROLLBACK_RELEASE=xxxxxxx`

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
