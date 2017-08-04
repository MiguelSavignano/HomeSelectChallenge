import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const genetageUid = () => {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8)
    return v.toString(16)
  });
}

class TodoListApp extends React.Component {

  state = { todo: {value: ""}, todos: [] }

  componentDidMount() {
    this.getTodosFromLocalStore()
  }

  saveTodos = () => {
    localStorage.setItem('todos', JSON.stringify(this.state.todos));
  }

  getTodosFromLocalStore = () => {
    const todos = JSON.parse(localStorage.getItem('todos') || [])
    this.setState({ todos })
  }

  onAddTodo = () => {
    if (this.state.todo.value == "") return false
    const todo = this.state.todo
    todo.id = genetageUid()
    this.setState({ todos: [...this.state.todos, todo], todo: {value: ""} }, () => {
      this.saveTodos()
    })
  }

  removeTodo = todoSelected => event => {
    this.setState({
      todos: this.state.todos.filter(todo => todoSelected.id != todo.id),
      todo: { value: ""}
    }, () => {
      this.saveTodos()
    })
  }

  onChangeHandler = (event) => {
    this.setState({ todo: { value: event.target.value } })
  }

  getColorItem = (index) => {
   if ((index + 1) % 3 == 0) return "red-color"
   return ""
  }

  render() {
    const { todos, todo } = this.state
    return (
      <div>
        <input type="text" value={todo.value} onChange={this.onChangeHandler} />
        <button className="btn" onClick={this.onAddTodo}>Insert</button>
        <ul className="flex-grid-4">
          { todos.map((todo, index) => (
            <li key={index} className={`todo-item ${this.getColorItem(index)}`}>
              <span>{todo.value}</span>
              <button className="btn danger" onClick={this.removeTodo(todo)}>Remove</button>
            </li>
          ))}
        </ul>
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TodoListApp />,
    document.querySelector('#todo-list-app'),
  )
})
