<?php
    session_start();
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <link rel="stylesheet" href="include/bootstrap.min.css">
    <link rel="stylesheet" href="include/styles.css">
	<title>Festival Questionnaire</title>
</head>
<body>
	<?php include("./include/header.php"); ?>
    <?php include("./include/menus.php"); ?>

    <div style="padding-top: 30px" id="main">
        <div style="text-align: center" class="col-md-12">
                <?php
                    require_once("function.php");
                    
                    if(empty($_SESSION['SLogin'])){
                        connection();
                    } else {
                        deconnection();
                    }
                ?>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
