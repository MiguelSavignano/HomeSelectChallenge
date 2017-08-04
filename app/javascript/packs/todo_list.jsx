import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class TodoListApp extends React.Component {

  state = { todo: {value: ""}, todos: [] }

  onAddTodo = () => {
    if (this.state.todo.value == "") return false
    this.setState({ todos: [...this.state.todos, this.state.todo], todo: {value: ""} })
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
        <button onClick={this.onAddTodo}>Insert</button>
        <ul>
          { todos.map((todo, index) => (
            <li key={index} className={this.getColorItem(index)}>{todo.value}</li>
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
