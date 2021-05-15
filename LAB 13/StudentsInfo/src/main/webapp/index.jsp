<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div id="login-div" class="col-12 col-md-4" style="margin: auto;padding-top: 5%">
            <h2 style="border-radius: 25px;border: 1px solid transparent;background-color: green;padding:20px;color: white;text-align: center">
                Login</h2>
            <form id="loginForm" class="form-group">
                <label>Name: </label>
                <input type="text" name="name" id="loginName" required class="form-control">
                <label>Password:</label>
                <input type="password" name="password" id="loginPassword" required class="form-control">
                <br>
            </form>
            <div style="text-align: center;">
                <button id="login" class="btn btn-success">Login</button>
            </div>
            <br>
            <div id="warning"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#login").click(function (event) {
        document.getElementById("warning").innerHTML = "";
        let name = document.getElementById("loginName").value;
        let password = document.getElementById("loginPassword").value;
        fetch("login?name=" + name + "&password=" + password, {method: 'post'}).then(response => {
            return response.text()
        }).then(data => {
            data = parseInt(data);
            if (data == 1) {
                window.location.href = "home.jsp"
            } else if (data == 0) {
                document.getElementById("warning").innerHTML = `<p style="text-align: center;color: red">Invalid username or password.</p>`
            }
        })
    });

</script>

</body>
</html>
