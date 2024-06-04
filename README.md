# Interview API

We would like you to design and build a fictitious refund API endpoint.

We have some existing code to help you get started, however feel free to change anything, design and build your solution as you would for a production environment.

## Requirements

* A merchant must be enabled when creating a refund.
* A refund cannot be created when the card has expired.
* A refund must have a unique reference.
* A refund can be standalone, created against a card.
* A refund against a purchase can be for a partial or full amount of the purchase.
* A refund must match the currency of the purchase or allowed currencies of the merchant for standlone refunds.

## Guidelines

* Use Git and commit as often as you think is necessary to properly tell your story.
* Write tests using RSpec proving that your solution works.
* Use any tools, gems, patterns, etc that you would use in a production codebase.
* Engineer your solution as you would for a production environment.
* We are here to assist, feel free to ask questions.
* We want to see how you work, feel free to use your usual workflow including searching the internet, docs, AI, etc.

## Getting started

1. Clone the repository.
1. Create a new branch to work from.
1. Run `bin/setup`.
1. Do your thing.
1. When you're done, push your branch and create a PR for review.
