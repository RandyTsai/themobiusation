<?php

include("php-jwt/src/JWT.php");
include("php-jwt/src/Key.php");
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

header('Content-Type: application/json; charset=utf-8');

if(!empty($_GET)){
    $json = [
        'status' => "fail",
        'message' => 'forbidden request using GET'
    ];
    $response = json_encode($json);
    echo $response;
    die();
}


$json = file_get_contents('php://input');
$data = json_decode($json);  // get posted over data
$email = $data->email;
if(empty($email)){  // IF get empty
    $json = [
        'status' => "fail",
        'message' => 'Please send email in request body'
    ];
    $response = json_encode($json);
    echo $response;
    die();

}else {

    if(!filter_var($email, FILTER_VALIDATE_EMAIL)){  // invalid mail format
        $response = json_encode([
            'status' => "fail",
            'message'=>"Email inValid!"
        ]);
        echo $response;
        die();
    }else{

        // generate jwtToken
        $secret = '5b763b43ef14ef0c8b6eb44ce094750feef722a85565ffb465f386d68426fe2a4f896c10659b6c6ac6c868b855446618cefa313f3e37f062bfe7b1540298c739';
        $payload = [
            'email' => $email,
            'iat' =>  time(),
            'exp' => strtotime('+1 day', time())
        ];

        $jwt = JWT::encode($payload, $secret, 'HS256');

       //$response = json_encode([
         //   "jwt"=>$jwt
        //]);  // to print json in browser
        echo $jwt;
    }

}

?>