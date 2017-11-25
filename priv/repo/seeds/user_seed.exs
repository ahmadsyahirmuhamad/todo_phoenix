alias MyTodoApp.TodoApp.User
alias MyTodoApp.TodoApp.Repo
alias MyTodoApp.TodoApp


user_array = [
  %{
    email: "user_one@example.com",
    password: "password",
    password_confirmation: "password",
    first_name: "user",
    last_name: "one"
  },
  %{
    email: "user_two@example.com",
    password: "password",
    password_confirmation: "password",
    first_name: "user",
    last_name: "two"
  },
  %{
    email: "user_three@example.com",
    password: "password",
    password_confirmation: "password",
    first_name: "user",
    last_name: "three"
  },
]

Enum.each user_array, fn x ->
  TodoApp.create_user(x)
end
