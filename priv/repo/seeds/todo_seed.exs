alias MyTodoApp.TodoApp

todos_array = [
  %{
    title: "Title one",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus, earum eos, et quia beatae quis alias voluptatem consectetur nobis itaque culpa, quisquam saepe veniam tenetur aliquam laborum quas fuga suscipit?",
    user_id: 1
  },
  %{
    title: "Title two",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus, earum eos, et quia beatae quis alias voluptatem consectetur nobis itaque culpa, quisquam saepe veniam tenetur aliquam laborum quas fuga suscipit?",
    user_id: 1
  },
  %{
    title: "Title three",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus, earum eos, et quia beatae quis alias voluptatem consectetur nobis itaque culpa, quisquam saepe veniam tenetur aliquam laborum quas fuga suscipit?",
    user_id: 1
  },
]

Enum.each todos_array, fn x ->
  TodoApp.create_todo(x)
end
