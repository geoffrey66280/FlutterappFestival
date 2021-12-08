<?php

require('BDConnexion.php');

$makeQuery = "SELECT * FROM Users";

$statement = $conn->prepare($makeQuery);

$statement->execute();

$myarray = array();

while ($result = $statement ->fetch()) {
    array_push(
        $myarray,array(
            'login'=>$result['login'],
            'password'=>$result['password']
            )
        );

    }

    echo json_encode($myarray);
?>

/*
FutureBuilder(
            future: logine.get('http://193.54.227.216/getData.php'),
            builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData? ListView.builder(
                  itemCount: 40,
                  itemBuilder: (context,index){
                    List<dynamic>? list = snapshot.data as List?;
                    return Text('oui');

                  }
              ) : Center(child: CircularProgressIndicator(),);
            }
        ),
*/