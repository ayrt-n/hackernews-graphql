# Hackernew Clone using GraphQL

## Overview

Straightforward implementation of a Hackernews clone using Ruby on Rails and GraphQL from https://www.howtographql.com/graphql-ruby/0-introduction/. Features include creating accounts, creating and searching for links, as well as up voting links.

Having gained some exposure to REST APIs, I have wanted to start digging into and learning about GraphQL, given increased popularity and growing community. This marks one of the first of many future GraphQL projects!

## Installation

To install and test locally yourself:

1. Clone this repo
2. Install the required gems by running

```
$ bundle install
```
3. Start the server

```
$ rails server
```
4. Open a browser and open the in-browser GraphQL IDE at http://localhost:3000/graphiql

## Sample GraphQL Queries

Once in the GraphQL IDE, there are a number of different queries and mutations which can be run to test any of the functionality. Some examples...

List first 10 links, containing "example":

```
{
  allLinks(first: 10, filter: {descriptionContains: "example"}) {
    id
    url
    description
    createdAt
    postedBy {
      id
      name
    }
  }
}
```
Create new user:

```
mutation {
  createUser(
    name: "Radoslav Stankov",
    authProvider: {
      credentials: { email: "rado@example.com", password: "123456" }
    }
  ) {
    id
    email
    name
  }
}
```
Create new user token: 

```
mutation {
  signinUser(credentials: {email: "rado@example.com", password: "123456"}) {
    token
    user {
      id
      email
      name
    }
  }
}
```
Create new link:

```
mutation {
  createLink(url:"http://example.com", description:"Example") {
    id
    url
    description
    postedBy {
      id
      name
    }
  }
}
```
Create new vote:

```
mutation {
  createVote(linkId:"TGluay0yMQ==") {
    user {
      id
      name
    }
    link {
      id
      url
      description
    }
  }
}
```
