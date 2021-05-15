import 'bootstrap/dist/css/bootstrap.min.css'
import React, {Component} from 'react'
import $ from 'jquery';

class StudentData extends Component {
    constructor(props) {
        super(props)
        this.state = {}
    }

    getStudentData = async () => {
        const response = await fetch("http://localhost:8080/student_data_backend_war/displayDataServlet");
        const res = await response.json();
        res.data.forEach((data) => {
            document.getElementById("student-table").innerHTML += `<tr><td><input type="radio" id="${data.id}" value="${data.id}" name="studentID"></td><td id="${data.id}name" name="${data.name}">${data.name}</td><td id="${data.id}rollNo" name="${data.rollNo}">${data.rollNo}</td><td id="${data.id}degree" name="${data.degree}">${data.degree}</td></tr>`;
        })
    }

    displayTableData = async () => {
        const response = await fetch("http://localhost:8080/student_data_backend_war/displayDataServlet");
        const res = await response.json();
        document.getElementById("student-table").innerHTML = "";
        document.getElementById("student-table").innerHTML = `<table id="student-table" class="table"><thead class="thead-dark"><tr><th>Select</th><th>Name</th><th>Roll No</th><th>Degree</th></tr></thead>`;
        res.data.forEach((data) => {
            document.getElementById("student-table").innerHTML += `<tr><td><input type="radio" id="${data.id}" value="${data.id}" name="studentID"></td><td id="${data.id}name" name="${data.name}">${data.name}</td><td id="${data.id}rollNo" name="${data.rollNo}">${data.rollNo}</td><td id="${data.id}degree" name="${data.degree}">${data.degree}</td></tr>`;
        })
        document.getElementById("student-table").innerHTML += `</table>`;
    }

    deleteStudent = () => {
        document.getElementById("success").innerHTML = "";
        document.getElementById("failure").innerHTML = "";
        document.getElementById("noSelected").innerHTML = "";
        if ($('input[name=studentID]:checked').attr("id") === undefined) {
            document.getElementById("noSelected").innerHTML = "<h4>No row is selected.</h4>";

        } else {
            const xmlhttp = new XMLHttpRequest();
            let id = $('input[name=studentID]:checked').attr('id');
            let callBackFunc = () => {
                if (xmlhttp.readyState == 4) {
                    this.displayTableData();
                    document.getElementById("noSelected").innerHTML = "<h4>Student data deleted successfully.</h4>";
                }
            }
            xmlhttp.open("GET", "http://localhost:8080/student_data_backend_war/deleteStudentServlet?id=" + id, true);
            xmlhttp.onreadystatechange = callBackFunc;
            xmlhttp.send();
        }
    }

    addStudent = () => {
        document.getElementById("success").innerHTML = "";
        document.getElementById("failure").innerHTML = "";
        document.getElementById("noSelected").innerHTML = "";
        let name = prompt("Please enter your name:*");
        while (!name) {
            name = prompt("Please enter your name:*");
        }
        let rollNo = prompt("Please enter your roll no:*");
        while (!rollNo) {
            rollNo = prompt("Please enter your roll no:*");
        }
        let degree = prompt("Please enter your degree(SE, CS, IT):*");
        while (!degree) {
            degree = prompt("Please enter your degree(SE, CS, IT):*");
        }
        fetch("http://localhost:8080/student_data_backend_war/addStudentServlet?name=" + name + "&rollNo=" + rollNo + "&degree=" + degree, {method: 'post'}).then(response => {
            return response.text()
        }).then(data => {
            data = parseInt(data);
            if (data == 0) {
                this.displayTableData();
                document.getElementById("success").innerHTML = `<h4 >Student data added successfully.</h4>`
            } else if (data == 1) {
                document.getElementById("failure").innerHTML = `<h4>A student already exists with this roll no.</h4>`
            }
        })
    }

    updateStudent = () => {
        document.getElementById("success").innerHTML = "";
        document.getElementById("failure").innerHTML = "";
        document.getElementById("noSelected").innerHTML = "";
        if ($('input[name=studentID]:checked').attr("id") === undefined) {
            document.getElementById("noSelected").innerHTML = "<h4>No row is selected.</h4>";

        } else {
            let id = $('input[name=studentID]:checked').attr('id');
            let n = id + "name";
            let r = id + "rollNo";
            let d = id + "degree";
            let name1 = $("body").find('#' + n).attr('name');
            let rollNo1 = $("body").find('#' + r).attr('name');
            let degree1 = $("body").find('#' + d).attr('name');
            let name = prompt("Please enter your name:*", name1);
            while (!name) {
                name = prompt("Please enter your name:*", name1);
            }
            let rollNo = prompt("Please enter your roll no:*", rollNo1);
            while (!rollNo) {
                rollNo = prompt("Please enter your roll no:*", rollNo1);
            }
            let degree = prompt("Please enter your degree(SE, CS, IT):*", degree1);
            while (!degree) {
                degree = prompt("Please enter your degree(SE, CS, IT):*", degree1);
            }
            fetch("http://localhost:8080/student_data_backend_war/updateStudentServlet?name=" + name + "&rollNo=" + rollNo + "&degree=" + degree + "&id=" + id, {method: 'post'}).then(response => {
                return response.text()
            }).then(data => {
                data = parseInt(data);
                if (data == 0) {
                    this.displayTableData();
                    document.getElementById("success").innerHTML = `<h4>Student data updated successfully.</h4>`
                } else if (data == 1) {
                    document.getElementById("failure").innerHTML = `<h4>A student already exists with this roll no.</h4>`
                }
            })

        }
    }

    componentDidMount() {
        this.getStudentData();
    }

    render() {
        return (
            <React.Fragment>
                <div>
                    <div className="container">
                        <div className="row">
                            <div className="col-10" style={{margin: "auto"}}>
                                <div style={{paddingTop: "30px"}}>
                                    <div style={{textAlign: "center"}}>
                                        <button className="btn btn-primary" onClick={this.addStudent}
                                                id="add">Add
                                            Student
                                        </button>
                                        <button className="btn btn-warning" onClick={this.updateStudent} id="update">
                                            Update
                                            Student
                                        </button>
                                        <button className="btn btn-danger" id="delete"
                                                onClick={this.deleteStudent}>Delete
                                            Student
                                        </button>
                                    </div>
                                    <br/>
                                    <div id="noSelected" style={{color: "red", textAlign: "center"}}></div>
                                    <div id="success" style={{textAlign: "center", color: "green"}}></div>
                                    <div id="failure" style={{textAlign: "center", color: "red"}}></div>
                                    <br/>
                                    <table id="student-table" className="table">
                                        <thead className="thead-dark">
                                        <tr>
                                            <th>Select</th>
                                            <th>Name</th>
                                            <th>Roll No</th>
                                            <th>Degree</th>
                                        </tr>
                                        </thead>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </React.Fragment>
        )
    }
}

export default StudentData;