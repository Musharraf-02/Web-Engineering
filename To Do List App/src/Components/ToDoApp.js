import React, { useState, useEffect } from 'react';
const ToDoApp = () => {
    let [count, incCount] = useState(0)
    let [task, addTask] = useState("")
    let [tasksList, addTaskInList] = useState([])
    function addTaskListItem() {
        let str = task
        str = str.trim()
        if (str != "") {
            let tempTaskList = tasksList
            tempTaskList.push(task)
            addTaskInList(tempTaskList)
            incCount(count + 1)
        }
        addTask("")
    }
    return (
        <div>
            <input type="text" value={task} onChange={(e) => addTask(e.target.value)} />
            <button onClick={addTaskListItem}>Add</button>
            <h1>To Do Tasks {count}</h1>
            <ul>
                {tasksList.map(item => {
                    return (<li>{item}</li>)
                })
                }
            </ul>
        </div>
    )
}
export default ToDoApp;