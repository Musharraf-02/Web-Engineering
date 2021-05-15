<html>
<head>
    <title>Student Data</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Lato', sans-serif;
            background-image: url('Resources/Images/background.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white;
        }

        #student-table {
            background-image: url('Resources/Images/foreground.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px #68BDE6;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-10" style="margin: auto">
            <div style="padding-top: 30px">
                <h2 style="text-align: center;border: 1px solid transparent;border-radius: 10px;background:rgba(255,255,255,0.3);padding:20px;">
                    STUDENTS INFO </h2>
                <br>
                <div style="text-align: center">
                    <button class="btn btn-light" onclick="window.location.href='addStudent.jsp';" id="add">Add
                        Student
                    </button>
                    <button class="btn btn-light" id="update">
                        Update
                        Student
                    </button>
                    <button class="btn btn-light" id="delete">Delete
                        Student
                    </button>
                </div>
                <br>
                <div id="noSelected" style="text-align: center"></div>
                <br>
                <table id="student-table" class="table">
                    <thead style="background-color: white;color: black">
                    <tr>
                        <th>Select</th>
                        <th>Name</th>
                        <th>Roll No</th>
                        <th>Degree</th>
                    </tr>
                    </thead>
                </table>
                <script>
                    window.onload = async () => {
                        const response = await fetch("http://localhost:8080/StudentData_war/displayDataServlet");
                        const res = await response.json();
                        res.data.forEach((data) => {
                            document.getElementById("student-table").innerHTML += `<tr><td><input type="radio" id="${data.id}" value="${data.id}" name="studentID"></td><td id="${data.id}name" name="${data.name}">${data.name}</td><td id="${data.id}rollNo" name="${data.rollNo}">${data.rollNo}</td><td id="${data.id}degree" name="${data.degree}">${data.degree}</td></tr>`;
                        })
                    }
                </script>
                <script>
                    let displayTableData = async () => {
                        const response = await fetch("http://localhost:8080/StudentData_war/displayDataServlet");
                        const res = await response.json();
                        document.getElementById("student-table").innerHTML = "";
                        document.getElementById("student-table").innerHTML = `<table id="student-table" class="table"><thead style="background-color: white;color: black"><tr><th>Select</th><th>Name</th><th>Roll No</th><th>Degree</th></tr></thead>`;
                        res.data.forEach((data) => {
                            document.getElementById("student-table").innerHTML += `<tr><td><input type="radio" id="${data.id}" value="${data.id}" name="studentID"></td><td id="${data.id}name" name="${data.name}">${data.name}</td><td id="${data.id}rollNo" name="${data.rollNo}">${data.rollNo}</td><td id="${data.id}degree" name="${data.degree}">${data.degree}</td></tr>`;
                        })
                        document.getElementById("student-table").innerHTML += `</table>`;
                    }
                    $(document).ready(function () {
                        $("#delete").click(function () {
                            document.getElementById("noSelected").innerHTML = "";
                            if ($('input[name=studentID]:checked').attr("id") === undefined) {
                                document.getElementById("noSelected").innerHTML = "<h4>No row is selected.</h4>";

                            } else {
                                document.getElementById("noSelected").innerHTML = "";
                                const xmlhttp = new XMLHttpRequest();
                                let id = $('input[name=studentID]:checked').attr('id');
                                let callBackFunc = () => {
                                    if (xmlhttp.readyState == 4) {
                                        document.getElementById("noSelected").innerHTML = "<h4>Student data deleted successfully.</h4>";
                                        displayTableData();
                                    }
                                }
                                xmlhttp.open("GET", "deleteStudentServlet?id=" + id, true);
                                xmlhttp.onreadystatechange = callBackFunc;
                                xmlhttp.send();
                            }
                        });
                    });
                    $(document).ready(function () {
                        $("#update").click(function () {
                            document.getElementById("noSelected").innerHTML = "";
                            if ($('input[name=studentID]:checked').attr("id") === undefined) {
                                document.getElementById("noSelected").innerHTML = "<h4>No row is selected.</h4>";

                            } else {
                                document.getElementById("noSelected").innerHTML = "";
                                let id = $('input[name=studentID]:checked').attr('id');
                                let n = id + "name";
                                let r = id + "rollNo";
                                let name = $("body").find('#' + n).attr('name');
                                let rollNo = $("body").find('#' + r).attr('name');
                                window.location.href = "updateStudent.jsp?id=" + id + "&name=" + name + "&rollNo=" + rollNo;
                            }
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
