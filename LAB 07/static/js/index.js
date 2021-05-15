const std = angular.module("PUCITCMS", [])
std.controller("CMS", function ($scope) {
    $scope.Stds = students
    let j = 1
    $scope.Stds.forEach(function (value) { })
    $scope.StdClick = function (event) {
        $scope.Names = students[($(event.target).attr("id"))].name
        $scope.RollNo = students[($(event.target).attr("id"))].rollNo
        $scope.Sem = students[($(event.target).attr("id"))].semester
        $scope.TName = students[($(event.target).attr("id"))].name
        $scope.TRollNo = students[($(event.target).attr("id"))].rollNo
        $scope.TSem = students[($(event.target).attr("id"))].semester
        document.getElementById("btn").style.display = "block"
        $scope.EachStd = students[($(event.target).attr("id"))].subjects
        $scope.EachStd.forEach(function () { })
        let cgpa = 0.00
        students[($(event.target).attr("id"))].subjects.forEach(function (value) {
            if (value.grade == "A" || value.grade == "A+") {
                cgpa = cgpa + (3 * 4.0)
            }
            else if (value.grade == "A-") {
                cgpa = cgpa + (3 * 3.70)
            }
            else if (value.grade == "B+") {
                cgpa = cgpa + (3 * 3.30)
            }
            else if (value.grade == "B") {
                cgpa = cgpa + (3 * 3.00)
            }
            else if (value.grade == "B-") {
                cgpa = cgpa + (3 * 2.70)
            }
            else if (value.grade == "C+") {
                cgpa = cgpa + (3 * 2.30)
            }
            else if (value.grade == "C") {
                cgpa = cgpa + (3 * 2.00)
            }
            else if (value.grade == "C-") {
                cgpa = cgpa + (3 * 1.70)
            }
            else if (value.grade == "D") {
                cgpa = cgpa + (3 * 1.00)
            }
            else if (value.grade == "F") {
                cgpa = cgpa + (3 * 0.00)
            }
        })
        cgpa = (cgpa / (students[($(event.target).attr("id"))].subjects.length * 3)).toPrecision(3)
        $scope.ACgpa = cgpa
    }
})