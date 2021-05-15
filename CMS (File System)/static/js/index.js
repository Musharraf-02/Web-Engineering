let num = 1
let list = ""
students.forEach(function (value) {
    list += `<li id=${num}><a href="#">${value.name}</a></li>`
    num++
})
$("#studentLoginDropdownMenu").html(list)
let tableBody = document.getElementById("studentInfoTableBody")
for (i = 1; i <= students.length; i++) {
    let k = i - 1
    document.getElementById(i).addEventListener("click", function () {
        document.getElementById("studentName").innerText = `${students[k].name}`
        document.getElementById("studentTotalCreditHours").innerText = `${students[k].rollNo}`
        document.getElementById("studentCGPA").innerText = `${students[k].semester}`
        let tableData = "<tr>"
        tableData += `<td>${students[k].name}</td><td>${students[k].rollNo}</td><td>${students[k].semester}</td><td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#myModal">View Result</button></td>`
        tableData += "</tr>"
        tableBody.innerHTML = tableData
        let data="<tr><th>Subject</th><th>Grade Point</th></tr><tr>"
            let cgpa=0.00
        for(m=0;m<students[k].subjects.length; m++)
        {
            let n=m
            data+=`<td>${students[k].subjects[n].name}</td>`
            if(`${students[k].subjects[n].grade}`=="A" ||`${students[k].subjects[n].grade}`=="A+")
            {
                data+="<td>4</td>"
                cgpa=cgpa+(3*4.0)
            }
            else if(`${students[k].subjects[n].grade}`=="A-")
            {
                data+="<td>3.70</td>"
                cgpa=cgpa+(3*3.70)
            }
            else if(`${students[k].subjects[n].grade}`=="B+")
            {
                data+="<td>3.30</td>"
                cgpa=cgpa+(3*3.30)
            }
            else if(`${students[k].subjects[n].grade}`=="B")
            {
                data+="<td>3</td>"
                cgpa=cgpa+(3*3.00)
            }
            else if(`${students[k].subjects[n].grade}`=="B-")
            {
                data+="<td>2.70</td>"
                cgpa=cgpa+(3*2.70)
            }
            else if(`${students[k].subjects[n].grade}`=="C+")
            {
                data+="<td>2.30</td>"
                cgpa=cgpa+(3*2.30)
            }
            else if(`${students[k].subjects[n].grade}`=="C")
            {
                data+="<td>2</td>"
                cgpa=cgpa+(3*2.00)
            }
            else if(`${students[k].subjects[n].grade}`=="C-")
            {
                data+="<td>1.70</td>"
                cgpa=cgpa+(3*1.70)
            }
            else if(`${students[k].subjects[n].grade}`=="D")
            {
                data+="<td>1</td>"
                cgpa=cgpa+(3*1.00)
            }
            else if(`${students[k].subjects[n].grade}`=="F")
            {
                data+="<td>F(Fail)</td>"
                cgpa=cgpa+(3*0.00)
            }
            data+="</tr>"
            document.getElementById("modalBody").innerHTML=data
        }
        var actualCGPA=cgpa/(students[k].subjects.length*3)
        document.getElementById("my-div").innerText=`CGPA: ${actualCGPA.toPrecision(3)}`
        
    })
}