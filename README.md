## Summary
This repository consists of two actions, one for linting JSDoc comments, and one for actually building the documentation.

- `Lenni009/jsdoc2wiki-action/lint-doc@main` - lints the comments. Should be run on pull requests.
- `Lenni009/jsdoc2wiki-action/create-doc@main` - creates the docs. Should be run on push.

## create-doc
This action is responsible for creating the markdown files for the documentation.

A seperate markdown file is created for each JS file which contains JSDoc comments.

### Prerequisites
You need to have the wiki enabled in your repo and a wiki homepage already created.

You can enable the wiki functionality in the repo's settings.

### Usage
```yml
on:
  push:
    branches: ['main']

concurrency:
  group: "doc"
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    
    permissions:
      contents: write
    
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3

      - name: Create Doc
        uses: Lenni009/jsdoc2wiki-action/create-doc@main
```

## lint-doc
This action is intended to be run on every pull request to your main branch. It will lint the JSDoc comments in your code and return any errors in a comment on the PR. Errors and warnings also cause the action to fail, so the PR can be blocked from being merged.

### Usage
```yml
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  test:
    runs-on: ubuntu-latest

    permissions:
      pull-requests: write
      contents: write

    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3

      - name: Lint JSDoc Comments
        uses: Lenni009/jsdoc2wiki-action/lint-doc@main
```
