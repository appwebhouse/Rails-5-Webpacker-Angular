# Rails 5.1 Angular webpacker Application

Demo app that showcases Angular 4 on webpack and yarn using Rails 5.1.
Simple register, login and upload images for users.

## Table of Contents
 - [Getting Started](#getting-started)
 - [File Structure of Angular App](#file-structure-of-angular-app)
 - [Build with versions](#build-with-versions)

## Getting Started

* Clone this repository: `git clone https://github.com/appwebhouse/Rails-5-Webpacker-Angular.git`.
* Run `cd Rails-5-Webpacker-Angular`
* Run `cp .env_example .env` to fill envs.
* Run `bundle install`
* Run `bundle exec rake db:migrate`
* Install Dependencies `yarn install`
* Run `foreman start -f Procfile.dev` in a terminal from the project root.
* Visit `localhost:5000`

## File Structure of Angular App

```
Rails-5-Webpacker-Angular/
├── .github/                            * GitHub files
│
├── app/javascript/challenge/
│    ├── app/
│    │    ├── app.component.ts
│    │    ├── app.routing.ts
│    │    ├── app.module.ts
│    │    └── app.html
│    │
│    ├── models/
│    │    ├── image.ts
│    │    └── user.ts
│    │
│    ├── pages/                         * Contains all of our pages
│    │    ├── images/                   * Home page
│    │    │    └── index/               * HomePage template
│    │    │         ├── index.html      * HomePage code
│    │    │         └── index.ts        * HomePage stylesheet
│    │    │
│    │    ├── register/                 * Register page
│    │    │    ├── register.html        * Register template
│    │    │    └── register.ts          * Register code
│    │    │
│    │    └── login/                    * Login page
│    │         ├── login.html           * LoginPage template
│    │         └── login.ts             * LoginPage code
│    │
│    ├── services/                      * Contains all Injectables
│    │    ├── update_header.ts          * HttpClientService code
│    │    ├── user.ts                   * UserService code
│    │    └── httpService.ts            * HttpService code
│    │
│    ├── index.ts
│    └── polyfills.ts
│
├── .env_example                        * Defines envs
├── .gitignore                          * Example git ignore file
├── LICENSE                             * Apache License
├── README.md                           * This file
├── package.json                        * Defines our JavaScript dependencies
├── tsconfig.json                       * Defines the config for the TypeScript linter
└── yarn.lock                           * Store exactly which versions of each dependency were installed
```

## Build with versions

```
Rails 5.1.4

Ruby 2.4.1p111

Webpacker 3.0.1

Angular 4.4.0-RC.0
```
