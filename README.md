# README

A demonstration of Action Cable's capabilities with the ability to create multiple
chat rooms and have live conversations with multiple users and persisted chat history.

## Setup ##

1. Ensure Ruby 2.7.2 is installed and selected on your machine.
2. Ensure `bundler` is installed or install it (`gem install bundler`)
3. Download and navigate into the project in your terminal.
4. Run `bundle`
5. Run `rails db:migrate`
6. Run `rails s`
7. Navigate to `localhost:3000` in your browser of choice.

## Usage ##

First you'll want to create a user account by clicking "Register" and then login
with that account. From there you can Create a new chat room and it will be displayed
in the list of chat rooms. Select any chat room you wish to visit and chat away.

You can see a demonstration of the live chat capabilities by either opening
`localhost:3000` in two different browsers, using a normal and private window, or
easily try many chats at once using Firefox's [Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/).
