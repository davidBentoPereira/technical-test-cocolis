# Technical Test for Cocolis

<img src="https://www.cocolis.fr/_next/static/images/og_default_29_06_21-2a7f4ed592c79cea2472a249f2780938.png" style="border-radius: 15px ">

This app is my solution to the technical test for the french company [Cocolis 📦](https://www.cocolis.fr/)

---

## Subject (in 🇫🇷)

[Original Link to the subject](https://cocolis.notion.site/Backend-Rails-b601257f4dc34a31b2245b17efa5b718)
# Objectif : Construire une application RoR

## Fonctionnalités :

- Signup, Signin, Email validation, Forgot password
- Le premier utilisateur créé est admin
- Les admins peuvent inviter des utilisateurs et indiquer leur role(admin ou user)
- Depuis une liste de tous les users, un admin peut modifier leur role. Pages minimum: Signup, Signin, Lost password, List users (avec action create user et modifier le role), Detail user (avec Update and Delete user).

## Technos obligatoires :

- Ruby on rails 6
- Devise
- Devise invitable
- Bootstrap 5
- Rspec pour les tests

## Outils obligatoires :

- Slack
- Github

## Tests obligatoires :

- Fonctionnels et unitaires avec rspec
    - Tester les modèles et les controlleurs, au moins une grosse partie

## Bonus :

- Ajouter un worker sidekiq qui envoie un email 5min après l’inscription pour dire Bonjour, maintenant que vous êtes inscrit, amusez vous
- Utiliser cancancan pour la gestion des droits
- Design agréable

---


## ⬇️ Install

Clone the repository and enter the directory

```bash
git clone ...
cd technical-test-cocolis
```

Install ruby gems with bundler

```bash
bundle install
```

Install JS packages with Yarn

```bash
yarn
```

Create the database

```bash
rails db:create
```

Run the migrations to build the database

```bash
rails db:migrate
```

Run the seed command to populate some basic data

```bash
rails db:seed
```


---
## 🏃‍ Run

Run Rails Server and Sidekiq by using these commands :

```bash
rails server
bundle exec sidekiq
```

You may need to run Webpack to compile the assets :

````bash
bin/webpack --watch
````

### Alternative Run

If you want to run all needed services in one command (rails server + webpack + sidekiq), just run :

````bash
foreman start -f Procfile.dev # use gem install foreman if not already installed in your computer
````

_Notes: Procfile.dev is used for the local environement only. Heroku will use Procfile in production._


---

## ℹ️ Infos

- I used this [Notion](https://horn-decade-127.notion.site/Cocolis-Technical-Test-4303a6c1aa9d46fd9e5b53d537902c14) to list all my tasks on this project: 
- I used [livecanvas.com](https://livecanvas.com/sections/) to quickly build a basic landing page in Bootstrap
- I used [this repo](https://github.com/nauvalazhar/bootstrap-4-login-page) to quickly design the sign in, sign up and forgot password pages with Bootstrap

--- 

## 🦄 Official Authors

[David BENTO-PEREIRA ✌️](https://github.com/davidBentoPereira) 
