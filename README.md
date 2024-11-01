# Homey code test

## Instructions

### Requirements:

- Ruby 3.1.3
- PostgreSQL

### Setup app:

```bash
bin/setup
```

### Run tests:

```bash
bin/rails spec
```

### Run app:

```bash
bin/dev
```

## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status.

Please don’t spend any more than 3 hours on this task.

## Developer notes

The requirements look very simple, but it implies a lot of things that are not specified. I will make some assumptions to make the project more complete.

### Models

Based on the given informations, I can imagine the following models will be required:

- `User`
- `Project`
- `ProjectUser`
- `Comment`
- `StatusChange`
- `Event`

#### User

This model will allow the system to identify who has access to a project, the author of the comments, and the user who changed the status of the project.
I'm thinking of using the `devise` gem to handle user authentication as it's pretty straightforward to setup and will enable the system to identiy the current user interacting with the platform.

A user will have a `username`, `email` and `password`.

#### Project

Also the requirement only mentions "the project", I'm assuming that such platform would allow users to interact with a multitude of projects. (I'm guessing this task is a simplified version of what Homey has built in order to let multiple parties interact with a project: the process of buying a home).

A project will have a `name`, and a `status`.

#### ProjectUser

A project can have multiple users interacting with it. This model will be a join table between `User` and `Project` to allow the system to identify which users have access to a project.
I won't add extra fields to this model, but it could be useful to add a `role` field to identify the user's role in the project in the future. For now, all users will have the same role and will all be able to modify the project, leave comments, add and remove other users, and delete the project.

#### Comment

A comment will have a `body`, a `user_id` and a `project_id`. The user who has created the comment will be able to edit and delete it.

#### StatusChange

In order to keep track of every status changes, this model will have a `from_status`, `to_status`, `user_id` and `project_id`. The user who has changed the status of the project will be able to edit and delete it.

#### Event

When it comes to showing an historic of the project, there are multiple ways to approach it, but the one that makes more sense to me is to create an `Event` model that will have a `project_id`, `eventable_id`, `eventable_type`, and `user_id`. It's what seems to be the most efficient and flexible, as we can add more event types in the future without having to increase the complexity of a SQL query.

One drawback is the duplication of the foreign key `project_id` that will be found in the eventable models and the event itself. In the future, the `Event` model could be refactored to have a polymorphic association with the `project` model, allowing to gather events from many different entities.

### Limitations

Obivously beind limited on time, the solution won't be as robust as I would want it to be. Ideal the `ProjectUser` should handle mutliple roles for more complex access control. UI/UX-wise, I will stick with what the Rails' scaffold generator provides, but in a real-world scenario, I would keep the CSS tidy, refactor the styling into specific classes using tailwind `@apply`. UI components could be extracted into partials or using gems like `view_component`.

## End notes

- CSS is a mess, would need refactoring. I prioritised functionality over design.
- View tests are mostly missing, their current states are mostly what the Rails scaffold generator provides.
- Users cannot delete, edit their own comments
- When a user remove themselves from a project, they will be redirect to the project. It's an easy fix, but right now their redirect will lead to a 404 page.
- The UI for the login/signup and list of projects is very basic. I focused my limited time on the project view.
- The comment form should `require` the body field, but I thought I would keep it this way to show you that the app can display errors when the form is not valid. But ideally, we should avoid to make a request when we know it will fair ahead of time.
- There is shared logic in the services `Projects::Create` and `Projects::Update` that could be extracted into a module.
- As a validation, project should always have 1 user, but I didn't have time to implement it.
- UX-wise, it would make more sense to have the comment form at the top of the history of events, and the order of events should be reversed.
- Pagination should be put in place for both projects and history.
- Containerise the app with Docker would be good idea.
- The ability to logout is missing.
- Would be great to create an event when a user is added or removed from a project.
- Added user roles to a project giving them different permissions would be a great feature to have.
